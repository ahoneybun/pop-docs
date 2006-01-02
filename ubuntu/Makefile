# Makefile for the GNOME ubuntu Documentation
# Ubuntu Documentation Project <ubuntu-doc@lists.ubuntu.com>

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

# Docbook HTML Customization Layer
HTMLXSL=libs/gnome-ubuntu.xsl

# Style Guide HTML Customization Layer
SGHTMLXSL=libs/style-guide-html-cust.xsl

# About Ubuntu Docbook HTML Customization Layer
AUHTMLXSL=libs/ubuntu-html-cust.xsl

# Quick Tour Docbook HTML Customization Layer
QTHTMLXSL=libs/ubuntu-html-cust.xsl

# Desktop Guide Docbook HTML Customization Layer
DGHTMLCHUNKXSL=libs/desktopguide-html-chunk-cust.xsl
DGHTMLSINGLEXSL=libs/desktopguide-html-single-cust.xsl

# Base gnome directories for output from processor
BASE=../build/ubuntu/

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

.PHONY: all
all: au dg server package status

	# copy style sheet to build directory
	cp default.css ../build/ubuntu/default.css

# This is here to select what to build for the .deb package.
gdeb: au server dg

#Status: AVAILABLE
# Ubuntu Status Reports
status:
	@echo "----- Building status reports... please be patient. -----"
#	@echo "----- User Guide status report -----"
#	xsltproc --xinclude -o $(STBASE)ug-report.xml $(wOS) userguide/C/userguide.xml
#	xsltproc --xinclude -o $(STBASE)ug-report.html $(NWDBXSL) $(STBASE)ug-report.xml
	
#	@echo "----- Quick Guide status report -----"
#	xsltproc --xinclude -o $(STBASE)qg-report.xml $(wOS) quickguide/C/quick-guide.xml
#	xsltproc --xinclude -o $(STBASE)qg-report.html $(NWDBXSL) $(STBASE)qg-report.xml

#	@echo "----- Admin Guide status report -----"
#	xsltproc --xinclude -o $(STBASE)ag-report.xml $(wOS) adminguide/C/adminguide.xml
#	xsltproc --xinclude -o $(STBASE)ag-report.html $(NWDBXSL) $(STBASE)ag-report.xml

#	@echo "----- Install Guide status report -----"
#	xsltproc --xinclude -o $(STBASE)in-report.xml $(wOS) ../generic/instalguide/C/installation-guide.xml
#	xsltproc --xinclude -o $(STBASE)in-report.html $(NWDBXSL) $(STBASE)in-report.xml
	
#	@echo "----- Release Notes status report -----"
#	xsltproc --xinclude -o $(STBASE)rn-report.xml $(wOS) releasenotes/C/release-notes.xml
#	xsltproc --xinclude -o $(STBASE)rn-report.html $(NWDBXSL) $(STBASE)rn-report.xml
	
	@echo "----- About Ubuntu status report -----"
	xsltproc --xinclude -o $(STBASE)au-report.xml $(wOS) aboutubuntu/C/about-ubuntu.xml
	xsltproc --xinclude -o $(STBASE)au-report.html $(NWDBXSL) $(STBASE)au-report.xml

	@echo "----- desktopguide status report -----"
	xsltproc --xinclude -o $(STBASE)dg-report.xml $(wOS) desktopguide/C/desktopguide.xml
	xsltproc --xinclude -o $(STBASE)dg-report.html $(NWDBXSL) $(STBASE)dg-report.xml
	
	@echo "----- serverguide status report -----"
	xsltproc --xinclude -o $(STBASE)sg-report.xml $(wOS) ../generic/serverguide/C/serverguide.xml
	xsltproc --xinclude -o $(STBASE)sg-report.html $(NWDBXSL) $(STBASE)sg-report.xml
	
	@echo "----- Complete. Find outputs at" $(STBASE)

#Status: AVAILABLE
# Quick Tour
qt-html:
	@echo "--- Building the Ubuntu Quick Tour . . ."

	@echo "--- Removing existing build files (if any). . ."
	rm -f $(QTBASE)/C/index.html
	@echo "--- Building new files. . ."

	xsltproc --xinclude -o $(QTBASE)C/index.html $(QTHTMLXSL) quicktour/C/quicktour.xml
	xsltproc --xinclude -o $(QTBASE)qt-imagelist.txt $(MKIMGLST) quicktour/C/quicktour.xml

	mkdir -p $(QTBASE)quicktour_files/
	cp quicktour/quicktour_files/*.* $(QTBASE)quicktour_files

	mkdir -p $(IMAGES)C
	
	cp -r images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	cp libs/ubuntu.css $(QTBASE)
	@echo "--- Complete. Find outputs at" $(QTBASE)
	
#Status: AVAILABLE
# Installation Guide
in:
	
	@echo "--- Building the Ubuntu Installation Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(INBASE)C/*.html

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(INBASE)C/ --stringparam profile.os "gnome" $(HTMLXSL) ../generic/instalguide/C/installation-guide.xml
	xsltproc --xinclude -o $(INBASE)in-imagelist.txt $(MKIMGLST) ../generic/instalguide/C/installation-guide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	@echo "--- Complete. Find outputs at" $(INBASE)

#Status: AVAILABLE
# About Ubuntu Document
au: au-C
#au-all: au-C au-AF au-CA au-CS au-DA au-DE au-EL au-ES au-ET au-FA au-FI au-FR au-HE au-HU au-ID au-IT au-LV au-MK au-ML au-NL au-PL au-PT au-PT_BR au-RO au-SK au-SR au-SV au-TL au-XH

au-C:
	@echo "--- Building About Ubuntu Document"
	
	xsltproc --xinclude -o $(ABASE)C/index.html $(AUHTMLXSL) aboutubuntu/C/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/C/about-ubuntu.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	cp libs/ubuntu.css $(ABASE)

	@echo "--- Complete. Find outputs at" $(ABASE)

#Status: AVAILABLE
# Release Notes
rn:
	@echo "--- Building the Ubuntu Release Notes . . ."
	
	xsltproc --xinclude -o $(RNBASE)C/release-notes.html $(NWDBXSL) releasenotes/C/release-notes.xml
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
	@echo "--- Building the Desktop Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)C/*.*
	rm -f $(DGBASE)C/sample/*
	
	@echo "--- Building files . . ."

	rm -f ../build/ubuntu/desktopguide/C/*.*

	xsltproc --stringparam collect.xref.targets "only" --stringparam targets.filename "desktopguide/C/db/desktopguide.db" libs/desktopguide-html-chunk-cust.xsl desktopguide/C/desktopguide.xml

	xsltproc --stringparam collect.xref.targets "only" --stringparam targets.filename "desktopguide/C/db/bookinfo.db" libs/desktopguide-html-chunk-cust.xsl desktopguide/C/bookinfo.xml

	xsltproc --stringparam collect.xref.targets "only" --stringparam targets.filename "desktopguide/C/db/preface.db" libs/desktopguide-html-chunk-cust.xsl desktopguide/C/preface.xml

	xsltproc --stringparam collect.xref.targets "only" --stringparam targets.filename "desktopguide/C/db/getting-started.db" libs/desktopguide-html-chunk-cust.xsl desktopguide/C/getting-started.xml

	xsltproc --stringparam collect.xref.targets "only" --stringparam targets.filename "desktopguide/C/db/common-tasks.db" libs/desktopguide-html-chunk-cust.xsl desktopguide/C/common-tasks.xml

	xsltproc --stringparam collect.xref.targets "only" --stringparam targets.filename "desktopguide/C/db/config-system.db" libs/desktopguide-html-chunk-cust.xsl desktopguide/C/config-system.xml

	xsltproc --stringparam collect.xref.targets "only" --stringparam targets.filename "desktopguide/C/db/system-admin.db" libs/desktopguide-html-chunk-cust.xsl desktopguide/C/system-admin.xml

	xsltproc --stringparam collect.xref.targets "only" --stringparam targets.filename "desktopguide/C/db/tips-and-tricks.db" libs/desktopguide-html-chunk-cust.xsl desktopguide/C/tips-and-tricks.xml

	xsltproc --stringparam collect.xref.targets "only" --stringparam targets.filename "desktopguide/C/db/getting-help.db" libs/desktopguide-html-chunk-cust.xsl desktopguide/C/getting-help.xml

	xsltproc --xinclude --output ../build/ubuntu/desktopguide/C/index.html --stringparam target.database.document "desktopguide/C/olinkdb.xml" --stringparam current.docid "DesktopGuide" libs/desktopguide-html-chunk-cust.xsl desktopguide/C/desktopguide.xml 


#	@echo "--- Building new files. . ."
#	xsltproc --xinclude --stringparam target.database.document "../../../olinkdb.xml" --stringparam current.docid "DesktopGuide" #--stringparam base.dir $(DGBASE)C/ $(DGHTMLCHUNKXSL) desktopguide/C/desktopguide.xml
#	xsltproc --xinclude -o $(DGBASE)C/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/C/desktopguide.xml
#	#	xsltproc --xinclude -o $(DGBASE)dg-imagelist.txt $(MKIMGLST) desktopguide/C/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)C/sample
	cp -r desktopguide/C/sample/* $(DGBASE)C/sample/
	
	cp libs/ubuntu-book.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)C/

# QuickTour
#qt:
#	@echo "--- Coping the QuickTour . . ."
#	
#	@echo "--- Copying New Files. . ."
#	mkdir -p ../build/quicktour
#	cp -r quicktour/*.* ../build/quicktour/
#	@echo "--- Complete."

clean:
	rm -rf $(BASE)

## Server Guide
server:
	@echo "--- Building the Ubuntu Server Starter Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(SERVERBASE)C/*.html 
	@echo "--- Building new files. . . "

	xsltproc --xinclude --stringparam base.dir $(SERVERBASE)C/ $(DGHTMLCHUNKXSL) ../generic/serverguide/C/serverguide.xml
	xsltproc --xinclude -o $(SERVERBASE)C/serverguide-all.html $(DGHTMLSINGLEXSL) ../generic/serverguide/C/serverguide.xml

	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	# copy style sheet to build directory
	cp libs/ubuntu-book.css $(SERVERBASE)
	
	@echo "--- Complete. Find output at" $(SERVERBASE)

## Packaging Guide
package:
	@echo "--- Building the Ubuntu Installation Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(PGBASE)C/*.html 
	@echo "--- Building new files. . . "

	xsltproc --xinclude --stringparam base.dir $(PGBASE)C/ $(DGHTMLCHUNKXSL) ../generic/packagingguide/C/packagingguide.xml

	mkdir -p $(PGBASE)images
	mkdir -p $(PGBASE)images/C
	cp -r ../generic/packagingguide/images/C/*.* $(PGBASE)images/C/

	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	# copy style sheet to build directory
	cp libs/ubuntu-book.css ../build/ubuntu/packagingguide/ubuntu-book.css
	
	@echo "--- Complete. Find output at" $(PGBASE)
