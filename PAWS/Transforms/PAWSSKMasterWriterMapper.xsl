<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" doctype-system="XLingPap.dtd"/>
  <!--
================================================================
Convert PAWS answers xml file to an XLingPap xml file
  Input:    xml file conforming to PAWSStarterKit.dtd
  Output: XLingPap xml file
================================================================
Revision History is at the end of this file.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Preamble
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Main template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="/">
	<xsl:processing-instruction name="xml-stylesheet">
	  <xsl:text>type="text/xsl" href="XLingPap1.xsl"</xsl:text>
	</xsl:processing-instruction>
	<lingPaper>
	  <xsl:attribute name="css"><xsl:value-of select="//language/langAbbr"/><xsl:text>WriteUp.css</xsl:text></xsl:attribute>
	  <language id="lPAWSSKEnglish">PAWSSKEnglish</language>
	  <language id="lGloss">GlossLanguage</language>
	  <language>
		<xsl:attribute name="id"><xsl:text>l</xsl:text><xsl:value-of select="//language/langAbbr"/></xsl:attribute>
		<xsl:value-of select="//language/langName"/>
	  </language>
	  <xsl:apply-templates select="/" mode="intro"/>
	  <xsl:apply-templates select="/" mode="qp"/>
	  <xsl:apply-templates select="/" mode="advp"/>
	  <xsl:apply-templates select="/" mode="adjp"/>
	  <xsl:apply-templates select="/" mode="np"/>
	</lingPaper>
  </xsl:template>
  <xsl:include href="IntroAndTypology.xsl"/>
  <xsl:include href="QP.xsl"/>
  <xsl:include href="AdvP.xsl"/>
  <xsl:include href="AdjP.xsl"/>
  <xsl:include href="NP.xsl"/>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoGlossAndFree
	routine to create empty gloss and free lines for interlinear
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoGlossAndFree">
	<line>
	  <gloss lang="lGloss">
		<object class="comment">Enter gloss here.</object>
	  </gloss>
	</line>
	<free>
	  <gloss lang="lGloss">
		<object class="comment">Enter free translation here.</object>
	  </gloss>
	</free>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
OutputInterlinearExamples
	routine to create examples recursively
		Parameters: sExamles: text of examples
							 iLength: length of example text
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="OutputInterlinearExamples">
	<xsl:param name="sExamples"/>
	<xsl:param name="iLength"/>
	<xsl:if test="string-length($sExamples) != 0">
	  <xsl:variable name="sBefore" select="substring-before($sExamples, '&#xA;')"/>
	  <xsl:variable name="sLine">
		<xsl:choose>
		  <xsl:when test="string-length($sBefore) = 0">
			<xsl:value-of select="$sExamples"/>
		  </xsl:when>
		  <xsl:otherwise>
			<xsl:value-of select="$sBefore"/>
		  </xsl:otherwise>
		</xsl:choose>
	  </xsl:variable>
	  <listInterlinear>
		<xsl:attribute name="letter">x<xsl:value-of select="generate-id(.)"/>_<xsl:value-of select="$iLength"/></xsl:attribute>
		<line>
		  <langData>
			<xsl:attribute name="lang"><xsl:text>l</xsl:text><xsl:value-of select="//language/langAbbr"/></xsl:attribute>
			<xsl:value-of select="$sLine"/>
		  </langData>
		</line>
		<xsl:call-template name="DoGlossAndFree"/>
	  </listInterlinear>
	  <xsl:call-template name="OutputInterlinearExamples">
		<xsl:with-param name="sExamples">
		  <xsl:value-of select="substring-after($sExamples,'&#xA;')"/>
		</xsl:with-param>
		<xsl:with-param name="iLength">
		  <xsl:value-of select="string-length(substring-after($sExamples,'&#xA;'))"/>
		</xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
  </xsl:template>
</xsl:stylesheet>
<!--
================================================================
Revision History
- - - - - - - - - - - - - - - - - - -
26-Jul-2002    Andy Black  Initial version
================================================================
 -->
