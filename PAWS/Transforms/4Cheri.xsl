<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
	<html>
	<head>
	<style>
	.rule {
	 color: blue;
	 font-family: Courier New;
	 padding-top: 12px;
	 padding-bottom: 12px;
	  }
	.genTemplates {
	 color: black;
	 font-family: Courier New;
	 padding-top: 12px;
	 padding-bottom: 12px;
	 }
	.specialTemplates {
	 color:green;
	 font-family: Courier New;
	 padding-top: 12px;
	 padding-bottom: 12px;
	 }
	.catMapper{
	 color:red;
	 font-family: Courier New;
	 padding-top: 12px;
	 padding-bottom: 12px;
	 }
	 .ruleLine {
	 font-weight: bold;
	 }

	</style>
	</head>
	  <body>
		<xsl:apply-templates select="//*"/>
	  </body>
	</html>
  </xsl:template>
  <xsl:template match="//rule">
	<div class="rule">
	<xsl:variable name="sRuleContent"><xsl:value-of select="."/></xsl:variable>
	<xsl:variable name="sRuleBegin"><xsl:value-of select="substring-before($sRuleContent,'rule')"/></xsl:variable>
	<xsl:variable name="sRuleRest"><xsl:value-of select="substring-after($sRuleContent,'}')"/></xsl:variable>
	<xsl:variable name="sRuleLine"><xsl:value-of select="substring($sRuleContent, string-length($sRuleBegin), 1+(string-length($sRuleContent)-string-length($sRuleRest))-string-length($sRuleBegin))"/></xsl:variable>
	<xsl:value-of select="$sRuleBegin"/>
	<span class="ruleLine">
	<xsl:value-of select="$sRuleLine"/>
	</span>
	  <xsl:value-of select="$sRuleRest"/>
	</div>
  </xsl:template>
  <xsl:template match="//generalizedTemplates">
	<div class="genTemplates">
	  <xsl:value-of select="."/>
	</div>
  </xsl:template>
  <xsl:template match="//specializedTemplates">
	<div class="specialTemplates">
	  <xsl:value-of select="."/>
	</div>
  </xsl:template>
  <xsl:template match="//catMapper">
	<div class="catMapper">
	  <xsl:value-of select="."/>
	</div>
  </xsl:template>
  <xsl:template match="//masterGrammar"/>
  <xsl:template match="//showWhen"/>
</xsl:stylesheet>
