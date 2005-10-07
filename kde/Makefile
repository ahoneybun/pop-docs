# Makefile for the Kubuntu Documentation
# Sean Wheller <sean@inwords.co.za>
# Matt Galvin <matt.t.galvin@gmail.com>

MAKECMD=make

# XSL Processors
XSLTPROC=$(shell which xsltproc)

current_distro=$(shell test -e /etc/debian_version && echo "debian")

# NWalsh Docbook XSL's
ifeq ($(current_distro), debian)
# Ubuntu
NWDBXSL=/usr/share/xml/docbook/stylesheet/nwalsh/html/docbook.xsl
NWDBFOXSL=/usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl

# Debian and Ubuntu also need an explicit location for the XML catalog files
export XML_CATALOG_FILES = /usr/share/xml/docbook/schema/dtd/4.3/catalog.xml
else
# SuSE
NWDBXSL=/usr/share/xml/docbook/stylesheet/nwalsh/current/html/docbook.xsl
NWDBFOXSL=/usr/share/xml/docbook/stylesheet/nwalsh/current/fo/docbook.xsl
endif

KDEXSL=/usr/share/apps/ksgmltools2/customization/kde-chunk.xsl

# Makes an Image list text file
MKIMGLST=../libs/imagelist.xsl

# Collected and Write Status
wOS=../libs/writeOwnerStatus.xsl

# Kubuntu Docbook HTML Customization Layer
KHTMLXSL=libs/kde-ubuntu.xsl

# Kubuntu Docbook FO Customization Layer
KFOXSL=libs/kfo-cust.xsl

# About Ubuntu Docbook HTML Customization Layer
AUHTMLXSL=libs/about-ubuntu-html-cust.xsl

# Base kde directories for output from processor
KBASE=../build/kde/

KDSBASE=../build/kde/specs/

KSTBASE=../build/kde/status/

KUGBASE=../build/kde/kuserguide/

KQGBASE=../build/kde/kquickguide/

KAGBASE=../build/kde/kadminguide/

KINBASE=../build/kde/kubuntu-install/

KRNBASE=../build/kde/krelease-notes/

KAKBASE=../build/kde/about-kubuntu/

KUMBASE=../build/kde/kynaptic/

FAQBASEI386=../build/kde/kfaqi386/

FAQBASEAMD64=../build/kde/kfaqamd64/

FAQBASEPPC=../build/kde/kfaqppc/

kall: kspec kstatus pip kug kqg kin krn kak kum kfaq


# This is here to select what to build for the .deb package.
# Frode M. Doeving <frode@lnix.net>
# Depends: debhelper devscripts cdbs
# Run prepdeb.sh do not run this make target
# Status: Available
kdeb: kqg krn kak

#Status: AVAILABLE
# Kubuntu Document Specifications
kspec:
	@echo "Building the Kubuntu Document Specifications . . ."

	xsltproc -o $(KDSBASE)kreleasenotes-spec.html $(wOS) docspecs/kquickguide-spec.xml

# No File Yet
#	xsltproc -o $(KDSBASE)kadminguide-spec.html $(KDEXSL) docspecs/kadminguide-spec.xml

	xsltproc -o $(KDSBASE)kinstalguide-spec.html $(KDEXSL) docspecs/kinstalguide-spec.xml

	xsltproc -o $(KDSBASE)kquickguide-spec.html $(KDEXSL) docspecs/kquickguide-spec.xml

	xsltproc -o $(KDSBASE)kuserguide-spec.xml $(KDEXSL) docspecs/kuserguide-spec.xml

#Status: AVAILABLE
# Kubuntu Status Reports
kstatus:
	@echo "Building the Kubuntu Status Reports . . ."

	xsltproc -o $(KSTBASE)kug-report.xml $(wOS) kuserguide/C/kuserguide.xml
	xsltproc -o $(KSTBASE)kug-report.html $(KDEXSL) $(KSTBASE)kug-report.xml

	xsltproc -o $(KSTBASE)kqg-report.xml $(wOS) kquickguide/C/kquickguide.xml
	xsltproc -o $(KSTBASE)kqg-report.html $(KDEXSL) $(KSTBASE)kqg-report.xml

# No File Yet
#	xsltproc -o $(KSTBASE)kag-report.xml $(wOS) kadminguide/C/kadminguide.xml
#	xsltproc -o $(KSTBASE)kag-report.html $(KDEXSL) $(KSTBASE)kag-report.xml

	xsltproc -o $(KSTBASE)kin-report.xml $(wOS) ../generic/instalguide/C/installation-guide.xml
	xsltproc -o $(KSTBASE)kin-report.html $(KDEXSL) $(KSTBASE)kin-report.xml

	xsltproc -o $(KSTBASE)krn-report.xml $(wOS) kreleasenotes/C/kreleasenotes.xml
	xsltproc -o $(KSTBASE)krn-report.html $(KDEXSL) $(KSTBASE)krn-report.xml

	xsltproc -o $(KSTBASE)kak-report.xml $(wOS) aboutkubuntu/C/about-kubuntu.xml
	xsltproc -o $(KSTBASE)kak-report.html $(KDEXSL) $(KSTBASE)kak-report.xml

	xsltproc -o $(KSTBASE)kum-report.xml $(wOS) kynaptic/C/kynaptic.xml
	xsltproc -o $(KSTBASE)kum-report.html $(KDEXSL) $(KSTBASE)kum-report.xml

	@echo "Complete. Find outputs at" $(KSTBASE)

#Status: AVAILABLE
#Preview Index Page
pip:
	@echo "Building the Preview Index Page . . ."

	xsltproc -o $(KBASE)index.html $(KDEXSL) index.xml

#Status: AVAILABLE
# K User Guide
kug:
	@echo "Building the Kubuntu User Guide . . ."

	xsltproc --xinclude --stringparam base.dir $(KUGBASE)C/ $(KHTMLXSL) kuserguide/C/kuserguide.xml
	xsltproc -o $(KBASE)kug-imagelist.txt $(MKIMGLST) kuserguide/C/kuserguide.xml

	mkdir -p $(KBASE)images
	mkdir -p $(KBASE)images/C
	cp -rf images/C/*.* $(KBASE)images/C
	mkdir -p $(KBASE)images/navig
	cp -rf images/navig/*.* $(KBASE)images/navig
	mkdir -p $(KBASE)images/admon
	cp -rf images/admon/*.* $(KBASE)images/admon
	mkdir -p $(KBASE)images/callouts
	cp -rf images/callouts/*.* $(KBASE)images/callouts

	@echo "Complete. Find outputs at" $(KUGBASE)

#Status: AVAILABLE
# K Quick Guide
kqg:
	@echo "Building the Kubuntu Quick Guide . . ."

	xsltproc --stringparam base.dir $(KQGBASE)C/ $(KHTMLXSL) kquickguide/C/kquickguide.xml
	xsltproc -o $(KQGBASE)kqg-imagelist.txt $(MKIMGLST) kquickguide/C/kquickguide.xml

	mkdir -p $(KBASE)images
	mkdir -p $(KBASE)images/C
	cp -rf images/C/*.* $(KBASE)images/C
	mkdir -p $(KBASE)images/navig
	cp -rf images/navig/*.* $(KBASE)images/navig
	mkdir -p $(KBASE)images/admon
	cp -rf images/admon/*.* $(KBASE)images/admon
	mkdir -p $(KBASE)images/callouts
	cp -rf images/callouts/*.* $(KBASE)images/callouts

	@echo "Complete. Find outputs at" $(KQGBASE)

#Status: AVAILABLE
# K PDF Installation Guide
kinpdf:
	echo "Building PDF of Kubuntu Installation Guide . . ."
	java com.icl.saxon.StyleSheet -o $(KINBASE)C/kubuntu-installguide.fo ../generic/instalguide/C/installation-guide.xml $(KFOXSL)
 
	cp -rf ../generic/images/C/*.* $(KBASE)images/C
 
	java org.apache.fop.apps.Fop -fo $(KINBASE)C/kubuntu-installguide.fo -pdf $(KINBASE)C/kubuntu-installguide.pdf

	rm $(KINBASE)C/kubuntu-installguide.fo

#Status: AVAILABLE
# K About Kubuntu Document
kak:
	@echo "Building About Kubuntu Document"

	xsltproc -o $(KAKBASE)C/index.html $(KDEXSL) aboutkubuntu/C/about-kubuntu.xml
	xsltproc -o $(KAKBASE)kak-imagelist.txt $(MKIMGLST) aboutkubuntu/C/about-kubuntu.xml

	mkdir -p $(KBASE)images
	mkdir -p $(KBASE)images/C
	cp -rf images/C/*.* $(KBASE)images/C
	mkdir -p $(KBASE)images/navig
	cp -rf images/navig/*.* $(KBASE)images/navig
	mkdir -p $(KBASE)images/admon
	cp -rf images/admon/*.* $(KBASE)images/admon
	mkdir -p $(KBASE)images/callouts
	cp -rf images/callouts/*.* $(KBASE)images/callouts

	@echo "Complete. Find outputs at" $(KAKBASE)

#Status: AVAILABLE
# K Release Notes
krn:
	@echo "Building the Kubuntu Release Notes . . ."

	xsltproc -o $(KRNBASE)C/kreleasenotes.html $(KDEXSL) kreleasenotes/C/kreleasenotes.xml
	xsltproc -o $(KRNBASE)krn-imagelist.txt $(MKIMGLST) kreleasenotes/C/kreleasenotes.xml

	mkdir -p $(KBASE)images
	mkdir -p $(KBASE)images/C
	cp -rf images/C/*.* $(KBASE)images/C
	mkdir -p $(KBASE)images/navig
	cp -rf images/navig/*.* $(KBASE)images/navig
	mkdir -p $(KBASE)images/admon
	cp -rf images/admon/*.* $(KBASE)images/admon
	mkdir -p $(KBASE)images/callouts
	cp -rf images/callouts/*.* $(KBASE)images/callouts
	
	@echo "Complete. Find outputs at" $(KRNBASE)

#Status: AVAILABLE
# K Installation Guide
kin:
	
	@echo "Building the Kubuntu Installation Guide . . ."
	
	xsltproc --stringparam base.dir $(KINBASE)C/ --stringparam profile.os "kde" $(KHTMLXSL) ../generic/instalguide/C/installation-guide.xml
	xsltproc -o $(KINBASE)kin-imagelist.txt $(MKIMGLST) ../generic/instalguide/C/installation-guide.xml
	
	mkdir -p $(KBASE)images
	mkdir -p $(KBASE)images/C
	cp -rf images/C/*.* $(KBASE)images/C
	mkdir -p $(KBASE)images/navig
	cp -rf images/navig/*.* $(KBASE)images/navig
	mkdir -p $(KBASE)images/admon
	cp -rf images/admon/*.* $(KBASE)images/admon
	mkdir -p $(KBASE)images/callouts
	cp -rf images/callouts/*.* $(KBASE)images/callouts

	@echo "Complete. Find outputs at" $(KINBASE)

#Status: NOT WORKING
# K Administration Guide
kag:
	
	@echo "Building the Kubuntu Administration Guide . . ."
	
	xsltproc --stringparam base.dir $(KAGBASE)C/ $(KHTMLXSL) adminguide/C/adminguide.xml
	xsltproc -o $(KAGBASE)kad-imagelist.txt $(MKIMGLST) kadminguide/C/kadminguide.xml
	
	mkdir -p $(KBASE)images
	mkdir -p $(KBASE)images/C
	cp -rf images/C/*.* $(KBASE)images/C
	mkdir -p $(KBASE)images/navig
	cp -rf images/navig/*.* $(KBASE)images/navig
	mkdir -p $(KBASE)images/admon
	cp -rf images/admon/*.* $(KBASE)images/admon
	mkdir -p $(KBASE)images/callouts
	cp -rf images/callouts/*.* $(KBASE)images/callouts
	
	@echo "Complete. Find outputs at" $(KAGBASE)

#Status: AVAILABLE
# K FAQ Guide - build for all archs (i386, amd64, ppc)
kfaq: kfaqi386 kfaqamd64 kfaqppc

#Status: AVAILABLE
# K FAQ Guide (i386)
kfaqi386:
	
	@echo "Building the Kubuntu FAQ Guide (i386). . ."
	
	xsltproc --stringparam base.dir $(FAQBASEI386)C/ --stringparam profile.os "kde" --stringparam profile.arch "i386" $(KHTMLXSL) ../generic/faqguide/C/faqguide.xml
#	xsltproc -o $(KINBASE)kin-imagelist.txt $(MKIMGLST) ../generic/instalguide/C/installation-guide.xml
	
	mkdir -p $(KBASE)images
	mkdir -p $(KBASE)images/C
	cp -rf images/C/*.* $(KBASE)images/C
	mkdir -p $(KBASE)images/navig
	cp -rf images/navig/*.* $(KBASE)images/navig
	mkdir -p $(KBASE)images/admon
	cp -rf images/admon/*.* $(KBASE)images/admon
	mkdir -p $(KBASE)images/callouts
	cp -rf images/callouts/*.* $(KBASE)images/callouts
	
	@echo "Complete. Find outputs at" $(FAQBASEI386)

#Status: AVAILABLE
# K FAQ Guide (amd64)
kfaqamd64:
	
	@echo "Building the Kubuntu FAQ Guide (amd64). . ."
	
	xsltproc --stringparam base.dir $(FAQBASEAMD64)C/ --stringparam profile.os "kde" --stringparam profile.arch "amd64" $(KHTMLXSL) ../generic/faqguide/C/faqguide.xml
#	xsltproc -o $(KINBASE)kin-imagelist.txt $(MKIMGLST) ../generic/instalguide/C/installation-guide.xml
	
	mkdir -p $(KBASE)images
	mkdir -p $(KBASE)images/C
	cp -rf images/C/*.* $(KBASE)images/C
	mkdir -p $(KBASE)images/navig
	cp -rf images/navig/*.* $(KBASE)images/navig
	mkdir -p $(KBASE)images/admon
	cp -rf images/admon/*.* $(KBASE)images/admon
	mkdir -p $(KBASE)images/callouts
	cp -rf images/callouts/*.* $(KBASE)images/callouts
	
	@echo "Complete. Find outputs at" $(FAQBASEAMD64)

#Status: AVAILABLE
# K FAQ Guide (ppc)
kfaqppc:
	
	@echo "Building the Kubuntu FAQ Guide (ppc). . ."
	
	xsltproc --stringparam base.dir $(FAQBASEPPC)C/ --stringparam profile.os "kde" --stringparam profile.arch "ppc" $(KHTMLXSL) ../generic/faqguide/C/faqguide.xml
#	xsltproc -o $(KINBASE)kin-imagelist.txt $(MKIMGLST) ../generic/instalguide/C/installation-guide.xml
	
	mkdir -p $(KBASE)images
	mkdir -p $(KBASE)images/C
	cp -rf images/C/*.* $(KBASE)images/C
	mkdir -p $(KBASE)images/navig
	cp -rf images/navig/*.* $(KBASE)images/navig
	mkdir -p $(KBASE)images/admon
	cp -rf images/admon/*.* $(KBASE)images/admon
	mkdir -p $(KBASE)images/callouts
	cp -rf images/callouts/*.* $(KBASE)images/callouts
	
	@echo "Complete. Find outputs at" $(FAQBASEPPC)

#Status: AVAILABLE
# Kynaptic User Manual
kum:
	@echo "Building the Kynaptic User Manual . . ."
	
	xsltproc --stringparam base.dir $(KUMBASE)C/ $(KHTMLXSL) kynaptic/C/kynaptic.xml
	xsltproc -o $(KUMBASE)kun-imagelist.txt $(MKIMGLST) kynaptic/C/kynaptic.xml
	
	mkdir -p $(KUMBASE)C/figures
	cp -rf kynaptic/C/figures/*.* $(KUMBASE)C/figures/
	
#	mkdir -p $(KUMBASE)C/figures/admon
#	cp -rf ../common/admon/*.* $(KBASE)images/admon
	
#	mkdir -p $(KBASE)images/callouts
#	cp -rf ../common/callouts/*.* $(KBASE)images/callouts
	
#	mkdir -p $(KBASE)images/navig
#	cp -rf ../common/navig/*.* $(KBASE)images/navig
	
	@echo "Complete. Find outputs at" $(KUMBASE)

# Added for the .deb package
# Frode M. Doeving <frode@lnix.net>
clean:
	rm -rf $(KBASE)
