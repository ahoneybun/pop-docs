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

which gnome-autogen.sh || {
    echo "You need to install gnome-common from the GNOME CVS"
    exit 1
}

REQUIRED_AUTOMAKE_VERSION=1.6
export REQUIRED_AUTOMAKE_VERSION

USE_GNOME2_MACROS=1 . gnome-autogen.sh
