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
MKIMGLST=../libs/imagelist.xsl

# Collected and Write Status
wOS=../libs/writeOwnerStatus.xsl

# Ubuntu Docbook Customization Layer

UBUNTUCHUNKXSL=libs/ubuntu-html-chunk-cust.xsl
UBUNTUSINGLEXSL=libs/ubuntu-html-single-cust.xsl
PDFSTYLE=../libs/pdf/ubuntu-pdf.xsl
LULUSTYLE=../libs/pdf/ubuntu-pdf-lulu.xsl
# Local path to newer xsl for use with fop 0.90
PDFSTYLE2=../libs/pdf/ubuntu-pdf2.xsl

# Base gnome directories for output from processor
BASE=../build/ubuntu/

PDFBASE=../build/pdf/ubuntu/

LULUBASE=../build/lulu/ubuntu/

RNBASE=../build/ubuntu/release-notes/

ABASE=../build/ubuntu/about-ubuntu/

DGBASE=../build/ubuntu/desktopguide/

PACKAGEBASE= ../build/ubuntu/packagingguide/

IMAGES=../build/ubuntu/images/

SERVERBASE=../build/ubuntu/serverguide/

SGBASE=../build/ubuntu/styleguide/

.PHONY: website

gdeb: 

all: clean au rn dg server package

clean:
	rm -rf $(BASE)*

#######################################
#
# Here begin the HTML build targets
# 
#######################################

# About Ubuntu Document
au: $(ABASE)C

	@echo "--- Building About Ubuntu Document"
	# copy style sheet and common images to build directory
	mkdir -p ../build/ubuntu/common/img
	cp libs/*css ../build/ubuntu/common/
	cp libs/img/*png ../build/ubuntu/common/img/
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig

$(ABASE)%: aboutubuntu/%/about-ubuntu.xml
	xsltproc --xinclude -o $@/index.html $(UBUNTUCHUNKXSL) $<
		
#Status: AVAILABLE
# Release Notes
rn:
	@echo "--- Building the Ubuntu Release Notes . . ."
	# copy style sheet and common images to build directory
	mkdir -p ../build/ubuntu/common/img
	cp libs/*css ../build/ubuntu/common/
	cp libs/img/*png ../build/ubuntu/common/img/
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig

rn-C:	
	xsltproc --xinclude -o $(RNBASE)C/release-notes.html $(UBUNTUCHUNKXSL) releasenotes/C/release-notes.xml
	
# Desktop Guide

dg: $(DGBASE)C

	@echo "--- Building the Ubuntu Desktop Guide . . ."
	# copy style sheet and common images to build directory
	mkdir -p ../build/ubuntu/common/img
	cp libs/*css ../build/ubuntu/common/
	cp libs/img/*png ../build/ubuntu/common/img/
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig

$(DGBASE)%: desktopguide/%/desktopguide.xml
	xsltproc --xinclude -o $@/index.html $(UBUNTUCHUNKXSL) $<

# Server Guide

server: $(SERVERBASE)C

	@echo "Building the Server Guide . . ."
	# copy style sheet and common images to build directory
	mkdir -p ../build/ubuntu/common/img
	cp libs/*css ../build/ubuntu/common/
	cp libs/img/*png ../build/ubuntu/common/img/
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	mkdir -p $(SERVERBASE)sample
	cp -r ../generic/serverguide/sample/* $(SERVERBASE)sample/

$(SERVERBASE)%: ../generic/serverguide/%/serverguide.xml
	xsltproc --xinclude -o $@/index.html $(UBUNTUCHUNKXSL) $<

## Packaging Guide

package: $(PACKAGEBASE)C

	@echo "Building the Packaging Guide . . ."
	mkdir -p $(PACKAGEBASE)images/C
	cp -r ../generic/packagingguide/images/C/*.* $(PACKAGEBASE)images/C/
	mkdir -p $(PACKAGEBASE)files
	cp -r ../generic/packagingguide/files/*.* $(PACKAGEBASE)files
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	# copy style sheet and common images to build directory
	mkdir -p ../build/ubuntu/common/img
	cp libs/*css ../build/ubuntu/common/
	cp libs/img/*png ../build/ubuntu/common/img/

$(PACKAGEBASE)%: ../generic/packagingguide/%/packagingguide.xml
	xsltproc --xinclude -o $@/index.html $(UBUNTUCHUNKXSL) $<
