<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="PAWSSKMasterWriterMapperCommon.xsl"/>
	<xsl:import href="PAWSSKMasterWriterPracticalSpanishMapperOverrides.xsl"/>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" doctype-system="C:/carlarepo/CarlaLegacy/Cabhab/Configurations/PAWS/Transforms/XLingPap.dtd"/>

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
		<lingPaper automaticallywrapinterlinears="yes" sortRefsAbbrsByDocumentLanguage="yes" xml:lang="es" tablenumberedLabelAndCaptionLocation="after" tablenumberedLabel="Tabla ">
			<frontMatter>
				<title>Gramática del  <xsl:value-of select="//language/langNames/langName[@lang='es']"/>
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
				<xsl:with-param name="sEndnoteLabel" select="'Notas'"/>
				<xsl:with-param name="sReferencesLabel" select="'Referencias'"/>
			</xsl:call-template>
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
		DoTextsSection
		routine to create manually entered text section
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="DoTextsSection">
		<section1 id="sTexts">
			<secTitle>Los textos</secTitle>
			<p>
				<object type="tComment">Incluya varios textos aquí para mostrar cómo se forman las construcciones más grandes tales como párrafos, conversaciones e historias narrativas. Incluya los ejemplos de varios tipos literarios.</object>
			</p>
			<p>
				<object type="tComment"> Un formato sugerido para presentar los textos es presente el texto completo en la lengua vernáculo primero, así que los nativos pueden apreciarla. Después presenta la forma interlineal, como en los ejemplos a través de la gramática. Finalmente, dé una traducción libre completo, así que el altavoz extranjero puede apreciar más sobre la cultura.</object>
			</p>
			<p>
				<object type="tComment">Por favor, escriba sus textos aquí (Abre con el signo +). Tiene que preparar al menos un texto nativo - o puede importar de FLEx y eliminar las lineas abajo que no necesita.</object>
			</p>
			<interlinear-text>
				<textInfo>
					<textTitle>título - texto 1</textTitle>
					<shortTitle/>
				</textInfo>
				<p>
					<langData lang="lVernacular">parrafos para el texto completa en la lenga</langData>
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
							<langData lang="lVernacular">lengua</langData>
						</line>
						<line>
							<gloss lang="lGloss">glosa</gloss>
						</line>
						<line>
							<gloss lang="lGloss">morfemas</gloss>
						</line>
					</lineGroup>
					<free>traducción libre</free>
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
					<gloss lang="lGloss">parrafos para la traducción libre completa</gloss>
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
					<textTitle>título - texto 2</textTitle>
					<shortTitle/>
				</textInfo>
				<p>
					<langData lang="lVernacular">parrafos para el texto completa en la lenga</langData>
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
							<langData lang="lVernacular">lengua</langData>
						</line>
						<line>
							<gloss lang="lGloss">glosa</gloss>
						</line>
						<line>
							<gloss lang="lGloss">morfemas</gloss>
						</line>
					</lineGroup>
					<free>traducción libre</free>
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
					<gloss lang="lGloss">parrafos para la traducción libre completa</gloss>
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
					<textTitle>título - texto 3</textTitle>
					<shortTitle/>
				</textInfo>
				<p>
					<langData lang="lVernacular">parrafos para el texto completa en la lenga</langData>
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
							<langData lang="lVernacular">lengua</langData>
						</line>
						<line>
							<gloss lang="lGloss">glosa</gloss>
						</line>
						<line>
							<gloss lang="lGloss">morfemas</gloss>
						</line>
					</lineGroup>
					<free>traducción libre</free>
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
					<gloss lang="lGloss">parrafos para la traducción libre completa</gloss>
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
					<textTitle>título - texto 4</textTitle>
					<shortTitle/>
				</textInfo>
				<p>
					<langData lang="lVernacular">parrafos para el texto completa en la lenga</langData>
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
							<langData lang="lVernacular">lengua</langData>
						</line>
						<line>
							<gloss lang="lGloss">glosa</gloss>
						</line>
						<line>
							<gloss lang="lGloss">morfemas</gloss>
						</line>
					</lineGroup>
					<free>traducción libre</free>
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
					<gloss lang="lGloss">parrafos para la traducción libre completa</gloss>
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
			<p>Las abreviaturas usadas en los ejemplos son:</p>
			<abbreviationsShownHere/>
		</glossary>
		<xsl:copy-of select="document('../Data/AbreviaturasPAWS.xml')/abbreviations"/>

	</xsl:template>
</xsl:stylesheet>
