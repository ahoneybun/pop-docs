# Makefile for the Ubuntu Documentation maintained by the Ubuntu Documentation Team
# Christoph Haas <email@christoph-haas.de>
# Sean Wheller <sean@inwords.co.za>
# Modified for scrollkeeper and debian package by  Sivan Green <sivan@workaround.org>

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
# Redhat
# NWDBXSL=/usr/share/xml/docbook/xsl-stylesheets/html/docbook.xsl
endif

# Make Image list text file
MKIMGLST=libs/imagelist.xsl

# Ubuntu Docbook Customization Layer
HTMLXSL=libs/html-cust.xsl

# About Ubuntu Docbook Customization Layer
AUHTMLXSL=libs/about-ubuntu-html-cust.xsl

# House Keeping XSL's
wOS=housekeep/writeOwnerStatus.xsl

# Base directories for output from processor
UGBASE=build/userguide/

QGBASE=build/quickguide/

FAQBASE=build/faqguide/

ADBASE=build/adminguide/

STBASE=build/status/

RNBASE=build/release-notes/

AUBASE=build/about-ubuntu/

#Subversion information
SVN_HEAD=https://docteam.ubuntu.com/repos/trunk

# if no VERSION is specified content of WC VERSION file will be used
VERSION="`cat VERSION`"

# If no release is specified, 1 will be used
RELEASE=1

DATE="`date +%Y%m%d`"

# Location of XML catalog files
#XML_CATALOG_CANDIDATES = \
#	/usr/share/xml/docbook/schema/dtd/4.3/catalog.xml \
#	/usr/share/sgml/docbook/dtd/4.3/catalog.xml
#ifexists=$(shell test -e $(file) && echo $(file))
#XML_CATALOG_FILES=$(firstword $(foreach file,$(CANDS),$(ifexists)))
#export XML_CATALOG_FILES

.PHONY: all
	
all: ug qg faq ag abt rn status

packaged: qg abt rn

# all: html/index.html
#    
# html/index.html: usersguide.xml $(XSL) $(shell find parts -name '*.xml')
# 	mkdir -p html
# 	$(XSLTPROC) -o html/ $(XSL) $<
# 	mkdir -p xml
# 	mkdir -p xml/parts
# 	cp *.xml xml/.
# 	cp *.png xml/.
# 	cp -R --copy-contents parts/* xml/parts/.

# User Guide
ug:
	@echo "Building the Ubuntu User Guide . . ."
	mkdir -p $(UGBASE)
	
	$(XSLTPROC) --xinclude --stringparam base.dir $(UGBASE) $(HTMLXSL) userguide/usersguide.xml
	
	cp -r libs/corpstyle.css $(UGBASE)
	
	mkdir -p build/images
	cp -r images/*.* build/images
	
	mkdir -p build/images/admon
	cp -r images/admon/*.* build/images/admon
	
	mkdir -p build/images/callouts
	cp -r images/callouts/*.* build/images/callouts
	
	mkdir -p build/images/navig
	cp -r images/navig/*.* build/images/navig
	
	
# Quick Guide
qg:
	@echo "Building the Ubuntu Quick Guide . . ."
	mkdir -p $(QGBASE)
	
	xsltproc --xinclude --stringparam base.dir $(QGBASE) $(HTMLXSL) quickguide/quick-guide.xml
	
	cp -r libs/corpstyle.css $(QGBASE)
	
	mkdir -p build/images
	cp -r images/*.* build/images
	
	mkdir -p build/images/admon
	cp -r images/admon/*.* build/images/admon
	
	mkdir -p build/images/callouts
	cp -r images/callouts/*.* build/images/callouts
	
	mkdir -p build/images/navig
	cp -r images/navig/*.* build/images/navig

# Frequently Asked Questions
faq:
	
	@echo "Building the Ubuntu FAQ . . ."
	mkdir -p $(FAQBASE)
	
	xsltproc --xinclude --stringparam base.dir $(FAQBASE) $(HTMLXSL) faqguide/faqguide.xml
	
	cp -r libs/corpstyle.css $(FAQBASE)
	
	mkdir -p build/images
	cp -r images/*.* build/images
	
	mkdir -p build/images/admon
	cp -r images/admon/*.* build/images/admon
	
	mkdir -p build/images/callouts
	cp -r images/callouts/*.* build/images/callouts
	
	mkdir -p build/images/navig
	cp -r images/navig/*.* build/images/navig
	
# Administration Guide
ag:
	
	@echo "Building the Ubuntu Admin Guide . . ."
	mkdir -p $(ADBASE)
	
	xsltproc --xinclude --stringparam base.dir $(ADBASE) $(HTMLXSL) adminguide/adminguide.xml
	
	cp -r libs/corpstyle.css $(ADBASE)
	
	mkdir -p build/images
	cp -r images/*.* build/images
	
	mkdir -p build/images/admon
	cp -r images/admon/*.* build/images/admon
	
	mkdir -p build/images/callouts
	cp -r images/callouts/*.* build/images/callouts
	
	mkdir -p build/images/navig
	cp -r images/navig/*.* build/images/navig
# Build About Ubuntu Document
abt:
	@echo "Building About Ubuntu Document"
	mkdir -p $(AUBASE)
	
	xsltproc --xinclude -o $(AUBASE)/index.html $(AUHTMLXSL) aboutubuntu/about-ubuntu.xml
	xsltproc --xinclude -o $(AUBASE)/index-fr.html $(AUHTMLXSL) aboutubuntu/about-ubuntu-fr.xml
	xsltproc --xinclude -o $(AUBASE)/index-it.html $(AUHTMLXSL) aboutubuntu/about-ubuntu-it.xml
	xsltproc --xinclude -o $(AUBASE)/index-tl.html $(AUHTMLXSL) aboutubuntu/about-ubuntu-tl.xml
	xsltproc --xinclude -o $(AUBASE)/index-xh.html $(AUHTMLXSL) aboutubuntu/about-ubuntu-xh.xml
	cp -r images/ubuntuheader.png $(AUBASE)
	cp -r libs/aboutubuntu.css $(AUBASE)

# Build Release Notes
rn:
	@echo "Building the Release Notes . . ."
	mkdir -p $(RNBASE)
	
	xsltproc --xinclude -o $(RNBASE)/release-notes.html $(NWDBXSL) releasenotes/release-notes.xml
	cp -r images/IconUbuntu.png $(RNBASE)
	xsltproc --xinclude -o $(RNBASE)/release-notes-fr.html $(NWDBXSL) releasenotes/release-notes-fr.xml
	#xsltproc --xinclude -o $(RNBASE)/release-notes-it.html $(NWDBXSL) releasenotes/release-notes-it.xml
	xsltproc --xinclude -o $(RNBASE)/release-notes-xh.html $(NWDBXSL) releasenotes/release-notes-xh.xml 

# Make Document Image Lists
imagelist:
	mkdir -p build
	
	#xsltproc --xinclude -o build/usersguide-list.txt $(MKIMGLST) userguide/usersguide.xml
	xsltproc --xinclude -o build/quickguide-list.txt $(MKIMGLST) quickguide/quick-guide.xml
	#xsltproc --xinclude -o build/faq-list.txt $(MKIMGLST) faqguide/faqguide.xml
	xsltproc --xinclude -o build/adminguide-list.txt $(MKIMGLST) adminguide/adminguide.xml
	xsltproc --xinclude -o build/releasenotes-list.txt $(MKIMGLST) releasenotes/release-notes.xml
	xsltproc --xinclude -o build/aboutubuntu-list.txt $(MKIMGLST) aboutubuntu/about-ubuntu.xml

# Build Project Status Reports
status:
	@echo "Building the Status Reports . . ."
	mkdir -p $(STBASE)
		
	xsltproc --xinclude -o $(STBASE)/qg-report.xml $(wOS) quickguide/quick-guide.xml
	xsltproc --xinclude -o $(STBASE)/ug-report.xml $(wOS) userguide/usersguide.xml
	xsltproc --xinclude -o $(STBASE)/faq-report.xml $(wOS) faqguide/faqguide.xml
	xsltproc --xinclude -o $(STBASE)/rn-report.xml $(wOS) releasenotes/release-notes.xml
	
	xsltproc -o $(STBASE)/qg-report.html $(NWDBXSL) $(STBASE)/qg-report.xml
	xsltproc -o $(STBASE)/ug-report.html $(NWDBXSL) $(STBASE)/ug-report.xml
	xsltproc -o $(STBASE)/faq-report.html $(NWDBXSL) $(STBASE)/faq-report.xml
	xsltproc -o $(STBASE)/rn-report.html $(NWDBXSL) $(STBASE)/rn-report.xml

# Build .pot files from English lang xml
pot:
	@echo "Building .pot files . . ."
	./make-pot
	
# Rebuild xml from .po files
po:
	@echo "Rebuilding docbook xml files from .po files"
	./make-po

# Build Pristine Copy of Docs from SVN and make tarball
dist:
	@echo "Loading fresh copy of Ubuntu Documentation Set . . ."
	mkdir -p ubuntu-docs
	svn export $(SVN_HEAD) ubuntu-docs/$(VERSION)-$(RELEASE)
	
	@echo "Compressing source files . . ."
	tar -czf ubuntu-docs-$(VERSION)-$(RELEASE).tar.gz ubuntu-docs
	mv *.tar.gz ubuntu-docs

# Remove the mess
clean:
	rm -rf build/
	rm -rf ubuntu-docs/

