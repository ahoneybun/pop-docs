<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <!-- This file is a common customization layer -->
    <!-- ======================= -->
    
    <!-- ======================= -->
    <!-- Parameters -->
    <!-- ======================= -->
    
    <!-- Extensions -->
    <!-- <xsl:param name="use.extensions" select="1"/>
    <xsl:param name="saxon.extensions" select="1"/>
    <xsl:param name="tablecolumns.extension" select="1"/>
    <xsl:param name="callouts.extensions" select="1"/> -->
    
    <!-- General Formatting-->
    <xsl:param name="draft.mode" select="'yes'"/>
    <xsl:param name="draft.watermark.image" select="'https://wiki.ubuntu.com/htdocs/ubuntu/img/u-draft.png'"/>
    <xsl:param name="variablelist.as.blocks" select="1"/>
    <xsl:param name="shade.verbatim" select="1"/>
    <xsl:param name="hyphenate">false</xsl:param>
    <xsl:param name="alignment">left</xsl:param>
    
    <!-- Cross References -->
    <xsl:param name="insert.xref.page.number" select="1"/>
    <xsl:param name="xref.with.number.and.title" select="0"/>
    
    <!-- Indexes -->
    <xsl:param name="generate.index" select="0"/>
    
    <!-- Glossaries -->
    <xsl:param name="glossterm.auto.link" select="1"/>
    <xsl:param name="firstterm.only.link" select="0"/>
    <xsl:param name="glossary.collection" select="'/usr/share/computerdictionary/glossary/glossary.xml'"/>
    <!--<xsl:param name="glossary.collection" select="'/home/sean/projects/terms/trunk/dict/glossary/glossary.xml'"/>-->
    <xsl:param name="glossentry.show.acronym" select="'primary'"/>
    
    <!-- Bibliographies -->
    <xsl:param name="bibliography.collection" select="'/usr/share/computerdictionary/bibliography/references.xml'"/>
    <xsl:param name="bibliography.numbered" select="1"/>
    
    <!-- Captions -->
    <xsl:param name="formal.title.placement">
        figure before
        example before 
        equation before 
        table before 
        procedure before
    </xsl:param>
    
    <!-- ======================= -->
    <!-- Templates -->
    <!-- ======================= -->

    <!-- Inline Formatting -->
    <xsl:template match="filename">
      <xsl:call-template name="inline.boldmonoseq"/>
    </xsl:template>
    <xsl:template match="application">
      <xsl:call-template name="inline.boldseq"/>
    </xsl:template>
    <xsl:template match="guibutton">
      <xsl:call-template name="inline.boldseq"/>
    </xsl:template>
    <xsl:template match="guilabel">
      <xsl:call-template name="inline.italicseq"/>
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
