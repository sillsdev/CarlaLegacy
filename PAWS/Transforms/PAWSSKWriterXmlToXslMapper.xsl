<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!--
================================================================
Convert writer description xml file portion to an xslt to help perform the creation of an
 XLINGPAP xml file based on PAWS answers xml file
  Input:    xml file conforming to PAWSSKWriterDescription.dtd and parameter telling which type this is
  Output: XSL file
================================================================
Revision History is at the end of this file.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Preamble
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:param name="prmType">x</xsl:param>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Main template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="/">
	<!-- output header info -->
	<xsl:element name="xsl:stylesheet">
	  <xsl:attribute name="version">1.0</xsl:attribute>
	  <xsl:element name="xsl:template">
		<xsl:attribute name="match">/</xsl:attribute>
		<xsl:attribute name="mode"><xsl:value-of select="$prmType"/></xsl:attribute>
		<xsl:apply-templates/>
	  </xsl:element>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
content template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//content">
	<xsl:element name="xsl:text">
	  <xsl:value-of select="."/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
section1 template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//section1">
	<xsl:element name="section1">
	  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  <xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
secTitle template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//secTitle">
	<xsl:element name="secTitle">
	  <xsl:value-of select="."/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
p template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//p">
	<xsl:apply-templates select="*"/>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
langName template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//langName">
	<xsl:element name="xsl:value-of">
	  <xsl:attribute name="select"><xsl:text>//language/langName</xsl:text></xsl:attribute>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
comment template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//comment">
	<xsl:element name="object">
	<xsl:attribute name="class"><xsl:text>comment</xsl:text></xsl:attribute>
	  <xsl:value-of select="."/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
BuildCondition
	routine to create a test Expression
		Parameters: prmCondition: IDREF to a showWhen
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="BuildCondition">
	<xsl:param name="prmCondition"/>
	<xsl:for-each select="//showWhen[@id=$prmCondition]">
	  <xsl:for-each select="./*">
		<xsl:choose>
		  <xsl:when test="name()='whenValue'">
			<xsl:text>//</xsl:text>
			<xsl:value-of select="@element"/>
			<xsl:if test="@attr">
			  <xsl:text>/@</xsl:text>
			  <xsl:value-of select="@attr"/>
			</xsl:if>
			<xsl:if test="@negateValue='yes'">
			  <xsl:text>!</xsl:text>
			</xsl:if>
			<xsl:text>='</xsl:text>
			<xsl:value-of select="@value"/>
			<xsl:text>'</xsl:text>
		  </xsl:when>
		  <xsl:when test="name()='and'"> and </xsl:when>
		  <xsl:when test="name()='or'"> or </xsl:when>
		  <xsl:when test="name()='useShowWhen'">
			<xsl:call-template name="BuildCondition">
			  <xsl:with-param name="prmCondition" select="@show"/>
			</xsl:call-template>
		  </xsl:when>
		</xsl:choose>
	  </xsl:for-each>
	</xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
<!--
================================================================
Revision History
- - - - - - - - - - - - - - - - - - -
26-Jul-2002      Andy Black  Began working on Initial Draft
================================================================
 -->
