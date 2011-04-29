<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:html="http://www.w3.org/1999/xhtml"
                xmlns:exsl="http://exslt.org/common"
                xmlns:set="http://exslt.org/sets"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="html set"
                extension-element-prefixes="exsl"
                version="1.0">

<xsl:param name="color.gray_background" select="'#f7f6f5'"/>
<xsl:param name="color.gray_border" select="'#ccc1c1'"/>
<xsl:param name="color.blue_background" select="'#f7f6f5'"/>
<xsl:param name="color.blue_border" select="'#ccc1c1'"/>
<xsl:param name="color.yellow_background" select="'#f7f6f5'"/>
<xsl:param name="color.yellow_border" select="'#ccc1c1'"/>
<xsl:param name="color.red_background" select="'#f7f6f5'"/>
<xsl:param name="color.red_border" select="'#ccc1c1'"/>

<xsl:param name="color.text" select="'#333333'"/>
<xsl:param name="color.text_light" select="'#aea79f'"/>
<xsl:param name="color.link" select="'#dd4814'"/>
<xsl:param name="color.link_visited" select="'#dd4814'"/>

<xsl:template name="html.css.custom">
  <xsl:param name="node" select="."/>
  <xsl:param name="direction">
    <xsl:call-template name="l10n.direction"/>
  </xsl:param>
  <xsl:param name="left">
    <xsl:call-template name="l10n.align.start">
      <xsl:with-param name="direction" select="$direction"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="right">
    <xsl:call-template name="l10n.align.end">
      <xsl:with-param name="direction" select="$direction"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:text>

body {
 background: #d3caaa url(img/bg-page.png) repeat-x top;
 margin: 20px;
 padding: 0;
 font-size: 90%;
 font-family:"Helvetica Neue", "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
 color:#000;
 max-width: 100%;
 position: relative;
}
#round {
	background: #fff url(img/bg-content.png) repeat-y top;
	width: 876px;
	margin: auto;
	margin-bottom: 50px;
	position: relative;
}
#round .sb-inner {
	background-color: #fff;
}
#page {
	clear: both;
	margin: 0;
	padding: 10px 30px;
}
#content {
	padding: 12px;
}
img.ubuntulogo {
	margin: 20px;
}
#topcap {
	position: absolute;
	top: 0;
	left: 0;
}
#bottomcap {
	position: absolute;
	bottom: 0;
	left: 0;
}
#header {
	padding-top: 12px;
}
#header h1 {
	display: inline;
}
#header h1 span {
	display: none;
}
#logo-floater {
	width: 225px;
	float: left;
	padding: 10px;
}
#logo-floater h1 {
	border: none;
}
#sitename a {
	position: relative;
	top: 35px;
	float: right;
	font-size: 1.5em;
	padding-right: 20px;
	text-decoration: none;
	color: black;
}
#sitename span {
	padding-left: 5px;
}
#cse-search-box {
	position: absolute;
	right: 3px;
	top: 3px;
	/* float: right; */
	margin: 5px 10px;
	padding: 0;
	white-space: nowrap;
	font-size: 13px;
}
#cse-search-box form div {
    display: inline;
}
/* Links */
a, a:visited {
	color: #D90D19;
}
a:hover {
	color: #800000;
}
/* Headings */
h1, h2, h3, h4, h5, h6
{
        margin: 0;
        padding: 2px 0;
        font-weight: normal; 
        color: #5A3320;
        line-height: 1.2em;
}	
h1
{
        border-bottom: 2px solid #6d4c07; /* ubuntu dark brown */
	font-size: 1.6em;
}
h2
{
        border-bottom: 1px solid #6d4c07; /* ubuntu dark brown */
	font-size: 1.4em;
}
h3 {font-size: 1.3em;}
h4 {font-size: 1.1em;}
h4, h5, h6 {font-size: 1em;}
#footer {
	margin: 0;
	font-size: 90%;
	color: #444;
}
#ubuntulinks {
	text-align: center;
}
li {
  margin: 16px 0 0 0;
  margin-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 16px;
  -webkit-margin-start: 16px; -webkit-margin-end: 0;
  -moz-margin-start: 16px; -moz-margin-end: 0;
}
dt { margin-top: 16px; }
dt:first-child { margin-top: 0; }
dt + dt { margin-top: 0; }
dd {
  margin: 8px 0 0 0;
  margin-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 16px;
  -webkit-margin-start: 16px; -webkit-margin-end: 0;
  -moz-margin-start: 16px; -moz-margin-end: 0;
}
ol.compact li { margin-top: 8px; }
ul.compact li { margin-top: 8px; }
ol.compact li:first-child { margin-top: 0; }
ul.compact li:first-child { margin-top: 0; }
dl.compact dt { margin-top: 8px; }
dl.compact dt:first-child { margin-top: 0; }
dl.compact dt + dt { margin-top: 0; }

div.title { margin: 0 0 8px 0; }
div.desc { margin: 0 0 8px 0; }
div.contents + div.desc { margin: 8px 0 0 0; }
pre.contents { padding: 8px; }
li.links {
  margin: 8px 0 8px 0;
  padding-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 16px;
}
div.sectionlinks { padding: 0 16px 0 16px; }
div.sectionlinks div.title { margin: 8px 0 8px 0; }
div.sectionlinks div.sectionlinks { margin: 8px 0 0 0; }
div.sectionlinks div.sectionlinks li {
  padding-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 16px;
}
div.nextlinks {
  margin-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 16px;
}
div.serieslinks { padding: 0 16px 0 16px; }
div.serieslinks div.title { margin: 8xp 0 8px 0; }
pre.numbered {
  padding: 8px;
  margin-</xsl:text><xsl:value-of select="$right"/><xsl:text>: 8px;
}
div.figure {
  margin-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 16px;
  -webkit-margin-start: 16px;
  -moz-margin-start: 16px;
  padding: 4px;
}
div.figure > div.inner > div.contents {
  padding: 8px 16px 8px 16px;
}
div.list > div.title { margin-bottom: 8px; }
div.note { padding: 8px; }
div.note > div.inner > div.title {
  margin-</xsl:text><xsl:value-of select="$left"/><xsl:text>: </xsl:text>
    <xsl:value-of select="$icons.size.note + 8"/><xsl:text>px;
}
div.note > div.inner > div.contents {
  margin-</xsl:text><xsl:value-of select="$left"/><xsl:text>: </xsl:text>
    <xsl:value-of select="$icons.size.note + 8"/><xsl:text>px;
}
div.note-sidebar {
  margin-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 8px;
  padding: 8px;
}
div.quote > div.inner > div.title { margin: 0 0 8px 0; }
div.quote > div.inner > div.cite { margin-top: 8px; }
ol.steps, ul.steps {
  padding: 8px 16px 8px 16px;
}
li.steps {
  margin-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 16px;
  -webkit-margin-start: 16px;
  -moz-margin-start: 16px;
}
li.steps li.steps {
  margin-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 32px;
  -webkit-margin-start: 32px;
  -moz-margin-start: 32px;
}
div.synopsis > div.inner > div.contents, div.synopsis > pre.contents {
  padding: 8px 16px 8px 16px;
}
span.cmd { padding: 0 4px 0 4px; }
span.key { padding: 0 4px 0 4px; }
div.media-ttml-p {
  margin: 8px 0 0 0;
  padding: 8px;
}
div.floatleft { margin-right: 16px; }
div.floatright { margin-left: 16px; }
div.floatstart {
  margin-</xsl:text><xsl:value-of select="$right"/><xsl:text>: 16px;
}
div.floatend {
  margin-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 16px;
}
ul.mouseovers a { padding: 6px; }
table.toronto td {
  padding-top: 16px;
  padding-</xsl:text><xsl:value-of select="$right"/><xsl:text>: 16px;
}
td.twocolumnright {
  padding-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 16px;
  -webkit-padding-start: 16px;
  -moz-padding-start: 16px;
}
div.linkdiv div.title { font-size: 12px; }
div.linkdiv {
  padding: 8px;
  -moz-border-radius: 0px;
  border: solid 1px </xsl:text>
    <xsl:value-of select="$color.background"/><xsl:text>;
}
div.example {
  padding-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 16px;
}
div.comment { padding: 8px; }
div.comment div.comment { margin: 16px 16px 0 16px; }
div.comment div.cite { margin: 0 0 8px 0; }
ul.tree ul.tree {
  margin-</xsl:text><xsl:value-of select="$left"/><xsl:text>: 16px;
  -webkit-margin-start: 16px;
  -moz-margin-start: 16px;
}
div.facets { padding: 8px; } 
div.facet {
  margin-bottom: 16px;
  margin-</xsl:text><xsl:value-of select="$right"/><xsl:text>: 16px;
}

</xsl:text>
</xsl:template>

<xsl:template name="html.page">
  <xsl:param name="node" select="."/>
  <html>
    <head>
      <title>
        <xsl:apply-templates mode="html.title.mode" select="$node"/>
      </title>
      <xsl:call-template name="html.css"/>
      <xsl:call-template name="html.js"/>
      <xsl:call-template name="html.head.custom"/>
    </head>
    <body>
     <div id="round">
     <img id="topcap" alt="" src="https://help.ubuntu.com/htdocs/ubuntunew/img/cap-top.png" />
     <div id="layout" class="container clear-block">
      <xsl:apply-templates mode="html.body.attr.mode" select="$node"/>
      <script src="https://ssl.google-analytics.com/urchin.js"
      type="text/javascript"></script>
      <script type="text/javascript">
      _uacct = "UA-1018242-8";
      urchinTracker();
      </script>
      <div id="header">
      <div id="logo-floater">
       <h1><a href="https://help.ubuntu.com" title="Ubuntu Documentation"><img alt="Ubuntu" id="logo" src="https://help.ubuntu.com/htdocs/ubuntunew/img/logo.png" /></a>
       </h1>
      </div> <!-- logo-floater -->

      <!-- Provide a search box for clients with and without javascript -->
      <noscript>
       <form action="http://www.google.com/cse" id="cse-search-box">
        <div>
         <input type="hidden" name="cx" value="004599128559784038176:vj_p0xo-nng" />
         <input type="hidden" name="ie" value="UTF-8" />
         <input type="text" name="q" size="27" />
         <input type="submit" name="sa" value="Search" />
        </div>
       </form>
      </noscript>

      <!-- Search box -->
      <script>
       document.write('<form action="https://help.ubuntu.com/search.html" id="cse-search-box">');
       document.write('  <div>');
       document.write('    <input type="hidden" name="cof" value="FORID:9" />');
       document.write('    <input type="hidden" name="cx" value="004599128559784038176:vj_p0xo-nng" />');
       document.write('    <input type="hidden" name="ie" value="UTF-8" />');
       document.write('    <input type="text" name="q" size="27" />');
       document.write('    <input type="submit" name="sa" value="Search" />');
       document.write('  </div>');
       document.write('</form>');
      </script>
      <div id="sitename"><a href="https://help.ubuntu.com/"><img alt="Official Documentation" src="https://help.ubuntu.com/htdocs/ubuntunew/img/help-about.png" /><span>Official Documentation</span></a>
      </div> <!-- sitename -->
      </div> <!-- header -->
      <div id="page">
        <xsl:apply-templates mode="html.header.mode" select="$node"/>
      <div id="content">
        <xsl:apply-templates mode="html.body.mode" select="$node"/>
      </div> <!-- content -->
      <hr />
      <div id="footer">
       <div id="ubuntulinks">
	<p>The material in this document is available under a free license, see <a href="/legal.html">Legal</a> for details<br />
	For information on contributing see the <a href="https://wiki.ubuntu.com/DocumentationTeam">Ubuntu Documentation Team wiki page</a>. To report a problem, visit the <a href="https://bugs.launchpad.net/ubuntu/+source/ubuntu-docs">bug page for Ubuntu Documentation</a></p>
       </div> <!-- ubuntulinks -->
      <br />
      </div> <!-- footer -->
      <div id="bottomcap">
	<img src="https://help.ubuntu.com/htdocs/ubuntunew/img/cap-bottom.png" alt=""/>
      </div> <!-- bottomcap -->
      </div> <!-- page -->
      </div> <!-- layout -->
      </div> <!-- round -->
    </body>
  </html>
</xsl:template>

<xsl:template name="mal2html.page.linktrails.trail">
  <xsl:param name="node" select="."/>
  <div class="trail">
    <a href="https://help.ubuntu.com" class="trail">Ubuntu Documentation</a>
  <xsl:variable name="direction">
    <xsl:call-template name="l10n.direction"/>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$direction = 'rtl'">
      <xsl:choose>
        <xsl:when test="$node/@child = 'section'">
          <xsl:text>&#x00A0;‹ </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>&#x00A0;« </xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$node/@child = 'section'">
          <xsl:text>&#x00A0;› </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>&#x00A0;» </xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
    <a href="https://help.ubuntu.com/11.04" class="trail">Ubuntu 11.04</a>
  <xsl:choose>
    <xsl:when test="$direction = 'rtl'">
      <xsl:choose>
        <xsl:when test="$node/@child = 'section'">
          <xsl:text>&#x00A0;‹ </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>&#x00A0;« </xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$node/@child = 'section'">
          <xsl:text>&#x00A0;› </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>&#x00A0;» </xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>

    <xsl:call-template name="mal2html.page.linktrails.link">
      <xsl:with-param name="node" select="$node"/>
    </xsl:call-template>
  </div>
</xsl:template>

</xsl:stylesheet>
