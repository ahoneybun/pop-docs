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

GHBASE=../build/ubuntu/getting-help/

ABASE=../build/ubuntu/about-ubuntu/

DGBASE=../build/ubuntu/desktopguide/

PACKAGEBASE= ../build/ubuntu/packagingguide/

IMAGES=../build/ubuntu/images/

SERVERBASE=../build/ubuntu/serverguide/

SGBASE=../build/ubuntu/styleguide/

.PHONY: website

gdeb: 

all: clean au rn dg server package gh

clean:
	rm -rf $(BASE)

style:

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

#######################################
#
# Here begin the HTML build targets
# 
#######################################

# About Ubuntu Document
au: $(ABASE)C $(ABASE)af $(ABASE)am $(ABASE)ar $(ABASE)as $(ABASE)ast $(ABASE)be $(ABASE)bg $(ABASE)bn $(ABASE)bs $(ABASE)ca $(ABASE)cs $(ABASE)csb $(ABASE)da $(ABASE)de $(ABASE)el $(ABASE)en_AU $(ABASE)en_CA $(ABASE)en_GB $(ABASE)eo $(ABASE)es $(ABASE)es_PR $(ABASE)et $(ABASE)eu $(ABASE)fa $(ABASE)fi $(ABASE)fil $(ABASE)fr $(ABASE)gl $(ABASE)he $(ABASE)hi $(ABASE)hr $(ABASE)hu $(ABASE)id $(ABASE)is $(ABASE)it $(ABASE)ja $(ABASE)jv $(ABASE)ka $(ABASE)kn $(ABASE)ko $(ABASE)ku $(ABASE)lo $(ABASE)lt $(ABASE)lv $(ABASE)mk $(ABASE)ml $(ABASE)mr $(ABASE)ms $(ABASE)nb $(ABASE)nl $(ABASE)nn $(ABASE)oc $(ABASE)pam $(ABASE)pl $(ABASE)pt $(ABASE)pt_BR $(ABASE)ro $(ABASE)ru $(ABASE)sco $(ABASE)sk $(ABASE)sl $(ABASE)sq $(ABASE)sr $(ABASE)sv $(ABASE)ta $(ABASE)th $(ABASE)tl $(ABASE)tr $(ABASE)uk $(ABASE)ur $(ABASE)zh_CN $(ABASE)zh_HK $(ABASE)zh_TW

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

# Getting Help

gh: style $(GHBASE)C $(GHBASE)de $(GHBASE)en_GB $(GHBASE)es $(GHBASE)fi $(GHBASE)fr $(GHBASE)hr $(GHBASE)hu $(GHBASE)id $(GHBASE)it $(GHBASE)nb $(GHBASE)oc $(GHBASE)pl $(GHBASE)pt $(GHBASE)pt_BR $(GHBASE)sv

$(GHBASE)%: getting-help/%/getting-help.xml
	xsltproc --xinclude -o $@/index.html $(UBUNTUCHUNKXSL) $<
	
# Desktop Guide

dg: style $(DGBASE)C $(DGBASE)am $(DGBASE)be $(DGBASE)bn $(DGBASE)ca $(DGBASE)cs $(DGBASE)da $(DGBASE)de $(DGBASE)el $(DGBASE)en_AU $(DGBASE)en_GB $(DGBASE)eo $(DGBASE)es $(DGBASE)et $(DGBASE)fa $(DGBASE)fi $(DGBASE)fr $(DGBASE)gl $(DGBASE)he $(DGBASE)hr $(DGBASE)hu $(DGBASE)id $(DGBASE)it $(DGBASE)ja $(DGBASE)ka $(DGBASE)ko $(DGBASE)ku $(DGBASE)mk $(DGBASE)ms $(DGBASE)nb $(DGBASE)nl $(DGBASE)oc $(DGBASE)pl $(DGBASE)pt $(DGBASE)pt_BR $(DGBASE)ro $(DGBASE)ru $(DGBASE)sk $(DGBASE)sl $(DGBASE)sr $(DGBASE)sv $(DGBASE)ta $(DGBASE)th $(DGBASE)tl $(DGBASE)tr $(DGBASE)uk $(DGBASE)ur $(DGBASE)zh_CN $(DGBASE)zh_TW

$(DGBASE)%: desktopguide/%/desktopguide.xml
	xsltproc --xinclude -o $@/index.html $(UBUNTUCHUNKXSL) $<

# Server Guide

server: $(SERVERBASE)C $(SERVERBASE)be $(SERVERBASE)bn $(SERVERBASE)cs $(SERVERBASE)da $(SERVERBASE)de $(SERVERBASE)en_GB $(SERVERBASE)es $(SERVERBASE)et $(SERVERBASE)fr $(SERVERBASE)he $(SERVERBASE)hr $(SERVERBASE)hu $(SERVERBASE)id $(SERVERBASE)it $(SERVERBASE)ko $(SERVERBASE)lt $(SERVERBASE)nb $(SERVERBASE)nl $(SERVERBASE)pl $(SERVERBASE)pt $(SERVERBASE)pt_BR $(SERVERBASE)ro $(SERVERBASE)ru $(SERVERBASE)sk $(SERVERBASE)sv $(SERVERBASE)th $(SERVERBASE)tl $(SERVERBASE)tr $(SERVERBASE)ur $(SERVERBASE)zh_CN $(SERVERBASE)zh_TW

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

package: $(PACKAGEBASE)C $(PACKAGEBASE)bn $(PACKAGEBASE)cs $(PACKAGEBASE)da $(PACKAGEBASE)de $(PACKAGEBASE)en_GB $(PACKAGEBASE)es $(PACKAGEBASE)hu $(PACKAGEBASE)id $(PACKAGEBASE)it $(PACKAGEBASE)ka $(PACKAGEBASE)ko $(PACKAGEBASE)oc $(PACKAGEBASE)pl $(PACKAGEBASE)pt $(PACKAGEBASE)pt_BR $(PACKAGEBASE)ro $(PACKAGEBASE)ru $(PACKAGEBASE)sk $(PACKAGEBASE)sl $(PACKAGEBASE)sv $(PACKAGEBASE)th $(PACKAGEBASE)tl $(PACKAGEBASE)tr $(PACKAGEBASE)ur $(PACKAGEBASE)zh_CN

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

install:

	cd ../generic/installation-guide/build && mkdir -p ../../../build/ubuntu/installation-guide && destination='../../../build/ubuntu/installation-guide/'  formats='html txt' architectures='amd64 hppa i386 ia64 powerpc sparc' ./buildweb.sh && cd ../../../ubuntu/

