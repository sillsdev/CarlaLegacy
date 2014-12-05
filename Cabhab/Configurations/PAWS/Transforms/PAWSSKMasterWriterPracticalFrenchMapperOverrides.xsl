<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- French overrides -->
	<!--
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		DoFree
		routine to create empty free line for interlinear
		Parameters: none
		- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	-->
	<xsl:template name="DoFree">
		<free>
			<gloss lang="lGloss">ENTRER TRADUCTION LIBRE ICI.</gloss>
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
			<gloss lang="lGloss">ENTRER GLOSE ICI</gloss>
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
			<gloss lang="lGloss">IMP.entrer glose de morphème-PL ici</gloss>
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
			<gloss lang="lGloss">ENTRER GLOSE DU MOT ICI</gloss>
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
		<author>Nom du premier auteur</author>
		<author>Nom du deuxième auteur (effacer s’il n’y en a qu’un auteur)</author>
		<affiliation>Affiliation</affiliation>
		<date>
			<xsl:value-of select="$prmSDateTime"/>
		</date>
		<version>Ébauche générée par le programme de PAWS <xsl:value-of select="$prmSVersionNumber"/></version>
		<contents showLevel="3" label="Contenido"/>
	</xsl:template>
	<xsl:template name="OutputContentsElement">
		<contents showLevel="3" label="Contenido"/>
	</xsl:template>

</xsl:stylesheet>
