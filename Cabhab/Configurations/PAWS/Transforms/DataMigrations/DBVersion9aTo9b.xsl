<?xml version="1.0" encoding="UTF-8"?>
<!-- transform to convert PAWS answer file from dbversion 9a to 9b
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
	<xsl:template match="/paws[@dbversion='9a']">
		<paws dbversion="9b">
			<xsl:apply-templates select="@*[name()!='dbversion']"/>
			<xsl:apply-templates/>
		</paws>
	</xsl:template>
	<!--
		np:  add examples
	-->
	<xsl:template match="np">
		<np>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="np"/>
		</np>
	</xsl:template>
	<xsl:template match="*" mode="np">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="npContents1" mode="np">
		<articleErgGenExample/>
		<articleErgPlGenExample/>
		<articleErgIndefGenExample/>
		<articleErgIndefPlGenExample/>
		<articleSplitNomExample/>
		<articleSplitPlNomExample/>
		<articleSplitIndefNomExample/>
		<articleSplitIndefPlNomExample/>
		<articleSplitAccExample/>
		<articleSplitPlAccExample/>
		<articleSplitIndefAccExample/>
		<articleSplitIndefPlAccExample/>
		<articleSplitGenExample/>
		<articleSplitPlGenExample/>
		<articleSplitIndefGenExample/>
		<articleSplitIndefPlGenExample/>
		<articleSplitErgExample/>
		<articleSplitPlErgExample/>
		<articleSplitIndefErgExample/>
		<articleSplitIndefPlErgExample/>
		<articleSplitAbsExample/>
		<articleSplitPlAbsExample/>
		<articleSplitIndefAbsExample/>
		<articleSplitIndefPlAbsExample/>
		<demErgProximalGenExample/>
		<demErgMedialGenExample/>
		<demErgDistalGenExample/>
		<demErgProximalPlGenExample/>
		<demErgMedialPlGenExample/>
		<demErgDistalPlGenExample/>     
		<demSplitProximalNomExample/>
		<demSplitMedialNomExample/>
		<demSplitDistalNomExample/>
		<demSplitProximalPlNomExample/>
		<demSplitMedialPlNomExample/>
		<demSplitDistalPlNomExample/>
		<demSplitProximalAccExample/>
		<demSplitMedialAccExample/>
		<demSplitDistalAccExample/>
		<demSplitProximalPlAccExample/>
		<demSplitMedialPlAccExample/>
		<demSplitDistalPlAccExample/>
		<demSplitProximalGenExample/>
		<demSplitMedialGenExample/>
		<demSplitDistalGenExample/>
		<demSplitProximalPlGenExample/>
		<demSplitMedialPlGenExample/>
		<demSplitDistalPlGenExample/>
		<demSplitProximalErgExample/>
		<demSplitMedialErgExample/>
		<demSplitDistalErgExample/>
		<demSplitProximalPlErgExample/>
		<demSplitMedialPlErgExample/>
		<demSplitDistalPlErgExample/>
		<demSplitProximalAbsExample/>
		<demSplitMedialAbsExample/>
		<demSplitDistalAbsExample/>
		<demSplitProximalPlAbsExample/>
		<demSplitMedialPlAbsExample/>
		<demSplitDistalPlAbsExample/>     
		<xsl:copy-of select="."/>
	</xsl:template>
	<!--
		pron:  add examples
	-->
	<xsl:template match="pron">
		<pron>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="pron"/>
			<demProximalErgGenExample/>
			<demMedialErgGenExample/>
			<demDistalErgGenExample/>
			<demProximalErgPlGenExample/>
			<demMedialErgPlGenExample/>
			<demDistalErgPlGenExample/>
			<demProximalSplitNomExample/>
			<demMedialSplitNomExample/>
			<demDistalSplitNomExample/>
			<demProximalSplitPlNomExample/>
			<demMedialSplitPlNomExample/>
			<demDistalSplitPlNomExample/>
			<demProximalSplitAccExample/>
			<demMedialSplitAccExample/>
			<demDistalSplitAccExample/>
			<demProximalSplitPlAccExample/>
			<demMedialSplitPlAccExample/>
			<demDistalSplitPlAccExample/>
			<demProximalSplitGenExample/>
			<demMedialSplitGenExample/>
			<demDistalSplitGenExample/>
			<demProximalSplitPlGenExample/>
			<demMedialSplitPlGenExample/>
			<demDistalSplitPlGenExample/>
			<demProximalSplitErgExample/>
			<demMedialSplitErgExample/>
			<demDistalSplitErgExample/>
			<demProximalSplitPlErgExample/>
			<demMedialSplitPlErgExample/>
			<demDistalSplitPlErgExample/>
			<demProximalSplitAbsExample/>
			<demMedialSplitAbsExample/>
			<demDistalSplitAbsExample/>
			<demProximalSplitPlAbsExample/>
			<demMedialSplitPlAbsExample/>
			<demDistalSplitPlAbsExample/>
		</pron>
	</xsl:template>
	<xsl:template match="*" mode="pron">
		<xsl:copy-of select="."/>
	</xsl:template>
	<!--
		ip:  add examples
	-->
	<xsl:template match="ip">
		<ip>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="ip"/>
		</ip>
	</xsl:template>
	<xsl:template match="*" mode="ip">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="firstErgativePerson" mode="ip">
		<xsl:copy-of select="."/>
		<firstAbsolutivePerson/>
	</xsl:template>
</xsl:stylesheet>
