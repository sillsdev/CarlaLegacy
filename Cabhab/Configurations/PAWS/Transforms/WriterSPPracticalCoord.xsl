<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="coord">
  <section1 id="sCoord">
	  <secTitle>Las construcciones coordinativas</secTitle>
	<p>
<xsl:text>Esta sección empieza con las construcciones coordinativas básicas donde una conjunción se presenta entre dos oraciones conjuntivas. Esta incluye la coordinación a nivel de la oración y de la frase de verbo, la frase nominal, la frase </xsl:text>
<xsl:choose>
		   <xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
		   <xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
		   <xsl:when test="//pp/@pPos='both'">preposicional y posposicional</xsl:when>
		   <xsl:when test="//pp/@pPos='unknown'">preposicional y/o posposicional</xsl:when>
		</xsl:choose>
<xsl:text> y la frase adjetival.  Entonces, para el nivel de la frase nominal solamente, los elementos consecutivos  y aposiciones serán descritas. Finalmente, las construcciones comparativas que consisten en oraciones completas serán discutidas. (Los comparativos más cortos fueron analizados en la sección </xsl:text>
<sectionRef sec="sIPComparatives" />
<xsl:text>.)</xsl:text>
</p>

	  <p>
<xsl:text>En español, las conjunciones que se pueden utilizar entre dos oraciones conjuntivas son </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>y</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>o</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pero</langData>
<xsl:text> e </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>y/o</langData>
<xsl:text>.  Además, hay las construcciones coordinativas que requieren una conjunción inicial, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>o...o</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ni...ni</langData>
<xsl:text> construcciones. Algunas lenguas también utilizan una palabra que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>con</langData>
<xsl:text> al igual que una conjunción entre las frases nominales. </xsl:text>
</p>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> hay las conjunciones siguientes que se utilizan entre las oraciones conjuntivas:</xsl:text>
</p>
			<example num="xCoord.10">
<table border="1">
					<tr>
						<th>
							<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
						</th>
						<th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//coord/and),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>y</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
							<xsl:text>y</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//coord/or),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length(normalize-space($sExampleValue1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1 != 0 and $sExampleValue1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>o</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
							<xsl:text>o</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//coord/andOr),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length(normalize-space($sExampleValue2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2 != 0 and $sExampleValue2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>y/o</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
							<xsl:text>y/o</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//coord/but),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3" select="string-length(normalize-space($sExampleValue3))" />
<xsl:choose>
<xsl:when test="$iExampleLength3 != 0 and $sExampleValue3 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>pero</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
							<xsl:text>pero</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue4">
<xsl:value-of select="translate(string(//coord/with),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4" select="string-length(normalize-space($sExampleValue4))" />
<xsl:choose>
<xsl:when test="$iExampleLength4 != 0 and $sExampleValue4 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>con</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
							<xsl:text>con</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue5">
<xsl:value-of select="translate(string(//coord/other),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5" select="string-length(normalize-space($sExampleValue5))" />
<xsl:choose>
<xsl:when test="$iExampleLength5 != 0 and $sExampleValue5 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>otros (si hay)</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
							<xsl:text>otros (si hay)</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> hay las conjunciones siguientes que se utilizan solamente en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>o...o</langData>
<xsl:text> u </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ni...ni</langData>
<xsl:text> construcciones:</xsl:text>
</p>
			<example num="xCoord.14">
<table border="1">
					<tr>
						<th>
							<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
						</th>
						<th>Glosa</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//coord/either),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>o (cualquiera)</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
							<xsl:text>o (cualquiera)</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//coord/neither),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length(normalize-space($sExampleValue1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1 != 0 and $sExampleValue1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>ni (ningunos) - elemento inicial</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
							<xsl:text>ni (ningunos) - elemento inicial</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				   <xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//coord/nor),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length(normalize-space($sExampleValue2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2 != 0 and $sExampleValue2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
						 <xsl:text>ni - elemento medial</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
						 <xsl:text>ni - elemento medial</xsl:text>
					  </td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>

	 <p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:choose>
		<xsl:when test="//coord/@conjWord='yes'">todas las conjunciones antedichas se escriben como palabras independientes entre las oraciones conjuntivas.</xsl:when>
		<xsl:when test="//coord/@conjWord='some'">algunas de las conjunciones antedichas se escriben como palabras independientes entre las oraciones conjuntivas, pero otras se unen </xsl:when>
		<xsl:when test="//coord/@conjWord='no'">todas las conjunciones antedichas se unen </xsl:when>
	 </xsl:choose>
<xsl:if test="normalize-space(//coord/@conjWord)!='yes'">
<xsl:choose>
		   <xsl:when test="//coord/@conjPos='before'">al principio de la segunda oración conjuntiva. </xsl:when>
		   <xsl:when test="//coord/@conjPos='after'">al final de la primera oración conjuntiva. </xsl:when>
		   <xsl:when test="//coord/@conjPos='either'">al final de la primera oración conjuntiva o al principio de la segunda oración conjuntiva, según lo indicado por los guiones en los cuadros arriba. </xsl:when>
		   <xsl:when test="//coord/@conjPos='other'">como proclíticos o enclíticos, según lo indicado por los guiones en los cuadros arriba, a un cierto lugar dentro de la construcción coordinativa con excepción del final de la primera oración conjuntiva o del principio de la segunda oración conjuntiva.</xsl:when>
		</xsl:choose>
</xsl:if>
</p>
	 <xsl:if test="normalize-space(//coord/@noConj)='yes'">
<p>
<xsl:text>Además de usar estas conjunciones, dos elementos pueden también ser coordinativas sin ninguna conjunción entre ellas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, al menos en los niveles de la frase nominal y la oración.</xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//coord/@noConj)='no'">
<p>
<xsl:text>Cuando solamente dos elementos se unen en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, una de las conjunciones antedichas debe presentarse.</xsl:text>
</p>
</xsl:if>


	 <section2 id="sCoordLevels">
		<secTitle>Niveles de coordinación</secTitle>

		<p>
<xsl:text>Ejemplos para los varios niveles de coordinación se presentan en las secciones siguientes.</xsl:text>
</p>
		<section3 id="sCoordSentence">
			<secTitle>Coordinación a nivel de la oración</secTitle>
		   <p>
<xsl:text>En general, la coordinación está entre categorías similares. Para la coordinación a nivel de la oración, esto significa que dos oraciones declarativas pueden ser coordinativas, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan fue a la oficina esta mañana y él acaba de volver</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>O vendré a la fiesta o enviaré a mi hermana</langData>
<xsl:text>, o dos preguntas, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Cuándo vino el correo y dónde está mi paquete?</langData>
<xsl:text>  Cuando la conjunción significa </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘pero’</xsl:text>
</gloss>
<xsl:text>, una de las oraciones conjuntivas debe ser negativa, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan fue a la oficina esta mañana pero él no volvió</langData>
<xsl:text>.</xsl:text>
</p>

			<p>
<xsl:text> Algunos ejemplos de la coordinación a nivel de la oración en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son: </xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordSentence.8">
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
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordSentence.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordSentence.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text> para considerar los ejemplos de palabras o cláusulas de introducción, designadas a veces al igual que coordinación, y los ejemplos de las cláusulas adverbiales, que son subordinación.</xsl:text>
</p>
</section3>
		<section3 id="sCoordVP">
			<secTitle>Coordinación de la frase de verbo</secTitle>
		   <p>
<xsl:text>La coordinación de la frase de verbo implica dos frases de verbo completas que compartan un solo sujeto. La coordinación de la frase de verbo se ejemplifica en las oraciones en español siguientes: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Guillermo corrió la carrera y ganó el premio</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Susana irá a la fiesta o enviará a su hermana</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Susana ni irá a la fiesta ni enviará a su hermana</langData>
<xsl:text>.</xsl:text>
</p>

			<p>
<xsl:text> Algunos ejemplos de la coordinación de la frase de verbo en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son: </xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordVP.8">
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
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordVP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordVP.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
			<secTitle>Coordinación de la frase nominal</secTitle>
		<p>
<xsl:text>Las frases nominales coordinadas generalmente pueden presentarse en todas las posiciones donde una frase nominal normal puede presentarse, por ejemplo sujetos, objetos, objetos indirectos y objetos de </xsl:text>
<xsl:choose>
				 <xsl:when test="//pp/@pPos='before'">preposiciones</xsl:when>
				 <xsl:when test="//pp/@pPos='after'">posposiciones</xsl:when>
				 <xsl:when test="//pp/@pPos='both'">preposiciones y posposiciones</xsl:when>
				 <xsl:when test="//pp/@pPos='unknown'">preposiciones y/o posposiciones</xsl:when>
			  </xsl:choose>
<xsl:text>. La coordinación de la frase nominal se ejemplifica en las oraciones en español siguientes: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Guillermo corrió en el maratón de Boston y las Olimpiadas</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mi hermana o yo estará allí</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ni su hermana ni mi hermano estará allí</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Vendré al ensayo pero no a la cena</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Vendré a la boda y/o la recepción</langData>
<xsl:text>.</xsl:text>
</p>

			<p>
<xsl:text>Algunos ejemplos de la coordinación de la frase nominal en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son: </xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordDP.8">
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
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordDP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordDP.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
				<xsl:when test="//pp/@pPos='before'">Coordinación de la frase preposicional</xsl:when>
				<xsl:when test="//pp/@pPos='after'">Coordinación de la frase posposcional</xsl:when>
				<xsl:when test="//pp/@pPos='both'">Coordinación de la frase preposicional y/o posposcional</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">Coordinación de la frase preposicional y/o posposcional</xsl:when>
			</xsl:choose>
			</secTitle>
		 <p>
<xsl:text>Normalmente sea posible para frases </xsl:text>
<xsl:choose>
			   <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
			   <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
			   <xsl:when test="//pp/@pPos='both'">preposicionales o posposicionales</xsl:when>
			   <xsl:when test="//pp/@pPos='unknown'">preposicionales o posposicionales</xsl:when>
			</xsl:choose>
<xsl:text> coordinativas presentarse en todas las posiciones en que una frase de este tipo puede presentarse.  Algunos ejemplos en español de la coordinación de la frase preposicional son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Guillermo corrió a través del bosque y sobre el puente</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Vendré con usted al ensayo pero no a su hogar</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Vendré o a la boda o a la recepción</langData>
<xsl:text>.</xsl:text>
</p>
		  <p>
<xsl:text>Algunos ejemplos de la coordinación de las frases </xsl:text>
<xsl:choose>
				  <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
				  <xsl:when test="//pp/@pPos='after'">posposctionales</xsl:when>
				  <xsl:when test="//pp/@pPos='both'">preposicionales o posposicionales</xsl:when>
				  <xsl:when test="//pp/@pPos='unknown'">preposicionales o posposicionales</xsl:when>
</xsl:choose>
<xsl:text> en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
		  <example num="xCoord.CoordLevels.CoordPP.8">
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
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordPP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordPP.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
			<secTitle>Coordinación de la frase adjetival</secTitle>
		   <p>
<xsl:text>Finalmente, los adjetivos o frases adjetivales usualmente pueden ser coordinativas, cuando modifican un sustantivo, por ejemplo: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El perro blanco y negro pertenece a mi hijo</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mi hermana quiere una vela roja o azul</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ese parece un dolor terriblemente doloroso y muy peligroso en su pierna</langData>
<xsl:text>, y también cuando actúan como el adjetivo predicativo en una oración copulativo, como en: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El lesión en su pierna es muy feo y doloroso y peligroso</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Este material siente muy liso y sedoso</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Algunos ejemplos de la coordinación del adjetivo o la frase adjetival en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son: </xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordAdj.8">
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
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordAdj.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordAdj.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
		<secTitle>Elementos consecutivos</secTitle>
		<p>
<xsl:text>Los elementos consecutivos consisten en tres o más artículos que están coordinados para formar una sola frase nominal. Los elementos iniciales son separados normalmente por comas y una conjunción se presenta antes del elemento final en la lista, aunque existen diversas posibilidades. Algunos ejemplos en español de frases nominales con elementos consecutivos son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Juan, Guillermo, Susana y María]</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Juan, Guillermo, Susana y/o María]</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Juan y Guillermo o Susana y María]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[un gato, dos perros y un pollo pero no un mono]</langData>
<xsl:text>.</xsl:text>
</p>

		<p>
<xsl:text>Algunos ejemplos de elementos consecutivos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
		<example num="xCoord.CoordList.8">
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
<xsl:with-param name="sExNumber">xCoord.CoordList.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordList.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
		<secTitle>Aposiciones</secTitle>
		<p>
<xsl:text>Las aposiciones también forman una sola frase nominal.  Las aposiciones consisten normalmente en un nombre seguido por una coma y entonces una descripción también seguida por una coma o el orden puede ser invertido. Algunos ejemplos en español son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[George Washington, el primer Presidente de los Estados Unidos,]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Mi hermano, Jaime,]</langData>
<xsl:text>.</xsl:text>
</p>
		<p>
<xsl:text>Algunos ejemplos de frases nominales que contienen aposiciones en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
		<example num="xCoord.CoordAppositive.8">
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
<xsl:with-param name="sExNumber">xCoord.CoordAppositive.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordAppositive.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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

	 <section2 id="sCoordComparative">
		<secTitle>Comparativos</secTitle>
		<p>
<xsl:text>Esta sección considera los comparativos que tienen dos oraciones alrededor de la palabra comparativa, aunque en la segunda oración puede faltar el adjetivo. Cubrimos ya los comparativos que son un subtipo de oraciones copulativas en la sección  </xsl:text>
<sectionRef sec="sIPComparatives" />
<xsl:text>.
		   Como los comparativos más cortos, éstos comparan las calidades o las acciones de los sujetos de las oraciones y pueden tener un verbo copulativo o un verbo de percepción o un verbo de acción, junto con un adjetivo que sea modificado por una palabra o un afijo de grado. Algunos ejemplos en inglés son:
		</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John is more handsome than Bill is</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan es más hermoso que Guillermo’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue runs much faster than Mary can run</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Susana corre mucho más rápido de lo que María puede correr’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David appears lots taller than Michael does</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘David parece mucho más alto que Miguel’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mary looks prettier than Julie looks</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘María se ve mucho más bonita que Julia’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John seems more certain of his answers than Sue seems</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan parece más seguro de sus respuestas que Susana’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
		<p>
<xsl:text>Algunas lenguas no permiten que ninguna parte de la segunda oración sea omitida, más bien aparecen dos oraciones completas, las cuales van a ser comparadas. También, algunas lenguas que no tienen una palabra comparativa independiente que significa </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘than (que)’</xsl:text>
</gloss>
<xsl:text> en las construcciones comparativas más cortas, simplemente tendrá las dos partes de la oración seguida una de la otra en esta construcción.
		</xsl:text>
</p>
		<p>
<xsl:text>En estas construcciones comparativas más completas, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
		   <xsl:when test="//coord/@gap='yes'"> permite que el adjetivo falte en la segunda parte,como en los ejemplos de español y inglés. </xsl:when>
		   <xsl:when test="//coord/@gap='no'"> require que la oración completa se repite después del comparativo. </xsl:when>
		</xsl:choose>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
			  <xsl:when test="//ip/@comparative='yes'"> hay una palabra comparativa que significa ‘que’ que utiliza en ambos los comparativos cortos y más completos, como muestra en el cuadro suguiente.</xsl:when>
			  <xsl:when test="//ip/@comparative='no'"> no hay una palabra comparativa que significa ‘que’, entonces este tipo de comparativo simplemente tendrá las dos partes de la oración seguida una de la otra.</xsl:when>
		   </xsl:choose>
</p>

		<xsl:if test="normalize-space(//ip/@comparative)='yes'">
<example num="xCoord.CoordComparative.10">
<table border="1">
			  <tr>
				 <th>Palabra Comparativa</th>
				 <th>Glosa</th>
			  </tr>
			  <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/comparativeWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>que</xsl:text>
</gloss>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>que</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		   </table>
</example>
</xsl:if>

		<p>
<xsl:text>Algunos ejemplos de las construcciones comparativas más completas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
</p>
		<example num="xCoord.CoordComparative.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/comparativeSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/comparativeSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/comparativeSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/comparativeSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordComparative.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordComparative.14.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
