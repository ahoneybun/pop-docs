<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- This file is a customization layer for HTML only -->
    <!-- ======================= -->
    <!-- Imports -->
    <!--<xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/current/html/docbook.xsl"/>-->
    <xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/xhtml/docbook.xsl"/>
    <xsl:param name="body.font.master" select="12"/>
    <xsl:param name="html.stylesheet" select="'aboutubuntu.css'"/>
    <xsl:param name="generate.toc" select="''"/>
</xsl:stylesheet>
