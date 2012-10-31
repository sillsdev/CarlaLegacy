<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- Spanish overrides -->
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		DoFree
		routine to create empty free line for interlinear
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="DoFree">
		<free>
			<gloss lang="lGloss">ESCRIBA LA TRADUCCIÓN LIBRE AQUÍ .</gloss>
		</free>
	</xsl:template>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		DoGloss
		routine to create empty gloss line for interlinear
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="DoGloss">
		<line>
			<gloss lang="lGloss">ESCRIBA LA GLOSA AQUÍ </gloss>
		</line>
	</xsl:template>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		DoMorphemeGloss
		routine to create empty word gloss line for interlinear
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="DoMorphemeGloss">
		<line>
			<gloss lang="lGloss">IMP.escriba la glosa de los morfema-PL aquí</gloss>
		</line>
	</xsl:template>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		DoWordGloss
		routine to create empty word gloss line for interlinear
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="DoWordGloss">
		<line>
			<gloss lang="lGloss">ESCRIBA LA GLOSA DE LA PALABRA AQUÍ</gloss>
		</line>
	</xsl:template>
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		OutputCommonFrontmatter
		routine to create frontmatter items common to both types
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="OutputCommonFrontmatter">
		<author>EL NOMBRE DEL PRIMER AUTOR VA AQUÍ </author>
		<author>EL NOMBRE DEL SEGUNDO AUTOR VA AQUÍ  (si hay solamente uno, suprime esto)</author>
		<affiliation>AFILIACIÓN VA AQUÍ</affiliation>
		<date>
			<xsl:value-of select="$prmSDateTime"/>
		</date>
		<version>Este borrador fue generado por el programa PAWS <xsl:value-of select="$prmSVersionNumber"/></version>
		<contents showLevel="3" label="Contenido"/>
	</xsl:template>
	<xsl:template name="OutputContentsElement">
		<contents showLevel="3" label="Contenido"/>
	</xsl:template>

</xsl:stylesheet>
