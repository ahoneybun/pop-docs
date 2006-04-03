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
PDFSTYLE=../libs/ubuntu-pdf.xsl

# Base gnome directories for output from processor
BASE=../build/ubuntu/

PDFBASE=../build/pdf/ubuntu/

STBASE=../build/ubuntu/status/

UGBASE=../build/ubuntu/userguide/

QGBASE=../build/ubuntu/quickguide/

QTBASE=../build/ubuntu/quicktour/

AGBASE=../build/ubuntu/adminguide/

INBASE=../build/ubuntu/ubuntu-install/

RNBASE=../build/ubuntu/release-notes/

ABASE=../build/ubuntu/about-ubuntu/

DGBASE=../build/ubuntu/desktopguide/

PGBASE= ../build/ubuntu/packagingguide/

IMAGES=../build/ubuntu/images/

SERVERBASE=../build/ubuntu/serverguide/

SGBASE=../build/ubuntu/styleguide/

.PHONY: all
all: au dg sg server package status rn

	# copy style sheet and common images to build directory
	mkdir -p ../build/ubuntu/common/img
	cp libs/*css ../build/ubuntu/common/
	cp libs/img/*png ../build/ubuntu/common/img/

# This is here to select what to build for the .deb package.
gdeb: server dg

# This builds all the guides in PDF format. You need to install Java, Apache Fop, the Jimi imaging library, and other horrible non-free things to make this work

pdf: server-pdf dg-pdf package-pdf sg-pdf

#Status: AVAILABLE
# Ubuntu Status Reports
status:
	@echo "----- Building status reports... please be patient. -----"
	
	@echo "----- About Ubuntu status report -----"
	xsltproc --xinclude -o $(STBASE)au-report.xml $(wOS) aboutubuntu/C/about-ubuntu.xml
	xsltproc --xinclude -o $(STBASE)au-report.html $(NWDBXSL) $(STBASE)au-report.xml

	@echo "----- desktopguide status report -----"
	xsltproc --xinclude -o $(STBASE)dg-report.xml $(wOS) desktopguide/C/desktopguide.xml
	xsltproc --xinclude -o $(STBASE)dg-report.html $(NWDBXSL) $(STBASE)dg-report.xml
	
	@echo "----- serverguide status report -----"
	xsltproc --xinclude -o $(STBASE)sg-report.xml $(wOS) ../generic/serverguide/C/serverguide.xml
	xsltproc --xinclude -o $(STBASE)sg-report.html $(NWDBXSL) $(STBASE)sg-report.xml

	@echo "----- packagingguide status report -----"
	xsltproc --xinclude -o $(STBASE)pg-report.xml $(wOS) ../generic/packagingguide/C/packagingguide.xml
	xsltproc --xinclude -o $(STBASE)pg-report.html $(NWDBXSL) $(STBASE)pg-report.xml
	
	@echo "----- Complete. Find outputs at" $(STBASE)

# Ubuntu Documentation Style Guide
sg:

	@echo "--- Building the Style Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(SGBASE)C/*
	@echo "--- Building new files. . . "

	xsltproc --xinclude --stringparam base.dir $(SGBASE)en/ $(UBUNTUCHUNKXSL) ../generic/styleguide/styleguide.xml
	xsltproc --xinclude -o $(SGBASE)en/styleguide-single.html $(UBUNTUSINGLEXSL) ../generic/styleguide/styleguide.xml

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

	@echo "--- Complete. Find output at" $(SGBASE)

sg-pdf:

	mkdir -p $(PDFBASE)images
	cp -r ../common/admon-pdf/*.png $(PDFBASE)images/

	xsltproc --xinclude -o $(PDFBASE)styleguide.fo $(PDFSTYLE) ../generic/styleguide/styleguide.xml
	fop.sh -fo $(PDFBASE)styleguide.fo -pdf $(PDFBASE)styleguide.pdf
	rm $(PDFBASE)styleguide.fo
	rm -rf $(PDFBASE)images

#Status: AVAILABLE
# About Ubuntu Document
au: au-C
#au-all: au-C au-AF au-CA au-CS au-DA au-DE au-EL au-ES au-ET au-FA au-FI au-FR au-HE au-HU au-ID au-IT au-LV au-MK au-ML au-NL au-PL au-PT au-PT_BR au-RO au-SK au-SR au-SV au-TL au-XH

au-C:
	@echo "--- Building About Ubuntu Document"
	
	xsltproc --xinclude -o $(ABASE)C/index.html $(UBUNTUCHUNKXSL) aboutubuntu/C/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/C/about-ubuntu.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
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

	@echo "--- Complete. Find outputs at" $(ABASE)

#Status: AVAILABLE
# Release Notes
rn:
	@echo "--- Building the Ubuntu Release Notes . . ."
	
	xsltproc --xinclude -o $(RNBASE)C/release-notes.html $(UBUNTUCHUNKXSL) releasenotes/C/release-notes.xml
	xsltproc --xinclude -o $(RNBASE)rn-imagelist.txt $(MKIMGLST) releasenotes/C/release-notes.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	@echo "--- Complete. Find outputs at" $(RNBASE)

#Status: AVAILABLE
# DESKTOP Guide - build for all archs
dg: dg-C

dg-C:

# The build commands for this are pretty complicated, so for simplicity, it's migrated to a separate Makefile. This will help us organise the translations.

	@echo "--- Building the Ubuntu Desktop Guide . . ."

	xsltproc --xinclude --stringparam base.dir $(DGBASE)C/ $(UBUNTUCHUNKXSL) desktopguide/C/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)C/desktopguide-all.html $(UBUNTUSINGLEXSL) desktopguide/C/desktopguide.xml

	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)C/sample
	cp -r desktopguide/C/sample/* $(DGBASE)C/sample/
	
	# copy style sheet and common images to build directory
	mkdir -p ../build/ubuntu/common/img
	cp libs/*css ../build/ubuntu/common/
	cp libs/img/*png ../build/ubuntu/common/img/

	@echo "--- Complete. Find outputs at" $(DGBASE)

dg-pdf:

	mkdir -p $(PDFBASE)C/images
	cp -r ../common/admon-pdf/*.png $(PDFBASE)C/images/

	xsltproc --xinclude -o $(PDFBASE)C/desktopguide.fo $(PDFSTYLE) desktopguide/C/desktopguide.xml
	fop.sh -fo $(PDFBASE)C/desktopguide.fo -pdf $(PDFBASE)C/desktopguide.pdf
	rm $(PDFBASE)C/desktopguide.fo
	rm -rf $(PDFBASE)C/images

## Server Guide
server:
	@echo "--- Building the Ubuntu Server Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(SERVERBASE)C/*.html 
	rm -f $(SERVERBASE)C/sample/*
	@echo "--- Building new files. . . "

	xsltproc --xinclude --stringparam base.dir $(SERVERBASE)C/ $(UBUNTUCHUNKXSL) ../generic/serverguide/C/serverguide.xml
	xsltproc --xinclude -o $(SERVERBASE)C/serverguide-all.html $(UBUNTUSINGLEXSL) ../generic/serverguide/C/serverguide.xml

	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(SERVERBASE)C/sample
	cp -r ../generic/serverguide/C/sample/* $(SERVERBASE)C/sample/
	
	# copy style sheet and common images to build directory
	mkdir -p ../build/ubuntu/common/img
	cp libs/*css ../build/ubuntu/common/
	cp libs/img/*png ../build/ubuntu/common/img/

	@echo "--- Complete. Find output at" $(SERVERBASE)

server-pdf:

	rm -rf $(PDFBASE)
	mkdir -p $(PDFBASE)C/images
	cp -r ../common/admon-pdf/*.png $(PDFBASE)C/images/

	xsltproc --xinclude -o $(PDFBASE)C/serverguide.fo $(PDFSTYLE) ../generic/serverguide/C/serverguide.xml
	fop.sh -fo $(PDFBASE)C/serverguide.fo -pdf $(PDFBASE)C/serverguide.pdf
	rm $(PDFBASE)C/serverguide.fo
	rm -rf $(PDFBASE)C/images

## Packaging Guide
package:
	@echo "--- Building the Ubuntu Installation Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(PGBASE)C/*.html 
	@echo "--- Building new files. . . "

	xsltproc --xinclude --stringparam base.dir $(PGBASE)C/ $(UBUNTUCHUNKXSL) ../generic/packagingguide/C/packagingguide.xml

	mkdir -p $(PGBASE)images
	mkdir -p $(PGBASE)images/C
	cp -r ../generic/packagingguide/images/C/*.* $(PGBASE)images/C/

	mkdir -p $(PGBASE)files
	cp -r ../generic/packagingguide/files/*.* $(PGBASE)files

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

	@echo "--- Complete. Find output at" $(PGBASE)

package-pdf:

	mkdir -p $(PDFBASE)C/images
	cp -r ../common/admon-pdf/*.png $(PDFBASE)C/images/

	xsltproc --xinclude -o $(PDFBASE)C/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/C/packagingguide.xml
	fop.sh -fo $(PDFBASE)C/packagingguide.fo -pdf $(PDFBASE)C/packagingguide.pdf
	rm $(PDFBASE)C/packagingguide.fo
	rm -rf $(PDFBASE)C/images

clean:
	rm -rf $(BASE)
