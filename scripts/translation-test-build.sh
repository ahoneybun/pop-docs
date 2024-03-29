#!/bin/sh -e

INSTALL=
for P in gnome-common yelp-tools yelp-xsl; do
    if ! dpkg -l $P >/dev/null 2>&1; then
        INSTALL="$INSTALL $P"
    fi
done
if [ -n "$INSTALL" ]; then
    echo "To use this script, please install required packages by running this command:"
    echo "\nsudo apt install$INSTALL\n"
    exit 1
fi
if [ "${PWD##*/}" != 'scripts' -o ! -d ../ubuntu-help ]; then
    echo "ERROR: You should run this script from the 'scripts' directory."
    exit 1
fi
if [ -z "$1" ]; then
    echo "ERROR: You need to state the language code for the translation to be tested."
    exit 1
fi
if [ ! -d "../ubuntu-help/$1" ]; then
    echo "ERROR: Didn't find language code '$1'."
    exit 1
fi

sed -i -r -e "s/^(HELP_LINGUAS = ).*/\1$1/" ../ubuntu-help/Makefile.am

echo " --Test build of language '$1'..."
cd ..
./autogen.sh >/dev/null 2>&1
OUT=$(mktemp --tmpdir translation-test-build-XXXXXX)
ERR=$(mktemp --tmpdir translation-test-build-XXXXXX)
make >"$OUT" 2>"$ERR"
NOTHING=$(grep "Nothing to be done for 'all'" "$OUT") || true
if [ -n "$NOTHING" ]; then
    echo 'Built in a previous run -- nothing to do.'
elif [ -s "$ERR" ]; then
    cat <<EOC
+++
Due to syntax errors, the untranslated strings below are currently used on
respective translated page instead of the translated strings. Search for the
strings in Launchpad, try to figure out what the problem is, and correct the
translations. Then export a new PO file and try a new test build with a
fresh branch copy and the new ubuntu-help/$1/$1.po file.
+++
EOC
    cat "$ERR"
else
    echo 'OK!'
    echo "You may now want to run the command: ./validate.sh $1"
fi
echo
rm "$OUT" "$ERR"
