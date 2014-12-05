<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="coord">
  <section1 id="sCoord">
  	<secTitle>Constructions coordonnées</secTitle>
	<p contentType="ctComparativeIntro">
<xsl:text>Cette section commence avec des constructions de coordination simples, où il y a une conjonction visible entre les conjoints. Ceci comprend la coordination au niveau de la phrase et au niveau du syntagme verbal, du syntagme nominal, du syntagme </xsl:text>
<xsl:choose>
			<xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
		 <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
		 <xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
		 <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
		</xsl:choose>
<xsl:text> et du syntagme adjectival. Ensuite on traitera, au niveau du syntagme nominal seulement, les listes et les constructions appositives. </xsl:text>
</p>

  	<p contentType="ctComparativeIntro">
<xsl:text>En français, les conjonctions utilisées entre deux conjoints sont </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>et</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ou</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mais</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>et/ou</langData>
<xsl:text>.  En plus il y a d’autres constructions de coordination qui ont besoin d’une conjonction initiale, comme </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ou...ou</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ni...ni</langData>
<xsl:text>.  Certaines langues utilisent aussi un mot qui veut dire </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>avec</langData>
<xsl:text> comme conjonction entre syntagmes nominaux.
</xsl:text>
</p>
     <p contentType="ctPracticalIntro">
<xsl:text>On donne des exemples de la coordination de phrases, de syntagmes verbaux, de syntagmes nominaux, de syntagmes </xsl:text>
<xsl:choose>
     		<xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
           <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
           <xsl:when test="//pp/@pPos='both'">adpositionnels</xsl:when>
           <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
     	</xsl:choose>
<xsl:text> et de syntagmes adjectivaux. Ensuite on décrit les listes et les constructions  appositives. </xsl:text>
</p>
     
     <p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> on utilise les conjonctions suivantes entre deux conjoints:</xsl:text>
</p>
			<example num="xCoord.12">
<table border="1">
					<tr>
						<th>Morphèmes</th>
						<th>Glose</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//coord/and),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>et</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
							<xsl:text>et</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//coord/andThen),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.0" select="string-length(normalize-space($sExampleValue1.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.0 != 0 and $sExampleValue1.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>et puis</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
							<xsl:text>et puis</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//coord/or),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.0" select="string-length(normalize-space($sExampleValue2.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.0 != 0 and $sExampleValue2.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>ou</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
							<xsl:text>ou</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//coord/andOr),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.0" select="string-length(normalize-space($sExampleValue3.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.0 != 0 and $sExampleValue3.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>et/ou</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
							<xsl:text>et/ou</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue4.0">
<xsl:value-of select="translate(string(//coord/but),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.0" select="string-length(normalize-space($sExampleValue4.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.0 != 0 and $sExampleValue4.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>mais</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
							<xsl:text>mais</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue5.0">
<xsl:value-of select="translate(string(//coord/with),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.0" select="string-length(normalize-space($sExampleValue5.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.0 != 0 and $sExampleValue5.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>avec</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
							<xsl:text>avec</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue6.0">
<xsl:value-of select="translate(string(//coord/other),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.0" select="string-length(normalize-space($sExampleValue6.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.0 != 0 and $sExampleValue6.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>autres</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
							<xsl:text>autres</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> on utilise les conjonctions suivantes dans une construction de type </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ou...ou</langData>
<xsl:text> ou </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ni...ni</langData>
<xsl:text>:</xsl:text>
</p>
			<example num="xCoord.16">
<table border="1">
					<tr>
						<th>Morphèmes</th>
						<th>Glose</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//coord/either),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>ou (partie initiale)</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
							<xsl:text>ou (partie initiale)</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				   <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//coord/eitherOr),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.0" select="string-length(normalize-space($sExampleValue1.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.0 != 0 and $sExampleValue1.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
				      	<xsl:text>ou (deuxième partie)</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
				      	<xsl:text>ou (deuxième partie)</xsl:text>
				      </td>
</tr>
</xsl:otherwise>
</xsl:choose>
				   <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//coord/neither),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.0" select="string-length(normalize-space($sExampleValue2.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.0 != 0 and $sExampleValue2.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>ni (partie initiale)</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
							<xsl:text>ni (partie initiale)</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				   <xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//coord/nor),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.0" select="string-length(normalize-space($sExampleValue3.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.0 != 0 and $sExampleValue3.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
					  	<xsl:text>ni (deuxième partie)</xsl:text>
					  </td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
					  	<xsl:text>ni (deuxième partie)</xsl:text>
					  </td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>

	 <p>
<xsl:text></xsl:text>
<xsl:choose>
	 	<xsl:when test="//coord/@conjWord='yes'">Toutes les conjonctions ci-dessus sont écrites comme des mots indépendants entre les conjoints.</xsl:when>
	 	<xsl:when test="//coord/@conjWord='some'">Quelques-unes de ces conjonctions sont écrites comme ces mots indépendants entre les conjoints, mais d’autres s’attachent </xsl:when>
	 	<xsl:when test="//coord/@conjWord='no'">Toutes les conjonctions s’attachent </xsl:when>
	 </xsl:choose>
<xsl:if test="normalize-space(//coord/@conjWord)!='yes'">
	 	<xsl:if test="normalize-space(//coord/proclitic/@checked)='yes' and normalize-space(//coord/enclitic/@checked)='no'">
<xsl:text>au début du deuxième conjoint comme des proclitiques</xsl:text>
</xsl:if>
	 	<xsl:if test="normalize-space(//coord/proclitic/@checked)='no' and normalize-space(//coord/enclitic/@checked)='yes'">
<xsl:text>à la fin du premier conjoint comme enclitiques</xsl:text>
</xsl:if>
	 	<xsl:if test="normalize-space(//coord/proclitic/@checked)='yes' and normalize-space(//coord/enclitic/@checked)='yes'">
<xsl:text>ou bien au début du deuxième conjoint comme des clitiques</xsl:text>
</xsl:if>
	    <xsl:if test="normalize-space(//coord/attachesOther/@checked)='no'">
<xsl:text>. </xsl:text>
</xsl:if>
	 	<xsl:if test="normalize-space(//coord/proclitic/@checked)='no' and normalize-space(//coord/enclitic/@checked)='no' and normalize-space(//coord/attachesOther/@checked)='yes'">
<xsl:text>à ___</xsl:text>
<xsl:value-of select="//coord/attachesOther" />
<xsl:text>. </xsl:text>
</xsl:if>
	 	<xsl:if test="normalize-space(//coord/proclitic/@checked)='yes' and normalize-space(//coord/attachesOther/@checked)='yes' or normalize-space(//coord/enclitic/@checked)='yes' and normalize-space(//coord/attachesOther/@checked)='yes'">
<xsl:text> et peuvent aussi s’attacher à ___</xsl:text>
<xsl:value-of select="//coord/attachesOther" />
<xsl:text>. </xsl:text>
</xsl:if>
	 </xsl:if>
<xsl:if test="normalize-space(//coord/@noConj)='yes'">
<xsl:text>  Outre ces conjonctions, deux éléments peuvent se joindre sans aucune conjonction, au moins au niveau du syntagme nominal et de la phrase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//coord/@noConj)='no'">
<xsl:text>  Lorsque seulement deux éléments se joignent, une des conjonctions ci-dessus doit être présente.</xsl:text>
</xsl:if>
</p>

	 <section2 id="sCoordLevels">
	 	<secTitle>Les niveaux de coordination</secTitle>

	 	<p>
<xsl:text>Dans les sections qui suivent on présente les différents niveaux de coordination.</xsl:text>
</p>
		<section3 id="sCoordSentence">
			<secTitle>Coordination de phrases</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>En général, la coordination se pratique entre des catégories pareilles. Au niveau de la phrase, ceci veut dire que deux phrases déclaratives peuvent se joindre, comme suit: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jean est allé au bureau ce matin et il vient de rentrer</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ou je viendrai à la soirée ou j’enverrai ma sœur</langData>
<xsl:text>, ou deux questions, comme suit: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>A quelle heure le courrier est-il arrivé et où est mon colis?</langData>
<xsl:text>  Lorsqu’on utilise la conjonction de contraste </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mais</langData>
<xsl:text>, un des conjoints doit être au négatif, comme suit: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jean est allé au bureau ce matin mais il n’est pas revenu</langData>
<xsl:text>.</xsl:text>
</p>
		   <p contentType="ctPracticalIntro">
<xsl:text>En général, la coordination existe entre catégories pareilles. Pour les phrases ceci veut dire que deux phrases déclaratives, ou bien deux questions, peuvent être conjointes. Lorsqu’on utilise la conjonction de contraste </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mais</langData>
<xsl:text>, un des conjoints doit être au négatif. </xsl:text>
</p>
		   <p>
<xsl:text>Voici quelques exemples de la coordination de deux phrases en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordSentence.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/sentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/sentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/sentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/sentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordSentence.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordSentence.10.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Voici quelques exemples de la coordination séquentielle entre deux phrases:</xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordSentence.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/sentSeqExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/sentSeqExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/sentSeqExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/sentSeqExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordSentence.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordSentence.14.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Regardez la section </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text> pour des exemples de mots et propositions d’introduction quelquefois appelés coordination, ainsi que des exemples de propositions adverbiales, appelées subordination.</xsl:text>
</p>
</section3>
		<section3 id="sCoordVP">
			<secTitle>Coordination de syntagmes verbaux</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>La coordination de syntagmes verbaux consiste de deux syntagmes verbaux qui partagent un même sujet. Voici quelques exemples en français qui ont des syntagmes verbaux de coordination: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Guillaume a fait une course et a gagné le prix</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Je viendrai à la soirée ou j’enverrai ma soeur</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Je ne viendrai à la soirée ni n’enverrai ma soeur</langData>
<xsl:text>.</xsl:text>
</p>
		   <p contentType="ctPracticalIntro">
<xsl:text>La coordination de syntagmes verbaux consiste de deux syntagmes verbaux qui partagent un même sujet.</xsl:text>
</p>
		   <p>
<xsl:text>Voici des exemples de la coordination de syntagmes verbaux en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordVP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/vpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/vpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/vpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/vpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordVP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordVP.10.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</section3>
		<section3 id="sCoordDP">
			<secTitle>Coordination de syntagmes nominaux</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Normalement, les syntagmes nominaux coordonnés se présentent comme sujets, objets, objets indirects, et objets d’une </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">préposition</xsl:when>
			      <xsl:when test="//pp/@pPos='after'">postposition</xsl:when>
			      <xsl:when test="//pp/@pPos='both'">adposition</xsl:when>
			      <xsl:when test="//pp/@pPos='unknown'">adposition</xsl:when>
				</xsl:choose>
<xsl:text>, tout comme pour un syntagme nominal normal. Voici des exemples en français qui comprennent la coordination de syntagmes nominaux: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Guillaume a couru dans le Marathon à Boston et aux Jeux Olympiques</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ma soeur ou moi serons là</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ni ta soeur ni mon frère seront là</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Je viendrai à la répétition mais pas au dîner</langData>
<xsl:text>. </xsl:text>
</p>
		   <p contentType="ctPracticalIntro">
<xsl:text>Normalement, les syntagmes nominaux coordonnés se présentent comme sujets, objets, objets indirects, et objets d’une </xsl:text>
<xsl:choose>
		   		<xsl:when test="//pp/@pPos='before'">préposition</xsl:when>
		   		<xsl:when test="//pp/@pPos='after'">postposition</xsl:when>
		   		<xsl:when test="//pp/@pPos='both'">adposition</xsl:when>
		   		<xsl:when test="//pp/@pPos='unknown'">adposition</xsl:when>
		   	</xsl:choose>
<xsl:text>, tout comme pour un syntagme nominal normal.</xsl:text>
</p>
		   <p>
<xsl:text>Voici des exemples de la coordination de syntagmes nominaux en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordDP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/dpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/dpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/dpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/dpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordDP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordDP.10.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</section3>
	  <section3 id="sCoordPP">
		  <secTitle>
		  <xsl:choose>
		  	<xsl:when test="//pp/@pPos='before'">Coordination de syntagmes prépositionnels</xsl:when>
		  	<xsl:when test="//pp/@pPos='after'">Coordination de syntagmes postpositionnels</xsl:when>
		  	<xsl:when test="//pp/@pPos='both'">Coordination de syntagmes adpositionnels</xsl:when>
		  	<xsl:when test="//pp/@pPos='unknown'">Coordination de syntagmes adpositionnels</xsl:when>
			</xsl:choose>
</secTitle>
		  <p contentType="ctComparativeIntro">
<xsl:text>Normalement il est possible d’avoir les syntagmes </xsl:text>
<xsl:choose>
		     	<xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
				<xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
				<xsl:when test="//pp/@pPos='both'">adpositionnels</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
			 </xsl:choose>
<xsl:text> de coordination dans toutes les positions occupées par un syntagme </xsl:text>
<xsl:choose>
		     	<xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
		        <xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
		        <xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
		        <xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
		     </xsl:choose>
<xsl:text> normal. Voici des exemples en français de phrases qui comprennent des syntagmes prépositionnels de coordination: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Guillaume a couru à travers la forêt et à travers le pont</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Je viendrai avec toi à la répétition mais pas chez toi</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Je viendrai aux noces et/ou à la réception</langData>
<xsl:text>.</xsl:text>
</p>
	     <p contentType="ctPracticalIntro">
<xsl:text>Normalement il est possible d’avoir les syntagmes </xsl:text>
<xsl:choose>
	     		<xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
	     		<xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
	     		<xsl:when test="//pp/@pPos='both'">adpositionnels</xsl:when>
	     		<xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
	     	</xsl:choose>
<xsl:text> de coordination dans toutes les positions occupées par un syntagme </xsl:text>
<xsl:choose>
	     		<xsl:when test="//pp/@pPos='before'">prépositionnel</xsl:when>
	     		<xsl:when test="//pp/@pPos='after'">postpositionnel</xsl:when>
	     		<xsl:when test="//pp/@pPos='both'">adpositionnel</xsl:when>
	     		<xsl:when test="//pp/@pPos='unknown'">adpositionnel</xsl:when>
	     	</xsl:choose>
<xsl:text> normal.</xsl:text>
</p>
	     <p>
<xsl:text>Voici des exemples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de coordination de syntagmes </xsl:text>
<xsl:choose>
			  	<xsl:when test="//pp/@pPos='before'">prépositionnels</xsl:when>
				  <xsl:when test="//pp/@pPos='after'">postpositionnels</xsl:when>
			  	<xsl:when test="//pp/@pPos='both'">prépositionnels ou postpositionnels</xsl:when>
				  <xsl:when test="//pp/@pPos='unknown'">adpositionnels</xsl:when>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
		  <example num="xCoord.CoordLevels.CoordPP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/coordppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/coordppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/coordppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/coordppExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordPP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordPP.10.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
	  </section3>
	  <section3 id="sCoordAdj">
	  	<secTitle>Coordination de syntagmes adjectivaux</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Finalement, les adjectifs ou les syntagmes adjectivaux peuvent normalement être coordinés, et lorsqu’ils modifient un nom, comme suit: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Le chien noir et blanc est à mon fils</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ma soeur veut une bougie rouge vif ou bleu clair</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Cela paraît être une plaie terriblement douloureuse et très dangereuse sur ta jambe</langData>
<xsl:text>, et lorsqu’ils servent d’adjectif  prédicatif dans une phrase copulative, comme suit: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>La plaie sur ta jambe est terriblement douloureuse et très dangereuse</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Cette étoffe est très lisse et soyeuse</langData>
<xsl:text>.</xsl:text>
</p>
	     <p contentType="ctPracticalIntro">
<xsl:text>Finalement, les adjectifs ou les syntagmes adjectivaux peuvent normalement être coordonnés, et lorsqu’ils modifient un nom et lorsqu’ils servent d’adjectif  prédicatif dans une phrase copulative.</xsl:text>
</p>
	     <p>
<xsl:text>Voici des exemples en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de coordination de syntagmes adjectivaux:</xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordAdj.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/adjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/adjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/adjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/adjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordAdj.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordAdj.10.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
	  </section3>
	 </section2>
	 <section2 id="sCoordList">
		<secTitle>Listes</secTitle>
	 	<p contentType="ctComparativeIntro">
<xsl:text>Les listes comprennent trois éléments conjoints (ou plus) qui forment un seul syntagme nominal. Les éléments initiaux sont séparés normalement par des virgules, et il y a une conjonction distincte avant l’élément final, quoique d’autres possibilités existent. Voici des exemples en français de syntagmes nominaux sous forme de listes: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Jean, Guillaume, Susanne et Marie]</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Jean, Guillaume, Susanne et/ou Marie]</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Jean et Guillaume ou Susanne et Marie]</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[un chat, deux chiens et un poulet, mais pas un singe]</langData>
<xsl:text>.</xsl:text>
</p>
	 	<p contentType="ctPracticalIntro">
<xsl:text>Les listes comprennent trois éléments conjoints (ou plus) qui forment un seul syntagme nominal. Les éléments initiaux sont séparés normalement par des virgules, et il y a une conjonction distincte avant l’élément final, quoique d’autres possibilités existent. </xsl:text>
</p>
	    
		<p>
<xsl:text>Voici des exemples de listes en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> dans un syntagme nominal:</xsl:text>
</p>
		<example num="xCoord.CoordList.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/listExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/listExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/listExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/listExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordList.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordList.10.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
	 </section2>


	 <section2 id="sCoordAppositive">
		<secTitle>Appositifs</secTitle>
	 	<p contentType="ctComparativeIntro">
<xsl:text>Les appositifs aussi forment un seul syntagme nominal. Les appositifs consistent normalement d’un nom suivi d’une virgule, ensuite une description suivie d’une virgule; l’ordre peut être inversé. Voici quelques exemples en français: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[George Washington, le premier président des Etats Unis]</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Mon frère, Jacques]</langData>
<xsl:text>.</xsl:text>
</p>
	 	<p contentType="ctPracticalIntro">
<xsl:text>Les appositifs aussi forment un seul syntagme nominal. Les appositifs consistent normalement d’un nom suivi d’une virgule, ensuite une description suivie d’une virgule; l’ordre peut être inversé.</xsl:text>
</p>
	    <p>
<xsl:text>Voici des exemples d’appositifs en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> dans un syntagme nominal:</xsl:text>
</p>
		<example num="xCoord.CoordAppositive.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/appositiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/appositiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/appositiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/appositiveExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordAppositive.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordAppositive.10.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</line>
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
	 </section2>


  </section1>


   
	  
   
   
	  
   
   
	  
   

      
         
         
         
         
   
      
      
      
     
   
      
      
      
     
   
      
     
   
      
      
      
         
         
        
   
      
      
      
      
      
      
      
     
   
</xsl:template>
</xsl:stylesheet>
