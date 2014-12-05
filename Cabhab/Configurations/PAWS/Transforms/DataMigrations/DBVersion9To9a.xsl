<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from dbversion 7a to 8
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no"/>
	<xsl:template match="@* |  node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<!--
		increment dbversion
	-->
	<xsl:template match="/paws[@dbversion='9']">
		<paws dbversion="9a">
			<xsl:apply-templates select="@*[name()!='dbversion']"/>
			<xsl:apply-templates/>
		</paws>
	</xsl:template>
	<!--
		typology: add <splitConditions/> before <class1Example/>
	-->
	<xsl:template match="typology">
		<typology>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="noCaseExperiencer">no</xsl:attribute>
			<xsl:apply-templates mode="typology"/>
		</typology>
	</xsl:template>
	<xsl:template match="*" mode="typology">
		<xsl:copy-of select="."/>
	</xsl:template>

	<!--
		pron:  add many attributes and examples
	-->
	<xsl:template match="pron">
		<pron>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="pron"/>
		</pron>
	</xsl:template>
	<xsl:template match="*" mode="pron">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="personalThirdPlNoCaseExample" mode="pron">
		<xsl:copy-of select="."/>
		<personalFirstSgNoneDativeExample/>
		<personalFirstPlNoneDativeExample/>
		<personalFirstExclNoneDativeExample/>
		<personalFirstInclNoneDativeExample/>
		<personalSecondSgNoneDativeExample/>
		<personalSecondPlNoneDativeExample/>
		<personalThirdSgNoneDativeExample/>
		<personalThirdPlNoneDativeExample/>
	</xsl:template>
	<xsl:template match="personalDependentThirdPlNoCaseExample" mode="pron">
		<xsl:copy-of select="."/>
		<personalDependentFirstSgNoneDativeExample/>
		<personalDependentFirstPlNoneDativeExample/>
		<personalDependentFirstExclNoneDativeExample/>
		<personalDependentFirstInclNoneDativeExample/>
		<personalDependentSecondSgNoneDativeExample/>
		<personalDependentSecondPlNoneDativeExample/>
		<personalDependentThirdSgNoneDativeExample/>
		<personalDependentThirdPlNoneDativeExample/>
	</xsl:template>
</xsl:stylesheet>
