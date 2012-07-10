<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/abbreviations">
	<abbreviations>
		<xsl:copy-of select="@*"/>
		<xsl:copy-of select="comment"/>
	<xsl:for-each select="abbreviation">
		<xsl:sort select="abbrInLang/abbrDefinition" lang="es"/>
			<xsl:copy-of select="."/>
	</xsl:for-each>
	</abbreviations>
</xsl:template>
</xsl:stylesheet>
