<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/xhtml/chunk.xsl"/>
    <xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/xhtml/chunk.xsl"/>
    <xsl:param name="toc.max.depth">3</xsl:param>
    <xsl:param name="generate.toc"> book toc,title </xsl:param>
    <xsl:param name="admon.graphics" select="0"/>
    <xsl:param name="admon.textlabel" select="0"/>
    <xsl:param name="generate.meta.abstract" select="0"/>
    <!-- Notes shall not be indented -->
    <xsl:param name="admon.style"/>
    <xsl:param name="html.stylesheet" select="'http://www.ubuntulinux.org/plone.css'"/>
</xsl:stylesheet>
