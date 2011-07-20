<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="adjp">
	<section1 id="sAdjP">
		<secTitle>Los Adjetivos</secTitle>
		<p>
<xsl:text>Esta sección considera adjetivos cualitativos, los números y otros cuantificadores, artículos, y demonstratives. Las posiciones permitieron cada uno de estos elementos dentro de la frase nominal serán cubridas en la sección </xsl:text>
<sectionRef sec="sNP" />
<xsl:text>.
</xsl:text>
</p>
  <section2 id="sAdjQual">
	  <secTitle>Los adjetivos cualitativos</secTitle>
	  <p>
<xsl:text>Los adjetivos cualitativos ellos mismos pueden ser modificados. Algunos ejemplos españoles son:
		  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>muy grande</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>verdaderamente azul</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>extremadamente grande</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>muy bien construida</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>muy fácilmente olvidado</langData>
<xsl:text>.  No todas las combinaciones de palabras suceden debido a la semántica y a otras consideraciones, pero en general parece que ciertas palabras del grado y adverbios de la manera o frases del adverbio de la manera pueden modificar adjetivos. </xsl:text>
</p>
	  <xsl:if test="normalize-space(//adjp/@modifiers)='no'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no permite que ningunas palabras del grado o adverbios de la manera modifiquen adjetivos. </xsl:text>
</p>
</xsl:if>
	  <xsl:if test="normalize-space(//adjp/@modifiers)='yes'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> permite que ciertas palabras del grado modifiquen adjetivos, pero los adverbios de la manera no pueden. Las palabras del grado ocurren </xsl:text>
<xsl:choose>
			  <xsl:when test="//adjp/@degreePos='before'">antes</xsl:when>
			  <xsl:when test="//adjp/@degreePos='after'">después</xsl:when>
			  <xsl:when test="//adjp/@degreePos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
			  <xsl:when test="//adjp/@degreePos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@degreePos='beforeOrBoth'">antes o en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@degreePos='afterOrBoth'">después o en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@degreePos='both'">en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@degreePos='unknown'">_______</xsl:when>
		  </xsl:choose>
<xsl:text> del adjetivo.  </xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesDegree' and normalize-space(//adjp/@degreeEither)='unrestricted' and normalize-space(//adjp/@degreePos)!='before' and normalize-space(//adjp/@degreePos)!='after'">
			  <xsl:text>Todas las palabras del grado pueden ocurrir de cualquier lado del adjetivo.</xsl:text>
		  </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesDegree' and normalize-space(//adjp/@degreeEither)='restricted' and normalize-space(//adjp/@degreePos)!='before' and normalize-space(//adjp/@degreePos)!='after'">
			  <xsl:text>Hay restricciones en cuanto a las cuales palabras de grado puede ocurrir en cada lado del adjetivo.</xsl:text>
		  </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
	  <xsl:if test="normalize-space(//adjp/@modifiers)='yesManner'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> permite que ciertas palabras del grado y los adverbios de la manera modifiquen adjetivos. Estos modificantes ocurren </xsl:text>
<xsl:choose>
			  <xsl:when test="//adjp/@mannerPos='before'">antes</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='after'">después</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='afterOrBoth'">después o en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='both'">en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='unknown'">_______</xsl:when>
		  </xsl:choose>
<xsl:text> del adjetivo.  </xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerEither)='unrestricted' and normalize-space(//adjp/@mannerPos)!='before' and normalize-space(//adjp/@mannerPos)!='after'">
			  <xsl:text>Todas las palabras del grado y adverbios de la manera pueden ocurrir de cualquier lado del adjetivo. </xsl:text>
		  </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerEither)='restricted' and normalize-space(//adjp/@mannerPos)!='before' and normalize-space(//adjp/@mannerPos)!='after'">
			  <xsl:text>Hay restricciones en cuanto a las cuales palabras de grado y los cuales adverbios de la manera puede ocurrir en cada lado del adjetivo.</xsl:text>
		  </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
	  <p>
<xsl:text>Los ejemplos de adjetivos o de frases del adjetivo en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen:
		  </xsl:text>
</p>
	  <example num="xAdjP.AdjQual.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//adjp/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//adjp/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//adjp/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//adjp/example)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQual.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQual.14.1</xsl:text>
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
  </section2>

			<section2 id="sAdjNumbers">
				<secTitle>Los números</secTitle>
				<p>
<xsl:text>Los números no se pueden modificar por las palabras del grado como la poder de los cuantificadores, aunque ocurren en la misma posición. Los números cardinales se pueden, sin embargo, modificar por números ordinales y por </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>próximo</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>último</langData>
<xsl:text>, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>los primeros veinte muchachos</langData>
<xsl:text> o
					</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>los cientos años próximos</langData>
<xsl:text>.  Los números ordinales y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>próximo</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>último</langData>
<xsl:text> pueden también modificar sustantivos directamente, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la tercera muchacha</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el último muchacho</langData>
<xsl:text>.  </xsl:text>
</p>
				<section3 id="sQPNumbersCardinal">
					<secTitle>Los números cardinales</secTitle>
					<p>
<xsl:text>Las formas básicas para los números cardinales se dan en el cuadro siguiente:</xsl:text>
</p>
					<example num="xAdjP.AdjNumbers.QPNumbersCardinal.6">
<table border="1">
							 <tr>
								<th>Cuenta</th>
								 <th>Números cardinales</th>
								<th>Significado</th>
							 </tr>
							<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//qp/cardinalNumbers1to10),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>1 a 10</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>1 a 10</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
							<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers11to20),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>11 a 20</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>11 a 20</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
							<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//qp/cardinalNumbers30to100),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>30 a 100 (por diez)</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>30 a 100 (por diez)</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
						</table>
</example>
					<p>
<xsl:text>Números cardinales más grandes pueden ser los compuestos que se pueden escribir como palabras separadas, tales como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cientos treinta y tres</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cuatro mil y tres</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>seis mil cientos treinta y tres</langData>
<xsl:text>.
							Los ejemplos de números compuestos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
</p>
					<example num="xAdjP.AdjNumbers.QPNumbersCardinal.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/cardinalCompoundExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//qp/cardinalCompoundExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/cardinalCompoundExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/cardinalCompoundExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjNumbers.QPNumbersCardinal.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjNumbers.QPNumbersCardinal.10.1</xsl:text>
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
<xsl:text>De acuerdo con la posición del número de unidad y de cualquier conjunción, los números cardinales se dirijen </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
							<xsl:when test="//qp/@cardinalHead='before'">a la izquierda-</xsl:when>
							<xsl:when test="//qp/@cardinalHead='after'">al derecho</xsl:when>
						</xsl:choose>
<xsl:text>.
						</xsl:text>
</p>
				</section3>
				<section3 id="sQPNumbersOrdinal">
					<secTitle>Los números ordinales</secTitle>
					<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los números ordinales </xsl:text>
<xsl:choose>
							<xsl:when test="//qp/@ordinalFormation='affix'">son formados agregando un afijo al número cardinal.</xsl:when>
							<xsl:when test="//qp/@ordinalFormation='independent'">son todas palabras sintácticas independientes, distintas de los números cardinales.</xsl:when>
							<xsl:when test="//qp/@ordinalFormation='both'">pueden ser formados agregando un afijo al número cardinal, pero algunas formas son palabras sintácticas independientes.</xsl:when>
						</xsl:choose>
<xsl:text>  Los primeros diez números ordinales son:</xsl:text>
</p>
					<example num="xAdjP.AdjNumbers.QPNumbersOrdinal.6">
<table border="1">
							<tr>
								<th>Cuenta</th>
								<th>Números ordinales</th>
								<th>Significado</th>
							</tr>
							<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//qp/ordinalNumbers),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>primero a décimo</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
<xsl:text>primero a décimo</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
						</table>
</example>
					<p>
<xsl:text>Cuando los números ordinales en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> modifican un número cardinal, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>los primeros veinte muchachos</langData>
<xsl:text>, ocurren </xsl:text>
<xsl:choose>
							<xsl:when test="//qp/@ordinalPos='before'">antes</xsl:when>
							<xsl:when test="//qp/@ordinalPos='after'">después</xsl:when>
							<xsl:when test="//qp/@ordinalPos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
							<xsl:when test="//qp/@ordinalPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
							<xsl:when test="//qp/@ordinalPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
							<xsl:when test="//qp/@ordinalPos='afterOrBoth'">después o en ambos lados</xsl:when>
							<xsl:when test="//qp/@ordinalPos='both'">en ambos lados</xsl:when>
							<xsl:when test="//qp/@ordinalPos='unknown'">_______</xsl:when>
						</xsl:choose>
<xsl:text> del número cardinal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@ordinalEitherRestricted)='unrestricted' and normalize-space(//qp/@ordinalPos)!='before' and normalize-space(//qp/@ordinalPos)!='after' and normalize-space(//qp/@ordinalPos)!='unknown'">
							<xsl:text>Todos los números ordinales pueden ocurrir de cualquier lado del número cardinal.</xsl:text>
						</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@ordinalEitherRestricted)='restricted' and normalize-space(//qp/@ordinalPos)!='before' and normalize-space(//qp/@ordinalPos)!='after'">
							<xsl:text>Hay restricciones en cuanto a las cuales de los números ordinales puede ocurrir en cada lado del número cardinal.</xsl:text>
						</xsl:if>
<xsl:text></xsl:text>
</p>
					<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ejemplos del uso de números ordinales y de los modificantes que significan </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'el último'</xsl:text>
</gloss>
<xsl:text> o </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'el próximo'</xsl:text>
</gloss>
<xsl:text> dentro de una frase nominal incluyen: </xsl:text>
</p>
					<example num="xAdjP.AdjNumbers.QPNumbersOrdinal.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/ordinalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//qp/ordinalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/ordinalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/ordinalExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjNumbers.QPNumbersOrdinal.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjNumbers.QPNumbersOrdinal.12.1</xsl:text>
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
			</section3>

		</section2>

		<section2 id="sAdjQP">
			<secTitle>Los cuantificadores</secTitle>
		 <p>
<xsl:text>Los cuantificadores pueden aparecer en varios lugares en una frase nominal. La mayoría de las idiomas tienen tres sistemas de cuantificadores además de números:</xsl:text>
</p>
		 <ul>
			 <li>
				 <xsl:text>ésos que significan </xsl:text>
				 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
				 <xsl:text> o </xsl:text>
				 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
				 <xsl:text>, que modifican la frase nominal del conjunto,</xsl:text>
			 </li>
			 <li>
				 <xsl:text>cuantificadores tales como  </xsl:text>
				 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>alguno</langData>
				 <xsl:text> o </xsl:text>
				 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ninguno</langData>
				 <xsl:text>, que no ocurren con ningunos otros modificadores excepto adjetivos,</xsl:text>
			 </li>
			 <li>
				 <xsl:text>y otros cuantificadores tales como </xsl:text>
				 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>muchos</langData>
				 <xsl:text>
					 o </xsl:text>
				 <langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pocos.</langData>
			 </li>
		 </ul>
		 <p>
<xsl:text>Cada tipo será considerado en turno.
			 </xsl:text>
</p>
		 <section3 id="sQPAll">
			 <secTitle>Los cuantificadores que modifican la frase del nominal del conjunto</secTitle>
			<p>
<xsl:text>Los cuantificadores que significan </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> parecen ser una categoría propia.
					Ocurren generalmente primero (o último) en una frase nominal, en una posición distinta de los otros cuantificadores pero en el mismo lugar que las palabras del grado como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>apenas</langData>
<xsl:text> (que pueden también actuar como marcadores del foco, para ser discutido en la sección </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text>) y las palabras que significan iguales que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>casi</langData>
<xsl:text> (que pueden también ocurrir con </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
<xsl:text>), así que les referiremos como palabras especiales del grado. Estas palabras modifican la frase nominal del conjunto, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos los cinco niños</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente los tres niños de Susana</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>casi todos los niños jovenes de Juan</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>apenas este grupo de niños</langData>
<xsl:text>.  Observe que</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> puede ocurrir en lugar de o antes de las otras palabras especiales de grado, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no los niños</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no todos los cinco niños</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no apenas estos muchos niños</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no solamente los tres niños de Susana</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> utiliza el siguiente para expresar estas nociones:</xsl:text>
</p>
			<example num="xAdjP.AdjQP.QPAll.8">
<table border="1">
					<tr>
						<th>
							<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
						</th>
						<th>Significado</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//qp/all),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
							<xsl:text>todos</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
							<xsl:text>todos</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//qp/almost),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
							<xsl:text>casi</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
							<xsl:text>casi</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//qp/only),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length($sExampleValue2)" />
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
							<xsl:text>solamente o apenas</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
							<xsl:text>solamente o apenas</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:if test="normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//qp/not),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3" select="string-length($sExampleValue3)" />
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
							<xsl:text>no</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
							<xsl:text>no</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				</table>
</example>
			<xsl:if test="normalize-space(//qp/@npDegree)='no'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, éstos no se expresan como palabras separadas. En lugar, todos juntan a otra palabra en la frase nominal. Los elementos especiales positivos del grado son </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePosType='proclitic'">procliticos que juntan al frente de cualquiera palabra que comienza la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='enclitic'">encliticos que juntan al final de cualquiera palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='clitic'">clíticos que juntan al frente de cualquiera palabra que comienza la frase nominal o al final de cualquiera palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='prefix'">prefijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='suffix'">sufijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='affix'">prefijos o sufijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
				</xsl:choose>
<xsl:text>  Los elementos especiales negativos del grado son  </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreeNegType='proclitic'">procliticos que juntan al frente de cualquiera palabra que comienza la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='enclitic'">encliticos que juntan al final de cualquiera palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='clitic'">cliticos que juntan al frente de cualquiera palabra que comienza la frase nominal o al final de cualquiera palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='prefix'">prefijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='suffix'">sufijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='affix'">prefijos o sufijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ejemplos de la frases nominales positivas incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='noPosOnly'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los elementos especiales positivos del grado no se expresan como palabras separadas. En lugar, todos juntan a otra palabra en la frase nominal como </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePosType='proclitic'">procliticos que juntan al frente de cualquiera palabra que comienza la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='enclitic'">encliticos que juntan al final de cualquiera palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='clitic'">cliticos que juntan al frente de cualquiera palabra que comienza la frase nominal o al final de cualquiera palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='prefix'">prefijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='suffix'">sufijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='affix'">prefijos o sufijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
				</xsl:choose>
<xsl:text>No hay ninguna manera en la lengua de expresar el significado de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'no'</xsl:text>
</gloss>
<xsl:text>cuando está modificando una frase nominal del conjunto, sin embargo.   </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ejemplos de la frases nominales positivas incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yesPos'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los elementos especiales positivos del grado se expresan como palabras separadas que modifiquen la frase del nominal del conjunto. Ocurren </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePos='before'">antes</xsl:when>
					<xsl:when test="//qp/@npDegreePos='after'">después</xsl:when>
					<xsl:when test="//qp/@npDegreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">antes on en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='afterOrBoth'">después o en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='both'">en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del resto de la frase nominal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeEitherRestricted)='unrestricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
					<xsl:text>Todas estas palabras pueden ocurrir de cualquier lado de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeEitherRestricted)='restricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
					<xsl:text>Hay restricciones en cuanto a las cuales de estas palabras puede ocurrir en cada lado de la frase nominal.  </xsl:text>
				</xsl:if>
<xsl:text>Los elementos especiales negativos del grado, sin embargo, no se expresan como palabras separadas. En lugar, ellos juntan a otra palabra en la frase nominal. Estos elementos especiales negativos del grado son </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreeNegType='proclitic'">procliticos que juntan al frente de cualquiera palabra que comienza la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='enclitic'">encliticos que juntan al final de cualquiera palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='clitic'">cliticos que juntan al frente de cualquiera palabra que comienza la frase nominal o al final de cualquiera palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='prefix'">prefijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='suffix'">sufijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='affix'">prefijos o sufijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ejemplos de la frases nominales positivas incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yesPosOnly'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los elementos especiales positivos del grado se expresan como palabras separadas que modifiquen la frase del nominal del conjunto. Ocurren </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePos='before'">antes</xsl:when>
					<xsl:when test="//qp/@npDegreePos='after'">después</xsl:when>
					<xsl:when test="//qp/@npDegreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">antes on en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='afterOrBoth'">después o en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='both'">en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del resto de la frase nominal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeEitherRestricted)='unrestricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
					<xsl:text>Todas estas palabras pueden ocurrir de cualquier lado de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeEitherRestricted)='restricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
					<xsl:text>Hay restricciones en cuanto a las cuales de estas palabras puede ocurrir en cada lado de la frase nominal.  </xsl:text>
				</xsl:if>
<xsl:text>No hay ninguna manera en la lengua de expresar el significado de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'no'</xsl:text>
</gloss>
<xsl:text>cuando está modificando una frase nominal del conjunto, sin embargo.  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ejemplos de la frases nominales positivas incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yesNeg'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los elementos especiales positivos del grado no se expresan como palabras separadas. En lugar, todos juntan a otra palabra en la frase nominal como  </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePosType='proclitic'">procliticos que juntan al frente de cualquiera palabra que comienza la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='enclitic'">encliticos que juntan al final de cualquiera palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='clitic'">cliticos que juntan al frente de cualquiera palabra que comienza la frase nominal o al final de cualquiera palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='prefix'">prefijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='suffix'">sufijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='affix'">prefijos o sufijos que juntan al sustantivo principal de la frase nominal.</xsl:when>
				</xsl:choose>
<xsl:text>  Los elementos especiales negativos del grado en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, sin embargo, se expresan como palabras separadas que modifiquen la frase del nominal del conjunto. Ocurren </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePos='before'">antes</xsl:when>
					<xsl:when test="//qp/@npDegreePos='after'">después</xsl:when>
					<xsl:when test="//qp/@npDegreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">antes on en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='afterOrBoth'">después o en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='both'">en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del resto de la frase nominal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeEitherRestricted)='unrestricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
					<xsl:text>Todas estas palabras pueden ocurrir de cualquier lado de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeEitherRestricted)='restricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
					<xsl:text>Hay restricciones en cuanto a las cuales de estas palabras puede ocurrir en cada lado de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ejemplos de la frases nominales positivas incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes'">
<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, éstos se expresan como palabras separadas que modifiquen la frase del nominal del conjunto. Ocurren </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePos='before'">antes</xsl:when>
					<xsl:when test="//qp/@npDegreePos='after'">después</xsl:when>
					<xsl:when test="//qp/@npDegreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">antes on en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='afterOrBoth'">después o en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='both'">en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreePos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> delresto de la frase nominal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeEitherRestricted)='unrestricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
					<xsl:text>Todas estas palabras pueden ocurrir de cualquier lado de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeEitherRestricted)='restricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
					<xsl:text>Hay estricciones en cuanto a las cuales de estas palabras puede ocurrir en cada lado de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ejemplos de la frases nominales positivas incluyen:</xsl:text>
</p>
</xsl:if>
			<example num="xAdjP.AdjQP.QPAll.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//qp/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/example)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.22.1</xsl:text>
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
			<xsl:if test="normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> los ejemplos nominales negativos de la frase que no incluyen los elementos especiales positivos del grado son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<example num="xAdjP.AdjQP.QPAll.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/negExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//qp/negExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/negExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/negExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.26.1</xsl:text>
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
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='no'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no permite que las palabras que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> ocurrir con las palabras especiales positivas del grado en una sola frase nominal.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> permite que las palabras que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> ocurrir con las palabras especiales positivas del grado en una sola frase nominal.  Las palabras especiales negativas del grado ocurren </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreeNegPos='before'">antes</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='after'">después</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='beforeOrBoth'">antes on en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='afterOrBoth'">después o en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='both'">en ambos lados</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> el resto de la frase nominal (incluyendo las palabras especiales positivas del grado).  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegEitherRestricted)='unrestricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
					<xsl:text>Todas estas palabras negativas pueden ocurrir de cualquier lado de la frase nominal.  </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegEitherRestricted)='restricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
					<xsl:text>Hay restricciones en cuanto a las cuales de estas palabras negativas puede ocurrir en cada lado de la frase nominal.  </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ejemplos de las frases nominales negativos que incluyen las palabras especiales positivas del grado son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' or normalize-space(//qp/@npDegree)!='yes' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ejemplos de las frases nominales negativos que incluyen las palabras especiales positivas del grado son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' or normalize-space(//qp/@npDegree)!='yes' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<example num="xAdjP.AdjQP.QPAll.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/negCooccurExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//qp/negCooccurExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/negCooccurExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/negCooccurExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.34.1</xsl:text>
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
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sNegNominal" />
<xsl:text> para ejemplos de los elementos negativos usados en oraciones y la discusión de las construcciones de la negación en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
</xsl:if>
		 </section3>
			<section3 id="sQPDeterminers">
				<secTitle>Los cuantificadores que no ocurren con los determinadores</secTitle>
				<p>
<xsl:text>El segundo grupo incluye cuantificadores como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>alguno</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cada</langData>
<xsl:text>, y  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ninguno</langData>
<xsl:text>, que no permiten ningunos otros artículos, demonstratives o poseedores en la frase nominal. Los ejemplos españoles en frases incluyen </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>algunos niños tristes</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>casi cada niña que vea</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningunos perros negros</langData>
<xsl:text>.</xsl:text>
</p>
				<xsl:if test="normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene un grupo separado de los cuantificadores que actúan como el único determinador en la frase nominal. La negación de una frase nominal es expresada solamente por los elementos especiales del grado. Las nociones positivas de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>alguno</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cada</langData>
<xsl:text> son como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
<xsl:text> discutido arriba o como los cuantificadores que pueden ocurrir con los artículos, los demonstratives y/o los poseedores que se tratarán en la sección siguiente.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='noPosOnly' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene un grupo separado de los cuantificadores que actúan como el único determinador en la frase nominal.  Apenas pues no hay ninguna manera de expresar el elemento especial negativo del grado, no hay ninguna manera de expresar </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'ninguno'</xsl:text>
</gloss>
<xsl:text> cuando modificando de una frase nominal en esta lengua. Las nociones positivas de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>alguno</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cada</langData>
<xsl:text> son como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
<xsl:text> discutido arriba o como los cuantificadores que pueden ocurrir con los artículos, los demonstratives y/o los poseedores que se tratarán en la sección siguiente.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene un grupo separado de los cuantificadores negativos que actúan como el único determinador en la frase nominal. La negación de una frase nominal es expresada por los elementos especiales del grado solamente. </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene los cuantificadores positivos siguientes que actúan como el único determinador en la frase nominal: </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='noPosOnly' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene un grupo separado de los cuantificadores negativos que actúan como el único determinador en la frase nominal, apenas pues no había ninguna manera de expresar el elemento especial negativo 'del grado. </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene los cuantificadores positivos siguientes que actúan como el único determinador en la frase nominal:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yesNo'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene un grupo separado de los cuantificadores positivos que actúan como el único determinador en la frase nominal. Las nociones positivas de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>alguno</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cada</langData>
<xsl:text> son como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
<xsl:text> discutido arriba o como los cuantificadores que pueden ocurrir con los artículos, los demonstratives y/o los poseedores que se tratarán en la sección siguiente.   </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene los cuantificadores negativos siguientes que actúan como el único determiner en la frase nominal: </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene los cuantificadores positivos y negativos siguientes que actúan como el único determiner en la frase nominal: </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)!='no'">
<example num="xAdjP.AdjQP.QPDeterminers.18">
<table border="1">
						<tr>
							<th>Tipo</th>
							<th>Determinadores del cuantificador</th>
							<th>Significado</th>
						</tr>
						<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesSome'">
<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//qp/determinerExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
								<xsl:text>positivo</xsl:text>
							</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
								<xsl:text>positivo</xsl:text>
							</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
						<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//qp/determinerNegExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length($sExampleValue1)" />
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
								<xsl:text>negativo</xsl:text>
							</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left" rowspan="1">
								<xsl:text>negativo</xsl:text>
							</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					</table>
</example>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)!='no'">
<p>
<xsl:text>Estos determinadores del cuantificador ocurren  </xsl:text>
<xsl:choose>
						<xsl:when test="//qp/@determinerPos='before'">antes</xsl:when>
						<xsl:when test="//qp/@determinerPos='after'">después</xsl:when>
						<xsl:when test="//qp/@determinerPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
						<xsl:when test="//qp/@determinerPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
						<xsl:when test="//qp/@determinerPos='beforeOrBoth'">antes on en ambos lados</xsl:when>
						<xsl:when test="//qp/@determinerPos='afterOrBoth'">después o en ambos lados</xsl:when>
						<xsl:when test="//qp/@determinerPos='both'">en ambos lados</xsl:when>
						<xsl:when test="//qp/@determinerPos='unknown'">_______</xsl:when>
					</xsl:choose>
<xsl:text> del sustantivo principal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerEitherRestricted)='unrestricted' and normalize-space(//qp/@determinerPos)!='before' and normalize-space(//qp/@determinerPos)!='after'">
						<xsl:text>Todos los determinadores del cuantificador pueden ocurrir de cualquier lado del sustantivo.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerEitherRestricted)='restricted' and normalize-space(//qp/@determinerPos)!='before' and normalize-space(//qp/@determinerPos)!='after'">
						<xsl:text>Hay restricciones en cuanto a las cuales de los determinadores del cuantificador  puede ocurrir en cada lado del sustantivo.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesSome'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ejemplos de los determinadores positivos del cuantificador en frases nominales completas incluyen: </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesSome'">
<example num="xAdjP.AdjQP.QPDeterminers.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/determinerNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//qp/determinerNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/determinerNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/determinerNPExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPDeterminers.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPDeterminers.24.1</xsl:text>
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
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ejemplos de los determinadores negativas del cuantificador en frases nominales completas incluyen:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<example num="xAdjP.AdjQP.QPDeterminers.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/determinerNegNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//qp/determinerNegNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/determinerNegNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/determinerNegNPExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPDeterminers.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPDeterminers.28.1</xsl:text>
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
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<p>
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sNegNominal" />
<xsl:text> para ejemplos de los elementos negativos usados en oraciones y la discusión de las construcciones de la negación en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
</xsl:if>
			</section3>
			  <section3 id="sQPOtherQuantifiers">
				 <secTitle>Otros cuantificadores y la palabras del grado</secTitle>
				 <p>
<xsl:text>Otros cuantificadores, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>muchos</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mucho</langData>
<xsl:text>, y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>poco</langData>
<xsl:text>, vienen en una diversa posición en la frase nominal. En español, esto está después de un artículo, demostrativo o de poseedor pronominal y antes del sustantivo, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>los muchos perros negros de Juan</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>su pocos libros</langData>
<xsl:text>.
						 Además, estos cuantificadores se pueden modificar por palabras del grado tales como  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>muy</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tan</langData>
<xsl:text>, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>muchisimos perros</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>muy poco comida</langData>
<xsl:text>.</xsl:text>
</p>
				 <p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene los cuantificadores siguientes de este tipo:</xsl:text>
</p>
				 <example num="xAdjP.AdjQP.QPOtherQuantifiers.8">
<table border="1">
						 <tr>
							 <th>Cuantificadores</th>
							 <th>Significado</th>
						 </tr>
						 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//qp/quantifierExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					 </table>
</example>
				 <xsl:if test="normalize-space(//qp/@degree)='no'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> no tiene ninguna palabras del grado que modifiquen los cuantificadores.</xsl:text>
</p>
</xsl:if>
				 <xsl:if test="normalize-space(//qp/@degree)='yes'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> tiene palabras del grado que puedan modificar los cuantificadores. Estas palabras del grado ocurren </xsl:text>
<xsl:choose>
						 <xsl:when test="//qp/@degreePos='before'">antes</xsl:when>
						 <xsl:when test="//qp/@degreePos='after'">después</xsl:when>
						 <xsl:when test="//qp/@degreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
						 <xsl:when test="//qp/@degreePos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
						 <xsl:when test="//qp/@degreePos='beforeOrBoth'">antes on en ambos lados</xsl:when>
						 <xsl:when test="//qp/@degreePos='afterOrBoth'">después o en ambos lados</xsl:when>
						 <xsl:when test="//qp/@degreePos='both'">en ambos lados</xsl:when>
						 <xsl:when test="//qp/@degreePos='unknown'">_______</xsl:when>
					 </xsl:choose>
<xsl:text> del cuantificador.  </xsl:text>
<xsl:if test="normalize-space(//qp/@degree)='yes' and normalize-space(//qp/@degreeEitherRestricted)='unrestricted' and normalize-space(//qp/@degreePos)!='before' and normalize-space(//qp/@degreePos)!='after'">
						 <xsl:text>Todas las palabras del grado pueden ocurrir de cualquier lado del cuantificador.</xsl:text>
					 </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@degree)='yes' and normalize-space(//qp/@degreeEitherRestricted)='restricted' and normalize-space(//qp/@degreePos)!='before' and normalize-space(//qp/@degreePos)!='after'">
						 <xsl:text>Hay las restricciones en cuanto a las cuales de las palabras del grado puede ocurrir en cada lado del cuantificador.</xsl:text>
					 </xsl:if>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> ejemplos incluyen:</xsl:text>
</p>
</xsl:if>
				 <xsl:if test="normalize-space(//qp/@degree)='yes'">
<example num="xAdjP.AdjQP.QPOtherQuantifiers.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/degreeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//qp/degreeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/degreeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/degreeExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPOtherQuantifiers.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPOtherQuantifiers.14.1</xsl:text>
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
</xsl:if>
		 </section3>

	 </section2>
	 <section2 id="sAdjArtDem">
		 <secTitle>Los artículos y demonstrativos</secTitle>
		 <p>
<xsl:text>En español, los artículos incluyen </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>un</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>una</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la</langData>
<xsl:text>.  Los demonstrativos adjetivos españoles incluyen </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>esto</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ese</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>estos</langData>
<xsl:text>, y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>esos</langData>
<xsl:text>.  Algunos ejemplos simples son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>un libro, una manzana, el libro, los libros, esta manzana</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>esos libros.</langData>
<xsl:text></xsl:text>
</p>
		 <p>
<xsl:text>Algunos idiomas tienen solamente un grupo, los artículos o los demonstrativos. Un numero pequeño de idiomas pueden no tener ningún tipo expresado como palabras separadas. </xsl:text>
</p>
		 <p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
				 <xsl:when test="//np/@artAndDem='no'"> no tiene los artículos ni los demonstrativos que se observan como palabras separadas.</xsl:when>
				 <xsl:when test="//np/@artAndDem='article'"> tiene solamente artículos que se observen como palabras separadas, ningunos demonstrativos.</xsl:when>
				 <xsl:when test="//np/@artAndDem='demonstrative'"> tiene solamente demonstrativos que se observen como palabras separadas, ningunos artículos.</xsl:when>
				 <xsl:when test="//np/@artAndDem='both'"> tiene los artículos y demonstrativos que se observan como palabras separadas.</xsl:when>
			 </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
				 <xsl:text> Los </xsl:text>
				 <xsl:choose>
					 <xsl:when test="//np/@artAndDem='article'">artículos</xsl:when>
					 <xsl:when test="//np/@artAndDem='demonstrative'">demonstrativos</xsl:when>
					 <xsl:when test="//np/@artAndDem='both'">artículos y demonstrativos</xsl:when>
				 </xsl:choose>

				 <xsl:if test="normalize-space(//np/@artAndDem)!='no' and normalize-space(//np/@artCase)='no'">
					 <xsl:text>no </xsl:text>
				 </xsl:if>
				 <xsl:text>se marcan para el caso.</xsl:text>
			 </xsl:if>
<xsl:text></xsl:text>
</p>
		 <xsl:if test="normalize-space(//np/@artAndDem)='article' or normalize-space(//np/@artAndDem)='both'">
<p>
<xsl:text>Los ejemplos de artículos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
</p>
</xsl:if>
		 <xsl:if test="normalize-space(//np/@artAndDem)='article' or normalize-space(//np/@artAndDem)='both'">
<example num="xAdjP.AdjArtDem.12">
<table border="1">
  <tr>
	  <th>Artículos</th>
	  <th>Significado</th>
  </tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/articleExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			</table>
</example>
</xsl:if>
		 <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' or normalize-space(//np/@artAndDem)='both'">
<p>
<xsl:text>Los ejemploe de demonstrativos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> incluyen:</xsl:text>
</p>
</xsl:if>
		 <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' or normalize-space(//np/@artAndDem)='both'">
<example num="xAdjP.AdjArtDem.16">
<table border="1">
				 <tr>
					 <th>Demonstrativos</th>
					 <th>Significado</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/demonstrativeExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length($sExampleValue0)" />
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
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>PONE EL SIGNIFICADO</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			 </table>
</example>
</xsl:if>
		 <xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<p>
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sNPArtDem" />
<xsl:text> para los ejemplos en frases nominales.</xsl:text>
</p>
</xsl:if>
	 </section2>

	</section1>


































































































































































































































































































































































































































































































</xsl:template>
</xsl:stylesheet>