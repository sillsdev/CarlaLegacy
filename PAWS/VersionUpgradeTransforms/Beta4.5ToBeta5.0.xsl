<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from Beta version 0.4.5 to Beta version 4.6
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
	npContents9 needs to be added
	-->
	<xsl:template match="np/npContents8">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
		<npContents9 checkedOff="{@checkedOff}"/>
	</xsl:template>
</xsl:stylesheet>
