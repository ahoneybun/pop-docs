<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
 
<!-- Imports -->

	<xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/xhtml/chunk.xsl"/>
	<xsl:import href="handbook-chunk.xsl"/>	

<!-- Banner -->

  <xsl:template name="header.navigation">
    <xsl:variable name="home" select="/*[1]"/>
    <xsl:variable name="up" select="parent::*"/>
      <div id="mastwrap">
      <div id="masthead">
        </div>
	</div>
  
    </xsl:template>

<!-- ==================================================================== -->


</xsl:stylesheet>
