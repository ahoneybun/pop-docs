#!/bin/sh
#
# This script corrects a syntax error commonly found in the translated
# strings, such as '< /gui>' (not valid Mallard syntax) instead of
# '</gui>'. It should be applied to newly exported translations before
# committing/uploading.
#
# Let's add more sed commands below to the extent we find similar errors
# which can be safely corrected this way.
#
sed -i 's,</ ,</,g' ubuntu-help/*/*.po
