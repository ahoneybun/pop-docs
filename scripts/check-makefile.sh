#!/bin/sh

if [ "${PWD##*/}" != 'scripts' -o ! -d ../gnome-help ]; then
    echo "ERROR: You should run this script from the 'scripts' directory."
    exit 1
fi
cd ../gnome-help/C
TMP=$(mktemp --tmpdir page-files-in-makefile-XXXXXX)

grep '\.page' ../Makefile.am  | sed -e 's/\t*//' -e 's/ *\\//' | sort -u > $TMP && ls *.page | diff $TMP - \
    && {
        echo 'OK!'
        rm $TMP
    } || echo "\n.page files according to gnome-help/Makefile.am are listed in $TMP\n"
