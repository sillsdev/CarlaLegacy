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
		<col>
		  <xsl:element name="xsl:value-of">
			<xsl:attribute name="select"><xsl:text>//</xsl:text><xsl:value-of select="@exampleLoc"/></xsl:attribute>
		  </xsl:element>
		</col>
	  </xsl:when>
	  <xsl:when test="@show">
		<xsl:element name="xsl:if">
		  <xsl:attribute name="test"><xsl:call-template name="BuildCondition"><xsl:with-param name="prmCondition" select="@show"/></xsl:call-template></xsl:attribute>
		  <col>
			<xsl:apply-templates/>
		  </col>
		</xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
		<col>
		  <xsl:apply-templates/>
		</col>
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
	  <xsl:attribute name="class"><xsl:text>comment</xsl:text></xsl:attribute>
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
	<headerCol>
	  <xsl:apply-templates/>
	</headerCol>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
headerRowl template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//headerRow">
	<headerRow>
	  <xsl:apply-templates/>
	</headerRow>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
interlinear template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//interlinear">
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
		</xsl:element>
	  </xsl:element>
	  <xsl:element name="xsl:otherwise">
		<listInterlinear>
		  <xsl:element name="xsl:attribute">
			<xsl:attribute name="name"><xsl:text>letter</xsl:text></xsl:attribute>
			<xsl:element name="xsl:text">x</xsl:element>
			<xsl:value-of select="generate-id()"/>
		  </xsl:element>
		  <line>
			<langData>
			  <xsl:element name="xsl:attribute">
				<xsl:attribute name="name"><xsl:text>lang</xsl:text></xsl:attribute>
				<xsl:text>l</xsl:text>
				<xsl:element name="xsl:value-of">
				  <xsl:attribute name="select"><xsl:text>//language/langAbbr</xsl:text></xsl:attribute>
				</xsl:element>
			  </xsl:element>
			  <object class="comment">Enter an example here.</object>
			</langData>
		  </line>
		  <xsl:element name="xsl:call-template">
			<xsl:attribute name="name"><xsl:text>DoGlossAndFree</xsl:text></xsl:attribute>
		  </xsl:element>
		</listInterlinear>
	  </xsl:element>
	</xsl:element>
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
	<li>
	  <xsl:apply-templates/>
	</li>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ol template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//ol">
	<ol>
	  <xsl:apply-templates/>
	</ol>
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
	<row>
	  <xsl:apply-templates/>
	</row>
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
	<table>
	  <xsl:apply-templates/>
	</table>
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
	<ul>
	  <xsl:apply-templates/>
	</ul>
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
	  <xsl:if test="@num">
		<xsl:attribute name="num"><xsl:value-of select="@num"/></xsl:attribute>
	  </xsl:if>
	  <xsl:apply-templates/>
	</xsl:element>
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
</xsl:stylesheet>
<!--
================================================================
Revision History
- - - - - - - - - - - - - - - - - - -
26-Jul-2002      Andy Black  Began working on Initial Draft
================================================================
 -->
