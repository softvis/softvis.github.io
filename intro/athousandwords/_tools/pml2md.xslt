<xsl:stylesheet version = '1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
<xsl:output method="text" version="1.0" encoding="utf-8" indent="no"/>
<xsl:template match="/chapter">--- 
layout: page
title: <xsl:value-of select="title"/>
author: Farooq Ali
---

*This essay was originally published in [The ThoughtWorks Anthology, Volume 2](http://pragprog.com/book/twa2/the-thoughtworks-anthology-volume-2).*
 
<xsl:apply-templates select="p"/> 
<xsl:apply-templates select="sect1"/> 
</xsl:template>

<xsl:template match="sect1">
<xsl:text>&#xa;&#xa;</xsl:text> 	
## <xsl:apply-templates select="title"/>
<xsl:apply-templates select="*[name() != 'title']"/> 
</xsl:template>

<xsl:template match="sect2">
<xsl:text>&#xa;&#xa;</xsl:text> 	
### <xsl:apply-templates select="title"/>
<xsl:apply-templates select="*[name() != 'title']"/> 
</xsl:template>

<xsl:template match="sect3">
<xsl:text>&#xa;&#xa;</xsl:text> 	
#### <xsl:apply-templates select="title"/>
<xsl:apply-templates select="*[name() != 'title']"/> 
</xsl:template>

<xsl:template match="p">
<xsl:text>&#xa;&#xa;</xsl:text> 
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="//ul/li/p">
* <xsl:apply-templates/> 
</xsl:template>

<xsl:template match="//ol/li/p">
1. <xsl:apply-templates/> 
</xsl:template>

<xsl:template match="figure">
![<xsl:value-of select="./title"/>](<xsl:value-of select="./imagedata/@fileref"/> "Figure <xsl:value-of select="@id"/>")	
*Figure <xsl:value-of select="@id"/>*
</xsl:template>

<xsl:template match="imagedata">
![](<xsl:value-of select="@fileref"/>)	
</xsl:template>

<xsl:template match="blockquote/p">
&gt; <xsl:apply-templates/>	
</xsl:template>
	
<xsl:template match="emph">*<xsl:value-of select="."/>*</xsl:template>

<xsl:template match="ref">figure <xsl:value-of select="@linkend"/></xsl:template>

<xsl:template match="footnote">[link](http://<xsl:value-of select=".//url"/>)</xsl:template>

</xsl:stylesheet> 
