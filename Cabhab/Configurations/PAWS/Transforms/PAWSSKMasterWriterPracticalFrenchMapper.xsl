<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="PAWSSKMasterWriterMapperCommon.xsl"/>
	<xsl:import href="PAWSSKMasterWriterPracticalFrenchMapperOverrides.xsl"/>
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
		<lingPaper automaticallywrapinterlinears="yes" sortRefsAbbrsByDocumentLanguage="yes" xml:lang="fr" tablenumberedLabelAndCaptionLocation="after" tablenumberedLabel="Tableau ">
			<frontMatter>
				<title>
					<xsl:variable name="sLanguageName" select="//language/langNames/langName[@lang='fr']"/>
					<xsl:variable name="sFirstLetter" select="translate(substring($sLanguageName,1,1),'àâéèêëîïôùûü','aaeeeeiiouuu')"/>
					<xsl:text>Une grammaire </xsl:text>
					<xsl:choose>
						<xsl:when test="starts-with($sFirstLetter,'a') or starts-with($sFirstLetter,'e') or starts-with($sFirstLetter,'i') or starts-with($sFirstLetter,'o') or starts-with($sFirstLetter,'u')">
							<xsl:text>de l’</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>du </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:value-of select="$sLanguageName"/>
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
			<xsl:call-template name="DoTextsSection"/>
			<xsl:call-template name="OutputCommonBackmatterLanguagesAndTypes">
				<xsl:with-param name="sEndnoteLabel" select="'Notes'"/>
				<xsl:with-param name="sReferencesLabel" select="'Références'"/>
			</xsl:call-template>
		</lingPaper>
	</xsl:template>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		Include other templates
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:include href="WriterFrPracticalIntroAndTypology.xsl"/>
	<xsl:include href="WriterFrPracticalN.xsl"/>
	<xsl:include href="WriterFrPracticalV.xsl"/>
	<xsl:include href="WriterFrPracticalAdvP.xsl"/>
	<xsl:include href="WriterFrPracticalAdjP.xsl"/>
	<xsl:include href="WriterFrPracticalNP.xsl"/>
	<xsl:include href="WriterFrPracticalProp.xsl"/>
	<xsl:include href="WriterFrPracticalPron.xsl"/>
	<xsl:include href="WriterFrPracticalPP.xsl"/>
	<xsl:include href="WriterFrPracticalIP.xsl"/>
	<xsl:include href="WriterFrPracticalComp.xsl"/>
	<xsl:include href="WriterFrPracticalQues.xsl"/>
	<xsl:include href="WriterFrPracticalRelCl.xsl"/>
	<xsl:include href="WriterFrPracticalAdvCl.xsl"/>
	<xsl:include href="WriterFrPracticalNeg.xsl"/>
	<xsl:include href="WriterFrPracticalCoord.xsl"/>
	<xsl:include href="WriterFrPracticalFocus.xsl"/>
	<xsl:include href="WriterFrPracticalExcl.xsl"/>
	<xsl:include href="WriterFrPracticalAppdx.xsl"/>
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
		DoTextsSection
		routine to create manually entered text section
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="DoTextsSection">
		<section1 id="sTexts">
			<secTitle>Textes</secTitle>
			<p>
				<object type="tComment">Incluez ici plusieurs textes pour démontrer comment de plus grandes constructions comme des paragraphes, des conversations et des récits narratifs sont formés.</object>
			</p>
			<p>
				<object type="tComment">Un format suggéré pour présenter les textes c'est de les présenter d’abord en langage vulgaire afin que les présentateurs natifs puissent l'apprécier.  Ensuite les présenter dans une forme interlinéaire comme dans les exemples de cette grammaire.  Finalement donnez une traduction libre totale pour que les présentateurs qui ne sont pas natifs puissent mieux apprécier la culture.</object>
			</p>
			<p>
				<object type="tComment">Écrivez, s’il vous plaît, vos exemples ici. (Commencez avec la signe +) Il faut préparer au moins un texte en langue maternelle - ou bien importer un texte à partir de FLEx, en quel cas vous pouvez effacer les lignes superflues suivantes.</object>
			</p>
			<interlinear-text>
				<textInfo>
					<textTitle>titre - texte 1</textTitle>
					<shortTitle/>
				</textInfo>
				<p>
					<langData lang="lVernacular">paragraphes pour le texte entier dans la langue</langData>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular">langue</langData>
						</line>
						<line>
							<gloss lang="lGloss">glose</gloss>
						</line>
						<line>
							<gloss lang="lGloss">morphèmes</gloss>
						</line>
					</lineGroup>
					<free>traduction libre</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<p>
					<gloss lang="lGloss">paragraphes pour le texte entier dans la langue</gloss>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
			</interlinear-text>
			<interlinear-text>
				<textInfo>
					<textTitle>titre - texte 2</textTitle>
					<shortTitle/>
				</textInfo>
				<p>
					<langData lang="lVernacular">paragraphes pour le texte entier dans la langue</langData>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular">langue</langData>
						</line>
						<line>
							<gloss lang="lGloss">glose</gloss>
						</line>
						<line>
							<gloss lang="lGloss">morphèmes</gloss>
						</line>
					</lineGroup>
					<free>traduction libre</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<p>
					<gloss lang="lGloss">paragraphes pour le texte entier dans la langue</gloss>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
			</interlinear-text>
			<interlinear-text>
				<textInfo>
					<textTitle>titre - texte 3</textTitle>
					<shortTitle/>
				</textInfo>
				<p>
					<langData lang="lVernacular">paragraphes pour le texte entier dans la langue</langData>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular">langue</langData>
						</line>
						<line>
							<gloss lang="lGloss">glose</gloss>
						</line>
						<line>
							<gloss lang="lGloss">morphèmes</gloss>
						</line>
					</lineGroup>
					<free>traduction libre</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<p>
					<gloss lang="lGloss">paragraphes pour le texte entier dans la langue</gloss>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
			</interlinear-text>
			<interlinear-text>
				<textInfo>
					<textTitle>titre - texte 4</textTitle>
					<shortTitle/>
				</textInfo>
				<p>
					<langData lang="lVernacular">paragraphes pour le texte entier dans la langue</langData>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<p>
					<langData lang="lVernacular"/>
				</p>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular">langue</langData>
						</line>
						<line>
							<gloss lang="lGloss">glose</gloss>
						</line>
						<line>
							<gloss lang="lGloss">morphèmes</gloss>
						</line>
					</lineGroup>
					<free>traduction libre</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<interlinear>
					<lineGroup>
						<line>
							<langData lang="lVernacular"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
						<line>
							<gloss lang="lGloss"/>
						</line>
					</lineGroup>
					<free>
						<gloss lang="lGloss"/>
					</free>
				</interlinear>
				<p>
					<gloss lang="lGloss">paragraphes pour le texte entier dans la langue</gloss>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
				<p>
					<gloss lang="lGloss"/>
				</p>
			</interlinear-text>
		</section1>
	</xsl:template>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		HandleAnyAbbreviationLanguage
		routine to output appropriate language element for abbreviations
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="HandleAnyAbbreviationLanguage">
		<language id="fr" name="French"/>

	</xsl:template>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		HandleAnyAbbreviations
		routine to output appropriate elements for abbreviations
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="HandleAnyAbbreviations">
		<glossary label="Abréviations">
			<p>Les abréviations utilisées dans les exemples sont:</p>
			<abbreviationsShownHere/>
		</glossary>
		<xsl:copy-of select="document('../Data/AbreviationsPAWS.xml')/abbreviations"/>

	</xsl:template>
</xsl:stylesheet>
