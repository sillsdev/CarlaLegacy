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
	<xsl:element name="example">
	  <xsl:if test="@num">
		<xsl:attribute name="num"><xsl:value-of select="@num"/></xsl:attribute>
	  </xsl:if>
	  <xsl:apply-templates/>
	</xsl:element>
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
			<xsl:element name="xsl:value-of">
			  <xsl:attribute name="select"><xsl:text>generate-id()</xsl:text></xsl:attribute>
			</xsl:element>
		  </xsl:element>
		  <line>
			<langData>
			  <xsl:element name="xsl:attribute">
				<xsl:attribute name="name"><xsl:text>lang</xsl:text></xsl:attribute>
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
p template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//p">
	<p>
	  <xsl:apply-templates select="*"/>
	</p>
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
section2 template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//section2">
	<xsl:element name="section2">
	  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  <xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
section3 template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//section3">
	<xsl:element name="section3">
	  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  <xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
section4 template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//section4">
	<xsl:element name="section4">
	  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  <xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
section5 template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//section5">
	<xsl:element name="section5">
	  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  <xsl:apply-templates/>
	</xsl:element>
  </xsl:template>
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
section6 template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template match="//section6">
	<xsl:element name="section6">
	  <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	  <xsl:apply-templates/>
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
  <!--
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
OutputExamples
	routine to create examples recursively
		Parameters: sExamles: text of examples
							 iLength: length of example text
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-->
  <xsl:template name="OutputExamples">
	<xsl:param name="sExamples"/>
	<xsl:param name="iLength"/>
	<xsl:if test="string-length($sExamples) > 1">
	  <xsl:variable name="sLine" select="substring-before($sExamples, '&#x0a;')"/>
	  <listSingle>
		<xsl:attribute name="letter"><xsl:value-of select="generate-id()"/>_<xsl:value-of select="$iLength"/></xsl:attribute>
		<langData>
		  <xsl:attribute name="lang"><xsl:value-of select="$prmLangCode"/></xsl:attribute>
		  <xsl:value-of select="$sLine"/>
		</langData>
	  </listSingle>
	  <xsl:call-template name="OutputExamples">
		<xsl:with-param name="sExamples">
		  <xsl:value-of select="substring-after($sExamples,'&#x0a;')"/>
		</xsl:with-param>
		<xsl:with-param name="iLength">
		  <xsl:value-of select="string-length(substring-after($sExamples,'&#x0a;'))"/>
		</xsl:with-param>
	  </xsl:call-template>
	</xsl:if>
  </xsl:template>
</xsl:stylesheet>
<!--
================================================================
Revision History
- - - - - - - - - - - - - - - - - - -
26-Jul-2002      Andy Black  Began working on Initial Draft
================================================================
 -->
