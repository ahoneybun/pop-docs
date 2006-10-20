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

index-all: style

	for x in ubuntu/desktopguide/*; do y=$$(basename $${x} website-index/); echo $${y}; xsltproc --stringparam root.filename "index.$${y}" -o $(BASE) $(INDEXCHUNKXSL) website-index/$${y}/website-index.xml;	done
