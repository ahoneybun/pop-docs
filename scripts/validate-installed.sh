#!/bin/sh

# Mallard validation of installed files in /usr/share/help/C/gnome-help
# or in folder stated as argument

if [ -z "$1" ]; then
    DIR=/usr/share/help/C/gnome-help
else
    DIR="$1"
fi

echo " --Validation pass 1: The .page files actual validation pass (syntax):"
yelp-check validate --strict --allow http://www.w3.org/2005/11/its --allow http://www.w3.org/1999/xlink --allow http://projectmallard.org/experimental/ "$DIR"/*.page

echo " --Validation pass 2: Check the IDs:"
yelp-check ids "$DIR"/*.page

echo " --Validation pass 3: Check for orphans (no link back trail):"
yelp-check orphans "$DIR"/*.page

echo " --Validation pass 4: Check for non-existent internal links:"
yelp-check links "$DIR"/*.page

