<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- XSLT for art2moin
     art2moin XSLT converts a DocBook article to Moin markup
     CREATION INFO:
        Author: Jeff Schering
        Date: May 17, 2005
        Version: 0.1
     REVISION INFO:
        Author: Jeff Schering
        Date: June 5, 2005
        Version: 0.2
        Description: added rudimentary <table> and <informaltable> support, and
            <chapter> support for use with XInclude.
     REVISION INFO:
        Author: Jeff Schering
        Date: June 7, 2006
        Version: 0.3
        Description: changed license from CC-BY-SA to GPL
        
    Copyright 2005, 2006 by Jeff Schering (jeffschering@gmail.com)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

  
-->

<xsl:output method="text"/>
<xsl:strip-space elements="article"/>

<xsl:variable name="newline">
  <xsl:text>
</xsl:text>
</xsl:variable>

<xsl:template name="sect-templates">
  <xsl:apply-templates 
      select="title|para|orderedlist|itemizedlist|programlisting|literallayout|
      caution|important|note|tip|warning|table|informaltable|
      sect2|sect3|sect4"/>
</xsl:template>

<xsl:template name="paratags">
  <xsl:apply-templates
    select="text()|menuchoice|filename|command|subscript|superscript|ulink|
    application|emphasis|citetitle|guibutton|guilabel"/>
</xsl:template>

<xsl:template name="entrytags">
  <xsl:apply-templates
    select="text()|menuchoice|filename|command|subscript|superscript|ulink|
    application|emphasis|citetitle|guibutton|guilabel"/>
</xsl:template>

<xsl:template match="article|chapter">
  <xsl:text>## Generator: a2m.xslt Version 0.3 </xsl:text>
  <xsl:value-of select="$newline"/>
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="article/title">
  <xsl:text>= </xsl:text>
  <xsl:value-of select="text()"/>
  <xsl:text> =</xsl:text>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="chapter/title">
  <xsl:value-of select="$newline"/>
  <xsl:text>= </xsl:text>
  <xsl:value-of select="text()"/>
  <xsl:text> =</xsl:text>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="sect1">
  <xsl:value-of select="$newline"/>
  <xsl:call-template name="sect-templates"/>
</xsl:template>

<xsl:template match="sect2">
  <xsl:value-of select="$newline"/>
  <xsl:call-template name="sect-templates"/>
</xsl:template>

<xsl:template match="sect3">
  <xsl:value-of select="$newline"/>
  <xsl:call-template name="sect-templates"/>
</xsl:template>

<xsl:template match="sect4">
  <xsl:value-of select="$newline"/>
  <xsl:call-template name="sect-templates"/>
</xsl:template>

<xsl:template match="sect1/title">
  <xsl:text>== </xsl:text>
  <xsl:value-of select="text()"/>
  <xsl:text> ==</xsl:text>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="sect2/title">
  <xsl:text>=== </xsl:text>
  <xsl:value-of select="text()"/>
  <xsl:text> ===</xsl:text>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="sect3/title">
  <xsl:text>==== </xsl:text>
  <xsl:value-of select="text()"/>
  <xsl:text> ====</xsl:text>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="sect4/title">
  <xsl:text>===== </xsl:text>
  <xsl:value-of select="text()"/>
  <xsl:text> =====</xsl:text>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="table">
  <xsl:value-of select="$newline"/>
  <xsl:apply-templates select="title"/>
  <xsl:value-of select="$newline"/>
  <xsl:apply-templates select="tgroup"/>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="informaltable">
  <xsl:value-of select="$newline"/>
  <xsl:apply-templates select="tgroup"/>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="tgroup">
  <xsl:apply-templates select="thead"/>
  <xsl:apply-templates select="tbody"/>
</xsl:template>

<xsl:template match="thead|tbody">
  <xsl:apply-templates select="row"/>
</xsl:template>

<xsl:template match="table/title">
  <xsl:text>||&lt;style="text-align: center;"-</xsl:text>
  <xsl:value-of select="../tgroup/@cols"/>
  <xsl:text>&gt;'''</xsl:text>
  <xsl:value-of select="text()"/>
  <xsl:text>'''||</xsl:text>
</xsl:template>

<xsl:template match="thead/row|tbody/row">
  <xsl:text>||</xsl:text>
  <xsl:apply-templates select="entry"/>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="thead/row/entry">
  <xsl:text>&lt;style="text-align: center;">'''</xsl:text>
  <xsl:value-of select="text()"/>
  <xsl:text>'''||</xsl:text>
</xsl:template>

<xsl:template match="tbody/row/entry">
  <xsl:variable name="var">
    <xsl:call-template name="entrytags"/>
  </xsl:variable>
  <xsl:value-of select="normalize-space($var)"/>
  <xsl:text>||</xsl:text>
</xsl:template>

<xsl:template match="caution/para|important/para|note/para|tip/para|warning/para">
  <xsl:variable name="var">
    <xsl:call-template name="paratags"/>
  </xsl:variable>
  <xsl:value-of select="normalize-space($var)"/>
  <xsl:value-of select="$newline"/>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="para">
  <xsl:variable name="var">
    <xsl:call-template name="paratags"/>
  </xsl:variable>
  <xsl:value-of select="normalize-space($var)"/>
  <xsl:value-of select="$newline"/>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="listitem/para">
  <xsl:variable name="var">
    <xsl:call-template name="paratags"/>
  </xsl:variable>
  <xsl:value-of select="normalize-space($var)"/>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="orderedlist">
  <xsl:apply-templates select="itemizedlist|orderedlist|listitem"/>
</xsl:template>

<xsl:template match="itemizedlist">
  <xsl:apply-templates select="itemizedlist|orderedlist|listitem"/>
</xsl:template>

<xsl:template match="orderedlist/listitem">
  <xsl:text> 1. </xsl:text>
  <xsl:apply-templates select="para|orderedlist|itemizedlist"/>
</xsl:template>

<xsl:template match="listitem/orderedlist/listitem">
  <xsl:text>    2. </xsl:text>
  <xsl:apply-templates select="para|orderedlist|itemizedlist"/>
</xsl:template>

<xsl:template match="itemizedlist/listitem">
  <xsl:text> * </xsl:text>
  <xsl:apply-templates select="para|orderedlist|itemizedlist"/>
</xsl:template>

<xsl:template match="menuchoice">
  <xsl:text>'''''</xsl:text>
  <xsl:apply-templates select="guimenu|guisubmenu|guimenuitem"/>
  <xsl:text>'''''</xsl:text>
</xsl:template>

<!--
<xsl:template match="guibutton">
  <xsl:text>'''''</xsl:text>
  <xsl:value-of select="text()" />
  <xsl:text>'''''</xsl:text>
</xsl:template>
  
<xsl:template match="guilabel">
  <xsl:text>'''''</xsl:text>
  <xsl:value-of select="text()" />
  <xsl:text>'''''</xsl:text>
</xsl:template>
-->

<xsl:template match="guimenu">
  <xsl:value-of select="text()"/>
  <xsl:text>-></xsl:text>
  <xsl:apply-templates select="guisubmenu|guimenuitem"/>
</xsl:template>

<xsl:template match="guisubmenu">
  <xsl:value-of select="text()"/>
  <xsl:text>-></xsl:text>
  <xsl:apply-templates select="guisubmenu|guimenuitem"/>
</xsl:template>

<xsl:template match="guimenuitem">
  <xsl:value-of select="text()"/>
</xsl:template>

<xsl:template match="caution">
  <xsl:value-of select="$newline"/>
  <xsl:text>'''Caution:''' </xsl:text>
  <xsl:apply-templates select="para"/>
</xsl:template>

<xsl:template match="important">
  <xsl:value-of select="$newline"/>
  <xsl:text>'''Important:''' </xsl:text>
  <xsl:apply-templates select="para"/>
</xsl:template>

<xsl:template match="note">
  <xsl:value-of select="$newline"/>
  <xsl:text>'''Note:''' </xsl:text>
  <xsl:apply-templates select="para"/>
</xsl:template>

<xsl:template match="tip">
  <xsl:value-of select="$newline"/>
  <xsl:text>'''Tip:''' </xsl:text>
  <xsl:apply-templates select="para"/>
</xsl:template>

<xsl:template match="warning">
  <xsl:value-of select="$newline"/>
  <xsl:text>'''Warning''' </xsl:text>
  <xsl:apply-templates select="para"/>
</xsl:template>

<xsl:template match="command">
  <xsl:text>{{{</xsl:text>
  <xsl:apply-templates />
  <xsl:text>}}}</xsl:text>
</xsl:template>

<xsl:template match="filename">
  <xsl:text>{{{</xsl:text>
  <xsl:apply-templates />
  <xsl:text>}}}</xsl:text>
</xsl:template>

<xsl:template match="application">
  <xsl:text>{{{</xsl:text>
  <xsl:apply-templates />
  <xsl:text>}}}</xsl:text>
</xsl:template>

<xsl:template match="subscript">
  <xsl:text>,,</xsl:text>
  <xsl:apply-templates />
  <xsl:text>,,</xsl:text>
</xsl:template>

<xsl:template match="superscript">
  <xsl:text>^</xsl:text>
  <xsl:apply-templates />
  <xsl:text>^</xsl:text>
</xsl:template>

<xsl:template match="emphasis|emphasis[@role='@italic']">
  <xsl:text>''</xsl:text>
  <xsl:apply-templates />
  <xsl:text>''</xsl:text>
</xsl:template>

<xsl:template match="emphasis[@role='bold']">
  <xsl:text>'''</xsl:text>
  <xsl:apply-templates />
  <xsl:text>'''</xsl:text>
</xsl:template>

<xsl:template match="citetitle">
  <xsl:text>''</xsl:text>
  <xsl:apply-templates />
  <xsl:text>''</xsl:text>
</xsl:template>

<xsl:template match="literallayout">
  <xsl:text>{{{</xsl:text>
  <xsl:value-of select="text()" />
  <xsl:text>}}}</xsl:text>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="programlisting">
  <xsl:text>{{{</xsl:text>
  <xsl:value-of select="text()" />
  <xsl:text>}}}</xsl:text>
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="article/comment()">
  <xsl:text>#</xsl:text>
  <xsl:value-of select="." />
  <xsl:value-of select="$newline"/>
</xsl:template>

<xsl:template match="ulink">
  <xsl:text>[</xsl:text>
  <xsl:value-of select="@url" />
  <xsl:text> </xsl:text>
  <xsl:value-of select="text()" />
  <xsl:text>]</xsl:text>
</xsl:template>

</xsl:stylesheet>

