# Makefile for the GNOME ubuntu Documentation
# Ubuntu Documentation Project <ubuntu-doc@lists.ubuntu.com>

MAKECMD=make

# XSL Processors
XSLTPROC=/usr/bin/xsltproc

current_distro=$(shell test -e /etc/debian_version && echo "debian")

EDUXSL=libs/edubuntu-banner.xsl

# Makes an Image list text file
MKIMGLST=../libs/imagelist.xsl

# Collected and Write Status
wOS=../libs/writeOwnerStatus.xsl

# Base directories for output from processor
BASE=../build/edubuntu/

AEBASE=../build/edubuntu/about-edubuntu/

RNBASE=../build/edubuntu/edubuntu-releasenotes/

ESABASE=../build/edubuntu/school-advocacy/

IMAGES=../build/edubuntu/images/

all: ae rn esa

	# copy style sheet to build directory
	cp default.css $(BASE)

#Status: AVAILABLE
# About Edubuntu Document
ae: ae-C

ae-C:
	@echo "--- Building About Edbuntu Document"
	
	xsltproc --xinclude -o $(AEBASE)C/index.html $(EDUXSL) EdubuntuAbout/C/about-edubuntu.xml
	
	# copy style sheet and common images to build directory
	mkdir -p ../build/edubuntu/
	cp libs/*css ../build/edubuntu/
	cp libs/img/*png $(IMAGES)
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig

	mkdir -p $(IMAGES)C	
	cp -r images/C/*.* $(IMAGES)C
	
	@echo "--- Complete. Find outputs at" $(AEBASE)

#Status: AVAILABLE
# Edubuntu Release Notes
rn:
	@echo "--- Building the Edubuntu Release Notes . . ."
	
	xsltproc --xinclude -o $(RNBASE)C/release-notes.html $(EDUXSL) EdubuntuReleaseNotes/C/edubuntu-release-notes.xml
	
	# copy style sheet and common images to build directory
	mkdir -p ../build/edubuntu/
	cp libs/*css ../build/edubuntu/
	cp libs/img/*png $(IMAGES)
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig

	mkdir -p $(IMAGES)C	
	cp -r images/C/*.* $(IMAGES)C
	
	@echo "--- Complete. Find outputs at" $(RNBASE)

#Status: AVAILABLE
# Edubuntu School Advocacy Pamphlet
esa:
	@echo "--- Building the Edubuntu School Advocacy pamphlet . . ."
	
	xsltproc --xinclude -o $(ESABASE)C/school-advocacy.html $(EDUXSL) SchoolAdvocacy/C/school-advocacy.xml
	
	# copy style sheet and common images to build directory
	mkdir -p ../build/edubuntu/
	cp libs/*css ../build/edubuntu/
	cp libs/img/*png $(IMAGES)
	mkdir -p $(IMAGES)admon
	cp -r ../common/admon/*.* $(IMAGES)admon	
	mkdir -p $(IMAGES)callouts
	cp -r ../common/callouts/*.* $(IMAGES)callouts
	mkdir -p $(IMAGES)navig
	cp -r ../common/navig/*.* $(IMAGES)navig

	mkdir -p $(IMAGES)C	
	cp -r images/C/*.* $(IMAGES)C
		
	@echo "--- Complete. Find outputs at" $(ESABASE)

