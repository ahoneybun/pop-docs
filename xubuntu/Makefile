# Makefile for the GNOME ubuntu Documentation
# Ubuntu Documentation Project <ubuntu-doc@lists.ubuntu.com>

.PHONY: desktopguide browser-startpage

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

# Ubuntu Docbook Customization Layer

#XUBUNTUXSL=libs/ubuntu-banner.xsl
XUBUNTUXSL=libs/xubuntu-html-chunk-cust.xsl
#XUBUNTUWEBXSL=libs/ubuntu-banner-web.xsl
PDFSTYLE=../libs/pdf/ubuntu-pdf.xsl
LULUSTYLE=../libs/pdf/ubuntu-pdf-lulu.xsl

# Makes an Image list text file
MKIMGLST=../libs/imagelist.xsl

# Collected and Write Status
wOS=../libs/writeOwnerStatus.xsl

# Base directories for output from processor
BASE=../build/xubuntu/
PDFBASE=../build/pdf/xubuntu/
DESKTOPBASE=../build/xubuntu/desktopguide/
LULUBASE=../build/lulu/xubuntu/

# IMAGES=../build/xubuntu/images/
DGBASE=../build/xubuntu/desktopguide/

all: clean style index
	for doc in `cat libs/shipped-docs`; do xsltproc --xinclude -o $(BASE)$$doc/C/index.html $(XUBUNTUXSL) $$doc/C/$$doc.xml; done


style:
	# copy images to build directory
	mkdir -p $(DESKTOPBASE)images/C
	cp images/C/*.* $(DESKTOPBASE)images/C

	# copy logos
	mkdir -p $(BASE)common/images
	cp libs/images/*png $(BASE)common/images/

	# cp CSS Files to build directory
	cp libs/*.css $(BASE)common/

	# cp navigation / admon / .. images to build directory
	mkdir -p $(BASE)common/images/admon
	cp -r xubuntu-admon/*.* $(BASE)common/images/admon # need to keep these separately, because the default ones have a white bground
	
	# mkdir -p $(IMAGES)callouts
	# cp -r ../common/callouts/*.* $(IMAGES)callouts
	
	mkdir -p $(BASE)common/images/navig
	cp -r ../common/navig/*.* $(BASE)common/images/navig

index:
	xsltproc --stringparam html.stylesheet "../common/xubuntu-book.css" -o $(BASE)index.html $(XUBUNTUXSL) index.xml


# Desktop Guide

desktopguide: $(DGBASE)C
	#@echo "Building the Xubuntu Desktop Guide . . ."
	#for dir in desktopguide/*; do \
	#i=`basename $$dir`;\
	#if [ ! -d $$dir ];then continue;fi;\
	#mkdir -p $(DESKTOPBASE)$$i/; \
	#xsltproc --xinclude --stringparam base.dir $(DESKTOPBASE)$$i/ $(XUBUNTUXSL) $$dir/desktopguide.xml; \
	#done

	#@echo "Complete. Find outputs at" $(DESKTOPBASE)
	
$(DGBASE)%: desktopguide/%/desktopguide.xml
	xsltproc --xinclude -o $@/index.html $(XUBUNTUXSL) $<
	
browser-startpage:
	mkdir -p $(BASE)about
	cp about/*.html $(BASE)about
	cp about/*.css $(BASE)about

src-tarball:
	# exclude archive, backup, and svn files
	tar cvfz xubuntu-doc.tar.gz  --exclude="*.tar.gz" --exclude="*~" --exclude "*.svn*" *

clean:
	rm -rf $(BASE)

##################
# For building the website
##################

web: style desktopguide-web prepare desktop-pdf-C

# Desktop Guide

desktopguide-web:
	@echo "Building the Xubuntu Desktop Guide . . ."
	for dir in desktopguide/*; do \
	i=`basename $$dir`;\
	if [ ! -d $$dir ];then continue;fi;\
	mkdir -p $(DESKTOPBASE)$$i/; \
	xsltproc --xinclude --stringparam base.dir $(DESKTOPBASE)$$i/ $(XUBUNTUWEBXSL) $$dir/desktopguide.xml; \
	done

	@echo "Complete. Find outputs at" $(DESKTOPBASE)

##################
# For building the PDFS
##################

# PDFs in A4 size
pdf: desktop-pdf

desktop-pdf: prepare desktop-pdf-C desktop-pdf-be desktop-pdf-bn desktop-pdf-de desktop-pdf-es desktop-pdf-et desktop-pdf-fi desktop-pdf-fr desktop-pdf-hu desktop-pdf-id desktop-pdf-it desktop-pdf-ko desktop-pdf-pt_BR desktop-pdf-ro desktop-pdf-ru desktop-pdf-zh_CN desktop-pdf-zh_TW desktop-pdf-da desktop-pdf-nds desktop-pdf-ja desktop-pdf-he desktop-pdf-nb desktop-pdf-ta desktop-pdf-hr desktop-pdf-nl desktop-pdf-en_GB desktop-pdf-pl desktop-pdf-th desktop-pdf-lt desktop-pdf-tl desktop-pdf-ca desktop-pdf-pt desktop-pdf-tr desktop-pdf-en_AU desktop-pdf-am desktop-pdf-el desktop-pdf-oc desktop-pdf-gl desktop-pdf-cs desktop-pdf-eu desktop-pdf-sk

prepare:

	# copy images to build directory
	mkdir -p $(PDFBASE)images/C
	cp images/C/*.* $(PDFBASE)images/C

desktop-pdf-C:

	xsltproc --xinclude -o $(PDFBASE)C/desktopguide.fo $(PDFSTYLE) desktopguide/C/desktopguide.xml
	fop -fo $(PDFBASE)C/desktopguide.fo -pdf $(PDFBASE)C/desktopguide.pdf
	rm $(PDFBASE)C/desktopguide.fo

desktop-pdf-be:

	xsltproc --xinclude -o $(PDFBASE)be/desktopguide.fo $(PDFSTYLE) desktopguide/be/desktopguide.xml
	fop -fo $(PDFBASE)be/desktopguide.fo -pdf $(PDFBASE)be/desktopguide.pdf
	rm $(PDFBASE)be/desktopguide.fo

desktop-pdf-bn:

	xsltproc --xinclude -o $(PDFBASE)bn/desktopguide.fo $(PDFSTYLE) desktopguide/bn/desktopguide.xml
	fop -fo $(PDFBASE)bn/desktopguide.fo -pdf $(PDFBASE)bn/desktopguide.pdf
	rm $(PDFBASE)bn/desktopguide.fo

desktop-pdf-de:

	xsltproc --xinclude -o $(PDFBASE)de/desktopguide.fo $(PDFSTYLE) desktopguide/de/desktopguide.xml
	fop -fo $(PDFBASE)de/desktopguide.fo -pdf $(PDFBASE)de/desktopguide.pdf
	rm $(PDFBASE)de/desktopguide.fo

desktop-pdf-es:

	xsltproc --xinclude -o $(PDFBASE)es/desktopguide.fo $(PDFSTYLE) desktopguide/es/desktopguide.xml
	fop -fo $(PDFBASE)es/desktopguide.fo -pdf $(PDFBASE)es/desktopguide.pdf
	rm $(PDFBASE)es/desktopguide.fo

desktop-pdf-et:

	xsltproc --xinclude -o $(PDFBASE)et/desktopguide.fo $(PDFSTYLE) desktopguide/et/desktopguide.xml
	fop -fo $(PDFBASE)et/desktopguide.fo -pdf $(PDFBASE)et/desktopguide.pdf
	rm $(PDFBASE)et/desktopguide.fo

desktop-pdf-fi:

	xsltproc --xinclude -o $(PDFBASE)fi/desktopguide.fo $(PDFSTYLE) desktopguide/fi/desktopguide.xml
	fop -fo $(PDFBASE)fi/desktopguide.fo -pdf $(PDFBASE)fi/desktopguide.pdf
	rm $(PDFBASE)fi/desktopguide.fo

desktop-pdf-fr:

	xsltproc --xinclude -o $(PDFBASE)fr/desktopguide.fo $(PDFSTYLE) desktopguide/fr/desktopguide.xml
	fop -fo $(PDFBASE)fr/desktopguide.fo -pdf $(PDFBASE)fr/desktopguide.pdf
	rm $(PDFBASE)fr/desktopguide.fo

desktop-pdf-hu:

	xsltproc --xinclude -o $(PDFBASE)hu/desktopguide.fo $(PDFSTYLE) desktopguide/hu/desktopguide.xml
	fop -fo $(PDFBASE)hu/desktopguide.fo -pdf $(PDFBASE)hu/desktopguide.pdf
	rm $(PDFBASE)hu/desktopguide.fo

desktop-pdf-id:

	xsltproc --xinclude -o $(PDFBASE)id/desktopguide.fo $(PDFSTYLE) desktopguide/id/desktopguide.xml
	fop -fo $(PDFBASE)id/desktopguide.fo -pdf $(PDFBASE)id/desktopguide.pdf
	rm $(PDFBASE)id/desktopguide.fo

desktop-pdf-it:

	xsltproc --xinclude -o $(PDFBASE)it/desktopguide.fo $(PDFSTYLE) desktopguide/it/desktopguide.xml
	fop -fo $(PDFBASE)it/desktopguide.fo -pdf $(PDFBASE)it/desktopguide.pdf
	rm $(PDFBASE)it/desktopguide.fo

desktop-pdf-ko:

	xsltproc --stringparam body.font.family "batang" --stringparam monospace.font.family "dotum" --xinclude -o $(PDFBASE)ko/desktopguide.fo $(PDFSTYLE) desktopguide/ko/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)ko/desktopguide.fo -pdf $(PDFBASE)ko/desktopguide.pdf
	rm $(PDFBASE)ko/desktopguide.fo

desktop-pdf-pt_BR:

	xsltproc --xinclude -o $(PDFBASE)pt_BR/desktopguide.fo $(PDFSTYLE) desktopguide/pt_BR/desktopguide.xml
	fop -fo $(PDFBASE)pt_BR/desktopguide.fo -pdf $(PDFBASE)pt_BR/desktopguide.pdf
	rm $(PDFBASE)pt_BR/desktopguide.fo

desktop-pdf-ro:

	xsltproc --xinclude -o $(PDFBASE)ro/desktopguide.fo $(PDFSTYLE) desktopguide/ro/desktopguide.xml
	fop -fo $(PDFBASE)ro/desktopguide.fo -pdf $(PDFBASE)ro/desktopguide.pdf
	rm $(PDFBASE)ro/desktopguide.fo

desktop-pdf-ru:

	xsltproc --xinclude -o $(PDFBASE)ru/desktopguide.fo $(PDFSTYLE) desktopguide/ru/desktopguide.xml
	fop -fo $(PDFBASE)ru/desktopguide.fo -pdf $(PDFBASE)ru/desktopguide.pdf
	rm $(PDFBASE)ru/desktopguide.fo

desktop-pdf-zh_CN:

	xsltproc --stringparam body.font.family "uming" --stringparam monospace.font.family "uming" --xinclude -o $(PDFBASE)zh_CN/desktopguide.fo $(PDFSTYLE) desktopguide/zh_CN/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(PDFBASE)zh_CN/desktopguide.fo -pdf $(PDFBASE)zh_CN/desktopguide.pdf
	rm $(PDFBASE)zh_CN/desktopguide.fo

desktop-pdf-zh_TW:

	xsltproc --xinclude -o $(PDFBASE)zh_TW/desktopguide.fo $(PDFSTYLE) desktopguide/zh_TW/desktopguide.xml
	fop -fo $(PDFBASE)zh_TW/desktopguide.fo -pdf $(PDFBASE)zh_TW/desktopguide.pdf
	rm $(PDFBASE)zh_TW/desktopguide.fo

desktop-pdf-da:

	xsltproc --xinclude -o $(PDFBASE)da/desktopguide.fo $(PDFSTYLE) desktopguide/da/desktopguide.xml
	fop -fo $(PDFBASE)da/desktopguide.fo -pdf $(PDFBASE)da/desktopguide.pdf
	rm $(PDFBASE)da/desktopguide.fo

desktop-pdf-nds:

	xsltproc --xinclude -o $(PDFBASE)nds/desktopguide.fo $(PDFSTYLE) desktopguide/nds/desktopguide.xml
	fop -fo $(PDFBASE)nds/desktopguide.fo -pdf $(PDFBASE)nds/desktopguide.pdf
	rm $(PDFBASE)nds/desktopguide.fo

desktop-pdf-ja:

	xsltproc --xinclude -o $(PDFBASE)ja/desktopguide.fo $(PDFSTYLE) desktopguide/ja/desktopguide.xml
	fop -fo $(PDFBASE)ja/desktopguide.fo -pdf $(PDFBASE)ja/desktopguide.pdf
	rm $(PDFBASE)ja/desktopguide.fo

desktop-pdf-he:

	xsltproc --xinclude -o $(PDFBASE)he/desktopguide.fo $(PDFSTYLE) desktopguide/he/desktopguide.xml
	fop -fo $(PDFBASE)he/desktopguide.fo -pdf $(PDFBASE)he/desktopguide.pdf
	rm $(PDFBASE)he/desktopguide.fo

desktop-pdf-nb:

	xsltproc --xinclude -o $(PDFBASE)nb/desktopguide.fo $(PDFSTYLE) desktopguide/nb/desktopguide.xml
	fop -fo $(PDFBASE)nb/desktopguide.fo -pdf $(PDFBASE)nb/desktopguide.pdf
	rm $(PDFBASE)nb/desktopguide.fo

desktop-pdf-ta:

	xsltproc --xinclude -o $(PDFBASE)ta/desktopguide.fo $(PDFSTYLE) desktopguide/ta/desktopguide.xml
	fop -fo $(PDFBASE)ta/desktopguide.fo -pdf $(PDFBASE)ta/desktopguide.pdf
	rm $(PDFBASE)ta/desktopguide.fo

desktop-pdf-hr:

	xsltproc --xinclude -o $(PDFBASE)hr/desktopguide.fo $(PDFSTYLE) desktopguide/hr/desktopguide.xml
	fop -fo $(PDFBASE)hr/desktopguide.fo -pdf $(PDFBASE)hr/desktopguide.pdf
	rm $(PDFBASE)hr/desktopguide.fo

desktop-pdf-nl:

	xsltproc --xinclude -o $(PDFBASE)nl/desktopguide.fo $(PDFSTYLE) desktopguide/nl/desktopguide.xml
	fop -fo $(PDFBASE)nl/desktopguide.fo -pdf $(PDFBASE)nl/desktopguide.pdf
	rm $(PDFBASE)nl/desktopguide.fo

desktop-pdf-en_GB:

	xsltproc --xinclude -o $(PDFBASE)en_GB/desktopguide.fo $(PDFSTYLE) desktopguide/en_GB/desktopguide.xml
	fop -fo $(PDFBASE)en_GB/desktopguide.fo -pdf $(PDFBASE)en_GB/desktopguide.pdf
	rm $(PDFBASE)en_GB/desktopguide.fo

desktop-pdf-pl:

	xsltproc --xinclude -o $(PDFBASE)pl/desktopguide.fo $(PDFSTYLE) desktopguide/pl/desktopguide.xml
	fop -fo $(PDFBASE)pl/desktopguide.fo -pdf $(PDFBASE)pl/desktopguide.pdf
	rm $(PDFBASE)pl/desktopguide.fo

desktop-pdf-th:

	xsltproc --xinclude -o $(PDFBASE)th/desktopguide.fo $(PDFSTYLE) desktopguide/th/desktopguide.xml
	fop -fo $(PDFBASE)th/desktopguide.fo -pdf $(PDFBASE)th/desktopguide.pdf
	rm $(PDFBASE)th/desktopguide.fo

desktop-pdf-lt:

	xsltproc --xinclude -o $(PDFBASE)lt/desktopguide.fo $(PDFSTYLE) desktopguide/lt/desktopguide.xml
	fop -fo $(PDFBASE)lt/desktopguide.fo -pdf $(PDFBASE)lt/desktopguide.pdf
	rm $(PDFBASE)lt/desktopguide.fo

desktop-pdf-tl:

	xsltproc --xinclude -o $(PDFBASE)tl/desktopguide.fo $(PDFSTYLE) desktopguide/tl/desktopguide.xml
	fop -fo $(PDFBASE)tl/desktopguide.fo -pdf $(PDFBASE)tl/desktopguide.pdf
	rm $(PDFBASE)tl/desktopguide.fo

desktop-pdf-ca:

	xsltproc --xinclude -o $(PDFBASE)ca/desktopguide.fo $(PDFSTYLE) desktopguide/ca/desktopguide.xml
	fop -fo $(PDFBASE)ca/desktopguide.fo -pdf $(PDFBASE)ca/desktopguide.pdf
	rm $(PDFBASE)ca/desktopguide.fo

desktop-pdf-pt:

	xsltproc --xinclude -o $(PDFBASE)pt/desktopguide.fo $(PDFSTYLE) desktopguide/pt/desktopguide.xml
	fop -fo $(PDFBASE)pt/desktopguide.fo -pdf $(PDFBASE)pt/desktopguide.pdf
	rm $(PDFBASE)pt/desktopguide.fo

desktop-pdf-tr:

	xsltproc --xinclude -o $(PDFBASE)tr/desktopguide.fo $(PDFSTYLE) desktopguide/tr/desktopguide.xml
	fop -fo $(PDFBASE)tr/desktopguide.fo -pdf $(PDFBASE)tr/desktopguide.pdf
	rm $(PDFBASE)tr/desktopguide.fo

desktop-pdf-en_AU:

	xsltproc --xinclude -o $(PDFBASE)en_AU/desktopguide.fo $(PDFSTYLE) desktopguide/en_AU/desktopguide.xml
	fop -fo $(PDFBASE)en_AU/desktopguide.fo -pdf $(PDFBASE)en_AU/desktopguide.pdf
	rm $(PDFBASE)en_AU/desktopguide.fo

desktop-pdf-en_am:

	xsltproc --xinclude -o $(PDFBASE)am/desktopguide.fo $(PDFSTYLE) desktopguide/am/desktopguide.xml
	fop -fo $(PDFBASE)am/desktopguide.fo -pdf $(PDFBASE)am/desktopguide.pdf
	rm $(PDFBASE)am/desktopguide.fo

desktop-pdf-el:

	xsltproc --xinclude -o $(PDFBASE)el/desktopguide.fo $(PDFSTYLE) desktopguide/el/desktopguide.xml
	fop -fo $(PDFBASE)el/desktopguide.fo -pdf $(PDFBASE)el/desktopguide.pdf
	rm $(PDFBASE)el/desktopguide.fo

desktop-pdf-oc:

	xsltproc --xinclude -o $(PDFBASE)oc/desktopguide.fo $(PDFSTYLE) desktopguide/oc/desktopguide.xml
	fop -fo $(PDFBASE)oc/desktopguide.fo -pdf $(PDFBASE)oc/desktopguide.pdf
	rm $(PDFBASE)oc/desktopguide.fo

desktop-pdf-gl:

	xsltproc --xinclude -o $(PDFBASE)gl/desktopguide.fo $(PDFSTYLE) desktopguide/gl/desktopguide.xml
	fop -fo $(PDFBASE)gl/desktopguide.fo -pdf $(PDFBASE)gl/desktopguide.pdf
	rm $(PDFBASE)gl/desktopguide.fo

desktop-pdf-cs:

	xsltproc --xinclude -o $(PDFBASE)cs/desktopguide.fo $(PDFSTYLE) desktopguide/cs/desktopguide.xml
	fop -fo $(PDFBASE)cs/desktopguide.fo -pdf $(PDFBASE)cs/desktopguide.pdf
	rm $(PDFBASE)cs/desktopguide.fo

desktop-pdf-eu:

	xsltproc --xinclude -o $(PDFBASE)eu/desktopguide.fo $(PDFSTYLE) desktopguide/eu/desktopguide.xml
	fop -fo $(PDFBASE)eu/desktopguide.fo -pdf $(PDFBASE)eu/desktopguide.pdf
	rm $(PDFBASE)eu/desktopguide.fo

desktop-pdf-sk:

	xsltproc --xinclude -o $(PDFBASE)sk/desktopguide.fo $(PDFSTYLE) desktopguide/sk/desktopguide.xml
	fop -fo $(PDFBASE)sk/desktopguide.fo -pdf $(PDFBASE)sk/desktopguide.pdf
	rm $(PDFBASE)sk/desktopguide.fo

# PDFs for use with LULU

desktop-lulu: prepare-lulu desktop-lulu-C desktop-lulu-pt_BR

prepare-lulu:

	# copy images to build directory
	mkdir -p $(LULUBASE)images/C
	cp images/C/*.* $(LULUBASE)images/C

desktop-lulu-C:
	xsltproc --xinclude -o $(LULUBASE)C/desktopguide.fo $(LULUSTYLE) desktopguide/C/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(LULUBASE)C/desktopguide.fo -pdf $(LULUBASE)C/desktopguide.pdf
	rm $(LULUBASE)C/desktopguide.fo

desktop-lulu-pt_BR:
	xsltproc --xinclude -o $(LULUBASE)pt_BR/desktopguide.fo $(LULUSTYLE) desktopguide/pt_BR/desktopguide.xml
	fop -c ../libs/pdf/fop.xconf -fo $(LULUBASE)pt_BR/desktopguide.fo -pdf $(LULUBASE)pt_BR/desktopguide.pdf
	rm $(LULUBASE)pt_BR/desktopguide.fo
