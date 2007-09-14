#################################################################################
# Makefile for the Kubuntu Documentation
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
#################################################################################

MAKECMD=make

# XSL Processors
XSLTPROC=/usr/bin/xsltproc

current_distro=$(shell test -e /etc/debian_version && echo "debian")

# NWalsh Docbook XSL's
ifeq ($(current_distro), debian)
# Ubuntu
NWDBXSL=/usr/share/xml/docbook/stylesheet/nwalsh/html/docbook.xsl

# Debian and Ubuntu also need an explicit location for the XML catalog files
#export XML_CATALOG_FILES = /usr/share/xml/docbook/schema/dtd/4.3/catalog.xml
#else
# SuSE
#NWDBXSL=/usr/share/xml/docbook/stylesheet/nwalsh/current/html/docbook.xsl
endif

# Stylesheets for building HTML and PDF
KUBUNTUXSL=libs/kubuntu-chunk.xsl
INDEXXSL=libs/index-table.xsl

# Makes an Image list text file
MKIMGLST=../libs/imagelist.xsl

# Collected and Write Status
wOS=../libs/writeOwnerStatus.xsl

BUILDDIR=../build/

# Base kde directories for output from processor
KBASE=$(BUILDDIR)kubuntu/

# all is for the kubuntu package and for the nightly builds for doc.ubuntu.com
all: clean style tbh about kindex

# Style
style:
	# copy style sheet to build directory
	mkdir $(KBASE)common/
	mkdir -p $(KBASE)images/admon/
	mkdir $(KBASE)images/C/
	mkdir $(KBASE)images/callouts/
	mkdir $(KBASE)images/navig/
	mkdir $(KBASE)images/index
	cp libs/*.css $(KBASE)common/
	cp /usr/share/doc/kde/HTML/en/common/*png $(KBASE)common/
	cp images/admon/*.png $(KBASE)images/admon/
	cp images/C/*.png $(KBASE)images/C/
	cp images/callouts/*.png $(KBASE)images/callouts/
	cp images/navig/*.png $(KBASE)images/navig/
	cp images/index/*.png $(KBASE)images/index/

# Topic Based Help
tbh:

	for doc in add-applications basic-concepts config-desktop files-and-docs \
		games getting-help hardware internet keeping-safe musicvideophotos \
		network newtokubuntu office printing programming system-settings; do \
		xsltproc --xinclude -o $(KBASE)$$doc/C/index.html $(KUBUNTUXSL) \
		$$doc/C/$$doc.xml; done

# Kubuntu Index
kindex:

	xsltproc --xinclude -o $(KBASE)index/C/index.html $(INDEXXSL) \
		index/C/index.xml

# About Kubuntu
## --stringparam generate.toc "no" removes the table of contents from the page
## --param chunk.first.sections 0 makes this build as 1 page
about:

	xsltproc --stringparam generate.toc "no" --param chunk.first.sections 0 \
		--xinclude -o $(KBASE)about-kubuntu/C/index.html $(KUBUNTUXSL) \
		about-kubuntu/C/about-kubuntu.xml

# Cleanup
clean:

	rm -rf $(KBASE)*
