<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from dbversion 6 to 7
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
	<xsl:template match="/paws[@dbversion='6']">
		<paws dbversion="7">
			<xsl:apply-templates select="@*[name()!='dbversion']"/>
			<xsl:apply-templates/>
		</paws>
	</xsl:template>
	<!--
		Add langNames element, copy in current langName as the English one, and then add a Spanish langName
	-->
	<xsl:template match="language">
		<language>
			<langNames>
				<langName lang="en">
					<xsl:value-of select="langName"/>
				</langName>
				<langName lang="es"/>
			</langNames>
			<xsl:apply-templates select="*[name()!='langName']"/>
		</language>
	</xsl:template>
</xsl:stylesheet>
