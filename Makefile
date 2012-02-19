####################################################################################           
# Makefile for the GNOME Ubuntu Documentation
# Copyright (C) 2005-2006 Ubuntu Documentation Project (ubuntu-doc@lists.ubuntu.com)
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version. 
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#    On Debian based systems a copy of the GPL can be found 
#    at /usr/share/common-licenses/GPL
#
####################################################################################

MAKECMD=make

# Language code for documents
# Ex. LN=ja for japanese
LN=C

# XSL Processors
XSLTPROC=/usr/bin/xsltproc

current_distro=$(shell test -e /etc/debian_version && echo "debian")

# NWalsh Docbook XSL's
ifeq ($(current_distro), debian)
# Ubuntu
NWDBXSL=/usr/share/xml/docbook/stylesheet/nwalsh/html/docbook.xsl

# Debian and Ubuntu also need an explicit location for the XML catalog files
#export XML_CATALOG_FILES = /usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml
#else
# SuSE
#NWDBXSL=/usr/share/xml/docbook/stylesheet/nwalsh/current/html/docbook.xsl
endif

# Makes an Image list text file
MKIMGLST=libs/imagelist.xsl

# Collected and Write Status
wOS=libs/writeOwnerStatus.xsl

# Ubuntu Docbook Customization Layer

UBUNTUCHUNKXSL=libs/ubuntu-html-chunk-cust.xsl
UBUNTUSINGLEXSL=libs/ubuntu-html-single-cust.xsl
UBUNTUPDFXSL=libs/ubuntu-pdf.xsl

# Base gnome directories for output from processor
BASE=build/

.PHONY: website switching

gdeb: 

all: clean style index serverguide switching status contributors

	for doc in `cat libs/shipped-docs`; do \
		if [ $(LN) != "C" ]; then \
			./scripts/translate.sh -d $$doc -l $(LN); \
		fi; \
		if find $$doc/$(LN) -name "*.xml"; then \
			xsltproc --xinclude -o $(BASE)$$doc/$(LN)/index.html $(UBUNTUCHUNKXSL) $$doc/$(LN)/$$doc.xml; \
		fi; \
	done
	./scripts/fix-urls.sh -l $(LN)

index:

	xsltproc --stringparam html.stylesheet "libs/ubuntu-book.css" -o $(BASE)index.html $(UBUNTUCHUNKXSL) index.xml

clean:
	rm -rf $(BASE)*

style:

	# copy style sheet and common images to build directory
	mkdir -p build/libs/img
	mkdir -p build/libs/admon
	mkdir -p build/libs/callouts
	mkdir -p build/libs/navig
	cp libs/*css build/libs/
	cp libs/img/*.* build/libs/img/
	cp -r libs/admon/*.* build/libs/admon	
	cp -r libs/callouts/*.* build/libs/callouts
	cp -r libs/navig/*.* build/libs/navig

## Targets for building standalone documents

serverguide-pdf:

	if [ $(LN) != "C" ]; then \
		./scripts/translate.sh -d serverguide -l $(LN); \
	fi
	if find serverguide/$(LN) -name "*.xml"; then \
		xsltproc --xinclude -o $(BASE)serverguide/$(LN)/serverguide.fo $(UBUNTUPDFXSL) serverguide/$(LN)/serverguide.xml; \
		fop -fo $(BASE)serverguide/$(LN)/serverguide.fo -pdf $(BASE)serverguide/$(LN)/serverguide.pdf; \
	fi

## Individual documents built separately for help.ubuntu.com

install: style

# To build an Ubuntu look n feel version of the installation-guide, download
# the source package and unpack it to installation-guide. Then amend
# build/buildone.sh so that the "web" stylesheet refers to the Ubuntu installguide stylesheet
# in libs. Then use this make target.

	cd installation-guide/build && mkdir -p ../../build/installation-guide && destination='../../build/installation-guide/'  formats='html' architectures='amd64 hppa i386 ia64 powerpc sparc' ./buildweb.sh && cd ../../

software-center: style

# To build the software-center manual for help.ubuntu.com, download the source package
# and unpack the "help" directory to a directory as follows: software-center/C/software-center.xml
# Then use this make target:

	xsltproc --xinclude -o $(BASE)software-center/$(LN)/index.html $(UBUNTUCHUNKXSL) software-center/$(LN)/software-center.xml

language-selector: style

# To build the language-selector manual for help.ubuntu.com, download the source package
# and unpack the "help" directory to a directory as follows: language-selector/C/language-selector.xml
# Then use this make target:

	xsltproc --xinclude -o $(BASE)language-selector/$(LN)/index.html $(UBUNTUCHUNKXSL) language-selector/$(LN)/language-selector.xml

