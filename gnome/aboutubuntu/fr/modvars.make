BUILD_FILE=index.html
HTML_XSL=../libs/about-ubuntu-html-cust.xsl
FIG_DIR=../images
DOC_NAME=about-ubuntu

LANG=fr
OMF_FILE=$DOC_NAME-$LANG.omf
SUBJECT="General|Linux|Distributions|Other"
IDENTIFIER=file:///usr/share/gnome/help/$DOC_NAME/$LANG/$DOC_NAME.xml
SERIES_ID=7fb11226-8a1d-11d9-9fcf-ff970c259736

PROC_CMD="xsltproc --xinclude -o $BUILDDIR/$LANG/$BUILD_FILE $HTML_XSL $DOC_NAME.xml"
