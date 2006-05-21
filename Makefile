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

website: index-all
	@echo "Building the Ubuntu Docs . . ."

	make -C ubuntu -f Makefile website pdf

	@echo "Building the Kubuntu Docs . . ."

	make -C kubuntu -f Makefile website pdf

index-all: index-C index-be index-bn index-bo index-cs index-da index-de index-el index-es index-et index-fi index-fr index-hr index-hu index-id index-is index-it index-ja index-ka index-ko index-ku index-lt index-nb index-pl index-pt index-pt_BR index-ru index-ro index-sk index-sv index-th index-tl index-tr index-zh_CN index-zh_TW

	cp libs/index.css $(BASE)
	mkdir -p $(BASE)ubuntu/common/img/
	cp ubuntu/libs/img/*png $(BASE)ubuntu/common/img/

index-C:

	xsltproc --stringparam root.filename "index" -o $(BASE) $(INDEXCHUNKXSL) website-index/C/website-index.xml

index-be:

	xsltproc --stringparam root.filename "index.be" -o $(BASE) $(INDEXCHUNKXSL) website-index/be/website-index.xml

index-bn:

	xsltproc --stringparam root.filename "index.bn" -o $(BASE) $(INDEXCHUNKXSL) website-index/bn/website-index.xml

index-bo:

	xsltproc --stringparam root.filename "index.bo" -o $(BASE) $(INDEXCHUNKXSL) website-index/bo/website-index.xml

index-cs:

	xsltproc --stringparam root.filename "index.cs" -o $(BASE) $(INDEXCHUNKXSL) website-index/cs/website-index.xml

index-da:

	xsltproc --stringparam root.filename "index.da" -o $(BASE) $(INDEXCHUNKXSL) website-index/da/website-index.xml

index-de:

	xsltproc --stringparam root.filename "index.de" -o $(BASE) $(INDEXCHUNKXSL) website-index/de/website-index.xml

index-el:

	xsltproc --stringparam root.filename "index.el" -o $(BASE) $(INDEXCHUNKXSL) website-index/el/website-index.xml

index-es:

	xsltproc --stringparam root.filename "index.es" -o $(BASE) $(INDEXCHUNKXSL) website-index/es/website-index.xml

index-et:

	xsltproc --stringparam root.filename "index.et" -o $(BASE) $(INDEXCHUNKXSL) website-index/et/website-index.xml

index-fi:

	xsltproc --stringparam root.filename "index.fi" -o $(BASE) $(INDEXCHUNKXSL) website-index/fi/website-index.xml

index-fr:

	xsltproc --stringparam root.filename "index.fr" -o $(BASE) $(INDEXCHUNKXSL) website-index/fr/website-index.xml

index-hr:

	xsltproc --stringparam root.filename "index.hr" -o $(BASE) $(INDEXCHUNKXSL) website-index/hr/website-index.xml

index-hu:

	xsltproc --stringparam root.filename "index.hu" -o $(BASE) $(INDEXCHUNKXSL) website-index/hu/website-index.xml

index-id:

	xsltproc --stringparam root.filename "index.id" -o $(BASE) $(INDEXCHUNKXSL) website-index/id/website-index.xml

index-is:

	xsltproc --stringparam root.filename "index.is" -o $(BASE) $(INDEXCHUNKXSL) website-index/is/website-index.xml

index-it:

	xsltproc --stringparam root.filename "index.it" -o $(BASE) $(INDEXCHUNKXSL) website-index/it/website-index.xml

index-ja:

	xsltproc --stringparam root.filename "index.ja" -o $(BASE) $(INDEXCHUNKXSL) website-index/ja/website-index.xml

index-ka:

	xsltproc --stringparam root.filename "index.ka" -o $(BASE) $(INDEXCHUNKXSL) website-index/ka/website-index.xml

index-ko:

	xsltproc --stringparam root.filename "index.ko" -o $(BASE) $(INDEXCHUNKXSL) website-index/ko/website-index.xml

index-ku:

	xsltproc --stringparam root.filename "index.ko" -o $(BASE) $(INDEXCHUNKXSL) website-index/ko/website-index.xml

index-lt:

	xsltproc --stringparam root.filename "index.lt" -o $(BASE) $(INDEXCHUNKXSL) website-index/lt/website-index.xml

index-nb:

	xsltproc --stringparam root.filename "index.nb" -o $(BASE) $(INDEXCHUNKXSL) website-index/nb/website-index.xml

index-pl:

	xsltproc --stringparam root.filename "index.pl" -o $(BASE) $(INDEXCHUNKXSL) website-index/pl/website-index.xml

index-pt:

	xsltproc --stringparam root.filename "index.pt" -o $(BASE) $(INDEXCHUNKXSL) website-index/pt/website-index.xml

index-pt_BR:

	xsltproc --stringparam root.filename "index.pt_BR" -o $(BASE) $(INDEXCHUNKXSL) website-index/pt_BR/website-index.xml

index-ro:

	xsltproc --stringparam root.filename "index.ro" -o $(BASE) $(INDEXCHUNKXSL) website-index/ro/website-index.xml

index-ru:

	xsltproc --stringparam root.filename "index.ru" -o $(BASE) $(INDEXCHUNKXSL) website-index/ru/website-index.xml

index-sk:

	xsltproc --stringparam root.filename "index.sv" -o $(BASE) $(INDEXCHUNKXSL) website-index/sv/website-index.xml

index-sv:

	xsltproc --stringparam root.filename "index.sv" -o $(BASE) $(INDEXCHUNKXSL) website-index/sv/website-index.xml

index-th:

	xsltproc --stringparam root.filename "index.th" -o $(BASE) $(INDEXCHUNKXSL) website-index/th/website-index.xml

index-tl:

	xsltproc --stringparam root.filename "index.tl" -o $(BASE) $(INDEXCHUNKXSL) website-index/tl/website-index.xml

index-tr:

	xsltproc --stringparam root.filename "index.tr" -o $(BASE) $(INDEXCHUNKXSL) website-index/tr/website-index.xml

index-zh_CN:

	xsltproc --stringparam root.filename "index.zh_CN" -o $(BASE) $(INDEXCHUNKXSL) website-index/zh_CN/website-index.xml

index-zh_TW:

	xsltproc --stringparam root.filename "index.zh_TW" -o $(BASE) $(INDEXCHUNKXSL) website-index/zh_TW/website-index.xml
