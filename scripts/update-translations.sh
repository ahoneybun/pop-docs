#!/bin/bash

# Ensure we're running from the scripts directory
if [ "${PWD##*/}" != 'scripts' -o ! -d ../ubuntu-help ]; then
    echo "ERROR: You must run this script from the 'scripts' directory."
    exit 1
fi

# Ensure the URL to the translation files tarball has been specified
if [ $# -lt 1 ]; then
    echo "Usage: $0 FILE"
    echo ""
    echo "    FILE         The tarball of .po files that Launchpad provides."
    exit 1
fi

# Location to store downloaded tarball
TMPDOCS="$1"

if [ ! -e "$TMPDOCS" ]; then
    echo "ERROR: File $TMPDOCS does not exist!"
    exit 1
fi

TMPLANGS=/tmp/ubuntu-docs/po-files
mkdir -p $TMPLANGS
rm -rf $TMPLANGS/*

echo "Extracting translations from $TMPDOCS..."
tar -zxf "$TMPDOCS" --exclude='*.pot' --directory $TMPLANGS

for i in $TMPLANGS/ubuntu-help/*/*.po $TMPLANGS/ubuntu-help/*.po; do
    POFILE=$(basename $i | sed -e 's/^ubuntu-help-//')
    PODIR=${POFILE%.*}
    if [ -d "../ubuntu-help/$PODIR" ]; then
        cp $i ../ubuntu-help/$PODIR/$POFILE
    else
        cp $i ../ubuntu-help/newlang-$POFILE
    fi
done

echo "Removing obsolete translations..."
# PO files exported from LP contain to a large extent obsolete
# translations of previously present strings. These commands clean
# up the PO files from such translations, since it's unnecessary to
# pollute the branch and the source package with them.
#
# Remove obsolete translations
sed -i '/^#~/d' ../ubuntu-help/*/*.po
# Remove orphans as a result of the previous command
# (this is unforgivably clumsy)
sed -i '$!N;s/^#.*\n$//;P;D' ../ubuntu-help/*/*.po
sed -i '$!N;s/^#.*\n$//;P;D' ../ubuntu-help/*/*.po
sed -i '$!N;s/^#.*\n$//;P;D' ../ubuntu-help/*/*.po
sed -i '$!N;s/^#.*\n$//;P;D' ../ubuntu-help/*/*.po
# Remove blank lines at the end
sed -i -e :a -e '/^\n*$/{$d;N;};/\n$/ba' ../ubuntu-help/*/*.po

echo "Done!"

