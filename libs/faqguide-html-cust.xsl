<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- This file is a customization layer for HTML only -->
    <!-- ======================= -->
    <!-- Imports -->
	<xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/html/profile-chunk.xsl"/>

    <!-- Params -->
    <xsl:param name="generate.legalnotice.link" select="1"/>
    <xsl:param name="chunker.output.indent" select="'yes'"/>
    <xsl:param name="body.font.master" select="10"/>
    <xsl:param name="html.stylesheet" select="'../../faqguide.css'"/>
    <xsl:param name="shade.verbatim" select="0"/>
    <xsl:param name="draft.mode" select="'no'"/>
    <xsl:param name="draft.watermark.image" select="'https://wiki.ubuntu.com/htdocs/ubuntu/img/u-draft.png'"/>

	<!--Navigation Graphics-->
	<xsl:param name="navig.graphics" select="1"/>
	<xsl:param name="navig.graphics.path" select="'../../images/navig/'"/>
	<xsl:param name="navig.graphics.extension" select="'.gif'"/> 
	<xsl:param name="navig.showtitles" select="1"/>
	
	<!--Admon Graphics--> 
	<xsl:param name="admon.graphics" select="1"/>
	<xsl:param name="admon.textlabel" select="0"/>
	<xsl:param name="admon.graphics.path" select="'../../images/admon/'"/>
	<xsl:param name="admon.graphics.extension" select="'.png'"/>
	
	<!-- Callout Graphics -->
	<xsl:param name="callout.unicode" select="1"/>
	<xsl:param name="callout.graphics" select="0"/>
	<xsl:param name="callout.graphics.path" select="'../../images/callouts/'"/>
	<xsl:param name="callout.graphics.extension" select="'.png'"/>
	
    <!-- Inline Formatting -->
    <xsl:template match="application">
      <xsl:call-template name="inline.boldseq"/>
    </xsl:template>
    <xsl:template match="guibutton">
      <xsl:call-template name="inline.boldseq"/>
    </xsl:template>
    <xsl:template match="guilabel">
      <xsl:call-template name="inline.italicseq"/>
    </xsl:template>
    
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

    <!-- The only change made to this template is the background-repeat -->
    <xsl:template name="head.content">
      <xsl:param name="node" select="."/>
      <xsl:param name="title">
        <xsl:apply-templates select="$node" mode="object.title.markup.textonly"/>
      </xsl:param>
      
      <title>
        <xsl:copy-of select="$title"/>
      </title>
      
      <xsl:if test="$html.stylesheet != ''">
        <xsl:call-template name="output.html.stylesheets">
          <xsl:with-param name="stylesheets" select="normalize-space($html.stylesheet)"/>
        </xsl:call-template>
      </xsl:if>
      
      <xsl:if test="$link.mailto.url != ''">
        <link rev="made" href="{$link.mailto.url}"/>
      </xsl:if>
      
      <xsl:if test="$html.base != ''">
        <base href="{$html.base}"/>
      </xsl:if>
      
      <meta name="generator" content="DocBook XSL Stylesheets V{$VERSION}"/>
      
      <xsl:if test="$generate.meta.abstract != 0">
        <xsl:variable name="info" select="(articleinfo                                       |bookinfo                                       |prefaceinfo                                       |chapterinfo                                       |appendixinfo                                       |sectioninfo                                       |sect1info                                       |sect2info                                       |sect3info                                       |sect4info                                       |sect5info                                       |referenceinfo                                       |refentryinfo                                       |partinfo                                       |info                                       |docinfo)[1]"/>
        <xsl:if test="$info and $info/abstract">
          <meta name="description">
            <xsl:attribute name="content">
              <xsl:for-each select="$info/abstract[1]/*">
                <xsl:value-of select="."/>
                <xsl:if test="position() &lt; last()">
                  <xsl:text> </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </xsl:attribute>
          </meta>
        </xsl:if>
      </xsl:if>
      
      <xsl:if test="($draft.mode = 'yes' or                 ($draft.mode = 'maybe' and                 ancestor-or-self::*[@status][1]/@status = 'draft'))                 and $draft.watermark.image != ''">
        <style type="text/css"><xsl:text>
            body { background-image: url('</xsl:text>
          <xsl:value-of select="$draft.watermark.image"/><xsl:text>');
            background-repeat: repeat;
            background-position: top left;
            /* The following properties make the watermark "fixed" on the page. */
            /* I think that's just a bit too distracting for the reader... */
            /* background-attachment: fixed; */
            /* background-position: center center; */
            }</xsl:text>
        </style>
      </xsl:if>
      <xsl:apply-templates select="." mode="head.keywords.content"/>
    </xsl:template>

</xsl:stylesheet>
