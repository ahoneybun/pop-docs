<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
  
  <xsl:template name="header.navigation">
    <xsl:variable name="home" select="/*[1]"/>
    <xsl:variable name="up" select="parent::*"/>
      <div id="mastwrap">
      <div id="masthead">
      <div id="sisternav">
        <ul>
          <li id="plain">
            <a href="/5.10">5.10 (Breezy Badger)</a>
          </li>
          <li id="current">
            <a href="/6.06">6.06 LTS (Dapper Drake)</a>
       	  </li>
          <li id="plain">
            <a href="/community">Community Docs</a>
          </li>
	  </ul>
	</div>
        </div>
	</div>


      </xsl:template>

<!-- ==================================================================== -->


</xsl:stylesheet>
