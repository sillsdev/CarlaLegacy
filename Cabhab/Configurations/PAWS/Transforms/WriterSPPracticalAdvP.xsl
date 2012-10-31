<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="advp">
	<section1 id="sAdvP">
		<secTitle>Los adverbios</secTitle>
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
				<xsl:text>modo, y</xsl:text>
			</li>
			<li>
				<xsl:text>razón o propósito.</xsl:text>
			</li>
		</ul>
		<p>
<xsl:text>Estos tipos tienen diversas características en cuanto a qué posiciones pueden presentarse y cómo pueden ser modificados. Cada tipo será considerado en su orden correspondiente.
</xsl:text>
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
<xsl:text>. Muchas lenguas también tienen un adverbio negativo de tiempo, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> en español.</xsl:text>
</p>
		   <p>
<xsl:text>Empezamos con los adverbios positivos de tiempo.</xsl:text>
</p>
		   <p>
<xsl:text>Los adverbios positivos de tiempo en </xsl:text>
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
		   <example num="xAdvP.AdvPTemporal.10">
<table border="1">
				 <tr>
					<th>Adverbios positivos de tiempo</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/temporalExample),'.','')" />
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

		   <p>
<xsl:text>En muchos idioimas los abverbios de tiempo puenden ser modificado con palabras de grado.  Algunos ejemplos en español son: </xsl:text>
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
<xsl:text>.  </xsl:text>
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
<xsl:text>, </xsl:text>
<xsl:choose>
				 <xsl:when test="//advp/@temporalDegree='yesBefore'">una palabra de grado puede presentarse antes del adverbio positivo de tiempo.</xsl:when>
				 <xsl:when test="//advp/@temporalDegree='yesAfter'">una palabra de grado puede presentarse después del adverbio positivo de tiempo.</xsl:when>
				 <xsl:when test="//advp/@temporalDegree='attaches'">hay un afijo o clítico que se une al adverbio positivo de tiempo para intensificarlo.</xsl:when>
				 <xsl:when test="//advp/@temporalDegree='noRedup'">no hay palabras de grado independientes, pero utiliza reduplicación para intensificar el significado del adverbio positivo de tiempo.</xsl:when>
				 <xsl:when test="//advp/@temporalDegree='no'">los adverbios positivos de tiempo no se modifican ni intensifican.</xsl:when>
			  </xsl:choose>
</p>

		   <xsl:if test="normalize-space(//advp/@temporalDegree)='yesBefore' or normalize-space(//advp/@temporalDegree)='yesAfter'">
<p>
<xsl:text>Las palabras de grado que pueden modificar un adverbio positivo de tiempo en </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@temporalDegree)='yesBefore' or normalize-space(//advp/@temporalDegree)='yesAfter'">
<example num="xAdvP.AdvPTemporal.18">
<table border="1">
				 <tr>
					<th>Palabras de grado</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/temporalDegreeExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@temporalDegree)='attaches'">
<p>
<xsl:text>Los afijos o clíticos de grado que pueden modificar un adverbio positivo de tiempo en </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@temporalDegree)='attaches'">
<example num="xAdvP.AdvPTemporal.22">
<table border="1">
				 <tr>
					<th>Afijos o clíticos de grado</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/temporalDegreeAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@temporalDegree)='noRedup'">
<p>
<xsl:text>Algunos ejemplos de los adverbios positivos de tiempo con reduplicación son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@temporalDegree)='noRedup'">
<example num="xAdvP.AdvPTemporal.26">
<table border="1">
				 <tr>
					<th>Adverbiois de tiempo con reduplicación</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/temporalDegreeRedupExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@temporalDegree)='attaches'">
<p>
<xsl:text>Algunos ejemplos de los afijos o clíticos de grado unido con un adverbio de tiempo son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@temporalDegree)='attaches'">
<example num="xAdvP.AdvPTemporal.30">
<table border="1">
				 <tr>
					<th>Adverbios positivos de tiempo intensificados</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/temporalPhraseAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@temporalDegree)='yesBefore' or normalize-space(//advp/@temporalDegree)='yesAfter'">
<p>
<xsl:text>Algunos ejemplos de un adverbio positivo de tiempo con una palabra de grado modificandolo son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@temporalDegree)='yesBefore' or normalize-space(//advp/@temporalDegree)='yesAfter'">
<example num="xAdvP.AdvPTemporal.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/temporalPhraseExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/temporalPhraseExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/temporalPhraseExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/temporalPhraseExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.34.1</xsl:text>
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
<xsl:text>Moviendo ahora al adverbio negativo de tiempo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> que expresa el concepto de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no tiempo’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>

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
<xsl:text>, el concepto negativo de tiempo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> se expresa con una o más palabras independientes que no se relacionan con los adverbios positivos de tiempo.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
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
<xsl:text>, el concepto negativo de tiempo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> se expresa con un afijo negativo que se une con un adverbio positivo de tiempo para formar un adverbio negativo de tiempo.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
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
<xsl:text>, el concepto negativo de tiempo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> se expresa con una palabra negativa independiente que se presenta </xsl:text>
<xsl:choose>
				 <xsl:when test="//advp/@negTemporalWordPos='before'">antes</xsl:when>
				 <xsl:when test="//advp/@negTemporalWordPos='after'">después</xsl:when>
				 <xsl:when test="//advp/@negTemporalWordPos='unknown'">________</xsl:when>
			  </xsl:choose>
<xsl:text> de un adverbio positivo de tiempo para formar una frase adverbial negativo de tiempo.</xsl:text>
</p>
</xsl:if>
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
<xsl:text>, el concepto negativo de tiempo de </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> se expresa con uno o más afijos verbales, en lugar de palabras independientes.</xsl:text>
</p>
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
<xsl:text>, hay solamente un afijo negativo verbal, pero puede presentarse con adverbios positivos de tiempo para dar un significado negativo de tiempo.</xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<p>
<xsl:text>La palabra negativa que se presenta con los adverbios positivos de tiempo es:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<example num="xAdvP.AdvPTemporal.50">
<table border="1">
				 <tr>
					<th>Palabra negativa</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalAdverbWordExample),'.','')" />
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
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<p>
<xsl:text>Algunos ejemplos de frases de adverbios negativos de tiempo formadas por la palabra negativa presentarse </xsl:text>
<xsl:choose>
			  <xsl:when test="//advp/@negTemporalWordPos='before'">antes</xsl:when>
			  <xsl:when test="//advp/@negTemporalWordPos='after'">después</xsl:when>
			  <xsl:when test="//advp/@negTemporalWordPos='unknown'">________</xsl:when>
		   </xsl:choose>
<xsl:text> de un adverbio positivo de tiempo son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<example num="xAdvP.AdvPTemporal.54">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalAdverbWordsExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negTemporalAdverbWordsExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalAdverbWordsExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negTemporalAdverbWordsExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.54</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.54.1</xsl:text>
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

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<p>
<xsl:text>El afijo negativo que se une con un adverbio positivo de tiempo es:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<example num="xAdvP.AdvPTemporal.58">
<table border="1">
				 <tr>
					<th>Afijo negativo</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalAdverbAffixExample),'.','')" />
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
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<p>
<xsl:text>Algunos ejemplos de adverbios negativos de tiempo formados por unirse el afijo negativo con un adverbio positivo de tiempo son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<example num="xAdvP.AdvPTemporal.62">
<table border="1">
				 <tr>
					<th>Adverbios negativos de tiempo</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalAdverbExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='word'">
<p>
<xsl:text>Los adverbios negativos de tiempo en </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='word'">
<example num="xAdvP.AdvPTemporal.66">
<table border="1">
				 <tr>
					<th>Adverbios negativos de tiempo</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='verb'">
<p>
<xsl:text>Algunos ejemplos de adverbios positivos de tiempo con un verbo negativo son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='verb'">
<example num="xAdvP.AdvPTemporal.70">
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
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.70</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.70.1</xsl:text>
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

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<p>
<xsl:text>Los afijos adverbiales negativos de tiempo que se unen a los verbos son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<example num="xAdvP.AdvPTemporal.74">
<table border="1">
				 <tr>
					<th>Afijos adverbiales negativos de tiempo</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<p>
<xsl:text>Algunos ejemplos de afijos adverbiales negativos de tiempo unidos a los verbos son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<example num="xAdvP.AdvPTemporal.78">
<table border="1">
				 <tr>
					<th>Verbos con un afijo adverbial negativo de tiempo</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalVerbExample),'.','')" />
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
</xsl:attribute>el año próximo</langData>
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
<xsl:text>.  Muchas lenguas también tienen un adverbio negativo de lugar que significa </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘en ninguna parte’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>

		   <p>
<xsl:text>Empezamos con los adverbios positivos de lugar.</xsl:text>
</p>
		   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//advp/@locativeClassifier)='yes'">
<p>
<xsl:text>Los raíces de los adverbios positivos de lugar en </xsl:text>
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
		   <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//advp/@locativeClassifier)!='yes'">
<p>
<xsl:text>Los adverbios positivos de lugar en </xsl:text>
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
		   <example num="xAdvP.AdvPLocative.12">
<table border="1">
				 <tr>
					<th>Adverbios positivos de lugar</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/locativeExample),'.','')" />
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

		   <p>
<xsl:text>Las formas de los adverbios positivos de lugar </xsl:text>
<xsl:choose>
				 <xsl:when test="//advp/@advLocDem='no'">son completemente distintos de los pronombres demostrativos. </xsl:when>
				 <xsl:when test="//advp/@advLocDem='same'">son idénticos que los pronombres demostrativos, pero se presentan en posiciones distintos en la oración. </xsl:when>
				 <xsl:when test="//advp/@advLocDem='affix'">se relacionan con los pronombres demostrativos por medio de un afijo que se une a un pronombre demostrativo para formar un adverbio de lugar. </xsl:when>
			  </xsl:choose>
<xsl:text> Véase la  sección </xsl:text>
<sectionRef sec="sPronDem" />
<xsl:text> para información acerca de los pronombres demostrativos.</xsl:text>
</p>

		   <p>
<xsl:text>En muchos idioimas los abverbios de lugar puenden ser modificado con palabras de grado.  Los adverbios de lugar en español se pueden modificar por </xsl:text>
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
<xsl:text>, </xsl:text>
<xsl:choose>
				 <xsl:when test="//advp/@locativeDegree='yesBefore'">una palabra de grado puede presentarse antes del adverbio positivo de lugar.</xsl:when>
				 <xsl:when test="//advp/@locativeDegree='yesAfter'">una palabra de grado puede presentarse después del adverbio positivo de lugar.</xsl:when>
				 <xsl:when test="//advp/@locativeDegree='attaches'">hay un afijo o clítico que se une al adverbio positivo de lugar para intensificarlo.</xsl:when>
				 <xsl:when test="//advp/@locativeDegree='noRedup'">no hay palabras de grado independientes, pero utiliza reduplicación para intensificar el significado del adverbio positivo de lugar.</xsl:when>
				 <xsl:when test="//advp/@locativeDegree='no'">los adverbios positivos de lugar no se modifican ni intensifican.</xsl:when>
			  </xsl:choose>
</p>

		   <xsl:if test="normalize-space(//advp/@locativeDegree)='yesBefore' or normalize-space(//advp/@locativeDegree)='yesAfter'">
<p>
<xsl:text>Las palabras de grado que pueden modificar un adverbio positivo de lugar en </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@locativeDegree)='yesBefore' or normalize-space(//advp/@locativeDegree)='yesAfter'">
<example num="xAdvP.AdvPLocative.22">
<table border="1">
				 <tr>
					<th>Palabras de grado</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/locativeDegreeExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@locativeDegree)='attaches'">
<p>
<xsl:text>Los afijos o clíticos de grado que pueden modificar un adverbio positivo de lugar en </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@locativeDegree)='attaches'">
<example num="xAdvP.AdvPLocative.26">
<table border="1">
				 <tr>
					<th>Afijos o clíticos de grado</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/locativeDegreeAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@locativeDegree)='noRedup'">
<p>
<xsl:text>Algunos ejemplos de los adverbios positivos de lugar con reduplicación son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@locativeDegree)='noRedup'">
<example num="xAdvP.AdvPLocative.30">
<table border="1">
				 <tr>
					<th>Adverbiois de lugar con reduplicación</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/locativeDegreeRedupExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@locativeDegree)='attaches'">
<p>
<xsl:text>Algunos ejemplos de los afijos o clíticos de grado unido con un adverbio de lugar son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@locativeDegree)='attaches'">
<example num="xAdvP.AdvPLocative.34">
<table border="1">
				 <tr>
					<th>Adverbios positivos de lugar intensificados</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/locativePhraseAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@locativeDegree)='yesBefore' or normalize-space(//advp/@locativeDegree)='yesAfter'">
<p>
<xsl:text>Algunos ejemplos de un adverbio positivo de lugar con una palabra de grado modificandolo son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@locativeDegree)='yesBefore' or normalize-space(//advp/@locativeDegree)='yesAfter'">
<example num="xAdvP.AdvPLocative.38">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/locativePhraseExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/locativePhraseExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/locativePhraseExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/locativePhraseExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.38</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.38.1</xsl:text>
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
<xsl:text>Moviendo ahora al adverbio negativo de lugar </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en ninguna parte</langData>
<xsl:text> que expresa el concepto de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no lugar’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>

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
<xsl:text>, el concepto negativo de lugar de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no lugar’</xsl:text>
</gloss>
<xsl:text> se expresa con una o más palabras independientes que no se relacionan con los adverbios positivos de lugar.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
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
<xsl:text>, el concepto negativo de lugar de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no lugar’</xsl:text>
</gloss>
<xsl:text> se expresa con un afijo negativo que se une con un adverbio positivo de lugar para formar un adverbio negativo de lugar.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
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
<xsl:text>, el concepto negativo de lugar de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no lugar’</xsl:text>
</gloss>
<xsl:text> se expresa con una palabra negativa independiente que se presenta </xsl:text>
<xsl:choose>
				 <xsl:when test="//advp/@negLocativeWordPos='before'">antes</xsl:when>
				 <xsl:when test="//advp/@negLocativeWordPos='after'">después</xsl:when>
				 <xsl:when test="//advp/@negLocativeWordPos='unknown'">________</xsl:when>
			  </xsl:choose>
<xsl:text> de un adverbio positivo de lugar para formar una adverbio negativo de lugar frase.</xsl:text>
</p>
</xsl:if>
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
<xsl:text>, el concepto negativo de lugar de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no lugar’</xsl:text>
</gloss>
<xsl:text> se expresa con uno o más afijos verbales, en vez de palabras independientes.</xsl:text>
</p>
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
<xsl:text>, hay solamente un afijo negativo verbal, pero puede presentarse con adverbios positivos de lugar para dar un significado negativo de lugar.</xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<p>
<xsl:text>La palabra negativa que se presenta con los adverbios positivos de lugar es:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<example num="xAdvP.AdvPLocative.54">
<table border="1">
				 <tr>
					<th>Palabra negativa</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeAdverbWordExample),'.','')" />
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
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<p>
<xsl:text>Algunos ejemplos de frases de adverbios negativos de lugar formado por la palabra negativa presentarse </xsl:text>
<xsl:choose>
			  <xsl:when test="//advp/@negLocativeWordPos='before'">antes</xsl:when>
			  <xsl:when test="//advp/@negLocativeWordPos='after'">después</xsl:when>
			  <xsl:when test="//advp/@negLocativeWordPos='unknown'">________</xsl:when>
		   </xsl:choose>
<xsl:text> de un adverbio positivo de lugar son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<example num="xAdvP.AdvPLocative.58">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeAdverbWordsExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negLocativeAdverbWordsExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeAdverbWordsExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negLocativeAdverbWordsExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.58</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.58.1</xsl:text>
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

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<p>
<xsl:text>El afijo negativo que se une con un adverbio positivo de lugar es:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<example num="xAdvP.AdvPLocative.62">
<table border="1">
				 <tr>
					<th>Afijo negativo</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeAdverbAffixExample),'.','')" />
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
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<p>
<xsl:text>Algunos ejemplos de adverbios negativos de lugar formados por unirse el afijo negativo con un adverbio positivo de lugar son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<example num="xAdvP.AdvPLocative.66">
<table border="1">
				 <tr>
					<th>Adverbios negativos de lugar</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeAdverbExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='word'">
<p>
<xsl:text>Los adverbios negativos de lugar en </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='word'">
<example num="xAdvP.AdvPLocative.70">
<table border="1">
				 <tr>
					<th>Adverbios negativos de lugar</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='verb'">
<p>
<xsl:text>Algunos ejemplos de adverbios positivos de lugar con un verbo negativo son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='verb'">
<example num="xAdvP.AdvPLocative.74">
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
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.74</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.74.1</xsl:text>
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

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<p>
<xsl:text>Los afijos adverbiales negativos de lugar que se unen a los verbos son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<example num="xAdvP.AdvPLocative.78">
<table border="1">
				 <tr>
					<th>Afijos adverbiales negativos de lugar</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<p>
<xsl:text>Algunos ejemplos de afijos adverbiales negativos de lugar unidos a los verbos son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<example num="xAdvP.AdvPLocative.82">
<table border="1">
				 <tr>
					<th>Verbos con un afijo adverbial negativo de lugar</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeVerbExample),'.','')" />
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
<xsl:text>.  Muchas lenguas permiten sólo una frase nominal, la cual consiste en un nombre propio o una descripción del lugar. Las expresiones del lugar normalmente pueden presentarse al inicio o al final en una cláusula, o como complementos para verbos de movimiento. Véase la sección </xsl:text>
<sectionRef sec="sIPMotion" />
<xsl:text> para considerar otros ejemplos con verbos del movimiento.
</xsl:text>
</p>
		</section2>

		<section2 id="sAdvPManner">
			<secTitle>Adverbios de modo</secTitle>
			<p>
<xsl:text>Los adverbios de modo directamente modifican el verbo y generalmente terminan con el sufijo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-mente</langData>
<xsl:text> en español.  En algunas lenguas, los adverbios de modo son todos escritos como afijos en el verbo, en lugar de como palabras independientes.</xsl:text>
</p>

		   <xsl:if test="normalize-space(//advp/@mannerType)='word'">
<p>
<xsl:text>Los adverbios de modo en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son escritos como palabras independientes.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='word'">
<p>
<xsl:text>Algunos ejemplos de adverbios de modo en </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@mannerType)='word'">
<example num="xAdvP.AdvPManner.10">
<table border="1">
				 <tr>
					<th>Alverbios de modo</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='affix'">
<p>
<xsl:text>Los adverbios de modo en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son todos escritos como afijos en el verbo.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='affix'">
<p>
<xsl:text>Algunos ejemplos de afijos adverbiales de modo en </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@mannerType)='affix'">
<example num="xAdvP.AdvPManner.16">
<table border="1">
				 <tr>
					<th>Afijos adverbiales de modo</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerExample),'.','')" />
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

		   <p>
<xsl:text>Los adverbios de modo normalmente se pueden modificar con palabras de grado.  En español, los adverbios de modo se pueden modificar con </xsl:text>
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='word'">
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
				 <xsl:when test="//advp/@mannerDegree='yesBefore'">una palabra de grado puede presentarse antes de un adverbio de modo.</xsl:when>
				 <xsl:when test="//advp/@mannerDegree='yesAfter'">una palabra de grado puede presentarse después de un adverbio de modo.</xsl:when>
				 <xsl:when test="//advp/@mannerDegree='attaches'">hay un afijo o clítico que se une al adverbio de modo para intensificarlo.</xsl:when>
				 <xsl:when test="//advp/@mannerDegree='noRedup'">no hay palabras de grado independientes, pero utiliza reduplicación para intensificar el significado del adverbio de modo.</xsl:when>
				 <xsl:when test="//advp/@mannerDegree='no'">los adverbios de modo no se modifican ni intensifican.</xsl:when>
			  </xsl:choose>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesBefore' or normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesAfter'">
<p>
<xsl:text>Las palabras de grado que puede modificar los adverbios de modo en </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesBefore' or normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesAfter'">
<example num="xAdvP.AdvPManner.24">
<table border="1">
				 <tr>
					<th>Palabras de grado</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerDegreeExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='attaches'">
<p>
<xsl:text>Los afijos o clíticos que pueden modificar los adverbios de modo en </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='attaches'">
<example num="xAdvP.AdvPManner.28">
<table border="1">
				 <tr>
					<th>Afijos o clíticos de grado</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerDegreeAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='noRedup'">
<p>
<xsl:text>Algunos ejemplos de los adverbios de modo con reduplicación son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='noRedup'">
<example num="xAdvP.AdvPManner.32">
<table border="1">
				 <tr>
					<th>Adverbios de modo con reduplicación</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerDegreeRedupExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='attaches'">
<p>
<xsl:text>Algunos ejemplos de los afijos o clíticos de grado unidos a un adverbio de modo son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='attaches'">
<example num="xAdvP.AdvPManner.36">
<table border="1">
				 <tr>
					<th>Adverbios de modo con afijos o clíticos de grado</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerPhraseAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesBefore' or normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesAfter'">
<p>
<xsl:text>Algunos ejemplos de los adverbios de modo con una palabra de grado modificándolos son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesBefore' or normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesAfter'">
<example num="xAdvP.AdvPManner.40">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/mannerDegreePhraseExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/mannerDegreePhraseExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/mannerDegreePhraseExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/mannerDegreePhraseExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPManner.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPManner.40.1</xsl:text>
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='affix'">
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
				 <xsl:when test="//advp/@mannerAffixDegree='yesBefore'">un afijo de grado puede presentarse antes de un afijo adverbial de modo.</xsl:when>
				 <xsl:when test="//advp/@mannerAffixDegree='yesAfter'">un afijo de grado puede presentarse después de un afijo adverbial de modo.</xsl:when>
				 <xsl:when test="//advp/@mannerAffixDegree='noRedup'">utiliza reduplicación para intensificar el significado del afijo adverbial de modo.</xsl:when>
				 <xsl:when test="//advp/@mannerAffixDegree='no'">los afijos adverbiales de modo no se modifican ni intensifican.</xsl:when>
			  </xsl:choose>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesBefore' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesAfter'">
<p>
<xsl:text>Los afijos o clíticos de grado que pueden modificar los afijos adverbiales de modo en </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesBefore' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesAfter'">
<example num="xAdvP.AdvPManner.46">
<table border="1">
				 <tr>
					<th>Afijos o clíticos de grado</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerAffixDegreeExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='noRedup'">
<p>
<xsl:text>Algunos ejemplos de los afijos adverbiales de modo con reduplicación unidos a los verbos son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='noRedup'">
<example num="xAdvP.AdvPManner.50">
<table border="1">
				 <tr>
					<th>Afijos adverbiales de modo con reduplicación</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerAffixDegreeRedupExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesBefore' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesAfter'">
<p>
<xsl:text>Algunos ejemplos de los afijos adverbiales de modo con afijos de grado unidos a los verbos son:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesBefore' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesAfter'">
<example num="xAdvP.AdvPManner.54">
<table border="1">
				 <tr>
					<th>Afijos adverbiales de modo con afijos de grado</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerAffixPhraseExample),'.','')" />
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
		   <p>
<xsl:text>Los adverbios de modo no parece tener el  mismo significado que otros tipos de frases, con la excepción de oraciones comparativas como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tan rápido como puede</langData>
<xsl:text>.  Las oraciones comparativas se discuten en las secciones </xsl:text>
<sectionRef sec="sIPComparatives" />
<xsl:text> y </xsl:text>
<sectionRef sec="sCoordComparative" />
<xsl:text>. </xsl:text>
</p>

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
<xsl:text>.  Estos adverbios normalmente no permiten modificadores.</xsl:text>
</p>
		   <p>
<xsl:text>La razón o el propósito también se puede expresar con una cláusula adverbial empezando con </xsl:text>
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
<xsl:text>.  Estas frases o cláusulas adverbiales se presentan al inicio o al final en la oración.  La estructura de las cláusulas adverbiales será analizada en la sección </xsl:text>
<sectionRef sec="sAdvClReason" />
<xsl:text>. </xsl:text>
</p>
		   <p>
<xsl:text>Los adverbios que expresan razón o propósito por sí mismos o que empiezan una cláusula adverbial que expresa razón o propósito en </xsl:text>
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
		   <example num="xAdvP.AdvPReason.10">
<table border="1">
				 <tr>
					<th>Adverbios que expresan razón o propósito</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/reasonExample),'.','')" />
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
		   <p>
<xsl:text> La razón o el propósito también se pueden expresar por una frase preposicional en español, por ejemplo </xsl:text>
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
		   <p>
<xsl:text>Frases </xsl:text>
<xsl:choose>
				 <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
				 <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
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
<xsl:text> que expresan razón o propósito son:  </xsl:text>
</p>
		   <example num="xAdvP.AdvPReason.16">
<table border="1">
				 <tr>
					<th>Otros expresiones de razón o propósito</th>
					<th>Glosa</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/reasonPPExample),'.','')" />
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

		   <p>
<xsl:text>Algunos ejemplos de los adverbios que expresan razón o propósito o de las cláusulas adverbiales o de frases </xsl:text>
<xsl:choose>
				 <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
				 <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
				 <xsl:when test="//pp/@pPos='both'">preposicionales o posposicionales</xsl:when>
				 <xsl:when test="//pp/@pPos='unknown'">preposicionales o posposicionales</xsl:when>
			  </xsl:choose>
<xsl:text> que expresan razón o propósito en </xsl:text>
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
			<example num="xAdvP.AdvPReason.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/reasonSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/reasonSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/reasonSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/reasonSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPReason.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPReason.20.1</xsl:text>
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
