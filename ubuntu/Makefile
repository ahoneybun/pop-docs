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

website: au dg server package rn

	# copy style sheet and common images to build directory
	mkdir -p ../build/ubuntu/common/img
	cp libs/*css ../build/ubuntu/common/
	cp libs/img/*png ../build/ubuntu/common/img/

# This builds all the guides in PDF format. You need to install Java, Apache Fop, the Jimi imaging library, and other horrible non-free things to make this work

pdf: server-pdf dg-pdf package-pdf

clean:
	rm -rf $(BASE)

#######################################
#
# Here begin the HTML build targets
# 
#######################################

# About Ubuntu Document
au: $(ABASE)C $(ABASE)af $(ABASE)am $(ABASE)ar $(ABASE)bg $(ABASE)bn $(ABASE)bs $(ABASE)ca $(ABASE)cs $(ABASE)da $(ABASE)de $(ABASE)el $(ABASE)en_GB $(ABASE)es $(ABASE)fi $(ABASE)fr $(ABASE)gl $(ABASE)he $(ABASE)hr $(ABASE)id $(ABASE)is $(ABASE)it $(ABASE)ja $(ABASE)jv $(ABASE)ka $(ABASE)ko $(ABASE)lo $(ABASE)lt $(ABASE)mk $(ABASE)nb $(ABASE)nl $(ABASE)oc $(ABASE)pl $(ABASE)pt $(ABASE)pt_BR $(ABASE)ro $(ABASE)ru $(ABASE)sco $(ABASE)sk $(ABASE)sl $(ABASE)sv $(ABASE)th $(ABASE)tl $(ABASE)tr $(ABASE)urd $(ABASE)zh_CN $(ABASE)zh_HK $(ABASE)zh_TW

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

dg: $(DGBASE)C $(DGBASE)am $(DGBASE)be $(DGBASE)bn $(DGBASE)cs $(DGBASE)da $(DGBASE)de $(DGBASE)en_GB $(DGBASE)es $(DGBASE)et $(DGBASE)fi $(DGBASE)fr $(DGBASE)he $(DGBASE)hr $(DGBASE)hu $(DGBASE)id $(DGBASE)it $(DGBASE)ja $(DGBASE)ka $(DGBASE)ko $(DGBASE)nb $(DGBASE)nl $(DGBASE)oc $(DGBASE)pl $(DGBASE)pt $(DGBASE)pt_BR $(DGBASE)ro $(DGBASE)ru $(DGBASE)sk $(DGBASE)sr $(DGBASE)sv $(DGBASE)th $(DGBASE)tl $(DGBASE)tr $(DGBASE)urd $(DGBASE)zh_CN $(DGBASE)zh_TW

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

server: $(SERVERBASE)C $(SERVERBASE)bn $(SERVERBASE)de $(SERVERBASE)en_GB $(SERVERBASE)es $(SERVERBASE)et $(SERVERBASE)fr $(SERVERBASE)he $(SERVERBASE)hu $(SERVERBASE)id $(SERVERBASE)it $(SERVERBASE)ko $(SERVERBASE)lt $(SERVERBASE)nb $(SERVERBASE)pl $(SERVERBASE)pt $(SERVERBASE)pt_BR $(SERVERBASE)ro $(SERVERBASE)ru $(SERVERBASE)sk $(SERVERBASE)sv $(SERVERBASE)th $(SERVERBASE)tr $(SERVERBASE)urd $(SERVERBASE)zh_CN $(SERVERBASE)zh_TW 

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

package: $(PACKAGEBASE)C $(PACKAGEBASE)bn $(PACKAGEBASE)cs $(PACKAGEBASE)de $(PACKAGEBASE)es $(PACKAGEBASE)fr $(PACKAGEBASE)id $(PACKAGEBASE)it $(PACKAGEBASE)hu $(PACKAGEBASE)ka $(PACKAGEBASE)ko $(PACKAGEBASE)pl $(PACKAGEBASE)pt $(PACKAGEBASE)pt_BR $(PACKAGEBASE)ro $(PACKAGEBASE)ru $(PACKAGEBASE)sk $(PACKAGEBASE)sv $(PACKAGEBASE)th $(PACKAGEBASE)tl $(PACKAGEBASE)tr $(PACKAGEBASE)urd $(PACKAGEBASE)zh_CN

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

$(PACKAGEBASE)%: ../generic/packagingguide/%/packagingguideguide.xml
	xsltproc --xinclude -o $@/index.html $(UBUNTUCHUNKXSL) $<

#######################################
#
# Here begin the PDF build targets
# 
#######################################

# Desktop Guide

dg-pdf: dg-pdf-C dg-pdf-am dg-pdf-be dg-pdf-bn dg-pdf-cs dg-pdf-da dg-pdf-de dg-pdf-en_GB dg-pdf-es dg-pdf-et dg-pdf-fi dg-pdf-fr dg-pdf-he dg-pdf-hu dg-pdf-id dg-pdf-it dg-pdf-ja dg-pdf-ka dg-pdf-ko dg-pdf-nb dg-pdf-nl dg-pdf-oc dg-pdf-pl dg-pdf-pt dg-pdf-pt_BR dg-pdf-ro dg-pdf-ru dg-pdf-sk dg-pdf-sr dg-pdf-sv dg-pdf-th dg-pdf-tl dg-pdf-tr dg-pdf-urd dg-pdf-zh_CN dg-pdf-zh_TW

dg-pdf-C:

	xsltproc --xinclude -o $(PDFBASE)C/desktopguide.fo $(PDFSTYLE) desktopguide/C/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)C/desktopguide.fo -pdf $(PDFBASE)C/desktopguide.pdf
	#rm $(PDFBASE)C/desktopguide.fo

dg-pdf-am:

	xsltproc --xinclude -o $(PDFBASE)am/desktopguide.fo $(PDFSTYLE) desktopguide/am/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)am/desktopguide.fo -pdf $(PDFBASE)am/desktopguide.pdf
	rm $(PDFBASE)am/desktopguide.fo

dg-pdf-be:

	xsltproc --xinclude -o $(PDFBASE)be/desktopguide.fo $(PDFSTYLE) desktopguide/be/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)be/desktopguide.fo -pdf $(PDFBASE)be/desktopguide.pdf
	rm $(PDFBASE)be/desktopguide.fo

dg-pdf-bn:

	xsltproc --xinclude -o $(PDFBASE)bn/desktopguide.fo $(PDFSTYLE) desktopguide/bn/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)bn/desktopguide.fo -pdf $(PDFBASE)bn/desktopguide.pdf
	rm $(PDFBASE)bn/desktopguide.fo

dg-pdf-cs:

	xsltproc --xinclude -o $(PDFBASE)cs/desktopguide.fo $(PDFSTYLE) desktopguide/cs/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)cs/desktopguide.fo -pdf $(PDFBASE)cs/desktopguide.pdf
	rm $(PDFBASE)cs/desktopguide.fo

dg-pdf-da:

	xsltproc --xinclude -o $(PDFBASE)da/desktopguide.fo $(PDFSTYLE) desktopguide/da/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)da/desktopguide.fo -pdf $(PDFBASE)da/desktopguide.pdf
	rm $(PDFBASE)da/desktopguide.fo

dg-pdf-de:

	xsltproc --xinclude -o $(PDFBASE)de/desktopguide.fo $(PDFSTYLE) desktopguide/de/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)de/desktopguide.fo -pdf $(PDFBASE)de/desktopguide.pdf
	rm $(PDFBASE)de/desktopguide.fo

dg-pdf-en_GB:

	xsltproc --xinclude -o $(PDFBASE)en_GB/desktopguide.fo $(PDFSTYLE) desktopguide/en_GB/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)en_GB/desktopguide.fo -pdf $(PDFBASE)en_GB/desktopguide.pdf
	rm $(PDFBASE)en_GB/desktopguide.fo

dg-pdf-es:

	xsltproc --xinclude -o $(PDFBASE)es/desktopguide.fo $(PDFSTYLE) desktopguide/es/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)es/desktopguide.fo -pdf $(PDFBASE)es/desktopguide.pdf
	rm $(PDFBASE)es/desktopguide.fo

dg-pdf-et:

	xsltproc --xinclude -o $(PDFBASE)et/desktopguide.fo $(PDFSTYLE) desktopguide/et/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)et/desktopguide.fo -pdf $(PDFBASE)et/desktopguide.pdf
	rm $(PDFBASE)et/desktopguide.fo

dg-pdf-fi:

	xsltproc --xinclude -o $(PDFBASE)fi/desktopguide.fo $(PDFSTYLE) desktopguide/fi/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)fi/desktopguide.fo -pdf $(PDFBASE)fi/desktopguide.pdf
	rm $(PDFBASE)fi/desktopguide.fo

dg-pdf-fr:

	xsltproc --xinclude -o $(PDFBASE)fr/desktopguide.fo $(PDFSTYLE) desktopguide/fr/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)fr/desktopguide.fo -pdf $(PDFBASE)fr/desktopguide.pdf
	rm $(PDFBASE)fr/desktopguide.fo

dg-pdf-he:

	xsltproc --xinclude -o $(PDFBASE)he/desktopguide.fo $(PDFSTYLE) desktopguide/he/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)he/desktopguide.fo -pdf $(PDFBASE)he/desktopguide.pdf
	rm $(PDFBASE)he/desktopguide.fo

dg-pdf-hr:

	xsltproc --xinclude -o $(PDFBASE)hr/desktopguide.fo $(PDFSTYLE) desktopguide/hr/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)hr/desktopguide.fo -pdf $(PDFBASE)hr/desktopguide.pdf
	rm $(PDFBASE)hr/desktopguide.fo

dg-pdf-hu:

	xsltproc --xinclude -o $(PDFBASE)hu/desktopguide.fo $(PDFSTYLE) desktopguide/hu/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)hu/desktopguide.fo -pdf $(PDFBASE)hu/desktopguide.pdf
	rm $(PDFBASE)hu/desktopguide.fo

dg-pdf-id:

	xsltproc --xinclude -o $(PDFBASE)id/desktopguide.fo $(PDFSTYLE) desktopguide/id/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)id/desktopguide.fo -pdf $(PDFBASE)id/desktopguide.pdf
	rm $(PDFBASE)id/desktopguide.fo

dg-pdf-it:

	xsltproc --xinclude -o $(PDFBASE)it/desktopguide.fo $(PDFSTYLE) desktopguide/it/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)it/desktopguide.fo -pdf $(PDFBASE)it/desktopguide.pdf
	rm $(PDFBASE)it/desktopguide.fo

dg-pdf-ja:

	xsltproc --xinclude -o $(PDFBASE)ja/desktopguide.fo $(PDFSTYLE) desktopguide/ja/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ja/desktopguide.fo -pdf $(PDFBASE)ja/desktopguide.pdf
	rm $(PDFBASE)ja/desktopguide.fo

dg-pdf-ka:

	xsltproc --xinclude -o $(PDFBASE)ka/desktopguide.fo $(PDFSTYLE) desktopguide/ka/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ka/desktopguide.fo -pdf $(PDFBASE)ka/desktopguide.pdf
	rm $(PDFBASE)ka/desktopguide.fo

dg-pdf-ko:

	xsltproc --stringparam body.font.family "batang" --stringparam monospace.font.family "dotum" --xinclude -o $(PDFBASE)ko/desktopguide.fo $(PDFSTYLE) desktopguide/ko/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ko/desktopguide.fo -pdf $(PDFBASE)ko/desktopguide.pdf
	rm $(PDFBASE)ko/desktopguide.fo

dg-pdf-nb:

	xsltproc --xinclude -o $(PDFBASE)nb/desktopguide.fo $(PDFSTYLE) desktopguide/nb/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)nb/desktopguide.fo -pdf $(PDFBASE)nb/desktopguide.pdf
	rm $(PDFBASE)nb/desktopguide.fo

dg-pdf-nl:

	xsltproc --xinclude -o $(PDFBASE)nl/desktopguide.fo $(PDFSTYLE) desktopguide/nl/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)nl/desktopguide.fo -pdf $(PDFBASE)nl/desktopguide.pdf
	rm $(PDFBASE)nl/desktopguide.fo

dg-pdf-oc:

	xsltproc --xinclude -o $(PDFBASE)oc/desktopguide.fo $(PDFSTYLE) desktopguide/oc/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)oc/desktopguide.fo -pdf $(PDFBASE)oc/desktopguide.pdf
	rm $(PDFBASE)oc/desktopguide.fo

dg-pdf-pl:

	xsltproc --xinclude -o $(PDFBASE)pl/desktopguide.fo $(PDFSTYLE) desktopguide/pl/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)pl/desktopguide.fo -pdf $(PDFBASE)pl/desktopguide.pdf
	rm $(PDFBASE)pl/desktopguide.fo

dg-pdf-pt:

	xsltproc --xinclude -o $(PDFBASE)pt/desktopguide.fo $(PDFSTYLE) desktopguide/pt/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)pt/desktopguide.fo -pdf $(PDFBASE)pt/desktopguide.pdf
	rm $(PDFBASE)pt/desktopguide.fo

dg-pdf-pt_BR:

	xsltproc --xinclude -o $(PDFBASE)pt_BR/desktopguide.fo $(PDFSTYLE) desktopguide/pt_BR/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)pt_BR/desktopguide.fo -pdf $(PDFBASE)pt_BR/desktopguide.pdf
	rm $(PDFBASE)pt_BR/desktopguide.fo

dg-pdf-ro:

	xsltproc --xinclude -o $(PDFBASE)ro/desktopguide.fo $(PDFSTYLE) desktopguide/ro/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ro/desktopguide.fo -pdf $(PDFBASE)ro/desktopguide.pdf
	rm $(PDFBASE)ro/desktopguide.fo

dg-pdf-ru:

	xsltproc --xinclude -o $(PDFBASE)ru/desktopguide.fo $(PDFSTYLE) desktopguide/ru/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ru/desktopguide.fo -pdf $(PDFBASE)ru/desktopguide.pdf
	rm $(PDFBASE)ru/desktopguide.fo

dg-pdf-sk:

	xsltproc --xinclude -o $(PDFBASE)sk/desktopguide.fo $(PDFSTYLE) desktopguide/sk/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)sk/desktopguide.fo -pdf $(PDFBASE)sk/desktopguide.pdf
	rm $(PDFBASE)sk/desktopguide.fo

dg-pdf-sr:

	xsltproc --xinclude -o $(PDFBASE)sr/desktopguide.fo $(PDFSTYLE) desktopguide/sr/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)sr/desktopguide.fo -pdf $(PDFBASE)sr/desktopguide.pdf
	rm $(PDFBASE)sr/desktopguide.fo

dg-pdf-sv:

	xsltproc --xinclude -o $(PDFBASE)sv/desktopguide.fo $(PDFSTYLE) desktopguide/sv/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)sv/desktopguide.fo -pdf $(PDFBASE)sv/desktopguide.pdf
	rm $(PDFBASE)sv/desktopguide.fo

dg-pdf-th:

	xsltproc --xinclude -o $(PDFBASE)th/desktopguide.fo $(PDFSTYLE) desktopguide/th/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)th/desktopguide.fo -pdf $(PDFBASE)th/desktopguide.pdf
	rm $(PDFBASE)th/desktopguide.fo

dg-pdf-tl:

	xsltproc --xinclude -o $(PDFBASE)tl/desktopguide.fo $(PDFSTYLE) desktopguide/tl/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)tl/desktopguide.fo -pdf $(PDFBASE)tl/desktopguide.pdf
	rm $(PDFBASE)tl/desktopguide.fo

dg-pdf-tr:

	xsltproc --xinclude -o $(PDFBASE)tr/desktopguide.fo $(PDFSTYLE) desktopguide/tr/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)tr/desktopguide.fo -pdf $(PDFBASE)tr/desktopguide.pdf
	rm $(PDFBASE)tr/desktopguide.fo

dg-pdf-urd:

	xsltproc --xinclude -o $(PDFBASE)urd/desktopguide.fo $(PDFSTYLE) desktopguide/urd/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)urd/desktopguide.fo -pdf $(PDFBASE)urd/desktopguide.pdf
	rm $(PDFBASE)urd/desktopguide.fo

dg-pdf-zh_CN:

	xsltproc --stringparam body.font.family "uming" --stringparam monospace.font.family "uming" --xinclude -o $(PDFBASE)zh_CN/desktopguide.fo $(PDFSTYLE) desktopguide/zh_CN/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)zh_CN/desktopguide.fo -pdf $(PDFBASE)zh_CN/desktopguide.pdf
	rm $(PDFBASE)zh_CN/desktopguide.fo

dg-pdf-zh_TW:

	xsltproc --xinclude -o $(PDFBASE)zh_TW/desktopguide.fo $(PDFSTYLE) desktopguide/zh_TW/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)zh_TW/desktopguide.fo -pdf $(PDFBASE)zh_TW/desktopguide.pdf
	rm $(PDFBASE)zh_TW/desktopguide.fo

# Lulu book targets
dg-lulu:

	xsltproc --xinclude -o $(LULUBASE)C/desktopguide.fo $(LULUSTYLE) desktopguide/C/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(LULUBASE)C/desktopguide.fo -pdf $(LULUBASE)C/desktopguide.pdf
	#rm $(LULUBASE)C/desktopguide.fo

# Packaging Guide

package-pdf: package-pdf-C package-pdf-bn package-pdf-cs package-pdf-de package-pdf-es package-pdf-fr package-pdf-hu package-pdf-id package-pdf-it package-pdf-ka package-pdf-ko package-pdf-pl package-pdf-pt package-pdf-pt_BR package-pdf-ro package-pdf-sk package-pdf-sv package-pdf-th package-pdf-tl package-pdf-tr package-pdf-urd package-pdf-zh_CN

package-pdf-C:

	xsltproc --xinclude -o $(PDFBASE)C/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/C/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)C/packagingguide.fo -pdf $(PDFBASE)C/packagingguide.pdf
	rm $(PDFBASE)C/packagingguide.fo

package-pdf-bn:

	xsltproc --xinclude -o $(PDFBASE)bn/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/bn/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)bn/packagingguide.fo -pdf $(PDFBASE)bn/packagingguide.pdf
	rm $(PDFBASE)bn/packagingguide.fo

package-pdf-cs:

	xsltproc --xinclude -o $(PDFBASE)cs/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/cs/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)cs/packagingguide.fo -pdf $(PDFBASE)cs/packagingguide.pdf
	rm $(PDFBASE)cs/packagingguide.fo

package-pdf-de:

	xsltproc --xinclude -o $(PDFBASE)de/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/de/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)de/packagingguide.fo -pdf $(PDFBASE)de/packagingguide.pdf
	rm $(PDFBASE)de/packagingguide.fo

package-pdf-es:

	xsltproc --xinclude -o $(PDFBASE)es/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/es/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)es/packagingguide.fo -pdf $(PDFBASE)es/packagingguide.pdf
	rm $(PDFBASE)es/packagingguide.fo

package-pdf-fr:

	xsltproc --xinclude -o $(PDFBASE)fr/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/fr/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)fr/packagingguide.fo -pdf $(PDFBASE)fr/packagingguide.pdf
	rm $(PDFBASE)fr/packagingguide.fo

package-pdf-hu:

	xsltproc --xinclude -o $(PDFBASE)hu/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/hu/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)hu/packagingguide.fo -pdf $(PDFBASE)hu/packagingguide.pdf
	rm $(PDFBASE)hu/packagingguide.fo

package-pdf-id:

	xsltproc --xinclude -o $(PDFBASE)id/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/id/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)id/packagingguide.fo -pdf $(PDFBASE)id/packagingguide.pdf
	rm $(PDFBASE)id/packagingguide.fo

package-pdf-it:

	xsltproc --xinclude -o $(PDFBASE)it/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/it/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)it/packagingguide.fo -pdf $(PDFBASE)it/packagingguide.pdf
	rm $(PDFBASE)it/packagingguide.fo

package-pdf-ka:

	xsltproc --xinclude -o $(PDFBASE)ka/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/ka/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ka/packagingguide.fo -pdf $(PDFBASE)ka/packagingguide.pdf
	rm $(PDFBASE)ka/packagingguide.fo

package-pdf-ko:

	xsltproc --stringparam body.font.family "batang" --stringparam monospace.font.family "dotum" -xinclude -o $(PDFBASE)ko/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/ko/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ko/packagingguide.fo -pdf $(PDFBASE)ko/packagingguide.pdf
	rm $(PDFBASE)ko/packagingguide.fo

package-pdf-pl:

	xsltproc --xinclude -o $(PDFBASE)pl/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/pl/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)pl/packagingguide.fo -pdf $(PDFBASE)pl/packagingguide.pdf
	rm $(PDFBASE)pl/packagingguide.fo

package-pdf-pt:

	xsltproc --xinclude -o $(PDFBASE)pt/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/pt/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)pt/packagingguide.fo -pdf $(PDFBASE)pt/packagingguide.pdf
	rm $(PDFBASE)pt/packagingguide.fo

package-pdf-pt_BR:

	xsltproc --xinclude -o $(PDFBASE)pt_BR/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/pt_BR/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)pt_BR/packagingguide.fo -pdf $(PDFBASE)pt_BR/packagingguide.pdf
	rm $(PDFBASE)pt_BR/packagingguide.fo

package-pdf-ro:

	xsltproc --xinclude -o $(PDFBASE)ro/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/ro/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ro/packagingguide.fo -pdf $(PDFBASE)ro/packagingguide.pdf
	rm $(PDFBASE)ro/packagingguide.fo

package-pdf-ru:

	xsltproc --xinclude -o $(PDFBASE)ru/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/ru/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ru/packagingguide.fo -pdf $(PDFBASE)ru/packagingguide.pdf
	rm $(PDFBASE)ru/packagingguide.fo

package-pdf-sk:

	xsltproc --xinclude -o $(PDFBASE)sk/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/sk/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)sk/packagingguide.fo -pdf $(PDFBASE)sk/packagingguide.pdf
	rm $(PDFBASE)sk/packagingguide.fo

package-pdf-sv:

	xsltproc --xinclude -o $(PDFBASE)sv/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/sv/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)sv/packagingguide.fo -pdf $(PDFBASE)sv/packagingguide.pdf
	rm $(PDFBASE)sv/packagingguide.fo

package-pdf-th:

	xsltproc --xinclude -o $(PDFBASE)th/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/th/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)th/packagingguide.fo -pdf $(PDFBASE)th/packagingguide.pdf
	rm $(PDFBASE)th/packagingguide.fo

package-pdf-tl:

	xsltproc --xinclude -o $(PDFBASE)tl/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/tl/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)tl/packagingguide.fo -pdf $(PDFBASE)tl/packagingguide.pdf
	rm $(PDFBASE)tl/packagingguide.fo

package-pdf-tr:

	xsltproc --xinclude -o $(PDFBASE)tr/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/tr/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)tr/packagingguide.fo -pdf $(PDFBASE)tr/packagingguide.pdf
	rm $(PDFBASE)tr/packagingguide.fo

package-pdf-urd:

	xsltproc --xinclude -o $(PDFBASE)urd/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/urd/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)urd/packagingguide.fo -pdf $(PDFBASE)urd/packagingguide.pdf
	rm $(PDFBASE)urd/packagingguide.fo

package-pdf-zh_CN:

	xsltproc --stringparam body.font.family "uming" --stringparam monospace.font.family "uming" --xinclude -o $(PDFBASE)zh_CN/packagingguide.fo $(PDFSTYLE) ../generic/packagingguide/zh_CN/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)zh_CN/packagingguide.fo -pdf $(PDFBASE)zh_CN/packagingguide.pdf
	rm $(PDFBASE)zh_CN/packagingguide.fo

package-lulu:

	xsltproc --xinclude -o $(LULUBASE)C/packagingguide.fo $(LULUSTYLE) ../generic/packagingguide/C/packagingguide.xml
	fop -c ../libs/pdf/fop.xconf -c ../libs/pdf/userconfig.xml -fo $(LULUBASE)C/packagingguide.fo -pdf $(LULUBASE)C/packagingguide.pdf
	rm $(LULUBASE)C/packagingguide.fo

# Server Guide


server-pdf: server-pdf-C server-pdf-bn server-pdf-de server-pdf-en_GB server-pdf-es server-pdf-et server-pdf-fr server-pdf-he server-pdf-id server-pdf-it server-pdf-ko server-pdf-lt server-pdf-pl server-pdf-pt server-pdf-pt_BR server-pdf-ro server-pdf-sk server-pdf-sv server-pdf-tr server-pdf-urd server-pdf-zh_CN

server-pdf-C:

	xsltproc --xinclude -o $(PDFBASE)C/serverguide.fo $(PDFSTYLE) ../generic/serverguide/C/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)C/serverguide.fo -pdf $(PDFBASE)C/serverguide.pdf
	rm $(PDFBASE)C/serverguide.fo

server-pdf-bn:

	xsltproc --xinclude -o $(PDFBASE)bn/serverguide.fo $(PDFSTYLE) ../generic/serverguide/bn/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)bn/serverguide.fo -pdf $(PDFBASE)bn/serverguide.pdf
	rm $(PDFBASE)bn/serverguide.fo

server-pdf-de:

	xsltproc --xinclude -o $(PDFBASE)de/serverguide.fo $(PDFSTYLE) ../generic/serverguide/de/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)de/serverguide.fo -pdf $(PDFBASE)de/serverguide.pdf
	rm $(PDFBASE)de/serverguide.fo

server-pdf-en_GB:

	xsltproc --xinclude -o $(PDFBASE)en_GB/serverguide.fo $(PDFSTYLE) ../generic/serverguide/en_GB/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)en_GB/serverguide.fo -pdf $(PDFBASE)en_GB/serverguide.pdf
	rm $(PDFBASE)en_GB/serverguide.fo

server-pdf-es:

	xsltproc --xinclude -o $(PDFBASE)es/serverguide.fo $(PDFSTYLE) ../generic/serverguide/es/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)es/serverguide.fo -pdf $(PDFBASE)es/serverguide.pdf
	rm $(PDFBASE)es/serverguide.fo

server-pdf-et:

	xsltproc --xinclude -o $(PDFBASE)et/serverguide.fo $(PDFSTYLE) ../generic/serverguide/et/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)et/serverguide.fo -pdf $(PDFBASE)et/serverguide.pdf
	rm $(PDFBASE)et/serverguide.fo

server-pdf-fr:

	xsltproc --xinclude -o $(PDFBASE)fr/serverguide.fo $(PDFSTYLE) ../generic/serverguide/fr/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)fr/serverguide.fo -pdf $(PDFBASE)fr/serverguide.pdf
	rm $(PDFBASE)fr/serverguide.fo

server-pdf-he:

	xsltproc --xinclude -o $(PDFBASE)he/serverguide.fo $(PDFSTYLE) ../generic/serverguide/he/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)he/serverguide.fo -pdf $(PDFBASE)he/serverguide.pdf
	rm $(PDFBASE)he/serverguide.fo

server-pdf-hu:

	xsltproc --xinclude -o $(PDFBASE)hu/serverguide.fo $(PDFSTYLE) ../generic/serverguide/hu/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)hu/serverguide.fo -pdf $(PDFBASE)hu/serverguide.pdf
	rm $(PDFBASE)hu/serverguide.fo

server-pdf-id:

	xsltproc --xinclude -o $(PDFBASE)id/serverguide.fo $(PDFSTYLE) ../generic/serverguide/id/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)id/serverguide.fo -pdf $(PDFBASE)id/serverguide.pdf
	rm $(PDFBASE)id/serverguide.fo

server-pdf-it:

	xsltproc --xinclude -o $(PDFBASE)it/serverguide.fo $(PDFSTYLE) ../generic/serverguide/it/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)it/serverguide.fo -pdf $(PDFBASE)it/serverguide.pdf
	rm $(PDFBASE)it/serverguide.fo

server-pdf-ko:

	xsltproc --stringparam body.font.family "batang" --stringparam monospace.font.family "dotum" --xinclude -o $(PDFBASE)ko/serverguide.fo $(PDFSTYLE) ../generic/serverguide/ko/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ko/serverguide.fo -pdf $(PDFBASE)ko/serverguide.pdf
	rm $(PDFBASE)ko/serverguide.fo

server-pdf-lt:

	xsltproc --xinclude -o $(PDFBASE)lt/serverguide.fo $(PDFSTYLE) ../generic/serverguide/lt/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)lt/serverguide.fo -pdf $(PDFBASE)lt/serverguide.pdf
	rm $(PDFBASE)lt/serverguide.fo

server-pdf-nb:

	xsltproc --xinclude -o $(PDFBASE)nb/serverguide.fo $(PDFSTYLE) ../generic/serverguide/nb/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)nb/serverguide.fo -pdf $(PDFBASE)nb/serverguide.pdf
	rm $(PDFBASE)nb/serverguide.fo

server-pdf-pl:

	xsltproc --xinclude -o $(PDFBASE)pl/serverguide.fo $(PDFSTYLE) ../generic/serverguide/pl/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)pl/serverguide.fo -pdf $(PDFBASE)pl/serverguide.pdf
	rm $(PDFBASE)pl/serverguide.fo

server-pdf-pt:

	xsltproc --xinclude -o $(PDFBASE)pt/serverguide.fo $(PDFSTYLE) ../generic/serverguide/pt/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)pt/serverguide.fo -pdf $(PDFBASE)pt/serverguide.pdf
	rm $(PDFBASE)pt/serverguide.fo

server-pdf-pt_BR:

	xsltproc --xinclude -o $(PDFBASE)pt_BR/serverguide.fo $(PDFSTYLE) ../generic/serverguide/pt_BR/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)pt_BR/serverguide.fo -pdf $(PDFBASE)pt_BR/serverguide.pdf
	rm $(PDFBASE)pt_BR/serverguide.fo

server-pdf-ro:

	xsltproc --xinclude -o $(PDFBASE)ro/serverguide.fo $(PDFSTYLE) ../generic/serverguide/ro/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ro/serverguide.fo -pdf $(PDFBASE)ro/serverguide.pdf
	rm $(PDFBASE)ro/serverguide.fo

server-pdf-ru:

	xsltproc --xinclude -o $(PDFBASE)ru/serverguide.fo $(PDFSTYLE) ../generic/serverguide/ru/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ru/serverguide.fo -pdf $(PDFBASE)ru/serverguide.pdf
	rm $(PDFBASE)ru/serverguide.fo

server-pdf-sk:

	xsltproc --xinclude -o $(PDFBASE)sk/serverguide.fo $(PDFSTYLE) ../generic/serverguide/sk/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)sk/serverguide.fo -pdf $(PDFBASE)sk/serverguide.pdf
	rm $(PDFBASE)sk/serverguide.fo

server-pdf-sv:

	xsltproc --xinclude -o $(PDFBASE)sv/serverguide.fo $(PDFSTYLE) ../generic/serverguide/sv/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)sv/serverguide.fo -pdf $(PDFBASE)sv/serverguide.pdf
	rm $(PDFBASE)sv/serverguide.fo

server-pdf-th:

	xsltproc --xinclude -o $(PDFBASE)th/serverguide.fo $(PDFSTYLE) ../generic/serverguide/th/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)th/serverguide.fo -pdf $(PDFBASE)th/serverguide.pdf
	rm $(PDFBASE)th/serverguide.fo

server-pdf-tr:

	xsltproc --xinclude -o $(PDFBASE)tr/serverguide.fo $(PDFSTYLE) ../generic/serverguide/tr/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)tr/serverguide.fo -pdf $(PDFBASE)tr/serverguide.pdf
	rm $(PDFBASE)tr/serverguide.fo

server-pdf-urd:

	xsltproc --xinclude -o $(PDFBASE)urd/serverguide.fo $(PDFSTYLE) ../generic/serverguide/urd/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)urd/serverguide.fo -pdf $(PDFBASE)urd/serverguide.pdf
	rm $(PDFBASE)urd/serverguide.fo

server-pdf-zh_CN:

	xsltproc --stringparam body.font.family "uming" --stringparam monospace.font.family "uming" --xinclude -o $(PDFBASE)zh_CN/serverguide.fo $(PDFSTYLE) ../generic/serverguide/zh_CN/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)zh_CN/serverguide.fo -pdf $(PDFBASE)zh_CN/serverguide.pdf
	rm $(PDFBASE)zh_CN/serverguide.fo

server-pdf-zh_TW:

	xsltproc --stringparam body.font.family "uming" --stringparam monospace.font.family "uming" --xinclude -o $(PDFBASE)zh_TW/serverguide.fo $(PDFSTYLE) ../generic/serverguide/zh_TW/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)zh_TW/serverguide.fo -pdf $(PDFBASE)zh_TW/serverguide.pdf
	rm $(PDFBASE)zh_TW/serverguide.fo

# PDF Targets for building the Lulu book
server-lulu:

	xsltproc --xinclude -o $(LULUBASE)C/serverguide.fo $(LULUSTYLE) ../generic/serverguide/C/serverguide.xml
	fop -c ../libs/pdf/fop.xconf -c ../libs/pdf/userconfig.xml -fo $(LULUBASE)C/serverguide.fo -pdf $(LULUBASE)C/serverguide.pdf
	rm $(LULUBASE)C/serverguide.fo
