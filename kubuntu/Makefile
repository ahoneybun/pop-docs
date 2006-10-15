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
# Uncomment the line below this and comment out the line above this to build website with tabs
# KUBUNTUXSL=libs/kubuntu-web.xsl
PDFSTYLE=../libs/pdf/ubuntu-pdf.xsl
LULUSTYLE=../libs/pdf/ubuntu-pdf-lulu.xsl

# Makes an Image list text file
MKIMGLST=../libs/imagelist.xsl

# Collected and Write Status
wOS=../libs/writeOwnerStatus.xsl

BUILDDIR=../build/

# Base kde directories for output from processor
KBASE=$(BUILDDIR)kubuntu/

PDFBASE=$(BUILDDIR)pdf/kubuntu/

LULUBASE=../build/lulu/kubuntu/

RNBASE=$(BUILDDIR)kubuntu/release-notes/

AKBASE=$(BUILDDIR)kubuntu/about-kubuntu/

SERVERBASE=$(BUILDDIR)kubuntu/serverguide/

PACKAGEBASE=$(BUILDDIR)kubuntu/packagingguide/

DESKTOPBASE=$(BUILDDIR)kubuntu/desktopguide/

ADEPTBASE=$(KBASE)adeptguide/

ADEPTUPDATERBASE=$(KBASE)adeptupdater/

ADEPTADDREMOVEBASE=$(KBASE)adeptaddremoveprograms/

all: clean about desktop package server release-notes

	# copy style sheet to build directory
	mkdir -p $(KBASE)common/
	cp libs/kde-default.css $(KBASE)common/
	cp libs/kubuntu-default.css $(KBASE)common/
	cp /usr/share/doc/kde/HTML/en/common/*png $(KBASE)common/

# This is here to select what to build for the .deb package.
# Frode M. Doeving <frode@lnix.net>
# Depends: debhelper devscripts cdbs
# Run prepdeb.sh do not run this make target
# Status: Available
kdeb: release-notes about server desktop package

# Style and header images - these are used in all the documents below

style:

	@echo "Building the Server Guide . . ."
	# copy style sheet to build directory
	mkdir -p $(KBASE)common/
	cp libs/kde-default.css $(KBASE)common/
	cp libs/kubuntu-default.css $(KBASE)common/
	cp /usr/share/doc/kde/HTML/en/common/*png $(KBASE)common/

#Status: AVAILABLE
# K About Kubuntu Document

about: style $(AKBASE)C

# To add other languages to the build simply include them after the above, like this: "$(AKBASE)lc" where "lc" is the language code.

$(AKBASE)%: aboutkubuntu/%/about-kubuntu.xml
	xsltproc -o $@/index.html $(KUBUNTUXSL) $<

#Status: AVAILABLE
# K Release Notes

release-notes: style $(RNBASE)C

$(RNBASE)%: releasenotes/%/releasenotes.xml
	xsltproc -o $@/index.html $(KUBUNTUXSL) $<

	@echo "Complete. Find outputs at" $(RNBASE)

# Server Guide

server: style $(SERVERBASE)C


$(SERVERBASE)%: ../generic/serverguide/%/serverguide.xml
	xsltproc --xinclude -o $@/index.html $(KUBUNTUXSL) $<

# Desktop Guide

desktop: style $(DESKTOPBASE)C $(DESKTOPBASE)ar $(DESKTOPBASE)bn $(DESKTOPBASE)ca $(DESKTOPBASE)cs $(DESKTOPBASE)csb $(DESKTOPBASE)da $(DESKTOPBASE)de $(DESKTOPBASE)el $(DESKTOPBASE)en_AU $(DESKTOPBASE)en_GB $(DESKTOPBASE)es $(DESKTOPBASE)fi $(DESKTOPBASE)fr $(DESKTOPBASE)gl $(DESKTOPBASE)he $(DESKTOPBASE)hu $(DESKTOPBASE)id $(DESKTOPBASE)it $(DESKTOPBASE)ko $(DESKTOPBASE)ku $(DESKTOPBASE)ms $(DESKTOPBASE)nb $(DESKTOPBASE)nl $(DESKTOPBASE)oc $(DESKTOPBASE)pl $(DESKTOPBASE)pt $(DESKTOPBASE)pt_BR $(DESKTOPBASE)ro $(DESKTOPBASE)ru $(DESKTOPBASE)sk $(DESKTOPBASE)sl $(DESKTOPBASE)sv $(DESKTOPBASE)th $(DESKTOPBASE)tl $(DESKTOPBASE)tr$(DESKTOPBASE)zh_CN $(DESKTOPBASE)zh_TW

	# copy sample files to build directory
	mkdir -p $(DESKTOPBASE)sample
	cp -r desktopguide/sample/* $(DESKTOPBASE)sample/

$(DESKTOPBASE)%: desktopguide/%/desktopguide.xml
	xsltproc --xinclude -o $@/index.html $(KUBUNTUXSL) $<

# Packaging Guide
package: style $(PACKAGEBASE)C

$(PACKAGEBASE)%: ../generic/packagingguide/%/packagingguide.xml
	xsltproc --xinclude -o $@/index.html $(KUBUNTUXSL) $<

# Adept Guide
adept-guide: style $(ADEPTBASE)C

$(ADEPTBASE)%: adeptguide/%/adeptguide.xml
	xsltproc --xinclude -o $@/index.html $(KUBUNTUXSL) $<

adept-updater: style $(ADEPTUPDATERBASE)C

$(ADEPTUPDATERBASE)%: adeptguide/adeptupdater/%/adeptupdater.xml
	xsltproc --xinclude -o $@/index.html $(KUBUNTUXSL) $<

addremoveprograms: style $(ADEPTADDREMOVEBASE)C

$(ADEPTADDREMOVEBASE)%: adeptguide/addremoveprograms/%/addremoveprograms.xml
	xsltproc --xinclude -o $@/index.html $(KUBUNTUXSL) $<

# Cleanup

clean:
	rm -rf $(KBASE)
