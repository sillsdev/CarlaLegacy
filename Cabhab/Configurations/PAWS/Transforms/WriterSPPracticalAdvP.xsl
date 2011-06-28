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
<xsl:text>Estos tipos tienen diversas características en cuanto a qué posiciones pueden ocupar y cómo pueden ser modificados. Cada tipo será cubierto en turno.
</xsl:text>
</p>
		<p>
<xsl:text>Los idiomas tienen normalmente palabras del grado que puedan modificar por lo menos algunos tipos de adverbios.  </xsl:text>
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
				<xsl:when test="//advp/@degree='no'"> no tiene cualquiera palabra del grado, sin embargo.</xsl:when>
				<xsl:when test="//advp/@degree='yes'"> tiene tales palabras del grado.</xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//advp/@degree)='yes'">
				<xsl:text> Estas palabras del grado ocurren </xsl:text>
				<xsl:choose>
					<xsl:when test="//advp/@degreePos='before'">antes</xsl:when>
					<xsl:when test="//advp/@degreePos='after'">después</xsl:when>
					<xsl:when test="//advp/@degreePos='either'">de cualquier lado (pero no ambos lados)</xsl:when>
					<xsl:when test="//advp/@degreePos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
					<xsl:when test="//advp/@degreePos='beforeOrBoth'">antes o en ambos lados</xsl:when>
					<xsl:when test="//advp/@degreePos='afterOrBoth'">después o en ambos lados</xsl:when>
					<xsl:when test="//advp/@degreePos='both'">en ambos lados</xsl:when>
					<xsl:when test="//advp/@degreePos='unknown'">_______</xsl:when>
				</xsl:choose>
				<xsl:text> del adverbio.  </xsl:text>
				<xsl:choose>
					<xsl:when test="//advp/@degreeSet='unrestricted'">Las palabras del grado pueden modificar cualquier tipo de adverbio.</xsl:when>
					<xsl:when test="//advp/@degreeSet='exceptReason'">Las palabras del grado pueden modificar temporals, locatives, y adverbios de la manera, pero los adverbios de la razón o del propósito no se modifican.</xsl:when>
					<xsl:when test="//advp/@degreeSet='restricted'">Hay grupos distintos de las palabras del grado que pueden modificar cada tipo de adverbio.</xsl:when>
				</xsl:choose>
				<xsl:text></xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
</p>
		<section2 id="sAdvPTemporal">
			<secTitle>Los adverbios temporales</secTitle>
			<p>
<xsl:text>Los adverbios temporales incluyen las palabras españolas: </xsl:text>
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
<xsl:text>.  Los ejemplos incluyendo modificantes de la palabra del grado son: </xsl:text>
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
<xsl:text>.  Muchos idiomas también tienen un adverbio temporal negativo, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> en español.</xsl:text>
</p>
			<p>
<xsl:text>Los ejemplos de de los adverbios temporales positivos y de cualquier palabra del grado que puedan modificarlos en </xsl:text>
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
			<example num="xAdvP.AdvPTemporal.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/temporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/temporalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/temporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/temporalExample)" />
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
			<xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
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
<xsl:text>, la idea temporal negativa de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'nunca'</xsl:text>
</gloss>
<xsl:text> es expresado por uno o más afijos verbales, algo que por palabras separadas.   Los ejemplos de los afijos juntados a los verbos incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<example num="xAdvP.AdvPTemporal.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/negTemporalAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/negTemporalAffixExample)" />
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
			<xsl:if test="normalize-space(//advp/@negTemporalType)='verb'">
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
<xsl:text>, hay solamente un afijo negativo verbal, pero puede ocurrir con adverbios temporales positivos para dar un significado temporal negativo. Los ejemplos de adverbios temporales con un verbo negativo incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negTemporalType)='word'">
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
<xsl:text>, la idea temporal negativa de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'nunca'</xsl:text>
</gloss>
<xsl:text> es expresado por una o más palabras separadas.  Los ejemplos incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negTemporalType)='word' or normalize-space(//advp/@negTemporalType)='verb'">
<example num="xAdvP.AdvPTemporal.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/negTemporalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/negTemporalExample)" />
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
			<p>
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sNegAdverb" />
<xsl:text> para los ejemplos de las expresiones temporales negativas en oraciones completos.</xsl:text>
</p>
			<p>
<xsl:text>El elemento del tiempo de una oración se puede también expresar por otros tipos de palabras o de frases, por ejemplo: frases nominales </xsl:text>
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
<xsl:text>, y</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cuando llegó Susana</langData>
<xsl:text>.  Estas frases ocurren en las mismas posiciones que los adverbios temporales, normalmente inicialmente o finalmente en la cláusula. Véase la sección </xsl:text>
<sectionRef sec="sNP" />
<xsl:text> para la estructura de frases nominales y la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> para la información sobre frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='before'">preposicionales y posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicionales y/o posposicionales</xsl:when>
				</xsl:choose>
<xsl:text>.  Véase también la sección </xsl:text>
<sectionRef sec="sAdvClTemporal" />
<xsl:text> para ejemplos de cláusulas adverbiales temporales. </xsl:text>
</p>
		</section2>
		<section2 id="sAdvPLocative">
			<secTitle>Los adverbios del lugar</secTitle>
			<p>
<xsl:text>Los adverbios del lugar incluyen las palabras españolas: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>aquí</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>allí</langData>
<xsl:text>, y</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>allá</langData>
<xsl:text>.  Los adverbios del lugar se pueden modificar por </xsl:text>
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
<xsl:text>.  Muchos idiomas también tienen un adverbio del lugar negativo que significado </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'en ninguna parte'</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Los ejemplos de los adverbios positivos del lugar y de cualquiera palabras del grado que puedan modificarlos en</xsl:text>
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
			<example num="xAdvP.AdvPLocative.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/locativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/locativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/locativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/locativeExample)" />
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
			<xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
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
<xsl:text>, la idea negativa del lugar de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'de ninguna parte'</xsl:text>
</gloss>
<xsl:text> es expresado por uno o más afijos verbales, algo que por palabras separadas. Los ejemplos de los afijos atados a los verbos incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<example num="xAdvP.AdvPLocative.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/negLocativeAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/negLocativeAffixExample)" />
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
			 <xsl:if test="normalize-space(//advp/@negLocativeType)='verb'">
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
<xsl:text>, hay solamente un afijo negativo verbal, pero puede ocurrir con adverbios positivos del lugar para dar un significado negativo del lugar. Los ejemplos de los adverbios del lugar con un verbo negativo incluyen:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='word'">
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
<xsl:text>, la idea negativa del lugar de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'de ninguna parte'</xsl:text>
</gloss>
<xsl:text> es expresado por una o más palabras separadas. Los ejemplos incluyen:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negLocativeType)='word' or normalize-space(//advp/@negLocativeType)='verb'">
<example num="xAdvP.AdvPLocative.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/negLocativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/negLocativeExample)" />
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
			<p>
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sNegAdverb" />
<xsl:text> para los ejemplos de las expresiones negativas del lugar en las oraciones completas.</xsl:text>
</p>
			<p>
<xsl:text>El lugar a menudo también es expresada por una frase preposicional, por ejemplo: </xsl:text>
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
<xsl:text>.  Muchos idiomas permiten apenas una frase nominal, consistiendo en un nombre propio o una descripción del lugar. Las expresiones del lugar pueden ocurrir normalmente inicialmente o finalmente en la cláusula, o como complementos para verbos de movimiento. Véase la sección </xsl:text>
<sectionRef sec="sIPMotion" />
<xsl:text> para los ejemplos con verbos del movimiento.
</xsl:text>
</p>
		</section2>
		<section2 id="sAdvPManner">
			<secTitle>Los adverbios de la manera</secTitle>
			<p>
<xsl:text>Los adverbios de la manera modifican directamente el verbo y terminan generalmente con </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-mente</langData>
<xsl:text> en español. Estos adverbios de la manera se pueden modificar por </xsl:text>
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
<xsl:text>Los ejemplos de los adverbios de la manera en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> y de cualquier palabra del grado que puedan modificarlos incluyen:
</xsl:text>
</p>
			<example num="xAdvP.AdvPManner.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/mannerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/mannerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/mannerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/mannerExample)" />
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
			<xsl:if test="normalize-space(//advp/@mannerType)='affix'">
<p>
<xsl:text>Los adverbios de la manera  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son todos escritos como afijos en el verbo, algo que siendo palabras separadas.</xsl:text>
</p>
</xsl:if>
		</section2>
		<section2 id="sAdvPReason">
			<secTitle>Los adverbios de la razón o del propósito</secTitle>
			<p>
<xsl:text>Los adverbios de la razón o del propósito incluyen </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por lo tanto</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pues</langData>
<xsl:text>.  Los adverbios de la razón o del propósito no permiten modificadores en español.  La razón o el propósito se puede también expresar por una cláusula adverbial empezando con </xsl:text>
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
<xsl:text>.  Estas frases o cláusulas adverbiales ocurren o inicialmente o finalmente en la oración.</xsl:text>
</p>
			<p>
<xsl:text>Los ejemplos de los adverbios de la razón o del propósito o de las cláusulas adverbiales en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/reasonExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/reasonExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/reasonExample)" />
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
<xsl:text>La estructura de las cláusulas adverbiales será tratada en la sección </xsl:text>
<sectionRef sec="sAdvClReason" />
<xsl:text>.  La razón o el propósito se puede también expresar por una frase preposicional, por ejemplo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por esta razón</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en propósito</langData>
<xsl:text>.  Tales frases se describen en la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>.
</xsl:text>
</p>
		</section2>
	</section1>


































</xsl:template>
</xsl:stylesheet>
