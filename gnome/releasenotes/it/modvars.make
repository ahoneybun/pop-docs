BUILD_FILE=release-notes.html
HTML_XSL=$NWDBXSL
FIG_DIR=../images
DOC_NAME=release-notes

LANG=it
OMF_FILE=$DOC_NAME-$LANG.omf
SUBJECT="General|Linux|Distributions|Other"
IDENTIFIER=file:///usr/share/gnome/help/$DOC_NAME/$LANG/$DOC_NAME.xml
SERIES_ID=ea3ef804-8b50-11d9-9b9c-fe9c594b39a7

PROC_CMD="xsltproc --xinclude -o $BUILDDIR/$LANG/$BUILD_FILE $HTML_XSL $DOC_NAME.xml"