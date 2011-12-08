<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="advp">
	<section1 id="sAdvP">
		<secTitle>Los adverbios y frases del adverbio</secTitle>
		<p>
<xsl:text>Los adverbios expresan cuatro tipos básicos de información:</xsl:text>
</p>
		<ul>
			<li>
				<xsl:text> tiempo,</xsl:text>
			</li>
			<li>
				<xsl:text> lugar,</xsl:text>
			</li>
			<li>
				<xsl:text>manera, y</xsl:text>
			</li>
			<li>
				<xsl:text>razón o propósito.</xsl:text>
			</li>
		</ul>
		<p>
<xsl:text>Estos tipos tienen diversas características en cuanto a qué posiciones pueden presentarse y cómo pueden ser modificados. Cada tipo será considerado en su orden correspondiente.
</xsl:text>
</p>
		<p>
<xsl:text>Los idiomas tienen normalmente palabras de grado que puedan modificar por lo menos algunos tipos de adverbios.  En </xsl:text>
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
				<xsl:when test="//advp/@degree='no'">, sin embargo, no hay ningún palabra de grado que modifica adverbios.</xsl:when>
				<xsl:when test="//advp/@degree='yes'"> hay tales palabras de grado.</xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//advp/@degree)='yes'">
				<xsl:text> Estas palabras de grado se presentan </xsl:text>
				<xsl:choose>
					<xsl:when test="//advp/@degreePos='before'">antes</xsl:when>
					<xsl:when test="//advp/@degreePos='after'">después</xsl:when>
					<xsl:when test="//advp/@degreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					<xsl:when test="//advp/@degreePos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
					<xsl:when test="//advp/@degreePos='beforeOrBoth'">antes o en ambos lados</xsl:when>
					<xsl:when test="//advp/@degreePos='afterOrBoth'">después o en ambos lados</xsl:when>
					<xsl:when test="//advp/@degreePos='both'">en ambos lados</xsl:when>
					<xsl:when test="//advp/@degreePos='unknown'">_______</xsl:when>
				</xsl:choose>
				<xsl:text> del adverbio.  </xsl:text>
				<xsl:choose>
					<xsl:when test="//advp/@degreeSet='unrestricted'">Las palabras de grado pueden modificar cualquier tipo de adverbio.</xsl:when>
					<xsl:when test="//advp/@degreeSet='exceptReason'">Las palabras de grado pueden modificar adverbios de tiempo, de lugar, y de manera, pero los adverbios de razón o propósito no se modifican.</xsl:when>
					<xsl:when test="//advp/@degreeSet='restricted'">Hay restricciones en cuanto a cuáles de las palabras de grado pueden modificar a cada tipo de adverbio.</xsl:when>
				</xsl:choose>
				<xsl:text></xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
</p>
		<section2 id="sAdvPTemporal">
			<secTitle>Adverbios de tiempo</secTitle>
			<p>
<xsl:text>Los adverbios de tiempo son las siguientes palabras en español: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ya</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>entonces</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pronto</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ahora</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>luego</langData>
<xsl:text>, y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>siempre</langData>
<xsl:text>.  Algunos ejemplos incluyendo modificadores con las palabras de grado son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>muy pronto</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>más luego</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente ahora</langData>
<xsl:text>.  Muchos idiomas también tienen un adverbio negativo de tiempo, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> en español.</xsl:text>
</p>
			<p>
<xsl:text>Algunos ejemplos de los adverbios positivos de tiempo y de cualquier palabra de grado que puedan modificarlos en </xsl:text>
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
			<example num="xAdvP.AdvPTemporal.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/temporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/temporalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/temporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/temporalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.8.1</xsl:text>
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
			<xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
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
<xsl:text>, la idea negativa de tiempo </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'nunca'</xsl:text>
</gloss>
<xsl:text> se expresa con uno o más afijos verbales, en lugar de palabras independientes.   Algunos ejemplos de afijos unidos a los verbos son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<example num="xAdvP.AdvPTemporal.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negTemporalAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negTemporalAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.12.1</xsl:text>
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
			<xsl:if test="normalize-space(//advp/@negTemporalType)='verb'">
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
<xsl:text>, hay solamente un afijo negativo verbal, pero puede presentarse con adverbios positivos de tiempo para dar un significado negativo de tiempo. Algunos ejemplos de adverbios de tiempo con un verbo negativo son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negTemporalType)='word'">
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
<xsl:text>, la idea negativa de tiempo </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'nunca'</xsl:text>
</gloss>
<xsl:text> se expresa con una o más palabras independientes.  Algunos ejemplos son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negTemporalType)='word' or normalize-space(//advp/@negTemporalType)='verb'">
<example num="xAdvP.AdvPTemporal.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negTemporalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negTemporalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.18.1</xsl:text>
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
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sNegAdverb" />
<xsl:text> para considerar otros ejemplos de expresiones negativas de tiempo en oraciones completas.</xsl:text>
</p>
			<p>
<xsl:text>El tiempo de una oración también se puede expresar por otros tipos de palabras o de frases, por ejemplo: frases nominales </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ayer</langData>
<xsl:text>,
</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>anoche</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el próximo año</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mañana</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hace mucho tiempo</langData>
<xsl:text>; frases preposicionales </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>durante mucho tiempo</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en poco tiempo</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>a las diez por la noche</langData>
<xsl:text>; y
					cláusulas adverbiales </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mientras que usted está trabajando</langData>
<xsl:text>, y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cuando llegó Susana</langData>
<xsl:text>.  Estas frases se presentan en las mismas posiciones que los adverbios de tiempo, normalmente inicialmente o finalmente en la cláusula. Véase la sección </xsl:text>
<sectionRef sec="sNP" />
<xsl:text> para la estructura de las frases nominales y la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> para el análisis de las frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='before'">preposicionales y posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicionales y/o posposicionales</xsl:when>
				</xsl:choose>
<xsl:text>.  Véase también la sección </xsl:text>
<sectionRef sec="sAdvClTemporal" />
<xsl:text> para considerar ejemplos de cláusulas adverbiales de tiempo. </xsl:text>
</p>
		</section2>
		<section2 id="sAdvPLocative">
			<secTitle>Adverbios de lugar</secTitle>
			<p>
<xsl:text>Los adverbios de lugar son las siguientes palabras en español: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>aquí</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>allí</langData>
<xsl:text>, y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>allá</langData>
<xsl:text>.  Los adverbios de lugar se pueden modificar por </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mero o mismo</langData>
<xsl:text>, como en: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente aquí</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>aquí mismo</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>allí mero</langData>
<xsl:text>.  Muchos idiomas también tienen un adverbio negativo de lugar que significa </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'en ninguna parte'</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Algunos ejemplos de los adverbios positivos de lugar y de cualquier palabra de grado que pueda modificar en</xsl:text>
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
			<example num="xAdvP.AdvPLocative.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/locativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/locativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/locativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/locativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.8.1</xsl:text>
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
			<xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
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
<xsl:text>, la idea negativa de lugar </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'en ninguna parte'</xsl:text>
</gloss>
<xsl:text> se expresa con uno o más afijos verbales, en lugar de palabras independientes. Algunos ejemplos de afijos unidos a los verbos son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<example num="xAdvP.AdvPLocative.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negLocativeAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negLocativeAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.12.1</xsl:text>
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
			 <xsl:if test="normalize-space(//advp/@negLocativeType)='verb'">
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
<xsl:text>, hay solamente un afijo negativo verbal, pero puede presentarse con adverbios positivos de lugar para dar un significado negativo de lugar. Algunos ejemplos de los adverbios de lugar con un verbo negativo son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='word'">
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
<xsl:text>, la idea negativa de lugar </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'en ninguna parte'</xsl:text>
</gloss>
<xsl:text> se expresa con una o más palabras independientes. Los ejemplos son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negLocativeType)='word' or normalize-space(//advp/@negLocativeType)='verb'">
<example num="xAdvP.AdvPLocative.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negLocativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negLocativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.18.1</xsl:text>
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
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sNegAdverb" />
<xsl:text> para considerar otros ejemplos de expresiones negativas de lugar en oraciones completas.</xsl:text>
</p>
			<p>
<xsl:text>El lugar también se puede expresar con una frase preposicional, por ejemplo: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en las montañas</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hasta San José</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>a través del río</langData>
<xsl:text>.  Muchos idiomas permiten sólo una frase nominal, la cual consiste en un nombre propio o una descripción del lugar. Las expresiones del lugar normalmente pueden presentarse al inicio o al final en una cláusula, o como complementos para verbos de movimiento. Véase la sección </xsl:text>
<sectionRef sec="sIPMotion" />
<xsl:text> para considerar otros ejemplos con verbos del movimiento.
</xsl:text>
</p>
		</section2>
		<section2 id="sAdvPManner">
			<secTitle>Adverbios de manera</secTitle>
			<p>
<xsl:text>Los adverbios de manera directamente modifican el verbo y generalmente terminan con el sufijo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-mente</langData>
<xsl:text> en español. Estos adverbios de manera se pueden modificar con </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>muy</langData>
<xsl:text>
y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tan</langData>
<xsl:text>, como en: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>muy rápidamente</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tan lentamente</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>muy bien</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Algunos ejemplos de  adverbios de manera en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> y de cualquier palabra de grado que pueda modificar son:
</xsl:text>
</p>
			<example num="xAdvP.AdvPManner.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/mannerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/mannerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/mannerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/mannerExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPManner.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPManner.8.1</xsl:text>
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
			<xsl:if test="normalize-space(//advp/@mannerType)='affix'">
<p>
<xsl:text>Los adverbios de manera en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son todos escritos como afijos en el verbo, en lugar de como palabras independientes.</xsl:text>
</p>
</xsl:if>
		</section2>
		<section2 id="sAdvPReason">
			<secTitle>Adverbios que expresan razón o propósito</secTitle>
			<p>
<xsl:text>Los adverbios que expresan razón o propósito son los siguientes: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por lo tanto</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pues</langData>
<xsl:text>.  Estos adverbios no permiten modificadores en español.  La razón o el propósito también se puede expresar con una cláusula adverbial empezando con </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>porque</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>desde que</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en orden que</langData>
<xsl:text>.  Estas frases o cláusulas adverbiales se presentan al inicio o al final en la oración.</xsl:text>
</p>
			<p>
<xsl:text>Algunos ejemplos de los adverbios que expresan razón o propósito o de las cláusulas adverbiales en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, incluidos en oraciones completas son:
</xsl:text>
</p>
			<example num="xAdvP.AdvPReason.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/reasonExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/reasonExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/reasonExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/reasonExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPReason.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPReason.8.1</xsl:text>
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
<xsl:text>La estructura de las cláusulas adverbiales será analizada en la sección </xsl:text>
<sectionRef sec="sAdvClReason" />
<xsl:text>.  La razón o el propósito también se pueden expresar por una frase preposicional, por ejemplo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por esta razón</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en propósito</langData>
<xsl:text>.  Tales frases se analizan en la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>.
</xsl:text>
</p>
		</section2>
	</section1>


































</xsl:template>
</xsl:stylesheet>
