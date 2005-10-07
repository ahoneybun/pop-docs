# Makefile for the GNOME ubuntu Documentation
# Sean Wheller <sean@inwords.co.za>
# Jeff Schering <jeffschering@gmail.com>
# Matt Galvin <matt.t.galvin@gmail.com>

MAKECMD=make

# XSL Processors
XSLTPROC=/usr/bin/xsltproc

current_distro=$(shell test -e /etc/debian_version && echo "debian")

# NWalsh Docbook XSL's
ifeq ($(current_distro), debian)
# Ubuntu
NWDBXSL=/usr/share/xml/docbook/stylesheet/nwalsh/html/docbook.xsl

# Debian and Ubuntu also need an explicit location for the XML catalog files
export XML_CATALOG_FILES = /usr/share/xml/docbook/schema/dtd/4.1.2/catalog.xml
else
# SuSE
NWDBXSL=/usr/share/xml/docbook/stylesheet/nwalsh/current/html/docbook.xsl
endif

# Makes an Image list text file
MKIMGLST=../libs/imagelist.xsl

# Collected and Write Status
wOS=../libs/writeOwnerStatus.xsl

# Docbook HTML Customization Layer
HTMLXSL=libs/gnome-ubuntu.xsl

# Syle Guide HTML Customization Layer
SGHTMLXSL=libs/style-guide-html-cust.xsl

# About Ubuntu Docbook HTML Customization Layer
AUHTMLXSL=../libs/about-ubuntu-html-cust.xsl

# FAQ Guide  Docbook HTML Customization Layer
FAQHTMLXSL=../libs/faqguide-html-cust.xsl

# Base gnome directories for output from processor
BASE=../build/gnome/

STBASE=../build/gnome/status/

UGBASE=../build/gnome/userguide/

QGBASE=../build/gnome/quickguide/

AGBASE=../build/gnome/adminguide/

INBASE=../build/gnome/ubuntu-install/

RNBASE=../build/gnome/release-notes/

ABASE=../build/gnome/about-ubuntu/

FAQBASEI386=../build/gnome/faqi386/

FAQBASEAMD64=../build/gnome/faqamd64/

FAQBASEPPC=../build/gnome/faqppc/

SGBASE=../build/styleguide/

IMAGES=../build/gnome/images/

.PHONY: all
all: status ug qg ag in au rn faq sg qt
	# copy style sheet to build directory
	cp default.css ../build/gnome/default.css

# This is here to select what to build for the .deb package.
gdeb: rn au faq
	cp default.css ../build/gnome/default.css

#Status: AVAILABLE
# Ubuntu Status Reports
status:
	@echo "----- Building status reports... please be patient. -----"
	@echo "----- User Guide status report -----"
	xsltproc -o $(STBASE)ug-report.xml $(wOS) userguide/C/userguide.xml
	xsltproc -o $(STBASE)ug-report.html $(NWDBXSL) $(STBASE)ug-report.xml
	
	@echo "----- Quick Guide status report -----"
	xsltproc -o $(STBASE)qg-report.xml $(wOS) quickguide/C/quick-guide.xml
	xsltproc -o $(STBASE)qg-report.html $(NWDBXSL) $(STBASE)qg-report.xml

	@echo "----- Admin Guide status report -----"
	xsltproc -o $(STBASE)ag-report.xml $(wOS) adminguide/C/adminguide.xml
	xsltproc -o $(STBASE)ag-report.html $(NWDBXSL) $(STBASE)ag-report.xml

	@echo "----- Install Guide status report -----"
	xsltproc -o $(STBASE)in-report.xml $(wOS) ../generic/instalguide/C/installation-guide.xml
	xsltproc -o $(STBASE)in-report.html $(NWDBXSL) $(STBASE)in-report.xml
	
	@echo "----- Release Notes status report -----"
	xsltproc -o $(STBASE)rn-report.xml $(wOS) releasenotes/C/release-notes.xml
	xsltproc -o $(STBASE)rn-report.html $(NWDBXSL) $(STBASE)rn-report.xml
	
	@echo "----- About Ubuntu status report -----"
	xsltproc -o $(STBASE)au-report.xml $(wOS) aboutubuntu/C/about-ubuntu.xml
	xsltproc -o $(STBASE)au-report.html $(NWDBXSL) $(STBASE)au-report.xml

	@echo "----- Faqguide status report -----"
	xsltproc -o $(STBASE)faq-report.xml $(wOS) ../generic/faqguide/C/faqguide.xml
	xsltproc -o $(STBASE)faq-report.html $(NWDBXSL) $(STBASE)faq-report.xml
	
	@echo "----- Complete. Find outputs at" $(STBASE)

#Status: AVAILABLE
# User Guide
ug:
	@echo "--- Building the Ubuntu User Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(UGBASE)C/*.html
	@echo "--- Building new files. . ."

	xsltproc --xinclude --stringparam base.dir $(UGBASE)C/ $(HTMLXSL) userguide/C/userguide.xml
	xsltproc --xinclude  -o $(UGBASE)ug-imagelist.txt $(MKIMGLST) userguide/C/userguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	@echo "--- Complete. Find outputs at" $(UGBASE)

#Status: AVAILABLE
# Quick Guide
qg:
	@echo "--- Building the Ubuntu Quick Guide . . ."

	@echo "--- Removing existing build files (if any). . ."
	rm -f $(QGBASE)C/*.html
	@echo "--- Building new files. . ."

	xsltproc --stringparam base.dir $(QGBASE)C/ $(HTMLXSL) quickguide/C/quick-guide.xml
	xsltproc -o $(QGBASE)qg-imagelist.txt $(MKIMGLST) quickguide/C/quick-guide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	@echo "--- Complete. Find outputs at" $(QGBASE)

#Status: NOT WORKING
# Administration Guide
ag:
	
	@echo "--- Building the Ubuntu Administration Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(AGBASE)C/*.html
	@echo "--- Building new files. . ."

	xsltproc --stringparam base.dir $(AGBASE)C/ $(HTMLXSL) adminguide/C/adminguide.xml
	xsltproc -o $(AGBASE)ag-imagelist.txt $(MKIMGLST) adminguide/C/adminguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	@echo "--- Complete. Find outputs at" $(AGBASE)
	
#Status: AVAILABLE
# Installation Guide
in:
	
	@echo "--- Building the Ubuntu Installation Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(INBASE)C/*.html

	@echo "--- Building new files. . ."
	xsltproc --stringparam base.dir $(INBASE)C/ --stringparam profile.os "gnome" $(HTMLXSL) ../generic/instalguide/C/installation-guide.xml
	xsltproc -o $(INBASE)in-imagelist.txt $(MKIMGLST) ../generic/instalguide/C/installation-guide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../generic/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	@echo "--- Complete. Find outputs at" $(INBASE)

#Status: AVAILABLE
# About Ubuntu Document
au:
	@echo "--- Building About Ubuntu Document"
	
	xsltproc -o $(ABASE)C/index.html $(AUHTMLXSL) aboutubuntu/C/about-ubuntu.xml
	xsltproc -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/C/about-ubuntu.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../generic/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	cp libs/aboutubuntu.css ../build/gnome/

	@echo "--- Complete. Find outputs at" $(ABASE)

#Status: AVAILABLE
# Release Notes
rn:
	@echo "--- Building the Ubuntu Release Notes . . ."
	
	xsltproc -o $(RNBASE)C/release-notes.html $(NWDBXSL) releasenotes/C/release-notes.xml
	xsltproc -o $(RNBASE)rn-imagelist.txt $(MKIMGLST) releasenotes/C/release-notes.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../generic/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	@echo "--- Complete. Find outputs at" $(RNBASE)

#Status: AVAILABLE
# FAQ Guide - build for all archs (i386, amd64, ppc)
faq: faqi386 faqamd64 faqppc

#Status: AVAILABLE
# FAQ Guide i386
faqi386:
	
	@echo "--- Building the FAQ Guide (i386) . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(FAQBASEI386)C/*.*
	rm -f $(FAQBASEI386)C/sample/*

	@echo "--- Building new files. . ."
	xsltproc --stringparam base.dir $(FAQBASEI386)C/ --stringparam profile.os "gnome" --stringparam profile.arch "i386" $(FAQHTMLXSL) ../generic/faqguide/C/faqguide.xml
	#	xsltproc -o $(FAQBASEI386)faq-imagelist.txt $(MKIMGLST) ../generic/faqguide/C/faqguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../generic/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(FAQBASEI386)C/sample
	cp -r ../generic/faqguide/C/sample/* $(FAQBASEI386)C/sample/
	
	cp ../generic/faqguide/faqguide.css ../build/gnome/
	
	@echo "Complete. Find outputs at" $(FAQBASEI386)C/

#Status: AVAILABLE
# FAQ Guide amd64
faqamd64:
	
	@echo "--- Building the FAQ Guide (amd64) . . ."
	
	@echo "--- Removing existing build files (if any). . . "
	rm -f $(FAQBASEAMD64)C/*.html
	rm -f $(FAQBASEAMD64)C/sample/*

	@echo "--- Building new files. . . "
	xsltproc --stringparam base.dir $(FAQBASEAMD64)C/ --stringparam profile.os "gnome" --stringparam profile.arch "amd64" $(FAQHTMLXSL) ../generic/faqguide/C/faqguide.xml
	#	xsltproc -o $(FAQBASEAMD64)faq-imagelist.txt $(MKIMGLST) ../generic/faqguide/C/faqguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../generic/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(FAQBASEAMD64)C/sample
	cp -r ../generic/faqguide/C/sample/* $(FAQBASEAMD64)C/sample/
	
	cp ../generic/faqguide/faqguide.css ../build/gnome/
	
	@echo "Complete. Find outputs at" $(FAQBASEAMD64)C/

#Status: AVAILABLE
# FAQ Guide ppc
faqppc:
	
	@echo "--- Building the FAQ Guide (ppc) . . ."
	
	@echo "--- Removing existing build files (if any). . . "
	rm -f $(FAQBASEPPC)C/*.html
	rm -f $(FAQBASEPPC)C/sample/*

	@echo "--- Building new files. . . "
	xsltproc --stringparam base.dir $(FAQBASEPPC)C/ --stringparam profile.os "gnome" --stringparam profile.arch "ppc" $(FAQHTMLXSL) ../generic/faqguide/C/faqguide.xml
	#	xsltproc -o $(FAQBASEPPC)faq-imagelist.txt $(MKIMGLST) ../generic/faqguide/C/faqguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../generic/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(FAQBASEPPC)C/sample
	cp -r ../generic/faqguide/C/sample/* $(FAQBASEPPC)C/sample/
	
	cp ../generic/faqguide/faqguide.css ../build/gnome/

	@echo "Complete. Find outputs at" $(FAQBASEPPC)C/

#Status: AVAILABLE
# Style Guide
sg:
	@echo "--- Building the Ubuntu Style Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(SGBASE)*.html
	@echo "--- Building new files. . . "

	xsltproc --stringparam base.dir $(SGBASE) $(SGHTMLXSL) ../styleguide/styleguide.xml
#	xsltproc -o $(SGBASE)sg-imagelist.txt $(MKIMGLST) ../styleguide/styleguide.xml
	
	mkdir -p $(IMAGES)
	
	cp -r images/C/*.* $(IMAGES)
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	# copy style sheet to build directory
	cp default.css ../build/gnome/default.css
	
	@echo "--- Complete. Find outputs at" $(SGBASE)
# QuickTour
qt:
	@echo "--- Coping the QuickTour . . ."
	
	@echo "--- Copying New Files. . ."
	mkdir -p ../build/quicktour
	cp -r quicktour/*.* ../build/quicktour/
	@echo "--- Complete."

clean:
	rm -rf $(BASE)
