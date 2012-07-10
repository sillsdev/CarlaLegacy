<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from dbversion 4 to 5
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@* |  node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<!--
		increment dbversion
	-->
	<!--
	This is the pattern to use when do not need to also add onen or more attributes to the paws element
	<xsl:template match="/paws[@dbversion='4']">
		<paws dbversion="5">
			<xsl:apply-templates select="@*[name()!='dbversion']"/>
			<xsl:apply-templates/>
		</paws>
	</xsl:template>
-->
	<!--
		Add output control attributes on the paws element
	-->
	<xsl:template match="/paws[@dbversion='4']">
		<paws dbversion="5" outputGrammar="True" outputWriter="True" outputWriterPractical="True" outputWriterPracticalSpanish="True">
			<xsl:apply-templates/>
		</paws>
	</xsl:template>
	<!--
		writerPracticalFile and writerPracticalSpanishFile need to be added
	-->
	<xsl:template match="language/writerFile">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
		<writerPracticalFile>
			<xsl:value-of select="substring-before(.,'.xml')"/>
			<xsl:text>Practical.xml</xsl:text>
		</writerPracticalFile>
		<writerPracticalSpanishFile>
			<xsl:value-of select="substring-before(.,'.xml')"/>
			<xsl:text>PracticalSpanish.xml</xsl:text>
		</writerPracticalSpanishFile>
	</xsl:template>
	<!--
		coordppExample may need to be added
	-->
	<xsl:template match="coord/dpExample">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
		<xsl:if test="following-sibling::*[1][name()!='coordppExample']">
			<coordppExample/>
		</xsl:if>
	</xsl:template>
	<!--
		remove outdated attribute
	-->
	<xsl:template match="qp/@NPDegreeNegCooccur">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
	</xsl:template>
</xsl:stylesheet>
