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
  <xsl:variable name="sIdSeparator">.</xsl:variable>
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
caption template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//caption">
	<caption>
	  <xsl:apply-templates/>
	</caption>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
case template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//case">
	<xsl:element name="xsl:choose">
	  <xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
caseText template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//caseText">
	<xsl:element name="xsl:when">
	  <xsl:attribute name="test"><xsl:text>//</xsl:text><xsl:value-of select="../@element"/><xsl:text>/@</xsl:text><xsl:value-of select="../@attr"/><xsl:text>='</xsl:text><xsl:value-of select="@value"/><xsl:text>'</xsl:text></xsl:attribute>
	  <xsl:element name="xsl:text">
		<xsl:value-of select="."/>
	  </xsl:element>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
category template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//category">
	<xsl:element name="xsl:text">
	  <xsl:value-of select="."/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
col template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//col">
	<xsl:choose>
	  <xsl:when test="@exampleLoc">
		<td>
		  <table>
			<xsl:element name="xsl:variable">
			  <xsl:attribute name="name"><xsl:text>sExampleValue</xsl:text></xsl:attribute>
			  <xsl:element name="xsl:value-of">
				<xsl:attribute name="select"><xsl:choose><xsl:when test="ancestor::example"><!-- remove any periods the user may have entered;  the assumption here is that this goes in a chart where periods are not wanted --><xsl:value-of select="translate(., '.', '')"/><xsl:text>translate(string(//</xsl:text><xsl:value-of select="@exampleLoc"/><xsl:text>),'.','')</xsl:text></xsl:when><xsl:otherwise><xsl:text>//</xsl:text><xsl:value-of select="@exampleLoc"/></xsl:otherwise></xsl:choose></xsl:attribute>
			  </xsl:element>
			</xsl:element>
			<xsl:element name="xsl:variable">
			  <xsl:attribute name="name"><xsl:text>iExampleLength</xsl:text></xsl:attribute>
			  <xsl:attribute name="select"><xsl:text>string-length($sExampleValue)</xsl:text></xsl:attribute>
			</xsl:element>
			<xsl:element name="xsl:choose">
			  <xsl:element name="xsl:when">
				<xsl:attribute name="test"><xsl:text>$iExampleLength != 0</xsl:text></xsl:attribute>
				<xsl:element name="xsl:call-template">
				  <xsl:attribute name="name"><xsl:text>OutputColExamples</xsl:text></xsl:attribute>
				  <xsl:element name="xsl:with-param">
					<xsl:attribute name="name"><xsl:text>sExamples</xsl:text></xsl:attribute>
					<xsl:element name="xsl:value-of">
					  <xsl:attribute name="select"><xsl:text>$sExampleValue</xsl:text></xsl:attribute>
					</xsl:element>
				  </xsl:element>
				  <xsl:element name="xsl:with-param">
					<xsl:attribute name="name"><xsl:text>iLength</xsl:text></xsl:attribute>
					<xsl:element name="xsl:value-of">
					  <xsl:attribute name="select"><xsl:text>string-length($sExampleValue)</xsl:text></xsl:attribute>
					</xsl:element>
				  </xsl:element>
				</xsl:element>
			  </xsl:element>
			  <xsl:element name="xsl:otherwise">
				<tr>
				  <td>
					<langData>
					  <xsl:element name="xsl:attribute">
						<xsl:attribute name="name"><xsl:text>lang</xsl:text></xsl:attribute>
						<xsl:text>l</xsl:text>
						<xsl:element name="xsl:value-of">
						  <xsl:attribute name="select"><xsl:text>//language/langAbbr</xsl:text></xsl:attribute>
						</xsl:element>
					  </xsl:element>
					  <xsl:text>ENTER AN EXAMPLE HERE</xsl:text>
					</langData>
				  </td>
				</tr>
			  </xsl:element>
			</xsl:element>
		  </table>
		</td>
		<!-- old and incorrect
		<td>
		  <xsl:element name="xsl:value-of">
			<xsl:attribute name="select"><xsl:choose><xsl:when test="ancestor::example"> < ! - - remove any periods the user may have entered;  the assumption here is that this goes in a chart where periods are not wanted - - ><xsl:value-of select="translate(., '.', '')"/><xsl:text>translate(string(//</xsl:text><xsl:value-of select="@exampleLoc"/><xsl:text>),'.','')</xsl:text></xsl:when><xsl:otherwise><xsl:text>//</xsl:text><xsl:value-of select="@exampleLoc"/></xsl:otherwise></xsl:choose></xsl:attribute>
		  </xsl:element>
		</td>
		-->
	  </xsl:when>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <td>
			<xsl:apply-templates/>
		  </td>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<td>
		  <xsl:apply-templates/>
		</td>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
comment template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//comment">
	<xsl:element name="object">
	  <xsl:attribute name="type"><xsl:text>tComment</xsl:text></xsl:attribute>
	  <xsl:value-of select="."/>
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
example template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//example">
	<xsl:choose>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <xsl:call-template name="DoExample"/>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:call-template name="DoExample"/>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
exampleRef template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//exampleRef">
	<xsl:copy>
	  <xsl:for-each select="@*">
		<xsl:copy/>
	  </xsl:for-each>
	</xsl:copy>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
feature template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//feature">
	<xsl:element name="xsl:text">
	  <xsl:value-of select="."/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
headerCol template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//headerCol">
	<xsl:choose>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <xsl:call-template name="DoHeaderCol"/>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:call-template name="DoHeaderCol"/>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
headerRow template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//headerRow">
	<xsl:choose>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <xsl:call-template name="DoHeaderRow"/>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:call-template name="DoHeaderRow"/>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
img template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//img">
	<xsl:copy>
	  <xsl:for-each select="@*">
		<xsl:copy/>
	  </xsl:for-each>
	</xsl:copy>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
langData template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//langData">
	<langData>
	  <xsl:element name="xsl:attribute">
		<xsl:attribute name="name"><xsl:text>lang</xsl:text></xsl:attribute>
		<xsl:element name="xsl:text">
		  <xsl:text>lPAWSSKEnglish</xsl:text>
		</xsl:element>
	  </xsl:element>
	  <xsl:apply-templates/>
	</langData>
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
li template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//li">
	<xsl:choose>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <xsl:call-template name="DoLI"/>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:call-template name="DoLI"/>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ol template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//ol">
	<xsl:choose>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <xsl:call-template name="DoOL"/>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:call-template name="DoOL"/>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
p template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//p">
	<xsl:choose>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <xsl:call-template name="DoP"/>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:call-template name="DoP"/>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
row template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//row">
	<xsl:choose>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <xsl:call-template name="DoRow"/>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:call-template name="DoRow"/>
	  </xsl:otherwise>
	</xsl:choose>
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
section1/2/3/4/5/6 template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//section1 | //section2 | //section3 | //section4 | //section5 | //section6">
	<xsl:choose>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <xsl:call-template name="DoSection"/>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:call-template name="DoSection"/>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sectionRef template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//sectionRef">
	<xsl:copy>
	  <xsl:for-each select="@*">
		<xsl:copy/>
	  </xsl:for-each>
	</xsl:copy>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
table template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//table">
	<xsl:choose>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <xsl:call-template name="DoTable"/>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:call-template name="DoTable"/>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
text template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//text">
	<xsl:element name="xsl:if">
	  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
	  <xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ul template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//ul">
	<xsl:choose>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <xsl:call-template name="DoUL"/>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:call-template name="DoUL"/>
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
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoExample
	routine to create an example element
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoExample">
	<xsl:element name="example">
	  <xsl:variable name="sNum">
		<xsl:choose>
		  <xsl:when test="@num">
			<xsl:value-of select="@num"/>
		  </xsl:when>
		  <xsl:otherwise>
			<xsl:text>x</xsl:text>
			<xsl:value-of select="substring-after(ancestor::section1/@id,'s')"/>
			<xsl:call-template name="DoSubSectionId">
			  <xsl:with-param name="sSectionId" select="ancestor::section2/@id"/>
			</xsl:call-template>
			<xsl:call-template name="DoSubSectionId">
			  <xsl:with-param name="sSectionId" select="ancestor::section3/@id"/>
			</xsl:call-template>
			<xsl:call-template name="DoSubSectionId">
			  <xsl:with-param name="sSectionId" select="ancestor::section4/@id"/>
			</xsl:call-template>
			<xsl:call-template name="DoSubSectionId">
			  <xsl:with-param name="sSectionId" select="ancestor::section5/@id"/>
			</xsl:call-template>
			<xsl:call-template name="DoSubSectionId">
			  <xsl:with-param name="sSectionId" select="ancestor::section6/@id"/>
			</xsl:call-template>
			<xsl:value-of select="$sIdSeparator"/>
			<xsl:value-of select="position()"/>
		  </xsl:otherwise>
		</xsl:choose>
	  </xsl:variable>
	  <xsl:attribute name="num"><xsl:value-of select="$sNum"/></xsl:attribute>
	  <xsl:call-template name="DoInterlinear">
		<xsl:with-param name="sExNum">
		  <xsl:value-of select="$sNum"/>
		</xsl:with-param>
	  </xsl:call-template>
	  <xsl:apply-templates select="table"/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoHeaderCol
	routine to create a headerCol element
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoHeaderCol">
	<th>
	  <xsl:apply-templates/>
	</th>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoHeaderRow
	routine to create a headerRow element
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoHeaderRow">
	<tr>
	  <xsl:apply-templates/>
	</tr>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoInterlinear
	routine to create an interlinear element
		Parameters: sExNum = example number of parent example element
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoInterlinear">
	<xsl:param name="sExNum"/>
	<xsl:for-each select="interlinear">
	  <xsl:element name="xsl:variable">
		<xsl:attribute name="name"><xsl:text>iExampleLength</xsl:text></xsl:attribute>
		<xsl:attribute name="select"><xsl:text>string-length(//</xsl:text><xsl:value-of select="@exampleLoc"/><xsl:text>)</xsl:text></xsl:attribute>
	  </xsl:element>
	  <xsl:element name="xsl:choose">
		<xsl:element name="xsl:when">
		  <xsl:attribute name="test"><xsl:text>$iExampleLength != 0</xsl:text></xsl:attribute>
		  <xsl:element name="xsl:call-template">
			<xsl:attribute name="name"><xsl:text>OutputInterlinearExamples</xsl:text></xsl:attribute>
			<xsl:element name="xsl:with-param">
			  <xsl:attribute name="name"><xsl:text>sExamples</xsl:text></xsl:attribute>
			  <xsl:element name="xsl:value-of">
				<xsl:attribute name="select"><xsl:text>//</xsl:text><xsl:value-of select="@exampleLoc"/></xsl:attribute>
			  </xsl:element>
			</xsl:element>
			<xsl:element name="xsl:with-param">
			  <xsl:attribute name="name"><xsl:text>iLength</xsl:text></xsl:attribute>
			  <xsl:element name="xsl:value-of">
				<xsl:attribute name="select"><xsl:text>string-length(//</xsl:text><xsl:value-of select="@exampleLoc"/><xsl:text>)</xsl:text></xsl:attribute>
			  </xsl:element>
			</xsl:element>
			<xsl:element name="xsl:with-param">
			  <xsl:attribute name="name"><xsl:text>sExNumber</xsl:text></xsl:attribute>
			  <xsl:value-of select="$sExNum"/>
			</xsl:element>
			<xsl:element name="xsl:with-param">
			  <xsl:attribute name="name"><xsl:text>sLetterList</xsl:text></xsl:attribute>
			  <xsl:element name="xsl:value-of">
				<xsl:attribute name="select"><xsl:text>$sMasterLetterList</xsl:text></xsl:attribute>
			  </xsl:element>
			</xsl:element>
		  </xsl:element>
		</xsl:element>
		<xsl:element name="xsl:otherwise">
		  <listInterlinear>
			<xsl:element name="xsl:attribute">
			  <xsl:attribute name="name"><xsl:text>letter</xsl:text></xsl:attribute>
			  <xsl:element name="xsl:text">
				<xsl:value-of select="$sExNum"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="position()"/>
			  </xsl:element>
			</xsl:element>
			<lineGroup>
			  <line>
				<langData>
				  <xsl:element name="xsl:attribute">
					<xsl:attribute name="name"><xsl:text>lang</xsl:text></xsl:attribute>
					<xsl:text>l</xsl:text>
					<xsl:element name="xsl:value-of">
					  <xsl:attribute name="select"><xsl:text>//language/langAbbr</xsl:text></xsl:attribute>
					</xsl:element>
				  </xsl:element>
					  <xsl:text>ENTER AN EXAMPLE HERE</xsl:text>
				</langData>
			  </line>
			  <xsl:element name="xsl:call-template">
				<xsl:attribute name="name"><xsl:text>DoGloss</xsl:text></xsl:attribute>
			  </xsl:element>
			</lineGroup>
			<xsl:element name="xsl:call-template">
			  <xsl:attribute name="name"><xsl:text>DoFree</xsl:text></xsl:attribute>
			</xsl:element>
		  </listInterlinear>
		</xsl:element>
	  </xsl:element>
	</xsl:for-each>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoLI
	routine to create an li element
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoLI">
	<li>
	  <xsl:apply-templates/>
	</li>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoOL
	routine to create an ol element
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoOL">
	<ol>
	  <xsl:apply-templates/>
	</ol>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoP
	routine to create a p element
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoP">
	<p>
	  <xsl:apply-templates select="*"/>
	</p>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoRow
	routine to create a row element
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoRow">
	<tr>
	  <xsl:apply-templates/>
	</tr>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoSection
	routine to create a section element
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoSection">
	<xsl:element name="{name()}">
	  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  <xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoSubSectionId
	routine to create part of a an example id based on a subsection id
		Parameters: sSectionId: the id of a subsection
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoSubSectionId">
	<xsl:param name="sSectionId"/>
	<xsl:if test="string-length($sSectionId) > 1">
	  <xsl:value-of select="$sIdSeparator"/>
	  <xsl:value-of select="substring-after($sSectionId, 's')"/>
	</xsl:if>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoTable
	routine to create a table element
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoTable">
	<table>
	  <xsl:for-each select="@border | @class">
		<xsl:copy/>
	  </xsl:for-each>
	  <xsl:apply-templates/>
	</table>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DoUL
	routine to create a ul element
		Parameters: none
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="DoUL">
	<ul>
	  <xsl:apply-templates/>
	</ul>
  </xsl:template>
</xsl:stylesheet>
<!--
================================================================
Revision History
- - - - - - - - - - - - - - - - - - -
20-Apr-2006  Andy Black  Make changes for XLingPap version 1.9.0; pave way for use iwth XMLmind
08-Oct-2002  Andy Black  Make changes for XLingPap version 1.4.1
02-Aug-2002  Andy Black  Add img; rework example ids to be unique
31-Jul-2002    Andy Black  Many refinements.
26-Jul-2002    Andy Black  Began working on Initial Draft
================================================================
 -->
