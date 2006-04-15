####################################################################################           
# Makefile for the Ubuntu Documentation Website
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
####################################################################################

MAKECMD=make

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

# Ubuntu Docbook Customization Layer

INDEXCHUNKXSL=libs/index-html-chunk-cust.xsl

# Base gnome directories for output from processor
BASE=build/

website: index
	@echo "Building the Ubuntu Docs . . ."

	make -C ubuntu -f Makefile all pdf

	@echo "Building the Kubuntu Docs . . ."

	make -C kubuntu -f Makefile all pdf

	@echo "Building the Index Page . . ."

index-all: index index-de index-es index-et index-fi index-fr index-id index-id index-it index-ko index-lt index-pt index-pt_BR index-ro index-sv index-tl

	cp libs/index.css $(BASE)
	cp ubuntu/libs/img/*png $(BASE)ubuntu/common/img/

index:

	xsltproc --stringparam root.filename "index" -o $(BASE) $(INDEXCHUNKXSL) website-index/C/website-index.xml


# This is an example target for translations, where "cc" is the country-code for the translation language.
index-de:

	xsltproc --stringparam root.filename "index.de" -o $(BASE) $(INDEXCHUNKXSL) website-index/de/website-index.xml

index-es:

	xsltproc --stringparam root.filename "index.es" -o $(BASE) $(INDEXCHUNKXSL) website-index/es/website-index.xml

index-et:

	xsltproc --stringparam root.filename "index.et" -o $(BASE) $(INDEXCHUNKXSL) website-index/et/website-index.xml

index-fi:

	xsltproc --stringparam root.filename "index.fi" -o $(BASE) $(INDEXCHUNKXSL) website-index/fi/website-index.xml

index-fr:

	xsltproc --stringparam root.filename "index.fr" -o $(BASE) $(INDEXCHUNKXSL) website-index/fr/website-index.xml

index-id:

	xsltproc --stringparam root.filename "index.id" -o $(BASE) $(INDEXCHUNKXSL) website-index/id/website-index.xml

index-it:

	xsltproc --stringparam root.filename "index.it" -o $(BASE) $(INDEXCHUNKXSL) website-index/it/website-index.xml

index-ko:

	xsltproc --stringparam root.filename "index.ko" -o $(BASE) $(INDEXCHUNKXSL) website-index/ko/website-index.xml

index-lt:

	xsltproc --stringparam root.filename "index.lt" -o $(BASE) $(INDEXCHUNKXSL) website-index/lt/website-index.xml

index-pt:

	xsltproc --stringparam root.filename "index.pt" -o $(BASE) $(INDEXCHUNKXSL) website-index/pt/website-index.xml

index-pt_BR:

	xsltproc --stringparam root.filename "index.pt_BR" -o $(BASE) $(INDEXCHUNKXSL) website-index/pt_BR/website-index.xml

index-ro:

	xsltproc --stringparam root.filename "index.ro" -o $(BASE) $(INDEXCHUNKXSL) website-index/ro/website-index.xml

index-sv:

	xsltproc --stringparam root.filename "index.sv" -o $(BASE) $(INDEXCHUNKXSL) website-index/sv/website-index.xml

index-tl:

	xsltproc --stringparam root.filename "index.tl" -o $(BASE) $(INDEXCHUNKXSL) website-index/tl/website-index.xml

index-zh_CN:

	xsltproc --stringparam root.filename "index.zh_CN" -o $(BASE) $(INDEXCHUNKXSL) website-index/zh_CN/website-index.xml
