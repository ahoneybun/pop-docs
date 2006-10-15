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

website: index-all ubuntu-book
	@echo "Building the Ubuntu Docs . . ."

	make -C ubuntu -f Makefile website pdf

	@echo "Building the Kubuntu Docs . . ."

	make -C kubuntu -f Makefile website pdf

	@echo "Building the Xubuntu Docs . . ."

	make -C xubuntu -f Makefile web pdf

ubuntu-book:

	mkdir -p $(BASE)book/
	cp -r book/* $(BASE)book/

style:

	cp libs/index.css $(BASE)
	mkdir -p $(BASE)ubuntu/common/img/
	cp ubuntu/libs/img/*png $(BASE)ubuntu/common/img/

index-all: style $(BASE)C $(BASE)af $(BASE)ar $(BASE)be $(BASE)bg $(BASE)bn $(BASE)bo $(BASE)ca $(BASE)cs $(BASE)csb $(BASE)da $(BASE)de $(BASE)de_DE $(BASE)el $(BASE)en_AU $(BASE)en_CA $(BASE)en_GB $(BASE)es $(BASE)es_ES $(BASE)es_PR $(BASE)et $(BASE)eu $(BASE)fa $(BASE)fi $(BASE)fr $(BASE)gl $(BASE)he $(BASE)hr $(BASE)hu $(BASE)id $(BASE)is $(BASE)it $(BASE)ja $(BASE)ka $(BASE)kn $(BASE)ko $(BASE)ku $(BASE)lb $(BASE)lt $(BASE)lv $(BASE)ms $(BASE)nb $(BASE)nl $(BASE)nn $(BASE)oc $(BASE)pl $(BASE)pt $(BASE)pt_BR $(BASE)ro $(BASE)ru $(BASE)sk $(BASE)sl $(BASE)sr $(BASE)sv $(BASE)th $(BASE)tl $(BASE)tr $(BASE)uk $(BASE)zh_CN $(BASE)zh_TW

	cd build; for i in `ls index.*.html` ; do mv $i index.html.`echo $i | sed -e 's/index.\(.*\).html/\1/'` ; done ; cd ../

$(BASE)%: website-index/%/website-index.xml
	xsltproc --xinclude --stringparam root.filename "index" -o $@ $(INDEXCHUNKXSL) $<

