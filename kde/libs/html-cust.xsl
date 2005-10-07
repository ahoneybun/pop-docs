<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- This file is a customization layer for HTML only -->
    <!-- ======================= -->
    <!-- Parameters -->
    <!-- ======================= -->
    
    <xsl:param name="generate.legalnotice.link" select="1"/>
    <xsl:param name="chunker.output.indent" select="'yes'"/>
    <xsl:param name="body.font.master" select="12"/>
	<xsl:param name="html.stylesheet" select="'/usr/share/doc/kde/HTML/en/common/kde-default.css'"/>
  
    <!-- ======================= -->
    <!-- Attribute Sets -->
    <!-- ======================= -->
    
    <!-- ======================= -->
    <!-- Template Customizations -->
    <!-- ======================= -->
 <!--<xsl:template name="user.head.content">
  <xsl:variable name="codefile" select="document('model.html',/)"/>
  <xsl:copy-of select="$codefile/htmlcode/node()"/>
 </xsl:template>
 
 <xsl:template match="processing-instruction('htmlcode')">
  <xsl:variable name="codefile" select="document(normalize-space(.),/)"/>
  <xsl:copy-of select="$codefile/*/node()"/>
 </xsl:template>-->

  <!-- this strippath template is copied from the 1.68.1 version of common.xls  -->
  <xsl:template name="strippath">
    <xsl:param name="filename" select="''"/>
    <xsl:choose>
      <!-- Leading .. are not eliminated -->
      <xsl:when test="starts-with($filename, '../')">
        <xsl:value-of select="'../'"/>
        <xsl:call-template name="strippath">
          <xsl:with-param name="filename" select="substring-after($filename, '../')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains($filename, '/../')">
        <xsl:call-template name="strippath">
          <xsl:with-param name="filename">
            <xsl:call-template name="getdir">
              <xsl:with-param name="filename" select="substring-before($filename, '/../')"/>
            </xsl:call-template>
            <xsl:value-of select="substring-after($filename, '/../')"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$filename"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


</xsl:stylesheet>
