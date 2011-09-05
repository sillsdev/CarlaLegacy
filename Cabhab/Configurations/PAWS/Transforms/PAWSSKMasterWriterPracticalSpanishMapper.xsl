<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="PAWSSKMasterWriterMapperCommon.xsl"/>
	<xsl:import href="PAWSSKMasterWriterPracticalSpanishMapperOverrides.xsl"/>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" doctype-system="/Transforms/XLingPap.dtd"/>

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
		<lingPaper automaticallywrapinterlinears="yes">
			<frontMatter>
				<title>Una Gramática del  <xsl:value-of select="//language/langName"/>
				</title>
				<xsl:call-template name="OutputCommonFrontmatter"/>
			</frontMatter>
			<xsl:apply-templates select="/" mode="intro"/>
			<xsl:apply-templates select="/" mode="n"/>
			<xsl:apply-templates select="/" mode="prop"/>
			<xsl:apply-templates select="/" mode="pron"/>
			<xsl:apply-templates select="/" mode="adjp"/>
			<xsl:apply-templates select="/" mode="np"/>
			<xsl:apply-templates select="/" mode="v"/>
			<xsl:apply-templates select="/" mode="advp"/>
			<xsl:apply-templates select="/" mode="pp"/>
			<xsl:apply-templates select="/" mode="excl"/>
			<xsl:apply-templates select="/" mode="ip"/>
			<xsl:apply-templates select="/" mode="focus"/>
			<xsl:apply-templates select="/" mode="ques"/>
			<xsl:apply-templates select="/" mode="neg"/>
			<xsl:apply-templates select="/" mode="coord"/>
			<xsl:apply-templates select="/" mode="comp"/>
			<xsl:apply-templates select="/" mode="advcl"/>
			<xsl:apply-templates select="/" mode="relcl"/>
			<xsl:call-template name="OutputCommonBackmatterLanguagesAndTypes"/>
		</lingPaper>
	</xsl:template>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		Include other templates
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:include href="WriterSpPracticalIntroAndTypology.xsl"/>
	<xsl:include href="WriterSpPracticalN.xsl"/>
	<xsl:include href="WriterSpPracticalV.xsl"/>
	<xsl:include href="WriterSpPracticalAdvP.xsl"/>
	<xsl:include href="WriterSpPracticalAdjP.xsl"/>
	<xsl:include href="WriterSpPracticalNP.xsl"/>
	<xsl:include href="WriterSpPracticalProp.xsl"/>
	<xsl:include href="WriterSpPracticalPron.xsl"/>
	<xsl:include href="WriterSpPracticalPP.xsl"/>
	<xsl:include href="WriterSpPracticalIP.xsl"/>
	<xsl:include href="WriterSpPracticalComp.xsl"/>
	<xsl:include href="WriterSpPracticalQues.xsl"/>
	<xsl:include href="WriterSpPracticalRelCl.xsl"/>
	<xsl:include href="WriterSpPracticalAdvCl.xsl"/>
	<xsl:include href="WriterSpPracticalNeg.xsl"/>
	<xsl:include href="WriterSpPracticalCoord.xsl"/>
	<xsl:include href="WriterSpPracticalFocus.xsl"/>
	<xsl:include href="WriterSpPracticalExcl.xsl"/>
	<xsl:include href="WriterSpPracticalAppdx.xsl"/>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		DoInterlinearGlossLines
		routine to create gloss lines for interlinear
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="DoInterlinearGlossLines">
		<xsl:call-template name="DoWordGloss"/>
		<xsl:call-template name="DoMorphemeGloss"/>
	</xsl:template>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		HandleAnyAbbreviationLanguage
		routine to output appropriate language element for abbreviations
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="HandleAnyAbbreviationLanguage">
		<language id="es" name="Spanish"/>

	</xsl:template>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		HandleAnyAbbreviations
		routine to output appropriate elements for abbreviations
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="HandleAnyAbbreviations">
		<glossary label="Abreviaturas">
			<abbreviationsShownHere/>
		</glossary>
		<xsl:copy-of select="document('../Data/AbreviaturasPAWS.xml')/abbreviations" />

	</xsl:template>
</xsl:stylesheet>
