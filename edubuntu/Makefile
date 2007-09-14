# Makefile for the GNOME ubuntu Documentation
# Ubuntu Documentation Project <ubuntu-doc@lists.ubuntu.com>

MAKECMD=make

# XSL Processors
XSLTPROC=/usr/bin/xsltproc

current_distro=$(shell test -e /etc/debian_version && echo "debian")

EDUXSL=libs/edubuntu-banner.xsl
HBXSL=libs/handbook-banner.xsl

# Makes an Image list text file
MKIMGLST=../libs/imagelist.xsl

# Collected and Write Status
wOS=../libs/writeOwnerStatus.xsl

# Base directories for output from processor
BASE=../build/edubuntu/

HBBASE=../build/edubuntu/handbook/

AEBASE=../build/edubuntu/about-edubuntu/

ESABASE=../build/edubuntu/school-advocacy/

IMAGES=../build/edubuntu/images/

# deb: used for creating package for Edubuntu documentation
deb:

# all: used for creating the markup for doc.ubuntu.com/edubuntu
all: clean style about esa hb 

# copy style sheet to build directory
	cp default.css $(BASE)

style:

# copy style sheet and common images to build directory
	mkdir -p ../build/edubuntu/
	cp libs/*css ../build/edubuntu/
	mkdir -p $(IMAGES)
	cp libs/img/*png $(IMAGES)
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig
	mkdir -p $(IMAGES)C	
	cp -r images/C/*.* $(IMAGES)C

# About Edubuntu Document
about:

	xsltproc --xinclude -o $(AEBASE)C/index.html $(EDUXSL) about-edubuntu/C/about-edubuntu.xml

# Edubuntu School Advocacy Pamphlet
esa:

	xsltproc --xinclude -o $(ESABASE)C/index.html $(EDUXSL) SchoolAdvocacy/C/school-advocacy.xml

# Edubuntu Handbook
hb:

	xsltproc --xinclude -o $(HBBASE)C/index.html $(HBXSL) handbook/C/handbook.xml

# Cleanup
clean:
	rm -rf $(BASE)*
