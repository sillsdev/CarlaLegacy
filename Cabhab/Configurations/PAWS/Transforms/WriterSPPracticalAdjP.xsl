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
<xsl:text>Los adjetivos cualitativos expresan tamaño, color, edad, textura, forma o calidad.  Una característica de adjetivos cualitativos en muchas lenguas es que se permita más de una frase adjetival modificar un sustantivo.  También, el orden de los adjetivos puede cambir en general (con un cambio pequeño  en el significado debido a los cambios en dominio de cada adjetivo).  Por ejemplo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hard dull brass rods</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘las barras de cobre amarillo pálido duras’</xsl:text>
</gloss>
<xsl:text> contra </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dull hard brass rods</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘las barras de cobre amarillo duras pálidas’</xsl:text>
</gloss>
<xsl:text> contra </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>brass hard dull rods</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘las barras pálidas duras de cobre amarillo’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
	 <p>
<xsl:text>Esta sección se trata los adjetivos que modifica sustantivos, en contraste que los adjetivos que actúan como predicados.  Las oraciones con adjetivos predicativos será cubierto en la sección </xsl:text>
<sectionRef sec="sIPCop" />
<xsl:text>.</xsl:text>
</p>

	 <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//adjp/@adjectiveClassifier)='yes'">
<p>
<xsl:text>Algunos ejemplos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de los raíces de adjetivos cualitativos que expresan tamaño, color, edad, textura, forma o calidad se dan en el cuadro siguiente.
		Cada uno puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//adjp/@adjectiveClassifier)!='yes'">
<p>
<xsl:text>Algunos ejemplos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de adjetivos cualitativos que expresan tamaño, color, edad, textura, forma o calidad se dan en el cuadro siguiente:</xsl:text>
</p>
</xsl:if>
	 <example num="xAdjP.AdjQual.12">
<table border="1">
		   <tr>
			  <th>Adjetivos cualitativos</th>
			  <th>Glosa</th>
		   </tr>
		   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//adjp/example),'.','')" />
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
<xsl:text>ECSRIBA LA GLOSA</xsl:text>
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
<xsl:text>ECSRIBA LA GLOSA</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		</table>
</example>

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
<xsl:text>.  No pueden proporcionarse todas las combinaciones de palabras debido a la semántica y a otras consideraciones, pero en general parece que ciertas palabras de grado y adverbios de manera o frases adverbiales pueden modificar a os adjetivos. </xsl:text>
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
<xsl:text> no se permite que ninguna palabra de grado ni adverbio de manera modifique a los adjetivos. </xsl:text>
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
<xsl:text> se permite que ciertas palabras de grado modifiquen a los adjetivos, pero los adverbios de manera no lo pueden hacer. Las palabras de grado se presentan </xsl:text>
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

	 <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//adjp/@adjectiveDegreeClassifier)='yes' and normalize-space(//adjp/@modifiers)='yes'">
<p>
<xsl:text>Los raíces de las palabras de grado que pueden modificar a los adjetivos cualitativos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada uno puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' and normalize-space(//adjp/@modifiers)='yes' or normalize-space(//adjp/@adjectiveDegreeClassifier)!='yes' and normalize-space(//adjp/@modifiers)='yes'">
<p>
<xsl:text>Las palabras de grado que pueden modificar a los adjetivos cualitativos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí:</xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//adjp/@modifiers)='yes'">
<example num="xAdjP.AdjQual.24">
<table border="1">
		   <tr>
			  <th>Palabras de grado</th>
			  <th>Glosa</th>
		   </tr>
		   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//adjp/adjectiveDegreeExample),'.','')" />
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
	 <xsl:if test="normalize-space(//adjp/@modifiers)='yes'">
<p>
<xsl:text>Algunos ejemplos de adjetivos cualitativos con palabras de grado modificándolos son:</xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//adjp/@modifiers)='yes'">
<example num="xAdjP.AdjQual.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//adjp/adjectivePhraseExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//adjp/adjectivePhraseExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//adjp/adjectivePhraseExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//adjp/adjectivePhraseExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQual.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQual.28.1</xsl:text>
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
<xsl:text> se permite que ciertas palabras de grado y adverbios de manera modifiquen a los adjetivos. Estos modificadores se presentan </xsl:text>
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
	 <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//adjp/@adjectiveDegreeClassifier)='yes' and normalize-space(//adjp/@modifiers)='yesManner'">
<p>
<xsl:text>Los raíces de las palabras de grado que pueden modificar a los adjetivos cualitativos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada uno puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' and normalize-space(//adjp/@modifiers)='yesManner' or normalize-space(//adjp/@adjectiveDegreeClassifier)!='yes' and normalize-space(//adjp/@modifiers)='yesManner'">
<p>
<xsl:text>Las palabras de grado que pueden modificar a los adjetivos cualitativos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí:</xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//adjp/@modifiers)='yesManner'">
<example num="xAdjP.AdjQual.36">
<table border="1">
		   <tr>
			  <th>Palabras de grado</th>
			  <th>Glosa</th>
		   </tr>
		   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//adjp/adjectiveDegreeExample),'.','')" />
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
	 <xsl:if test="normalize-space(//adjp/@modifiers)='yesManner'">
<p>
<xsl:text>Algunos ejemplos de adjetivos cualitativos con palabras de grado o adverbios de manera modificándolos son:</xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//adjp/@modifiers)='yesManner'">
<example num="xAdjP.AdjQual.40">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//adjp/adjectivePhraseExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//adjp/adjectivePhraseExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//adjp/adjectivePhraseExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//adjp/adjectivePhraseExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.AdjQual.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQual.40.1</xsl:text>
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

	 <xsl:if test="normalize-space(//adjp/@modifiers)='attaches'">
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
<xsl:text>, hay afijos o clíticos que unen a un adjetivo cualitativo para intensificarlo.  Los afijos o clíticos de grado que pueden modificar a los adjetivos cualitativos en </xsl:text>
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
	 <xsl:if test="normalize-space(//adjp/@modifiers)='attaches'">
<example num="xAdjP.AdjQual.44">
<table border="1">
		   <tr>
			  <th>Afijos o clíticos de grado</th>
			  <th>Glosa</th>
		   </tr>
		   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//adjp/adjectiveDegreeAffixExample),'.','')" />
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
<xsl:text>ECSRIBA LA GLOSA</xsl:text>
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
<xsl:text>ECSRIBA LA GLOSA</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		</table>
</example>
</xsl:if>
	 <xsl:if test="normalize-space(//adjp/@modifiers)='attaches'">
<p>
<xsl:text>Algunos ejemplos de adjetivos cualitativos con afijos o clíticos de grado son:</xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//adjp/@modifiers)='attaches'">
<example num="xAdjP.AdjQual.48">
<table border="1">
		   <tr>
			  <th>Adjetivos cualitativos intensificados</th>
			  <th>Glosa</th>
		   </tr>
		   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//adjp/adjectivePhraseAffixExample),'.','')" />
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

	 <xsl:if test="normalize-space(//adjp/@modifiers)='noRedup'">
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
<xsl:text>, utiliza reduplicación para intensificar el significado del adjetivo cualitativo.  Algunos ejemplos de adjetivos cualitativos con reduplicación son</xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//adjp/@modifiers)='noRedup'">
<example num="xAdjP.AdjQual.52">
<table border="1">
		   <tr>
			  <th>Adjetivos cualitativos con reduplicación</th>
			  <th>Glosa</th>
		   </tr>
		   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//adjp/adjectiveDegreeRedupExample),'.','')" />
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

  </section2>

			<section2 id="sAdjNumbers">
				<secTitle>Los números</secTitle>
				<p>
<xsl:text>Los números no se pueden modificar con las palabras de grado al iqual que se puede hacer los adjetivos cualificativos y los cuantificadores, aunque se presentan usualmente en la misma posición que los cuantificadores. Sin embargo, los números cardinales se pueden modificar con los números ordinales y los adjetivos </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>siguiente</langData>
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
</xsl:attribute>los cientos años siguientes</langData>
<xsl:text>.  Los números ordinales y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>siguiente</langData>
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
				   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@numberClassifier)='yes'">
<p>
<xsl:text>Las formas básicas para los números cardinales se dan en el cuadro siguiente.  Cada uno puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
				   <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//qp/@numberClassifier)!='yes'">
<p>
<xsl:text>Las formas básicas para los números cardinales se dan en el cuadro siguiente:</xsl:text>
</p>
</xsl:if>
				   <example num="xAdjP.AdjNumbers.QPNumbersCardinal.8">
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
					<example num="xAdjP.AdjNumbers.QPNumbersCardinal.12">
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
<xsl:with-param name="sExNumber">xAdjP.AdjNumbers.QPNumbersCardinal.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjNumbers.QPNumbersCardinal.12.1</xsl:text>
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
</p>
					  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@numberClassifier)='yes'">
<p>
<xsl:text>Las formas básicas para los primeros diez números ordinales se dan en el cuadro siguiente.  Cada uno puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
				   <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//qp/@numberClassifier)!='yes'">
<p>
<xsl:text>Las formas básicas para los primeros diez números ordinales se dan en el cuadro siguiente:</xsl:text>
</p>
</xsl:if>

					<example num="xAdjP.AdjNumbers.QPNumbersOrdinal.10">
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
<xsl:text>‘el último’</xsl:text>
</gloss>
<xsl:text> o </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘el siguiente’</xsl:text>
</gloss>
<xsl:text> dentro de una frase nominal: </xsl:text>
</p>
					<example num="xAdjP.AdjNumbers.QPNumbersOrdinal.16">
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
<xsl:with-param name="sExNumber">xAdjP.AdjNumbers.QPNumbersOrdinal.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjNumbers.QPNumbersOrdinal.16.1</xsl:text>
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
<xsl:text>Los cuantificadores pueden presentarse en varios lugares en una frase nominal. La mayoría de las lenguas tienen tres sistemas de cuantificadores además de números:</xsl:text>
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
			 <secTitle>Cuantificadores que modifican la frase nominal completa</secTitle>
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
<xsl:text> (que también pueden funcionar al igual que indicadores de foco, lo cual será analizado en la sección </xsl:text>
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
<xsl:text>), así que les llamaremos palabras especiales de grado.</xsl:text>
</p>
			   <p>
<xsl:text>Primeramente, consideremos las formas positivas que modifican la frase nominal completa, como en </xsl:text>
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
<xsl:text>.</xsl:text>
</p>
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
<xsl:text>, los elementos especiales positivos de grado no se expresan como palabras independientes. Por el contrario, todos se unen a otra palabra de la frase nominal como </xsl:text>
<xsl:choose>
						<xsl:when test="//qp/@npDegreeType='proclitic'">proclíticos que se unen al inicio de cualquier palabra que comienza la frase nominal.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='enclitic'">enclíticos que se unen al final de cualquier palabra que termina la frase nominal.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='clitic'">clíticos que se unen al inicio de cualquier palabra que comienza la frase nominal o al final de cualquier palabra que termina la frase nominal.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='prefix'">prefijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='suffix'">sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='affix'">prefijos o sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					 </xsl:choose>
</p>
</xsl:if>
				  <xsl:if test="normalize-space(//qp/@npDegree)='some'">
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
<xsl:text>, algunos son palabras independientes pero algunos de los elementos especiales positivos de grado no se expresan como palabras independientes.  Por el contrario, algunos se unen a otra palabra de la frase nominal como </xsl:text>
<xsl:choose>
						   <xsl:when test="//qp/@npDegreeType='proclitic'">proclíticos que se unen al inicio de cualquier palabra que comienza la frase nominal.</xsl:when>
						   <xsl:when test="//qp/@npDegreeType='enclitic'">enclíticos que se unen al final de cualquier palabra que termina la frase nominal.</xsl:when>
						   <xsl:when test="//qp/@npDegreeType='clitic'">clíticos que se unen al inicio de cualquier palabra que comienza la frase nominal o al final de cualquier palabra que termina la frase nominal.</xsl:when>
						   <xsl:when test="//qp/@npDegreeType='prefix'">prefijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
						   <xsl:when test="//qp/@npDegreeType='suffix'">sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
						   <xsl:when test="//qp/@npDegreeType='affix'">prefijos o sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
						</xsl:choose>
<xsl:text>  Los elementos especiales positivos de grado que se expresan como palabras independientes se presentan </xsl:text>
<xsl:choose>
						   <xsl:when test="//qp/@npDegreePos='before'">antes</xsl:when>
						   <xsl:when test="//qp/@npDegreePos='after'">después</xsl:when>
						   <xsl:when test="//qp/@npDegreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
						   <xsl:when test="//qp/@npDegreePos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
						   <xsl:when test="//qp/@npDegreePos='beforeOrBoth'">antes o en ambos lados</xsl:when>
						   <xsl:when test="//qp/@npDegreePos='afterOrBoth'">después o en ambos lados</xsl:when>
						   <xsl:when test="//qp/@npDegreePos='both'">en ambos lados</xsl:when>
						   <xsl:when test="//qp/@npDegreePos='unknown'">_______</xsl:when>
						</xsl:choose>
<xsl:text> del resto de la frase nominal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeEither)='unrestricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
						   <xsl:text>Todas estas palabras pueden presentarse de cualquier lado de la frase nominal.</xsl:text>
						</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeEither)='restricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
						   <xsl:text>Hay restricciones en cuanto a cuáles de estas palabras pueden presentarse en cada lado de la frase nominal.  </xsl:text>
						</xsl:if>
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
<xsl:text>, los elementos especiales positivos de grado se expresan como palabras independientes que modifican la frase nominal completa.  Se presentan  </xsl:text>
<xsl:choose>
				  <xsl:when test="//qp/@npDegreePos='before'">antes</xsl:when>
				  <xsl:when test="//qp/@npDegreePos='after'">después</xsl:when>
				  <xsl:when test="//qp/@npDegreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
				  <xsl:when test="//qp/@npDegreePos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
				  <xsl:when test="//qp/@npDegreePos='beforeOrBoth'">antes o en ambos lados</xsl:when>
				  <xsl:when test="//qp/@npDegreePos='afterOrBoth'">después o en ambos lados</xsl:when>
				  <xsl:when test="//qp/@npDegreePos='both'">en ambos lados</xsl:when>
				  <xsl:when test="//qp/@npDegreePos='unknown'">_______</xsl:when>
			   </xsl:choose>
<xsl:text> del resto de la frase nominal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeEither)='unrestricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
				  <xsl:text>Todas estas palabras pueden presentarse de cualquier lado de la frase nominal.</xsl:text>
			   </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeEither)='restricted' and normalize-space(//qp/@npDegreePos)!='before' and normalize-space(//qp/@npDegreePos)!='after'">
				  <xsl:text>Hay restricciones en cuanto a cuáles de estas palabras pueden presentarse en cada lado de la frase nominal.  </xsl:text>
			   </xsl:if>
</p>
</xsl:if>
			<p>
<xsl:text>Algunos ejemplos de frases nominales positivas en </xsl:text>
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
			<example num="xAdjP.AdjQP.QPAll.16">
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
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.16.1</xsl:text>
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
<xsl:text>Cambiando el tema ahora al elemento negativo que siginifica </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> cuando modifica una frase nominal.  Observe que </xsl:text>
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

			<xsl:if test="normalize-space(//qp/@npDegreeNeg)='none'">
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
<xsl:text>,  parece que no hay ninguna manera en la lengua para expresar el significado de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> cuando está modificando a una frase nominal completa. </xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegreeNeg)='no'">
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
<xsl:text>, los elementos especiales negativos de grado no se expresan como palabras independientes. Por el contrario, todos se unen a otra palabra de la frase nominal como </xsl:text>
<xsl:choose>
				  <xsl:when test="//qp/@npDegreeType='proclitic'">proclíticos que se unen al inicio de cualquier palabra que comienza la frase nominal.</xsl:when>
				  <xsl:when test="//qp/@npDegreeType='enclitic'">enclíticos que se unen al final de cualquier palabra que termina la frase nominal.</xsl:when>
				  <xsl:when test="//qp/@npDegreeType='clitic'">clíticos que se unen al inicio de cualquier palabra que comienza la frase nominal o al final de cualquier palabra que termina la frase nominal.</xsl:when>
				  <xsl:when test="//qp/@npDegreeType='prefix'">prefijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
				  <xsl:when test="//qp/@npDegreeType='suffix'">sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
				  <xsl:when test="//qp/@npDegreeType='affix'">prefijos o sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
			   </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>

			<xsl:if test="normalize-space(//qp/@npDegreeNeg)='some'">
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
<xsl:text>, algunos son palabras independientes pero algunos de los elementos especiales negativos de grado no se expresan como palabras independientes.  Por el contrario, algunos se unen a otra palabra de la frase nominal como </xsl:text>
<xsl:choose>
					 <xsl:when test="//qp/@npDegreeNegType='proclitic'">proclíticos que se unen al inicio de cualquier palabra que comienza la frase nominal.</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegType='enclitic'">enclíticos que se unen al final de cualquier palabra que termina la frase nominal.</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegType='clitic'">clíticos que se unen al inicio de cualquier palabra que comienza la frase nominal o al final de cualquier palabra que termina la frase nominal.</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegType='prefix'">prefijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegType='suffix'">sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegType='affix'">prefijos o sufijos que se unen al sustantivo principal de la frase nominal.</xsl:when>
				  </xsl:choose>
<xsl:text>  Los elementos especiales negativos de grado que se expresan como palabras independientes se presentan </xsl:text>
<xsl:choose>
					 <xsl:when test="//qp/@npDegreeNegPos='before'">antes</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegPos='after'">después</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegPos='afterOrBoth'">después o en ambos lados</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegPos='both'">en ambos lados</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegPos='unknown'">_______</xsl:when>
				  </xsl:choose>
<xsl:text> del resto de la frase nominal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='unrestricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
					 <xsl:text>Todas estas palabras pueden presentarse de cualquier lado de la frase nominal.</xsl:text>
				  </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='restricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
					 <xsl:text>Hay restricciones en cuanto a cuáles de estas palabras pueden presentarse en cada lado de la frase nominal.  </xsl:text>
				  </xsl:if>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegreeNeg)='yes'">
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
<xsl:text>, los elementos especiales negativos de grado se expresan como palabras independientes que modifican la frase nominal completa.  Se presentan  </xsl:text>
<xsl:choose>
				  <xsl:when test="//qp/@npDegreeNegPos='before'">antes</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='after'">después</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='afterOrBoth'">después o en ambos lados</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='both'">en ambos lados</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='unknown'">_______</xsl:when>
			   </xsl:choose>
<xsl:text> del resto de la frase nominal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='unrestricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
				  <xsl:text>Todas estas palabras pueden presentarse de cualquier lado de la frase nominal.</xsl:text>
			   </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='restricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
				  <xsl:text>Hay restricciones en cuanto a cuáles de estas palabras pueden presentarse en cada lado de la frase nominal.  </xsl:text>
			   </xsl:if>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none'">
<p>
<xsl:text>Algunos ejemplos de las frases nominales negativas (no incluyendo los elementos positivos especiales de grado) en </xsl:text>
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
			<example num="xAdjP.AdjQP.QPAll.30">
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
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.30.1</xsl:text>
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

			<xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none' and normalize-space(//qp/@npDegreeNegCooccur)='yes'">
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
<xsl:text> se presentan con las palabras especiales positivas de grado en una sola frase nominal. </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreeNeg)='some'">
<xsl:text> Las palabras especiales negativas de grado se presentan </xsl:text>
			   <xsl:choose>
				  <xsl:when test="//qp/@npDegreeNegPos='before'">antes</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='after'">después</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='afterOrBoth'">después o en ambos lados</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='both'">en ambos lados</xsl:when>
				  <xsl:when test="//qp/@npDegreeNegPos='unknown'">_______</xsl:when>
			   </xsl:choose>
			   <xsl:text> del resto de la frase nominal (incluyendo las palabras especiales positivas de grado).  </xsl:text>
</xsl:if>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none' and normalize-space(//qp/@npDegreeNegCooccur)='yes'">
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
			<xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none' and normalize-space(//qp/@npDegreeNegCooccur)='yes'">
<example num="xAdjP.AdjQP.QPAll.36">
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
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPAll.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPAll.36.1</xsl:text>
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

			<xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@npDegreeClassifier)='yes'">
<p>
<xsl:text>El cuadro siguiente presenta cómo los elementos especiales de grado se expresan en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Las formas en el cuadro son los raíces; cada uno puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//qp/@npDegreeClassifier)!='yes'">
<p>
<xsl:text>El cuadro siguiente presenta cómo los elementos especiales de grado se expresan en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
</xsl:if>

			<example num="xAdjP.AdjQP.QPAll.42">
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
					<xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none'">
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
<xsl:text>, que no permiten ningún otro artículo, demostrativo o poseedor en la frase nominal.</xsl:text>
</p>
			  <p>
<xsl:text>Algunos ejemplos en español en las frases incluyendo los cuantificadores positivos son </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>algunos niños tristes</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>casi cada niña que vea</langData>
<xsl:text>.  Ejemplos que no son gramaticales, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>*casi el muchacho malo</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>*estos algunos muchachos</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>*mis algunos hijos tristes</langData>
<xsl:text> muestran que estos cuantificadores no se presentan con los artículos, demostrativos ni poseedores.  Observe que un ejemplo como  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>algunos de los niños</langData>
<xsl:text> es gramatical, pero es un ejemplo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>algunos</langData>
<xsl:text> como el núcleo de la frase nominal, con una frase partitiva </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>de los niños</langData>
<xsl:text> modificándola, cuál fue cubierto en la sección </xsl:text>
<sectionRef sec="sPron" />
<xsl:text>.  Porque se presentan en el lugar de artículos, demostrativos y poseedores, trataremos estos cuantificadores como determinantes que modifican los sustantivos sólos.</xsl:text>
</p>

			  <xsl:if test="normalize-space(//qp/@determiner)='no' or normalize-space(//qp/@determiner)='attaches'">
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
<xsl:text> no hay una categoría independiente de los cuantificadores que funciona al igual que el único determinante de la frase nominal. Los conceptos positivos de </xsl:text>
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
<xsl:text> considerado anteriormente o al igual que los cuantificadores que pueden presentarse con los artículos, los demostrativos y/o los poseedores que se analizarán en la siguiente sección.</xsl:text>
</p>
</xsl:if>

			  <xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='some'">
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
<xsl:text> se encuentran cuantificadores positivos que funcionan al igual que el único determinante de la frase nominal. Estos determinantes del cuantificador se presentan  </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@determinerPos='before'">antes</xsl:when>
					<xsl:when test="//qp/@determinerPos='after'">después</xsl:when>
					<xsl:when test="//qp/@determinerPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					<xsl:when test="//qp/@determinerPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
					<xsl:when test="//qp/@determinerPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
					<xsl:when test="//qp/@determinerPos='afterOrBoth'">después o en ambos lados</xsl:when>
					<xsl:when test="//qp/@determinerPos='both'">en ambos lados</xsl:when>
					<xsl:when test="//qp/@determinerPos='unknown'">_______</xsl:when>
				 </xsl:choose>
<xsl:text> del sustantivo principal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@determinerEither)='unrestricted' and normalize-space(//qp/@determinerPos)!='before' and normalize-space(//qp/@determinerPos)!='after'">
					<xsl:text>Todos los determinantes del cuantificador pueden presentarse de cualquier lado del sustantivo.</xsl:text>
				 </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@determinerEither)='restricted' and normalize-space(//qp/@determinerPos)!='before' and normalize-space(//qp/@determinerPos)!='after'">
					<xsl:text>Hay restricciones en cuanto a cuáles de los determinantes del cuantificador pueden presentarse en cada lado del sustantivo.</xsl:text>
				 </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='some'">
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
			  <xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='some'">
<example num="xAdjP.AdjQP.QPDeterminers.14">
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
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPDeterminers.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPDeterminers.14.1</xsl:text>
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

			  <p>
<xsl:text>Cambiando el tema ahora al cuantificador negativo que siginifica </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún</langData>
<xsl:text> cuando es el único determinante en la frase nominal. Algunos ejemplos son </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún perro negro</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ninguna hija</langData>
<xsl:text>.  Observe que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún</langData>
<xsl:text> contraste con </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> de la sección anterior en que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún</langData>
<xsl:text> no puede presentarse con los artículos, demostrativos o poseedores, como mostrado en los ejemplos no gramaticales </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>*ningún el niño</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>*ningún este libro</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>*ningún mi perro</langData>
<xsl:text>.</xsl:text>
</p>
			  <xsl:if test="normalize-space(//qp/@determinerNeg)='no'">
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
<xsl:text> no hay una categoría independiente de los cuantificadores negativos que funciona al igual que el único determinante de la frase nominal. La negación de una frase nominal es expresa solamente con los elementos especiales de grado. El concepto negativo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún</langData>
<xsl:text> es expresado como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> en la sección anterior .</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//qp/@determinerNeg)='attaches'">
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
<xsl:text> no hay una categoría independiente de los cuantificadores negativos que funciona al igual que el único determinante de la frase nominal.  El concepto negativo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún</langData>
<xsl:text> es expresado por un clítico o afijo que se une a una palabra en la frase nominal, como explicó para </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> en la sección anterior.</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//qp/@determinerNeg)='none' and normalize-space(//qp/@npDegreeNeg)='none'">
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

			  <xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
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
<xsl:text> se encuentran cuantificadores negativos que funcionan al igual que el único determinante de la frase nominal.Estos determinantes del cuantificador se presentan  </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@determinerNegPos='before'">antes</xsl:when>
					<xsl:when test="//qp/@determinerNegPos='after'">después</xsl:when>
					<xsl:when test="//qp/@determinerNegPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					<xsl:when test="//qp/@determinerNegPos='eitherOrBoth'">de cualquier lado o en ambo lados</xsl:when>
					<xsl:when test="//qp/@determinerNegPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
					<xsl:when test="//qp/@determinerNegPos='afterOrBoth'">después o en ambos lados</xsl:when>
					<xsl:when test="//qp/@determinerNegPos='both'">en ambos lados</xsl:when>
					<xsl:when test="//qp/@determinerNegPos='unknown'">_______</xsl:when>
				 </xsl:choose>
<xsl:text> del sustantivo principal.  </xsl:text>
<xsl:if test="normalize-space(//qp/@determinerNegEither)='unrestricted' and normalize-space(//qp/@determinerNegPos)!='before' and normalize-space(//qp/@determinerNegPos)!='after'">
					<xsl:text>Todos los determinantes del cuantificador pueden presentarse de cualquier lado del sustantivo.</xsl:text>
				 </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@determinerNegEither)='restricted' and normalize-space(//qp/@determinerNegPos)!='before' and normalize-space(//qp/@determinerNegPos)!='after'">
					<xsl:text>Hay restricciones en cuanto a cuáles de los determinantes del cuantificador pueden presentarse en cada lado del sustantivo.</xsl:text>
				 </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>

			  <xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
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
			  <xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<example num="xAdjP.AdjQP.QPDeterminers.28">
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

			  <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@determinerClassifier)='yes' and normalize-space(//qp/@determiner)='yes' or normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@determinerClassifier)='yes' and normalize-space(//qp/@determiner)='some' or normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@determinerClassifier)='yes' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@determinerClassifier)='yes' and normalize-space(//qp/@determinerNeg)='some'">
<p>
<xsl:text>El cuadro siguiente presenta cómo los cuantificadores que funcionan al igual que el único determinante de la frase nomina se expresan en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Las formas en el cuadro son los raíces; cada uno puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
			  <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' and normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determinerClassifier)!='yes' and normalize-space(//qp/@determiner)='yes' or normalize-space(//typology/@classifier)!='yesAgr' and normalize-space(//qp/@determiner)='some' or normalize-space(//qp/@determinerClassifier)!='yes' and normalize-space(//qp/@determiner)='some' or normalize-space(//typology/@classifier)!='yesAgr' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerClassifier)!='yes' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//typology/@classifier)!='yesAgr' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//qp/@determinerClassifier)!='yes' and normalize-space(//qp/@determinerNeg)='some'">
<p>
<xsl:text>El cuadro siguiente presenta cómo los cuantificadores que funcionan al igual que el único determinante de la frase nomina se expresan en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
</xsl:if>

				<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='some'">
<example num="xAdjP.AdjQP.QPDeterminers.34">
<table border="1">
						<tr>
							<th>Tipo</th>
							<th>Determinantes del cuantificador</th>
							<th>Glosa</th>
						</tr>
						<xsl:if test="normalize-space(//qp/@determiner)='yes' or normalize-space(//qp/@determiner)='some'">
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
						<xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
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
				<xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
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
				 <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@quantifierClassifier)='yes'">
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
<xsl:text> se encuentran los siguientes cuantificadores de este tipo.  Las formas en el cuadro son los raíces; cada uno puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
				 <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//qp/@quantifierClassifier)!='yes'">
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
</xsl:if>

				 <example num="xAdjP.AdjQP.QPOtherQuantifiers.10">
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
						 <xsl:when test="//qp/@degreePos='beforeOrBoth'">antes o en ambos lados</xsl:when>
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
</p>
</xsl:if>
				 <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@degreeClassifier)='yes' and normalize-space(//qp/@degree)='yes'">
<p>
<xsl:text>Los raíces para las palabras de grado que puede modificar los cuantificadores en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son mostrado aquí.  Cada uno puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
				 <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' and normalize-space(//qp/@degree)='yes' or normalize-space(//qp/@degreeClassifier)!='yes' and normalize-space(//qp/@degree)='yes'">
<p>
<xsl:text>Las palabras de grado que puede modificar los cuantificadores en </xsl:text>
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
<example num="xAdjP.AdjQP.QPOtherQuantifiers.20">
<table border="1">
					   <tr>
						  <th>Palabras de grado que pueden modificar cuantificadores</th>
						  <th>Glosa</th>
					   </tr>
					   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//qp/degreeWordExample),'.','')" />
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
				 <xsl:if test="normalize-space(//qp/@degree)='yes'">
<p>
<xsl:text>Algunos ejemplos con una palabra de grado modificando un cuantificador son:</xsl:text>
</p>
</xsl:if>
				 <xsl:if test="normalize-space(//qp/@degree)='yes'">
<example num="xAdjP.AdjQP.QPOtherQuantifiers.24">
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
<xsl:with-param name="sExNumber">xAdjP.AdjQP.QPOtherQuantifiers.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.AdjQP.QPOtherQuantifiers.24.1</xsl:text>
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
<xsl:text>Algunas lenguas tienen solamente una categoría, los artículos o los demostrativos. Un numero pequeño de lenguas pueden no tener ningún tipo expresado como palabras independientes. </xsl:text>
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
				<xsl:text></xsl:text>
				 <xsl:if test="normalize-space(//np/@artAndDem)!='no' and normalize-space(//np/@artCase)='no'">
					 <xsl:text> no</xsl:text>
				 </xsl:if>
				 <xsl:text> se indican para el caso.</xsl:text>
			 </xsl:if>
<xsl:text></xsl:text>
</p>

		<xsl:if test="normalize-space(//np/@artAndDem)='article'">
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
			  <xsl:when test="//np/@artDefOnly='no'"> ambos los artículos definidos e indefinidos son palabras independientes.</xsl:when>
			  <xsl:when test="//np/@artDefOnly='yes'"> solamente los artículos definidos son palabras independientes; los sustantivos indefinidos no son marcados.</xsl:when>
		   </xsl:choose>
<xsl:text>  También, hay </xsl:text>
<xsl:choose>
			  <xsl:when test="//np/@artPl='no'">solamente un sistema de artículos que se usa con ambos sustantivos singulares y plurales.</xsl:when>
			  <xsl:when test="//np/@artPl='yes'">sistemas de artículos para singular y plural de modo que pueden concordar con el sustantivo.</xsl:when>
		   </xsl:choose>
</p>
</xsl:if>

		<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='no' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>Los artículos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>son:</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Los raíces de los artículos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada una puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>Los artículos definidos en </xsl:text>
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
		<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Los raíces de los artículos definidos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada una puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.20">
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
<xsl:text>ECSRIBA LA GLOSA</xsl:text>
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
<xsl:text>ECSRIBA LA GLOSA</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
		   </table>
</example>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='yes' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>Los artículos en </xsl:text>
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
		<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Los raíces de los artículos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada una puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='yes' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>Los artículos definidos en </xsl:text>
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
		<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Los raíces de los artículos definidos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada una puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.30">
<table border="1">
			  <tr>
				 <th>Número</th>
				 <th>Artículos</th>
				 <th>Glosa</th>
			  </tr>
			  <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/articleSgExample),'.','')" />
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<xsl:value-of select="translate(string(//np/articlePlExample),'.','')" />
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
<td align="left">
<xsl:text>plural</xsl:text>
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
<td align="left">
<xsl:text>plural</xsl:text>
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
</xsl:if>

		<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative'">
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
<xsl:text>, hay </xsl:text>
<xsl:choose>
			  <xsl:when test="//np/@demPl='no'">solamente un sistema de demostrativos que se usa con ambos sustantivos singulares y plurales.</xsl:when>
			  <xsl:when test="//np/@demPl='yes'">sistemas de demostrativos para singular y plural de modo que pueden concordar con el sustantivo.</xsl:when>
		   </xsl:choose>
</p>
</xsl:if>

		<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>Los demostrativos en </xsl:text>
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
		<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Los raíces de los demostrativos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada una puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPl)='no'">
<example num="xAdjP.AdjArtDem.38">
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

		<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPl)='yes'">
<example num="xAdjP.AdjArtDem.40">
<table border="1">
			  <tr>
				 <th>Número</th>
				 <th>Demostrativos</th>
				 <th>Glosa</th>
			  </tr>
			  <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/demonstrativeSgExample),'.','')" />
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<xsl:value-of select="translate(string(//np/demonstrativePlExample),'.','')" />
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
<td align="left">
<xsl:text>plural</xsl:text>
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
<td align="left">
<xsl:text>plural</xsl:text>
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
</xsl:if>

		<xsl:if test="normalize-space(//np/@artAndDem)='both'">
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
			  <xsl:when test="//np/@artDefOnly='no'"> ambos los artículos definidos e indefinidos son palabras independientes.</xsl:when>
			  <xsl:when test="//np/@artDefOnly='yes'"> solamente los artículos definidos son palabras undependientes; los sustantivos indefinidos no son marcados.</xsl:when>
		   </xsl:choose>
<xsl:text>  También, hay </xsl:text>
<xsl:choose>
			  <xsl:when test="//np/@artPl='no'">solamente un sistema de artículos que se usa con ambos sustantivos singulares y plurales.</xsl:when>
			  <xsl:when test="//np/@artPl='yes'">sistemas de artículos para singular y plural de modo que pueden concordar con el sustantivo.</xsl:when>
		   </xsl:choose>
</p>
</xsl:if>

		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='no' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>Los artículos en </xsl:text>
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
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Los raíces de los artículos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada una puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>Los artículos definidos en </xsl:text>
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
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Los raíces de los artículos definidos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada una puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artPl)='no'">
<example num="xAdjP.AdjArtDem.52">
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
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='yes' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>Los artículos en </xsl:text>
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
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Los raíces de los artículos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada una puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='yes' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>Los artículos definidos en </xsl:text>
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
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Los raíces de los artículos definidos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada una puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artPl)='yes'">
<example num="xAdjP.AdjArtDem.62">
<table border="1">
			  <tr>
				 <th>Número</th>
				 <th>Artículos</th>
				 <th>Glosa</th>
			  </tr>
			  <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/articleSgExample),'.','')" />
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<xsl:value-of select="translate(string(//np/articlePlExample),'.','')" />
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
<td align="left">
<xsl:text>plural</xsl:text>
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
<td align="left">
<xsl:text>plural</xsl:text>
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
</xsl:if>

		<xsl:if test="normalize-space(//np/@artAndDem)='both'">
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
<xsl:text>, hay </xsl:text>
<xsl:choose>
			  <xsl:when test="//np/@demPl='no'">solamente un sistema de demostrativos que se usa con ambos sustantivos singulares y plurales.</xsl:when>
			  <xsl:when test="//np/@demPl='yes'">sistemas de demostrativos para singular y plural de modo que pueden concordar con el sustantivo.</xsl:when>
		   </xsl:choose>
</p>
</xsl:if>

		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>Los demostrativos en </xsl:text>
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
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>Los raíces de los demostrativos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada una puede presentarse con su clasificador apropriado.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demPl)='no'">
<example num="xAdjP.AdjArtDem.70">
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

		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demPl)='yes'">
<example num="xAdjP.AdjArtDem.72">
<table border="1">
			  <tr>
				 <th>Número</th>
				 <th>Demostrativos</th>
				 <th>Glosa</th>
			  </tr>
			  <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/demonstrativeSgExample),'.','')" />
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<xsl:value-of select="translate(string(//np/demonstrativePlExample),'.','')" />
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
<td align="left">
<xsl:text>plural</xsl:text>
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
<td align="left">
<xsl:text>plural</xsl:text>
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
