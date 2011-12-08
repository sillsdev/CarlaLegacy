<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="adjp">
	<section1 id="sAdjP">
		<secTitle>Los adjetivos</secTitle>
		<p>
<xsl:text>En esta sección se consideran adjetivos cualitativos, los números y otros cuantificadores, artículos y los adjetivos demonstrativos. Las posiciones de los adjetivos que permiten cada uno de estos elementos dentro de la frase nominal serán tratadas en la sección </xsl:text>
<sectionRef sec="sNP" />
<xsl:text>.
</xsl:text>
</p>
  <section2 id="sAdjQual">
	  <secTitle>Adjetivos cualitativos</secTitle>
	  <p>
<xsl:text>Los adjetivos cualitativos también pueden modificarse.  Algunos ejemplos en español son:
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
</xsl:attribute>olvidado muy fácilmente</langData>
<xsl:text>.  No pueden proporcionarse todas las combinaciones de palabras debido a la semántica y a otras consideraciones, pero en general parece que ciertas palabras de grado y adverbios de manera o frases adverbiales pueden modificar a los adjetivos. </xsl:text>
</p>
	  <xsl:if test="normalize-space(//adjp/@modifiers)='no'">
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
<xsl:text> no se permite que ninguna palabra de grado ni adverbio de manera modifica a los adjetivos. </xsl:text>
</p>
</xsl:if>
	  <xsl:if test="normalize-space(//adjp/@modifiers)='yes'">
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
<xsl:text> se permite que ciertas palabras de grado modifican a los adjetivos, pero los adverbios de manera no lo pueden hacer. Las palabras de grado se presentan </xsl:text>
<xsl:choose>
			  <xsl:when test="//adjp/@degreePos='before'">antes</xsl:when>
			  <xsl:when test="//adjp/@degreePos='after'">después</xsl:when>
			  <xsl:when test="//adjp/@degreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
			  <xsl:when test="//adjp/@degreePos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@degreePos='beforeOrBoth'">antes o en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@degreePos='afterOrBoth'">después o en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@degreePos='both'">en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@degreePos='unknown'">_______</xsl:when>
		  </xsl:choose>
<xsl:text> del adjetivo.  </xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesDegree' and normalize-space(//adjp/@degreeEither)='unrestricted' and normalize-space(//adjp/@degreePos)!='before' and normalize-space(//adjp/@degreePos)!='after'">
			  <xsl:text>Todas las palabras de grado pueden presentarse de cualquier lado del adjetivo.</xsl:text>
		  </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesDegree' and normalize-space(//adjp/@degreeEither)='restricted' and normalize-space(//adjp/@degreePos)!='before' and normalize-space(//adjp/@degreePos)!='after'">
			  <xsl:text>Hay restricciones en cuanto a cuáles palabras de grado pueden presentarse en cada lado del adjetivo.</xsl:text>
		  </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
	  <xsl:if test="normalize-space(//adjp/@modifiers)='yesManner'">
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
<xsl:text> se permite que ciertas palabras de grado y adverbios de manera modifican a los adjetivos. Estos modificadores se presentan </xsl:text>
<xsl:choose>
			  <xsl:when test="//adjp/@mannerPos='before'">antes</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='after'">después</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='afterOrBoth'">después o en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='both'">en ambos lados</xsl:when>
			  <xsl:when test="//adjp/@mannerPos='unknown'">_______</xsl:when>
		  </xsl:choose>
<xsl:text> del adjetivo.  </xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerEither)='unrestricted' and normalize-space(//adjp/@mannerPos)!='before' and normalize-space(//adjp/@mannerPos)!='after'">
			  <xsl:text>Todas las palabras de grado y adverbios de manera pueden presentarse de cualquier lado del adjetivo. </xsl:text>
		  </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerEither)='restricted' and normalize-space(//adjp/@mannerPos)!='before' and normalize-space(//adjp/@mannerPos)!='after'">
			  <xsl:text>Hay restricciones en cuanto a cuáles palabras de grado y cuáles adverbios de manera pueden presentarse en cada lado del adjetivo.</xsl:text>
		  </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
	  <p>
<xsl:text>Algunos ejemplos de adjetivos o frases adjetivales en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:
		  </xsl:text>
</p>
	  <example num="xAdjP.AdjQual.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//adjp/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//adjp/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//adjp/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//adjp/example))" />
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

			<section2 id="sAdjNumbers">
				<secTitle>Los números</secTitle>
				<p>
<xsl:text>Los números no se pueden modificar con las palabras de grado al iqual que se puede hacer con los cuantificadores, aunque se presentan en la misma posición. Sin embargo, los números cardinales se pueden modificar con los números ordinales y los adjetivos </xsl:text>
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
</xsl:attribute>los próximos cien años </langData>
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
					<secTitle>Números cardinales</secTitle>
					<p>
<xsl:text>Las formas básicas para los números cardinales se dan en el cuadro siguiente:</xsl:text>
</p>
					<example num="xAdjP.AdjNumbers.QPNumbersCardinal.6">
<table border="1">
							 <tr>
								<th>Cuenta</th>
								 <th>Números cardinales</th>
								<th>Glosa</th>
							 </tr>
							<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//qp/cardinalNumbers1to10),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>1 a 10</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
							<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//qp/cardinalNumbers11to20),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>11 a 20</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
							<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//qp/cardinalNumbers30to100),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>30 a 100 (por diez)</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
						</table>
</example>
					<p>
<xsl:text>Los números cardinales más grandes pueden ser los compuestos que se pueden escribir como palabras independientes, tales como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ciento treinta y tres</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>seis mil ciento treinta y tres</langData>
<xsl:text>.
							Algunos ejemplos de números compuestos en </xsl:text>
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
					<example num="xAdjP.AdjNumbers.QPNumbersCardinal.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/cardinalCompoundExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/cardinalCompoundExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/cardinalCompoundExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/cardinalCompoundExample))" />
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
<xsl:text>De acuerdo con la posición del número de unidad y de cualquier conjunción, el núcleo de los números cardinales en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> aparece </xsl:text>
<xsl:choose>
							<xsl:when test="//qp/@cardinalHead='before'">a la izquierda-</xsl:when>
							<xsl:when test="//qp/@cardinalHead='after'">al derecho</xsl:when>
						</xsl:choose>
<xsl:text>.
						</xsl:text>
</p>
				</section3>
				<section3 id="sQPNumbersOrdinal">
					<secTitle>Números ordinales</secTitle>
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
<xsl:text>, los números ordinales </xsl:text>
<xsl:choose>
							<xsl:when test="//qp/@ordinalFormation='affix'">se forman agregando un afijo al número cardinal.</xsl:when>
							<xsl:when test="//qp/@ordinalFormation='independent'">son palabras sintácticas independientes, distintas de los números cardinales.</xsl:when>
							<xsl:when test="//qp/@ordinalFormation='both'">pueden se pueden  formar agregando un afijo al número cardinal, pero algunas formas son palabras sintácticas independientes.</xsl:when>
						</xsl:choose>
<xsl:text>  Los primeros diez números ordinales son:</xsl:text>
</p>
					<example num="xAdjP.AdjNumbers.QPNumbersOrdinal.6">
<table border="1">
							<tr>
								<th>Cuenta</th>
								<th>Números ordinales</th>
								<th>Glosa</th>
							</tr>
							<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//qp/ordinalNumbers),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
<xsl:text>primero a décimo</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
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
<xsl:text> cuando un número ordinal modifica a un número cardinal, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>los primeros veinte muchachos</langData>
<xsl:text>, se presenta </xsl:text>
<xsl:choose>
							<xsl:when test="//qp/@ordinalPos='before'">antes</xsl:when>
							<xsl:when test="//qp/@ordinalPos='after'">después</xsl:when>
							<xsl:when test="//qp/@ordinalPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
							<xsl:when test="//qp/@ordinalPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
							<xsl:when test="//qp/@ordinalPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
							<xsl:when test="//qp/@ordinalPos='afterOrBoth'">después o en ambos lados</xsl:when>
							<xsl:when test="//qp/@ordinalPos='both'">en ambos lados</xsl:when>
							<xsl:when test="//qp/@ordinalPos='unknown'">_______</xsl:when>
						</xsl:choose>
<xsl:text> del número cardinal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@ordinalEitherRestricted)='unrestricted' and normalize-space(//qp/@ordinalPos)!='before' and normalize-space(//qp/@ordinalPos)!='after' and normalize-space(//qp/@ordinalPos)!='unknown'">
							<xsl:text>Todos los números ordinales pueden presentarse de cualquier lado del número cardinal.</xsl:text>
						</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@ordinalEitherRestricted)='restricted' and normalize-space(//qp/@ordinalPos)!='before' and normalize-space(//qp/@ordinalPos)!='after'">
							<xsl:text>Hay restricciones en cuanto a cuáles de los números ordinales pueden presentarse en cada lado del número cardinal.</xsl:text>
						</xsl:if>
<xsl:text></xsl:text>
</p>
					<p>
<xsl:text>A continuación se dan en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> algunos ejemplos del uso de los números ordinales y de los modificadores que significan </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'el último'</xsl:text>
</gloss>
<xsl:text> o </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'el próximo'</xsl:text>
</gloss>
<xsl:text> dentro de una frase nominal: </xsl:text>
</p>
					<example num="xAdjP.AdjNumbers.QPNumbersOrdinal.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/ordinalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/ordinalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/ordinalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/ordinalExample))" />
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

		<section2 id="sAdjQP">
			<secTitle>Los cuantificadores</secTitle>
		 <p>
<xsl:text>Los cuantificadores pueden presentarse en varios lugares en una frase nominal. La mayoría de las idiomas tienen tres sistemas de cuantificadores además de números:</xsl:text>
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
				 <xsl:text>, que modifican la frase nominal completo,</xsl:text>
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
				 <xsl:text>, que no se presentan con ningún otro modificador excepto con los adjetivos,</xsl:text>
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
<xsl:text>Cada tipo será considerado en su orden correspondiete.
			 </xsl:text>
</p>
		 <section3 id="sQPAll">
			 <secTitle>Cuantificadores que modifican la frase nominal completo</secTitle>
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
<xsl:text> parecen tener una categoría propia.
					Generalmente se presentan primero (o al último) en una frase nominal, en una posición distinta de los otros cuantificadores pero en el mismo lugar que las palabras de grado como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>apenas</langData>
<xsl:text> (que también pueden funcionar al igual que indicadores de enfoque, lo cual será analizado en la sección </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text>) y las palabras que significan lo mismo que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>casi</langData>
<xsl:text> (lo que también puede presentarse con </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
<xsl:text>), así que les llamaremos palabras especiales de grado. Estas palabras modifican la frase nominal completo, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos los niños</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente los tres niños de Susana</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>casi todos los niños pequeños de Juan</langData>
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
<xsl:text> puede presentarse en lugar de o antes de las otras palabras especiales de grado, como en </xsl:text>
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
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> utilizan las siguientes palabras para expresar estas nociones:</xsl:text>
</p>
			<example num="xAdjP.AdjQP.QPAll.8">
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
<xsl:value-of select="translate(string(//qp/all),'.','')" />
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los elementos especiales de grado no se expresan como palabras independientes. Por el contrario, todos se unen a otra palabra de la frase nominal. Los elementos especiales positivos de grado son </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePosType='proclitic'">proclíticos que se unen al inicio de cualquier palabra que comienza la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='enclitic'">enclíticos que se unen al final de cualquier palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='clitic'">clíticos que se unen al inicio de cualquier palabra que comienza la frase nominal o al final de cualquier palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='prefix'">prefijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='suffix'">sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='affix'">prefijos o sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//qp/@npDegree)='no'">
<p>
<xsl:text>  Los elementos especiales negativos de grado son  </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreeNegType='proclitic'">proclíticos que se unen al inicio de cualquier palabra que comienza la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='enclitic'">enclíticos que se unen al final de cualquier palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='clitic'">clíticos que se unen al inicio de cualquier palabra que comienza la frase nominal o al final de cualquier palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='prefix'">prefijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='suffix'">sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='affix'">prefijos o sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//qp/@npDegree)='no'">
<p>
<xsl:text>Algunos  ejemplos de la frases nominales positivas en </xsl:text>
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
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='noPosOnly'">
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
<xsl:text>, los elementos especiales positivos de grado no se expresan como palabras independientes. Por el contrario, todos se unen a otra palabra de la frase nominal como </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePosType='proclitic'">proclíticos que se unen al inicio de cualquier palabra que comienza la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='enclitic'">enclíticos que se unen al final de cualquier palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='clitic'">clíticos que se unen al inicio de cualquier palabra que comienza la frase nominal o al final de cualquier palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='prefix'">prefijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='suffix'">sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='affix'">prefijos o sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//qp/@npDegree)='noPosOnly'">
<p>
<xsl:text>Sin embargo, no hay ninguna manera en el idioma para expresar el significado de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'no'</xsl:text>
</gloss>
<xsl:text>cuando está modificando a una frase nominal completo. </xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//qp/@npDegree)='noPosOnly'">
<p>
<xsl:text>Algunos ejemplos de la frases nominales positivas en </xsl:text>
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
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yesPos'">
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
<xsl:text>, los elementos especiales positivos de grado se expresan como palabras independientes que modifican la frase del nominal completo. Se presentan </xsl:text>
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
					<xsl:text>Todas estas palabras pueden presentarse de cualquier lado de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeEitherRestricted)='restricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
					<xsl:text>Hay restricciones en cuanto a cuáles de estas palabras pueden presentarse en cada lado de la frase nominal.  </xsl:text>
				</xsl:if>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//qp/@npDegree)='yesPos'">
<p>
<xsl:text>Sin embargo, los elementos especiales negativos de grado no se expresan como palabras independientes. Por el contrario, se unen a otra palabra de la frase nominal. Estos elementos especiales negativos de grado son </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreeNegType='proclitic'">proclíticos que se unen al inicio de cualquier palabra que comienza la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='enclitic'">enclíticos que se unen al final de cualquier palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='clitic'">clíticos que se unen al inicio de cualquier palabra que comienza la frase nominal o al final de cualquier palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='prefix'">prefijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='suffix'">sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='affix'">prefijos o sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//qp/@npDegree)='yesPos'">
<p>
<xsl:text>Algunos ejemplos de la frases nominales positivas en </xsl:text>
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
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yesPosOnly'">
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
<xsl:text>, los elementos especiales positivos de grado se expresan como palabras independientes que modifican la frase del nominal completo. Se presntan </xsl:text>
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
					<xsl:text>Todas estas palabras pueden presentarse de cualquier lado de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeEitherRestricted)='restricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
					<xsl:text>Hay restricciones en cuanto a cuáles de estas palabras pueden presentarse en cada lado de la frase nominal.  </xsl:text>
				</xsl:if>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//qp/@npDegree)='yesPosOnly'">
<p>
<xsl:text>Sin embargo, no hay ninguna manera en el idioma para expresar el significado de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'no'</xsl:text>
</gloss>
<xsl:text>cuando está modificando a una frase nominal completo.  </xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//qp/@npDegree)='yesPosOnly'">
<p>
<xsl:text>Algunos ejemplos de la frases nominales positivas en </xsl:text>
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
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yesNeg'">
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
<xsl:text>, los elementos especiales positivos de grado no se expresan como palabras independientes. Por el contrario, todos se unen a otra palabra de la frase nominal como  </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePosType='proclitic'">proclíticos que se unen al inicio de cualquier palabra que comienza la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='enclitic'">enclíticos que se unen al final de cualquier palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='clitic'">clíticos que se unen al inicio de cualquier palabra que comienza la frase nominal o al final de cualquier palabra que termina la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='prefix'">prefijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='suffix'">sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='affix'">prefijos o sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//qp/@npDegree)='yesNeg'">
<p>
<xsl:text>Sin embargo, los elementos especiales negativos de grado en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>  se expresan como palabras independientes que modifican la frase del nominal completo. Se presentan </xsl:text>
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
					<xsl:text>Todas estas palabras pueden presentarse de cualquier lado de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeEitherRestricted)='restricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
					<xsl:text>Hay restricciones en cuanto a cuáles de estas palabras pueden presentarse en cada lado de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//qp/@npDegree)='yesNeg'">
<p>
<xsl:text>Algunos ejemplos de la frases nominales positivas en </xsl:text>
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
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes'">
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
<xsl:text>, los elementos especiales positivos de grado se expresan como palabras independientes que modifican la frase del nominal completo. Se presentan </xsl:text>
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
					<xsl:text>Todas estas palabras pueden presentarse de cualquier lado de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeEitherRestricted)='restricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
					<xsl:text>Hay estricciones en cuanto a las cuáles de estas palabras pueden presentarse en cada lado de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//qp/@npDegree)='yes'">
<p>
<xsl:text>Algunos  ejemplos de la frases nominales positivas en </xsl:text>
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
</xsl:if>
			<example num="xAdjP.AdjQP.QPAll.44">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.44</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.44.1</xsl:text>
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
			<xsl:if test="normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>Algunos ejemplos nominales negativos de la frase en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> que no incluyen los elementos especiales positivos de grado son: </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<example num="xAdjP.AdjQP.QPAll.48">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/negExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/negExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/negExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/negExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.48</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.48.1</xsl:text>
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
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='no'">
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
<xsl:text> no se permite que las palabras que significan </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> se presentan con las palabras especiales positivas de grado en una sola frase nominal.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes'">
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
<xsl:text> se permite que las palabras que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> se presentan con las palabras especiales positivas de grado en una sola frase nominal.  Las palabras especiales negativas de grado se presentan </xsl:text>
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
<xsl:text> del resto de la frase nominal (incluyendo las palabras especiales positivas de grado).  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegEitherRestricted)='unrestricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
					<xsl:text>Todas estas palabras negativas pueden presentarse de cualquier lado de la frase nominal.  </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegEitherRestricted)='restricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
					<xsl:text>Hay restricciones en cuanto a cuáles de estas palabras negativas pueden presentarse en cada lado de la frase nominal.  </xsl:text>
				</xsl:if>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes'">
<p>
<xsl:text>Algunos ejemplos de las frases nominales negativos que incluyen las palabras especiales positivas de grado en </xsl:text>
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
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' or normalize-space(//qp/@npDegree)!='yes' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>Algunos ejemplos de las frases nominales negativos que incluyen las palabras especiales positivas de grado en </xsl:text>
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
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' or normalize-space(//qp/@npDegree)!='yes' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<example num="xAdjP.AdjQP.QPAll.58">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/negCooccurExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/negCooccurExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/negCooccurExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/negCooccurExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.58</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.58.1</xsl:text>
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
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sNegNominal" />
<xsl:text> para considerar otros ejemplos de los elementos negativos usados en las oraciones y el análisis de las construcciones de la negación en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
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
				<secTitle>Cuantificadores que no se presentan con los determinantes</secTitle>
				<p>
<xsl:text>El segundo sistema incluye cuantificadores como </xsl:text>
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
<xsl:text>, que no permiten ningún otro artículo, demostrativo o poseedor en la frase nominal. Algunos ejemplos en español en las frases son </xsl:text>
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
</xsl:attribute>ningún perro negro</langData>
<xsl:text>.</xsl:text>
</p>
				<xsl:if test="normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
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
<xsl:text> no hay una categoría independiente de los cuantificadores que funciona al igual que el único determinante de la frase nominal. La negación de una frase nominal se expresa solamente con los elementos especiales de grado. Los conceptos positivos de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>alguno</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cada</langData>
<xsl:text> son al igual que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
<xsl:text> considerados anteriormente o al igual que los cuantificadores que pueden presentarse con los artículos, los demostrativos y/o los poseedores que se analizarán en la siguiente sección.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='noPosOnly' or normalize-space(//qp/@determiner)='no' and normalize-space(//qp/@npDegree)='yesPosOnly'">
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
<xsl:text> no hay una categoría independiente de los cuantificadores que funciona al igual que el único determinante de la frase nominal.  De la misma forma no hay ninguna manera de expresar el elemento especial negativo de grado, no hay ninguna manera de expresar </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'ninguno'</xsl:text>
</gloss>
<xsl:text> cuando se modifica una frase nominal en esta lengua. Los conceptos positivos de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>alguno</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cada</langData>
<xsl:text> son al igual que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
<xsl:text> considerados anteriormente o al igual que los cuantificadores que pueden presentarse con los artículos, los demostrativos y/o los poseedores que se analizarán en la siguiente sección.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
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
<xsl:text> no hay una categoría independiente de los cuantificadores negativos que funciona al igual que el único determinante de la frase nominal. La negación de una frase nominal es expresa solamente con los elementos especiales de grado. </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegree)!='yesPosOnly'">
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
<xsl:text> se encuentran los siguientes cuantificadores positivos que funcionan al igual que el único determinante de la frase nominal: </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='noPosOnly' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='yesPosOnly'">
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
<xsl:text> no hay una categoría independiente de los cuantificadores negativos que funciona al igual que el único determinante de la frase nominal. Asimismo tampoco hay alguna manera de expresar el elemento especial negativo de grado. </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='noPosOnly' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@npDegree)='yesPosOnly'">
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
<xsl:text> se encuentran los siguientes cuantificadores positivos que funcionan al igual que el único determinante de la frase nominal:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yesNo'">
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
<xsl:text> no hay una categoría independiente de los cuantificadores positivos que funciona al igual que el único determinante de la frase nominal. Los conceptos positivos de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>alguno</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cada</langData>
<xsl:text> son al igual que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
<xsl:text> considerados anteriormente o al igual que los cuantificadores que pueden presentarse con los artículos, los demostrativos y/o los poseedores que se analizarán en la siguiente sección.   </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yesNo'">
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
<xsl:text> se encuentran los siguientes cuantificadores negativos que funcionan al igual que el único determinante de la frase nominal: </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes'">
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
<xsl:text> se encuentran los siguientes cuantificadores positivos y negativos que funcionan al igual que el único determinante de la frase nominal: </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)!='no'">
<example num="xAdjP.AdjQP.QPDeterminers.24">
<table border="1">
						<tr>
							<th>Tipo</th>
							<th>Determinantes del cuantificador</th>
							<th>Glosa</th>
						</tr>
						<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesSome'">
<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//qp/determinerExample),'.','')" />
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
								<xsl:text>positivo</xsl:text>
							</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
								<xsl:text>negativo</xsl:text>
							</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>Estos determinantes del cuantificador se presentan  </xsl:text>
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
						<xsl:text>Todos los determinantes del cuantificador pueden presentarse de cualquier lado del sustantivo.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerEitherRestricted)='restricted' and normalize-space(//qp/@determinerPos)!='before' and normalize-space(//qp/@determinerPos)!='after'">
						<xsl:text>Hay restricciones en cuanto a cuáles de los determinantes del cuantificador pueden presentarse en cada lado del sustantivo.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesSome'">
<p>
<xsl:text>Algunos ejemplos de los determinantes positivos del cuantificador en frases nominales completas en </xsl:text>
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
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesSome'">
<example num="xAdjP.AdjQP.QPDeterminers.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/determinerNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/determinerNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/determinerNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/determinerNPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPDeterminers.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPDeterminers.30.1</xsl:text>
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
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<p>
<xsl:text>Algunos ejemplos de los determinantes negativos del cuantificador en frases nominales completas en </xsl:text>
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
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<example num="xAdjP.AdjQP.QPDeterminers.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/determinerNegNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/determinerNegNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/determinerNegNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/determinerNegNPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPDeterminers.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPDeterminers.34.1</xsl:text>
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
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='yesNo'">
<p>
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sNegNominal" />
<xsl:text> para considerar otros ejemplos de los elementos negativos usados en las oraciones y el análisis de las construcciones de la negación en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
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
				 <secTitle>Otros cuantificadores y palabras de grado</secTitle>
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
<xsl:text>, se presentan en diversas posiciones en la frase nominal. En español, estos cuantificadores se presentan después de un artículo, demostrativo o de poseedor pronominal y antes del sustantivo, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>los muchos perros negros de Juan</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>sus pocos libros</langData>
<xsl:text>.
						 Además, estos cuantificadores se pueden modificar con palabras de grado tales como  </xsl:text>
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
</xsl:attribute>muy poca comida</langData>
<xsl:text>.</xsl:text>
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
<xsl:text> se encuentran los siguientes cuantificadores de este tipo:</xsl:text>
</p>
				 <example num="xAdjP.AdjQP.QPOtherQuantifiers.8">
<table border="1">
						 <tr>
							 <th>Cuantificadores</th>
							 <th>Glosa</th>
						 </tr>
						 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//qp/quantifierExample),'.','')" />
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
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					 </table>
</example>
				 <xsl:if test="normalize-space(//qp/@degree)='no'">
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
<xsl:text> no hay ninguna palabra de grado que modifica a los cuantificadores.</xsl:text>
</p>
</xsl:if>
				 <xsl:if test="normalize-space(//qp/@degree)='yes'">
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
<xsl:text> hay palabras de grado que puedan modificar a los cuantificadores. Estas palabras de grado se presentan </xsl:text>
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
						 <xsl:text>Todas las palabras de grado pueden presentarse de cualquier lado del cuantificador.</xsl:text>
					 </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@degree)='yes' and normalize-space(//qp/@degreeEitherRestricted)='restricted' and normalize-space(//qp/@degreePos)!='before' and normalize-space(//qp/@degreePos)!='after'">
						 <xsl:text>Hay restricciones en cuanto a cuáles de las palabras de grado pueden presentarse en cada lado del cuantificador.</xsl:text>
					 </xsl:if>
<xsl:text>Algunos ejemplos en </xsl:text>
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
</xsl:if>
				 <xsl:if test="normalize-space(//qp/@degree)='yes'">
<example num="xAdjP.AdjQP.QPOtherQuantifiers.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/degreeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/degreeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/degreeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/degreeExample))" />
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
</xsl:if>
		 </section3>

	 </section2>
	 <section2 id="sAdjArtDem">
		 <secTitle>Artículos y demostrativos</secTitle>
		 <p>
<xsl:text>En español, los artículos son los siguientes: </xsl:text>
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
<xsl:text>.  Los demostrativos en español son los siguientes: </xsl:text>
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
<xsl:text>Algunos idiomas tienen solamente una categoría, los artículos o los demostrativos. Un numero pequeño de idiomas pueden no tener ningún tipo expresado como palabras independientes. </xsl:text>
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
<xsl:text></xsl:text>
<xsl:choose>
				 <xsl:when test="//np/@artAndDem='no'"> no hay artículos ni demostrativos que son palabras independientes.</xsl:when>
				 <xsl:when test="//np/@artAndDem='article'"> solamente hay artículos que son palabras independientes, ningún demostrativo.</xsl:when>
				 <xsl:when test="//np/@artAndDem='demonstrative'"> solamente hay demostrativos que son palabras independientes, ningún artículo.</xsl:when>
				 <xsl:when test="//np/@artAndDem='both'"> hay artículos y demostrativos que son palabras independientes.</xsl:when>
			 </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
				 <xsl:text> Los </xsl:text>
				 <xsl:choose>
					 <xsl:when test="//np/@artAndDem='article'">artículos</xsl:when>
					 <xsl:when test="//np/@artAndDem='demonstrative'">demostrativos</xsl:when>
					 <xsl:when test="//np/@artAndDem='both'">artículos y demostrativos</xsl:when>
				 </xsl:choose>

				 <xsl:if test="normalize-space(//np/@artAndDem)!='no' and normalize-space(//np/@artCase)='no'">
					 <xsl:text>no </xsl:text>
				 </xsl:if>
				 <xsl:text>se indican para el caso.</xsl:text>
			 </xsl:if>
<xsl:text></xsl:text>
</p>
		 <xsl:if test="normalize-space(//np/@artAndDem)='article' or normalize-space(//np/@artAndDem)='both'">
<p>
<xsl:text>Algunos ejemplos de artículos en </xsl:text>
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
</xsl:if>
		 <xsl:if test="normalize-space(//np/@artAndDem)='article' or normalize-space(//np/@artAndDem)='both'">
<example num="xAdjP.AdjArtDem.12">
<table border="1">
  <tr>
	  <th>Artículos</th>
	  <th>Glosa</th>
  </tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/articleExample),'.','')" />
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
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>Algunos ejemplos de demostrativos en </xsl:text>
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
</xsl:if>
		 <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' or normalize-space(//np/@artAndDem)='both'">
<example num="xAdjP.AdjArtDem.16">
<table border="1">
				 <tr>
					 <th>Demostrativos</th>
					 <th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/demonstrativeExample),'.','')" />
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
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text>ESCRIBA LA GLOSA</xsl:text>
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
<xsl:text> para considerar otros ejemplos en frases nominales.</xsl:text>
</p>
</xsl:if>
	 </section2>

	</section1>


































































































































































































































































































































































































































































































</xsl:template>
</xsl:stylesheet>
