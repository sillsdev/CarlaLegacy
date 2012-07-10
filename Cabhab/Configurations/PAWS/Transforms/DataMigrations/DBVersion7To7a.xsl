<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from dbversion 7 to 7a
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
	<xsl:template match="/paws[@dbversion='7']">
		<paws dbversion="7a">
			<xsl:apply-templates select="@*[name()!='dbversion']"/>
			<xsl:apply-templates/>
		</paws>
	</xsl:template>
	<xsl:template match="pron/personaFirstlSplitPossessorExample">
		<xsl:choose>
			<xsl:when test="preceding-sibling::*[1][name()='personalThirdSplitObjectExample']">
				<personalFirstSplitPossessorExample>
					<xsl:apply-templates select="@*"/>
					<xsl:apply-templates/>
				</personalFirstSplitPossessorExample>
			</xsl:when>
			<xsl:otherwise>
				<personalDependentFirstSplitPossessorExample>
					<xsl:apply-templates select="@*"/>
					<xsl:apply-templates/>
				</personalDependentFirstSplitPossessorExample>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	</xsl:stylesheet>
