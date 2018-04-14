#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

PKG_NAME="ubuntu-docs"

(test -f $srcdir/configure.ac \
  && test -d $srcdir/ubuntu-help) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level $PKG_NAME directory"
    exit 1
}

autoreconf --verbose --force --install || exit 1
$srcdir/configure "$@" || exit 1
