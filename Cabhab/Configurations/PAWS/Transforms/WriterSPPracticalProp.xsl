<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="prop">
	<section1 id="sProp">
		<secTitle>Los nombres propios</secTitle>
		<p>
<xsl:text>Los nombres propios son una clase especial de sustantivos o frases que sintácticamente actúan igual que otros sustantivos o frases nominales. En español, algunos nombres propios pueden presentarse solos, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Susana</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Oaxaca</langData>
<xsl:text>.  Otros actúan como sustantivos compuestos, tales como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>George Washington</langData>
<xsl:text>.  Los nombres propios pueden también contener los artículos y/o frases </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='both'">preposicionales y/o posposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">preposicionales y/o posposicionales</xsl:when>
			</xsl:choose>
<xsl:text>, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>los Estados Unidos de América</langData>
<xsl:text>.  Muchos idiomas requieren un artículo antes de un nombre. También se presentan los apositivos.  En algunos casos aparecen con un poseedor, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mi hijo, David</langData>
<xsl:text>.  Además, los nombres propios se pueden modificar con los adjetivos y cláusulas relativas, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>México fuerte y orgulloso</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la Susana que conozco</langData>
<xsl:text>.</xsl:text>
</p>
		<p>
<xsl:text>Algunos ejemplos de nombres propios simples y compuestos, o los que se presentan con artículos, demonstratives, adjetivos y/o los poseedores en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son los siguientes:</xsl:text>
</p>
		<example num="xProp.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//prop/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//prop/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//prop/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//prop/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xProp.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xProp.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
		<p>
<xsl:text>Algunos ejemplos de nombres propios con frases </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='both'">preposicionales y/o posposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">preposicionales y/o posposicionales</xsl:when>
			</xsl:choose>
<xsl:text> en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son los siguientes:</xsl:text>
</p>
		<example num="xProp.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//prop/ppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//prop/ppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//prop/ppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//prop/ppExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xProp.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xProp.12.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
		<p>
<xsl:text>Algunos ejemplos de los nombres propios modificados con las cláusulas relativas en oraciones completas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son los siguientes:</xsl:text>
</p>
		<example num="xProp.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//prop/relClExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//prop/relClExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//prop/relClExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//prop/relClExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xProp.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xProp.16.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
	</section1>
</xsl:template>
</xsl:stylesheet>
