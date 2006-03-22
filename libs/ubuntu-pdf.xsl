<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Customization layer for PDF output 
     CREATION INFO:
        Author: Jeff Schering
        Date: April 23, 2005
        Version: 0.1
     REVISION INFO:
        Author: Jeff Schering 
        Date: January 3, 2006 
        Version: 0.2
        Description: added draft mode parameters
     REVISION INFO:
        Author: 
        Date: 
        Version: 0.3
        
     License: CC-BY-SA. see http://creativecommons.org/licenses/by-sa/2.0/
-->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fo="http://www.w3.org/1999/XSL/Format">

<!-- Import the standard xsl -->
<xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl"/>

<!-- PARAMETERS SECTION -->

<!-- select draft mode, either yes or no -->
<xsl:param name="draft.mode" select="'yes'"/>

<!-- Give each section a number -->
<xsl:param name="section.autolabel" select="0"></xsl:param>

<!-- Turn on left justify. The default is full justify  -->
<xsl:param name="alignment">left</xsl:param>

<!-- Create bookmarks in the PDF file 
     NOTE: this is only applicable if Apache fop is used -->
<xsl:param name="fop.extensions" select="1"/>

<!-- Put a rule above each footer and a rule below each header  -->
<xsl:param name="footer.rule" select="1"/>
<xsl:param name="header.rule" select="1"/>

<!-- Use a sans-serif font -->
<xsl:param name="body.font.family" select="'sans-serif'"/>

<!-- Don't split words across lines (no end-of-line word breaks) -->
<xsl:param name="hyphenate">false</xsl:param>

<!-- '1 3 1' means the center header has three times the width of the left and 
     right headers. This is needed because the doc title is in the center header -->
<xsl:param name="header.column.widths" select="'1 3 1'"/>

<!-- TEMPLATE OVERRIDES SECTION -->

<!-- modify footer.content template from fo/pagesetup.xsl to change page number
     location from center to right -->
<xsl:template name="footer.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>

  <fo:block>
    <!-- pageclass can be front, body, back -->
    <!-- sequence can be odd, even, first, blank -->
    <!-- position can be left, center, right -->
    <xsl:choose>
      <xsl:when test="$pageclass = 'titlepage'">
        <!-- nop; no footer on title pages -->
      </xsl:when>

      <xsl:when test="$double.sided != 0 and $sequence = 'even'
                      and $position='left'">
        <fo:page-number/>
      </xsl:when>

      <xsl:when test="$double.sided != 0 and ($sequence = 'odd' or $sequence = 'first')
                      and $position='right'">
        <fo:page-number/>
      </xsl:when>

<!-- This is the original
      <xsl:when test="$double.sided = 0 and $position='center'">
        <fo:page-number/>
      </xsl:when>
-->
     <!-- change from center to right -->
      <xsl:when test="$double.sided = 0 and $position='right'">
        <fo:page-number/>
      </xsl:when>


      <xsl:when test="$sequence='blank'">
        <xsl:choose>
          <xsl:when test="$double.sided != 0 and $position = 'left'">
            <fo:page-number/>
          </xsl:when>
          <xsl:when test="$double.sided = 0 and $position = 'center'">
            <fo:page-number/>
          </xsl:when>
          <xsl:otherwise>
            <!-- nop -->
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>


      <xsl:otherwise>
        <!-- nop -->
      </xsl:otherwise>
    </xsl:choose>
  </fo:block>
</xsl:template>

<!-- ***************  Links  *********************  -->
<!-- ***************************************************  -->

<!-- No stupid square brackets with urls in after links -->

<xsl:param name="ulink.show" select="0"></xsl:param>

<!-- Blue links -->

<xsl:attribute-set name="xref.properties">
  <xsl:attribute name="color">blue</xsl:attribute>
</xsl:attribute-set>

<!-- ***************  Admonitions  *********************  -->
<!-- ***************************************************  -->


<!-- If true (non-zero), admonitions are presented in an alternate style that uses a graphic. Default graphics are provided in the distribution. -->
<xsl:param name="admon.graphics" select="1"></xsl:param>

<!-- If true (non-zero), admonitions are presented with a generated text label such as Note or Warning in the appropriate language. If zero, such labels are turned off, but any title children of the admonition element are still output. The default value is 1. -->
<xsl:param name="admon.textlabel" select="0"></xsl:param>

<!-- ***************  ToC/LoT/Index Generation  *********************  -->
<!-- ***************************************************  -->

<!-- This is an excellent reference:  http://www.sagehill.net/docbookxsl/TOCcontrol.html -->

<!-- Specifies the depth to which recursive sections should appear in the TOC -->
<xsl:param name="toc.section.depth" select="1" />

<!-- How maximaly deep should be each TOC? -->
<xsl:param name="toc.max.depth" select="2" />

<!-- Get rid of annoying white page after titlepage -->

<!-- **************** Miscellaneous Fixes ****************** -->

<!-- Some custom spacing for lists -->

<xsl:attribute-set name="list.block.spacing">
  <xsl:attribute name="space-before.optimum">0.3em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.2em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1em</xsl:attribute>
</xsl:attribute-set>

<xsl:template name="book.titlepage.separator"/>

</xsl:stylesheet>

