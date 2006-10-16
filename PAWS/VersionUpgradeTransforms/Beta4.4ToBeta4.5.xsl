<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from Beta version 0.4.4 to Beta version 4.5
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
	ip
	-->
	<xsl:template match="ip/ipInflFeatRealis">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
		<ipInflFeatPassive checked="no"/>
		<ipInflFeatParticiple checked="no"/>
	</xsl:template>
	<!--
	np 1
	-->
	<xsl:template match="np/adjpExample">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
		<partExample/>
	</xsl:template>
	<!--
	np 2
	-->
	<xsl:template match="np/compPPExample">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
		<partHeadExample/>
		<partHeadSentExample/>
	</xsl:template>
</xsl:stylesheet>
