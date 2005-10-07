#!/bin/sh
BUILDBASE="build"
MODVARFILE="modvars.make"
MKIMGLST=common/libs/imagelist.xsl 

current_distro=`test -e /etc/debian_version && echo "debian"`

# NWalsh Docbook XSL's
if [ "$current_distro" = debian ]; then
	# Ubuntu
	if [ -f /usr/share/xml/docbook/stylesheet/nwalsh/html/docbook.xsl ]; then
	echo "Platform Debian"
	NWDBXSL=/usr/share/xml/docbook/stylesheet/nwalsh/html/docbook.xsl
	# Debian and Ubuntu also need an explicit location for the XML catalog files
	export XML_CATALOG_FILES = /usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml
	fi
else
	# SuSE
	if [ -f /usr/share/xml/docbook/stylesheet/nwalsh/current/html/docbook.xsl ]; then
	echo "Platform SuSE"
	NWDBXSL=/usr/share/xml/docbook/stylesheet/nwalsh/current/html/docbook.xsl
	fi
fi

if [ x$1 = x ]; then
    DOC2DO=`ls -d */*/*/`
    echo "Processing all modules"
else
	if [ "$1" = $1 ]; then
		echo $1
	else
		if [ "$2" = $2 ]; then
		echo $1 $2
		else
			if [ "$3" = $3 ]; then
				echo $1 $2 $3
			fi	
		fi
	fi
	
	
fi


