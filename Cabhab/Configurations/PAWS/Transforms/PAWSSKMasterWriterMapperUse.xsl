<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" doctype-system="C:/carla/Dev/Cabhab/Configurations/PAWS/Transforms/XLingPap.dtd"/>
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
			<frontMatter>
				<title>A Comparative Grammar of  <xsl:value-of select="//language/langName"/>
				</title>
				<xsl:call-template name="OutputCommonFrontmatter"/>
				<abstract>
					<p>ABSTRACT GOES HERE</p>
				</abstract>
			</frontMatter>
			<xsl:apply-templates select="/" mode="intro"/>
			<xsl:apply-templates select="/" mode="qp"/>
			<xsl:apply-templates select="/" mode="advp"/>
			<xsl:apply-templates select="/" mode="adjp"/>
			<xsl:apply-templates select="/" mode="np"/>
			<xsl:apply-templates select="/" mode="prop"/>
			<xsl:apply-templates select="/" mode="pron"/>
			<xsl:apply-templates select="/" mode="pp"/>
			<xsl:apply-templates select="/" mode="ip"/>
			<xsl:apply-templates select="/" mode="comp"/>
			<xsl:apply-templates select="/" mode="ques"/>
			<xsl:apply-templates select="/" mode="relcl"/>
			<xsl:apply-templates select="/" mode="advcl"/>
			<xsl:apply-templates select="/" mode="neg"/>
			<xsl:apply-templates select="/" mode="coord"/>
			<xsl:apply-templates select="/" mode="focus"/>
			<xsl:apply-templates select="/" mode="excl"/>
			<xsl:call-template name="OutputCommonBackmatterLanguagesAndTypes"/>
		</lingPaper>
	</xsl:template>
	<!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Include other templates
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
	<xsl:include href="WriterIntroAndTypology.xsl"/>
	<xsl:include href="WriterQP.xsl"/>
	<xsl:include href="WriterAdvP.xsl"/>
	<xsl:include href="WriterAdjP.xsl"/>
	<xsl:include href="WriterNP.xsl"/>
	<xsl:include href="WriterProp.xsl"/>
	<xsl:include href="WriterPron.xsl"/>
	<xsl:include href="WriterPP.xsl"/>
	<xsl:include href="WriterIP.xsl"/>
	<xsl:include href="WriterComp.xsl"/>
	<xsl:include href="WriterQues.xsl"/>
	<xsl:include href="WriterRelCl.xsl"/>
	<xsl:include href="WriterAdvCl.xsl"/>
	<xsl:include href="WriterNeg.xsl"/>
	<xsl:include href="WriterCoord.xsl"/>
	<xsl:include href="WriterFocus.xsl"/>
	<xsl:include href="WriterExcl.xsl"/>
	<xsl:include href="WriterAppdx.xsl"/>
	<xsl:include href="PAWSSKMasterWriterMapperCommon.xsl"/>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		DoInterlinearGlossLines
		routine to create gloss lines for interlinear
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="DoInterlinearGlossLines">
		<xsl:call-template name="DoMorphemeGloss"/>
		<xsl:call-template name="DoWordGloss"/>
	</xsl:template>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		HandleAnyAbbreviationLanguage
		routine to output appropriate language element for abbreviations
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="HandleAnyAbbreviationLanguage">
		<language id="en" name="English"/>

	</xsl:template>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		HandleAnyAbbreviations
		routine to output appropriate elements for abbreviations
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="HandleAnyAbbreviations">
		<glossary label="Abbreviations">
			<p>The abbreviations used in the examples are:</p>
			<abbreviationsShownHere/>
		</glossary>
		<xsl:copy-of select="document('../Data/AbbreviationsPAWS.xml')/abbreviations" />

	</xsl:template>
</xsl:stylesheet>
