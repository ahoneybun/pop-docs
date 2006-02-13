<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<!-- Imports -->
	<!--<xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/current/html/profile-chunk.xsl"/>-->
	<xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/html/profile-docbook.xsl"/>
  
  <!-- this param must be set before including html-cust.sml 
  <xsl:param name="html.stylesheet" select="'../default.css'"/>-->
  
	<xsl:param name="draft.mode" select="'no'"/>
<!-- commenting out because this seems to break images and other things
	<xsl:include href="../../libs/html-cust.xsl"/>
	<xsl:include href="../../libs/common-cust.xsl"/>
-->	
	<!--Admon Graphics-->
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
  
</xsl:stylesheet>
