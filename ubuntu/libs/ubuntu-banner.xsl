<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
  
  <xsl:template name="header.navigation">
    <xsl:variable name="home" select="/*[1]"/>
    <xsl:variable name="up" select="parent::*"/>

<script xmlns="" src="https://ssl.google-analytics.com/urchin.js"
type="text/javascript"></script>
<script xmlns="" type="text/javascript">
_uacct = "UA-1018242-8";
urchinTracker();
</script>

      <div id="mastwrap">
      <div id="masthead">
      <div id="sisternav">
        <ul>
          <li id="plain">
            <a href="/6.06">6.06 LTS</a>
       	  </li>
          <li id="plain">
            <a href="/7.04">7.04</a>
       	  </li>
          <li id="plain">
            <a href="/7.10">7.10</a>
       	  </li>
          <li id="current">
            <a href="/8.04">8.04 LTS</a>
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
