<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" doctype-system="c:\fw\ww\XLingPap\XLingPap.dtd"/>
  <!--
================================================================
Convert PAWS answer xml file to an XLingPap xml file
  Input:    xml file conforming to PAWSStarterKit.dtd
  Output: xml file confroming to XLingPap.dtd
================================================================
Revision History is at the end of this file.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Preamble
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:variable name="sLangName"><xsl:value-of select="//language/langName"/></xsl:variable>
  <xsl:variable name="sLangCode">l<xsl:value-of select="//language/langAbbr"/></xsl:variable>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Main template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="/">
  <xsl:processing-instruction name="xml-stylesheet">
  <xsl:text>type="text/xsl" href="c:\fw\ww\XLingPap\XLingPap1.xsl"</xsl:text>
  </xsl:processing-instruction>
<lingPaper>
<xsl:attribute name="css"><xsl:value-of select="//language/langAbbr"/>WriteUp.css</xsl:attribute>
  <language id="lEng" name="English">english</language>
  <language>
  <xsl:attribute name="id"><xsl:value-of select="$sLangCode"/></xsl:attribute>
  <xsl:attribute name="name"><xsl:value-of select="$sLangName"/></xsl:attribute>
  </language>
  <frontMatter>
	<title>PAWS Grammar WriteUp for <xsl:value-of select="$sLangName"/></title>
	<author>Author name(s) goes(go) here</author>
	<affiliation>Affiliation goes here</affiliation>
	<date>Date goes here</date>
	<contents showLevel="3"/>
  </frontMatter>
  <section1 id="sIntro">
  <secTitle>Introduction</secTitle>
  <p>This is a grammar description of <xsl:value-of select="$sLangName"/> based on the answers given to the PAWS Starter Kit.</p>
<p>The <xsl:value-of select="$sLangName"/> language is spoken in X.</p>
  </section1>
  <section1 id="sTypology">
  <secTitle>Overall Typology</secTitle>
  <p>The overall typology of <xsl:value-of select="$sLangName"/> is <xsl:choose>
	<xsl:when test="//typology/@wordOrder='SOV'">Subject-Object-Verb</xsl:when>
	<xsl:when test="//typology/@wordOrder='OSV'">Object-Subject-Verb</xsl:when>
	<xsl:when test="//typology/@wordOrder='SVO'">Subject-Verb-Object</xsl:when>
	<xsl:when test="//typology/@wordOrder='OVS'">Object-Verb-subject</xsl:when>
	<xsl:when test="//typology/@wordOrder='VSO'">Verb-Subject-Object</xsl:when>
	<xsl:when test="//typology/@wordOrder='VOS'">Verb-Object-Subject</xsl:when>
  </xsl:choose>.  Here are some examples:</p>
  <example>
  <xsl:attribute name="num">xTypology</xsl:attribute>
<xsl:call-template name="OutputExamples">
<xsl:with-param name="sExamples"><xsl:value-of select="//typology/example"/></xsl:with-param>
<xsl:with-param name="iLength"><xsl:value-of select="string-length(//typology/example)"/></xsl:with-param>
</xsl:call-template>
</example>
  </section1>
  <section1 id="sEtc">
  <secTitle>Other sections will go here</secTitle>
  <p>The other sections still need to be fleshed out.</p>
  </section1>
</lingPaper>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
NamedTemplate
	routine to create a test Expression
		Parameters: prmCondition: IDREF to a showWhen
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
<xsl:template name="OutputExamples">
<xsl:param name="sExamples"/>
<xsl:param name="iLength"/>
<xsl:if test="string-length($sExamples) > 1">
<xsl:variable name="sLine" select="substring-before($sExamples, '&#x0a;')"/>
<listSingle>
<xsl:attribute name="letter"><xsl:value-of select="generate-id()"/>_<xsl:value-of select="$iLength"/></xsl:attribute>
<langData>
<xsl:attribute name="lang"><xsl:value-of select="$sLangCode"/></xsl:attribute>
<xsl:value-of select="$sLine"/>
</langData>
</listSingle>
<xsl:call-template name="OutputExamples">
<xsl:with-param name="sExamples"><xsl:value-of select="substring-after($sExamples,'&#x0a;')"/></xsl:with-param>
<xsl:with-param name="iLength"><xsl:value-of select="string-length(substring-after($sExamples,'&#x0a;'))"/></xsl:with-param>
</xsl:call-template>
</xsl:if>
</xsl:template>
</xsl:stylesheet>
<!--
================================================================
Revision History
- - - - - - - - - - - - - - - - - - -
29-Apr-2002      Andy Black  Began working on Initial Draft
================================================================
 -->
