<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from dbversion 10 to 11 (add French writer output)
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
	<xsl:template match="/paws[@dbversion='10']">
		<paws dbversion="11">
			<xsl:apply-templates select="@*[name()!='dbversion']"/>
			<xsl:attribute name="outputWriterPracticalFrench">
				<xsl:text>True</xsl:text>
			</xsl:attribute>
			<xsl:apply-templates/>
		</paws>
	</xsl:template>
	<!--
		langName for French needs to be added
	-->
	<xsl:template match="language/langNames/langName[@lang='es']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
		<langName lang="fr"/>
	</xsl:template>
	<!--
		writerPracticalFrenchFile needs to be added
	-->
	<xsl:template match="language/writerPracticalSpanishFile">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
		<writerPracticalFrenchFile>
			<xsl:value-of select="substring-before(.,'Spanish.xml')"/>
			<xsl:text>French.xml</xsl:text>
		</writerPracticalFrenchFile>
	</xsl:template>
</xsl:stylesheet>
