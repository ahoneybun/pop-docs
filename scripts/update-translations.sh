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

echo "Extracting translations from $TMPDOCS..."
tar -zxf "$TMPDOCS" --exclude='*.pot' --directory ..

echo "Renaming translation files..."
POLANGS=""
for i in ../ubuntu-help/*/ubuntu-help-*.po; do
    OLDFILENAME=$i
    NEWFILENAME=$(basename $i | sed -e 's/^ubuntu-help-//')
    POLANG=$(basename $i .po | sed -e 's/^ubuntu-help-//')
    POLANGS="$POLANGS $POLANG"
    mkdir -p ../ubuntu-help/$POLANG
    mv $OLDFILENAME ../ubuntu-help/$POLANG/$NEWFILENAME
done

#echo "Updating Makefile.am..."
#cp ../ubuntu-help/Makefile.am ../ubuntu-help/Makefile.am.old
#sed "s/HELP_LINGUAS = .*$/HELP_LINGUAS =$POLANGS/" ../ubuntu-help/Makefile.am.old > ../ubuntu-help/Makefile.am
#rm -fr ../ubuntu-help/Makefile.am.old

echo "Done!"

