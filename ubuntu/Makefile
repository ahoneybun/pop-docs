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
all: au dg server package

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

	xsltproc --xinclude --stringparam base.dir $(QGBASE)C/ $(HTMLXSL) quickguide/C/quick-guide.xml
	xsltproc --xinclude -o $(QGBASE)qg-imagelist.txt $(MKIMGLST) quickguide/C/quick-guide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	@echo "--- Complete. Find outputs at" $(QGBASE)

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

#Status: NOT WORKING
# Administration Guide
ag:
	
	@echo "--- Building the Ubuntu Administration Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(AGBASE)C/*.html
	@echo "--- Building new files. . ."

	xsltproc --xinclude --stringparam base.dir $(AGBASE)C/ $(HTMLXSL) adminguide/C/adminguide.xml
	xsltproc --xinclude -o $(AGBASE)ag-imagelist.txt $(MKIMGLST) adminguide/C/adminguide.xml
	
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

au-AF:
	@echo "--- Building About Ubuntu AF  . . ."

	xsltproc --xinclude -o $(ABASE)AF/index.html $(AUHTMLXSL) aboutubuntu/af/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/af/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)AF/

au-CA:
	@echo "--- Building About Ubuntu CA  . . ."

	xsltproc --xinclude -o $(ABASE)CA/index.html $(AUHTMLXSL) aboutubuntu/ca/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/ca/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)CA/

au-CS:
	@echo "--- Building About Ubuntu CS . . ."

	xsltproc --xinclude -o $(ABASE)CS/index.html $(AUHTMLXSL) aboutubuntu/cs/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/cs/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)CS/

au-DA:
	@echo "--- Building About Ubuntu DA  . . ."

	xsltproc --xinclude -o $(ABASE)DA/index.html $(AUHTMLXSL) aboutubuntu/da/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/da/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)DA/

au-DE:
	
	echo "--- Building About Ubuntu DE . . ."

	xsltproc --xinclude -o $(ABASE)DE/index.html $(AUHTMLXSL) aboutubuntu/de/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/de/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)FR/

au-EL:
	@echo "--- Building About Ubuntu EL  . . ."

	xsltproc --xinclude -o $(ABASE)EL/index.html $(AUHTMLXSL) aboutubuntu/el/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/el/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)EL/

au-ES:
	@echo "--- Building About Ubuntu ES  . . ."

	xsltproc --xinclude -o $(ABASE)ES/index.html $(AUHTMLXSL) aboutubuntu/es/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/es/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)ES/

au-ET:
	@echo "--- Building About Ubuntu ET  . . ."

	xsltproc --xinclude -o $(ABASE)ET/index.html $(AUHTMLXSL) aboutubuntu/et/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/et/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)ET/

au-FA:
	@echo "--- Building About Ubuntu FA  . . ."

	xsltproc --xinclude -o $(ABASE)FA/index.html $(AUHTMLXSL) aboutubuntu/fa/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/fa/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)FA/

au-FI:
	@echo "--- Building About Ubuntu FI . . ."

	xsltproc --xinclude -o $(ABASE)FI/index.html $(AUHTMLXSL) aboutubuntu/fi/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/fi/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)FI/

au-FR:
	@echo "--- Building About Ubuntu FR  . . ."

	xsltproc --xinclude -o $(ABASE)FR/index.html $(AUHTMLXSL) aboutubuntu/fr/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/fr/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)FR/

au-HE:
	@echo "--- Building About Ubuntu HE . . ."

	xsltproc --xinclude -o $(ABASE)HE/index.html $(AUHTMLXSL) aboutubuntu/he/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/he/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)HE/

au-HU:
	@echo "--- Building About Ubuntu  HU. . ."

	xsltproc --xinclude -o $(ABASE)HU/index.html $(AUHTMLXSL) aboutubuntu/hu/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/hu/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)HU/

au-ID:
	@echo "--- Building About Ubuntu ID . . ."

	xsltproc --xinclude -o $(ABASE)ID/index.html $(AUHTMLXSL) aboutubuntu/id/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/id/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)id/

au-IT:
	@echo "--- Building About Ubuntu IT . . ."

	xsltproc --xinclude -o $(ABASE)IT/index.html $(AUHTMLXSL) aboutubuntu/it/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/it/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)IT/

au-LV:
	@echo "--- Building About Ubuntu IV. . ."

	xsltproc --xinclude -o $(ABASE)LV/index.html $(AUHTMLXSL) aboutubuntu/lv/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/lv/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)LV/

au-MK:
	@echo "--- Building About Ubuntu MK. . ."

	xsltproc --xinclude -o $(ABASE)MK/index.html $(AUHTMLXSL) aboutubuntu/mk/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/mk/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)MK/

au-ML:
	@echo "--- Building About Ubuntu ML . . ."

	xsltproc --xinclude -o $(ABASE)ML/index.html $(AUHTMLXSL) aboutubuntu/ml/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/ml/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)ML/

au-NL:
	@echo "--- Building About Ubuntu NL  . . ."

	xsltproc --xinclude -o $(ABASE)NL/index.html $(AUHTMLXSL) aboutubuntu/nl/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/nl/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)NL/

au-PL:
	@echo "--- Building About Ubuntu PL . . ."

	xsltproc --xinclude -o $(ABASE)PL/index.html $(AUHTMLXSL) aboutubuntu/pl/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/pl/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)PL/

au-PT:
	@echo "--- Building About Ubuntu PT  . . ."

	xsltproc --xinclude -o $(ABASE)PT/index.html $(AUHTMLXSL) aboutubuntu/pt/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/pt/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)PT/

au-PT_BR:
	@echo "--- Building About Ubuntu PT_BR . . ."

	xsltproc --xinclude -o $(ABASE)PT_BR/index.html $(AUHTMLXSL) aboutubuntu/pt_BR/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/pt_BR/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)PT_BR/

au-RO:
	@echo "--- Building About Ubuntu RO . . ."

	xsltproc --xinclude -o $(ABASE)RO/index.html $(AUHTMLXSL) aboutubuntu/ro/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/ro/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)RO/

au-SK:
	@echo "--- Building About Ubuntu SK. . ."

	xsltproc --xinclude -o $(ABASE)SK/index.html $(AUHTMLXSL) aboutubuntu/sk/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/sk/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)sk/

au-SR:
	@echo "--- Building About Ubuntu SR . . ."

	xsltproc --xinclude -o $(ABASE)SR/index.html $(AUHTMLXSL) aboutubuntu/sr/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/sr/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)SR/

au-SV:
	@echo "--- Building About Ubuntu SV. . ."

	xsltproc --xinclude -o $(ABASE)SV/index.html $(AUHTMLXSL) aboutubuntu/sv/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/sv/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)SV/

au-TL:
	@echo "--- Building About Ubuntu TL . . ."

	xsltproc --xinclude -o $(ABASE)TL/index.html $(AUHTMLXSL) aboutubuntu/tl/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/tl/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)TL/

au-XH:
	@echo "--- Building About Ubuntu XH . . ."

	xsltproc --xinclude -o $(ABASE)XH/index.html $(AUHTMLXSL) aboutubuntu/xh/about-ubuntu.xml
	xsltproc --xinclude -o $(ABASE)au-imagelist.txt $(MKIMGLST) aboutubuntu/xh/about-ubuntu.xml

	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
		
	cp libs/ubuntu.css $(ABASE)
	
	@echo "Complete. Find outputs at" $(ABASE)XH/


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
dg-all: dg-C dg-CS dg-DA dg-DE dg-EN_AU dg-ES dg-FA dg-FI dg-FR dg-HE dg-ID dg-IT dg-MK dg-PT dg-PT_BR dg-SR dg-SV dg-TL

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
	
dg-CS:
	@echo "--- Building the Desktop CS Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)CS/*.*
	rm -f $(DGBASE)CS/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)CS/ $(DGHTMLCHUNKXSL) desktopguide/cs/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)CS/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/cs/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-cs-imagelist.txt $(MKIMGLST) desktopguide/cs/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)CS/sample
	cp -r desktopguide/C/sample/* $(DGBASE)CS/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)CS/

dg-DA:
	@echo "--- Building the Desktop DA Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)DA/*.*
	rm -f $(DGBASE)DA/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)DA/ $(DGHTMLCHUNKXSL) desktopguide/da/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)DA/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/da/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-da-imagelist.txt $(MKIMGLST) desktopguide/da/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)DA/sample
	cp -r desktopguide/C/sample/* $(DGBASE)DA/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)DA/
	
dg-DE:
	@echo "--- Building the Desktop DE Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)DE/*.*
	rm -f $(DGBASE)DE/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)DE/ $(DGHTMLCHUNKXSL) desktopguide/de/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)DE/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/de/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-DE-imagelist.txt $(MKIMGLST) desktopguide/de/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)DE/sample
	cp -r desktopguide/C/sample/* $(DGBASE)DE/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)DE/
	
dg-EN_AU:
	@echo "--- Building the Desktop EN_AU Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)EN_AU/*.*
	rm -f $(DGBASE)EN_AU/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)DE/ $(DGHTMLCHUNKXSL) desktopguide/en_AU/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)EN_AU/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/en_AU/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-EN_AU-imagelist.txt $(MKIMGLST) desktopguide/en_AU/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)EN_AU/sample
	cp -r desktopguide/C/sample/* $(DGBASE)EN_AU/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)EN_AU/
	
dg-ES:
	@echo "--- Building the Desktop ES Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)ES/*.*
	rm -f $(DGBASE)ES/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)ES/ $(DGHTMLCHUNKXSL) desktopguide/es/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)ES/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/es/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-ES-imagelist.txt $(MKIMGLST) desktopguide/es/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)ES/sample
	cp -r desktopguide/C/sample/* $(DGBASE)ES/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)ES/
	
dg-FA:
	@echo "--- Building the Desktop FA Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)FA/*.*
	rm -f $(DGBASE)FA/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)FA/ $(DGHTMLCHUNKXSL) desktopguide/fa/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)FA/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/fa/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-FA-imagelist.txt $(MKIMGLST) desktopguide/fa/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)FA/sample
	cp -r desktopguide/C/sample/* $(DGBASE)FA/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)FA/
	
dg-FI:
	@echo "--- Building the Desktop FI Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)FI/*.*
	rm -f $(DGBASE)FI/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)FI/ $(DGHTMLCHUNKXSL) desktopguide/fi/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)FI/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/fi/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-FI-imagelist.txt $(MKIMGLST) desktopguide/fi/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)FI/sample
	cp -r desktopguide/C/sample/* $(DGBASE)FI/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)FI/
	
dg-FR:
	@echo "--- Building the Desktop FR Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)FR/*.*
	rm -f $(DGBASE)FR/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)FR/ $(DGHTMLCHUNKXSL) desktopguide/fr/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)FR/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/fr/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-FR-imagelist.txt $(MKIMGLST) desktopguide/fr/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)FR/sample
	cp -r desktopguide/C/sample/* $(DGBASE)FR/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)FR/
	
dg-HE:
	@echo "--- Building the Desktop HE Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)HE/*.*
	rm -f $(DGBASE)HE/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)HE/ $(DGHTMLCHUNKXSL) desktopguide/he/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)HE/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/he/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-HE-imagelist.txt $(MKIMGLST) desktopguide/he/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)HE/sample
	cp -r desktopguide/C/sample/* $(DGBASE)HE/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)HE/
	
dg-ID:
	@echo "--- Building the Desktop ID Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)ID/*.*
	rm -f $(DGBASE)ID/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)ID/ $(DGHTMLCHUNKXSL) desktopguide/id/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)ID/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/id/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-ID-imagelist.txt $(MKIMGLST) desktopguide/id/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)ID/sample
	cp -r desktopguide/C/sample/* $(DGBASE)ID/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)ID/

dg-IT:
	@echo "--- Building the Desktop ID Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)IT/*.*
	rm -f $(DGBASE)IT/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)IT/ $(DGHTMLCHUNKXSL) desktopguide/it/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)IT/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/it/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-IT-imagelist.txt $(MKIMGLST) desktopguide/it/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)IT/sample
	cp -r desktopguide/C/sample/* $(DGBASE)IT/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)IT/
	
dg-MK:
	@echo "--- Building the Desktop MK Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)MK/*.*
	rm -f $(DGBASE)MK/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)MK/ $(DGHTMLCHUNKXSL) desktopguide/mk/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)MK/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/mk/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-MK-imagelist.txt $(MKIMGLST) desktopguide/mk/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)MK/sample
	cp -r desktopguide/C/sample/* $(DGBASE)MK/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)MK/
	
dg-PT:
	@echo "--- Building the Desktop PT Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)PT/*.*
	rm -f $(DGBASE)PT/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)PT/ $(DGHTMLCHUNKXSL) desktopguide/pt/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)PT/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/pt/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-PT-imagelist.txt $(MKIMGLST) desktopguide/pt/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)PT/sample
	cp -r desktopguide/C/sample/* $(DGBASE)PT/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)PT/

dg-PT_BR:
	@echo "--- Building the Desktop PT_BR Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)PT_BR/*.*
	rm -f $(DGBASE)PT_BR/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)PT_BR/ $(DGHTMLCHUNKXSL) desktopguide/pt_BR/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)PT_BR/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/pt_BR/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-PT_BR-imagelist.txt $(MKIMGLST) desktopguide/pt_BR/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)PT_BR/sample
	cp -r desktopguide/C/sample/* $(DGBASE)PT_BR/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)PT_BR/
	
dg-SR:
	@echo "--- Building the Desktop SR Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)SR/*.*
	rm -f $(DGBASE)SR/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)SR/ $(DGHTMLCHUNKXSL) desktopguide/sr/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)SR/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/sr/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-SR-imagelist.txt $(MKIMGLST) desktopguide/sr/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)SR/sample
	cp -r desktopguide/C/sample/* $(DGBASE)SR/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)SR/
	
dg-SV:
	@echo "--- Building the Desktop SV Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)SV/*.*
	rm -f $(DGBASE)SV/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)SV/ $(DGHTMLCHUNKXSL) desktopguide/sv/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)SV/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/sv/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-SV-imagelist.txt $(MKIMGLST) desktopguide/sv/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)SV/sample
	cp -r desktopguide/C/sample/* $(DGBASE)SV/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)SV/
	
dg-TL:
	@echo "--- Building the Desktop TL Guide . . ."
	
	@echo "--- Removing existing build files (if any). . ."
	rm -f $(DGBASE)SV/*.*
	rm -f $(DGBASE)SV/sample/*

	@echo "--- Building new files. . ."
	xsltproc --xinclude --stringparam base.dir $(DGBASE)TL/ $(DGHTMLCHUNKXSL) desktopguide/tl/desktopguide.xml
	xsltproc --xinclude -o $(DGBASE)TL/desktopguide-all.html $(DGHTMLSINGLEXSL) desktopguide/tl/desktopguide.xml
	#	xsltproc --xinclude -o $(DGBASE)dg-TL-imagelist.txt $(MKIMGLST) desktopguide/tl/desktopguide.xml
	
	mkdir -p $(IMAGES)C
	
	cp -r ../ubuntu/images/C/*.* $(IMAGES)C
	
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon
	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	
	mkdir -p $(DGBASE)TL/sample
	cp -r desktopguide/C/sample/* $(DGBASE)TL/sample/
	
	cp desktopguide/desktopguide.css $(DGBASE)
	
	@echo "Complete. Find outputs at" $(DGBASE)TL/

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
