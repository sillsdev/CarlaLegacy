<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <!--
================================================================
Convert master grammar rule xml file to an xslt to perform the creation of a
 PC-PATR grammar file based on PAWS answers xml file
  Input:    xml file conforming to GrammarGenerator.dtd
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
	  <!-- not here now      <xsl:element name="xsl:output">
		<xsl:attribute name="method">xml</xsl:attribute>
		<xsl:attribute name="version">1.0</xsl:attribute>
		<xsl:attribute name="encoding">UTF-8</xsl:attribute>
		<xsl:attribute name="indent">yes</xsl:attribute>
	  </xsl:element> -->
	  <xsl:element name="xsl:template">
		<xsl:attribute name="match">/</xsl:attribute>
		<xsl:attribute name="mode"><xsl:value-of select="$prmType"/></xsl:attribute>
		<!-- do not include initial comments here; these are now in the main transform
		<xsl:element name="xsl:text">|-PC-PATR Grammar file for PAWS Starter Kit - starter3.doc
|- C Black    May 2001

|- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
|-Phrase structure rules
</xsl:element>
-->
		<xsl:apply-templates/>
	  </xsl:element>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
catMapper template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//catMapper">
	<xsl:element name="xsl:if">
	  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
Let <xsl:for-each select="id(@show)/whenValue">
		<xsl:element name="xsl:value-of">
		  <xsl:attribute name="select"><xsl:value-of select="./@element"/></xsl:attribute>
		</xsl:element>
	  </xsl:for-each> be [<xsl:value-of select="."/>]</xsl:element>
	<xsl:text/>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
generalized templates template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//generalizedTemplates">
	<xsl:element name="xsl:text">
	  <xsl:value-of select="."/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
rule template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//rule">
	<xsl:choose>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <xsl:element name="xsl:text">
			<xsl:value-of select="."/>
		  </xsl:element>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:element name="xsl:text">
		  <xsl:value-of select="."/>
		</xsl:element>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
specialized templates template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//specializedTemplates">
  <xsl:choose>
	<xsl:when test="@show!=''">
	<xsl:element name="xsl:if">
	  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
	  <xsl:element name="xsl:text">
		<xsl:value-of select="."/>
	  </xsl:element>
	</xsl:element>
	</xsl:when>
<xsl:otherwise>
	  <xsl:element name="xsl:text">
		<xsl:value-of select="."/>
	  </xsl:element>
</xsl:otherwise>
  </xsl:choose>
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
25-Apr-2002      Andy Black  Began working on Initial Draft
================================================================
 -->
