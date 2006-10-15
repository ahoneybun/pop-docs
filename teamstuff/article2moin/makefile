
INFILE = a2m-desc.xml
OUTFILE = a2m-desc
STYLESHEET = a2m.xslt
#STYLESHEET_HTML = /usr/share/xml/docbook/stylesheet/ldp/html/tldp-one-page.xsl
STYLESHEET_HTML = /usr/share/xml/docbook/stylesheet/nwalsh/html/docbook.xsl
PDFSTYLE = udp-pdf.xsl
DTD1 = a2m.dtd
DTD2 = /usr/share/xml/docbook/schema/dtd/4.3/docbookx.dtd

validate:
	xmllint --dtdvalid $(DTD1) --noout --xinclude --noent --postvalid $(INFILE)
	xmllint --dtdvalid $(DTD2) --noout --xinclude --noent --postvalid $(INFILE)

moin: validate
	xsltproc -o $(OUTFILE).txt $(STYLESHEET) $(INFILE)
#	java org.apache.xalan.xslt.Process -IN $(INFILE) -XSL $(STYLESHEET) -OUT $(OUTFILE).txt

html: validate
	xsltproc -o $(OUTFILE).html $(STYLESHEET_HTML) $(INFILE)

pdf: validate
	xsltproc -o $(OUTFILE).fo $(PDFSTYLE) $(INFILE)
	fop.sh -fo $(OUTFILE).fo -pdf $(OUTFILE).pdf
	rm $(OUTFILE).fo
	
