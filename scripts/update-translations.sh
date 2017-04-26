#!/bin/bash

# Ensure we're running from the scripts directory
if [ "${PWD##*/}" != 'scripts' -o ! -d ../gnome-help ]; then
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
for i in ../gnome-help/*/ubuntu-help-*.po; do
    OLDFILENAME=$i
    NEWFILENAME=$(basename $i | sed -e 's/^ubuntu-help-//')
    POLANG=$(basename $i .po | sed -e 's/^ubuntu-help-//')
    POLANGS="$POLANGS $POLANG"
    mkdir -p ../gnome-help/$POLANG
    mv $OLDFILENAME ../gnome-help/$POLANG/$NEWFILENAME
done

echo "Updating Makefile.am..."
cp ../gnome-help/Makefile.am ../gnome-help/Makefile.am.old
sed "s/HELP_LINGUAS = .*$/HELP_LINGUAS =$POLANGS/" ../gnome-help/Makefile.am.old > ../gnome-help/Makefile.am
rm -fr ../gnome-help/Makefile.am.old

echo "Done!"

