<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="focus">
  <section1 id="sFocus">
	 <secTitle>Las construcciones de tópico y foco</secTitle>
<p>
<xsl:text>
   Esta sección considera dos tipos de construcciones que dibujen la atención a un elemento particular. Puesto que los tópicos se presentan fuera de construcciones de foco, serán considerados primero. El ejemplo siguiente muestra que una sola oración puede tener un tópico y una frase enfocada.
   En este caso, el tópico </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Guillermo</langData>
<xsl:text> es introducido por el indicador de tópico </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en cuanto a</langData>
<xsl:text>,
		y después sigue la frase enfocada </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el fútbol</langData>
<xsl:text>, que se ha desplazado de su posición normal en la oración.</xsl:text>
</p>
<ul>
<li>
	<xsl:text>En cuanto a Guillermo, el fútbol él juega ___ fantástico. </xsl:text>
</li>
</ul>
<section2 id="sFocusTopics">
   <secTitle>Tópicos y indicadores de tópico</secTitle>
<p>
<xsl:text>
   De acuerdo con lo definido aquí, las construcciones de tópico consisten en una frase de tópico seguida por una oración o una pregunta completa y generalmente son fijados aparte por la puntuación. Ciertos indicadores se pueden utilizar para los tópicos, como en los ejemplos en español siguientes: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>En cuanto a Juan, pienso que él será un buen doctor</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El discurso de Juliana, ¿dónde está ella?</langData>
</p>

	<xsl:if test="normalize-space(//focus/@topic)='no'">
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
<xsl:text> no hay frases de tópico. </xsl:text>
</p>
</xsl:if>
	<xsl:if test="normalize-space(//focus/@topic)='yes'">
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
<xsl:text> hay frases de tópico que se presentan </xsl:text>
<xsl:choose>
				<xsl:when test="//focus/@topicPos='before'">antes</xsl:when>
				<xsl:when test="//focus/@topicPos='after'">después</xsl:when>
				<xsl:when test="//focus/@topicPos='unknown'">_______</xsl:when>
			</xsl:choose>
<xsl:text> de la oración o la pregunta principal. Algunos ejemplos son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//focus/@topic)='yes'">
<example num="xFocus.FocusTopics.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//focus/topicExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//focus/topicExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//focus/topicExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//focus/topicExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xFocus.FocusTopics.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xFocus.FocusTopics.10.1</xsl:text>
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
	<xsl:if test="normalize-space(//focus/@topic)='yes'">
<p>
<xsl:text>De acuerdo con los ejemplos, la frase de tópico en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
   <xsl:when test="//focus/@topicMarker='no'"> no es marcado por un indicador de tópico. Solamente la posición en la oración y posiblemente la puntuación distingue a la frase de tópico.</xsl:when>
	<xsl:when test="//focus/@topicMarker='yesWord'"> es indicado por ciertas palabras o frases.</xsl:when>
   <xsl:when test="//focus/@topicMarker='yesClitic'"> es indicado por uno o más clíticos que se unen a la frase de tópico.</xsl:when>
   <xsl:when test="//focus/@topicMarker='yesAffix'"> es indicado por uno o más afijos que se unen a la frase de tópico.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord'">
<xsl:text>Los indicadores de tópico se presentan </xsl:text>
<xsl:choose>
   <xsl:when test="//focus/@topicMarkerPos='before'">antes de la frase sí mismo de tópico.</xsl:when>
   <xsl:when test="//focus/@topicMarkerPos='after'">después de la frase sí mismo de tópico.</xsl:when>
   <xsl:when test="//focus/@topicMarkerPos='either'">de cualquier lado de la frase sí mismo de tópico, pero no en ambos lados en la misma oración.</xsl:when>
   <xsl:when test="//focus/@topicMarkerPos='both'">en ambos lados de la frase de tópico sí mismo.</xsl:when>
<xsl:when test="//focus/@topicMarkerPos='unknown'">_______.</xsl:when>
</xsl:choose>
		  <xsl:text> El indicador de tópico es </xsl:text>
<xsl:choose>
				<xsl:when test="//focus/@topicMarkerRequired='no'">opcional</xsl:when>
				<xsl:when test="//focus/@topicMarkerRequired='yes'">requerido</xsl:when>
</xsl:choose>
		  <xsl:text> siempre que haya una frase de tópico.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord' and normalize-space(//focus/@topicMarkerPos)='either' and normalize-space(//focus/@topicMarkerEither)='no' or normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord' and normalize-space(//focus/@topicMarkerPos)='both' and normalize-space(//focus/@topicMarkerEither)='no'">
<xsl:text> Hay restricciones en cuanto a cuáles indicadores de tópico pueden presentarse en cada lado de la frase de tópico.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord' and normalize-space(//focus/@topicMarkerPos)='either' and normalize-space(//focus/@topicMarkerEither)='yes' or normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord' and normalize-space(//focus/@topicMarkerPos)='both' and normalize-space(//focus/@topicMarkerEither)='yes'">
<xsl:text> Todos los indicadores de tópico pueden presentarse de cualquier lado de la frase de tópico.</xsl:text>
</xsl:if>
</p>
</xsl:if>
<xsl:if test="normalize-space(//focus/@topicMarker)!='no' and normalize-space(//focus/@topic)='yes'">
<example num="xFocus.FocusTopics.14">
<table border="1">
<tr>
   <th>Indicadores de tópico</th>
	<th>Glosa o restricciones</th>
</tr>
	<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//focus/topicMarkerExample),'.','')" />
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
<xsl:text>ESCRIBA LA GLOSA O RESTRICCIONES</xsl:text>
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
<xsl:text>ESCRIBA LA GLOSA O RESTRICCIONES</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</example>
</xsl:if>
</section2>

<section2 id="sFocusFocus">
	<secTitle>Frases enfocadas y indicadores de foco</secTitle>
   <p>
<xsl:text>En contraste con tópico, mientras que las construcciones de foco también tienen un elemento desplazado que se pueda ser indicado por la puntuación, la frase enfocada se mueve desde su posición normal en la oración, dejando un agujero.
		Ciertos indicadores,  como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente</langData>
<xsl:text> en español, se pueden utilizar para indicar la frase enfocada. Las construcciones de foco no se utilizan con frecuencia en lenguas del orden SVO, puesto que el sujeto es generalmente en foco y es ya primer en el orden normal.
		Las lenguas con otros órdenes de la palabra, tales como lenguas del orden VSO, pueden hacer el uso extenso de construcciones de foco. Algunos ejemplos en español de las construcciones de foco son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>De las muchachas, tengo gusto  __</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El fútbol, Guillermo juega __ fantástico</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>A solamente ese muchacho, Juan golpeó  __</langData>
<xsl:text>.</xsl:text>
</p>

	<xsl:if test="normalize-space(//focus/@focus)='no'">
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
<xsl:text> no permite que una frase enfocada sea desplazada ni antes ni después del resto de la oración de su posición normal. </xsl:text>
</p>
</xsl:if>
	<xsl:if test="normalize-space(//focus/@focus)='yes'">
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
<xsl:text> hay las frases enfocadas que se presentan </xsl:text>
<xsl:choose>
				<xsl:when test="//focus/@focusPos='before'">antes</xsl:when>
				<xsl:when test="//focus/@focusPos='after'">después</xsl:when>
				<xsl:when test="//focus/@focusPos='unknown'">_______</xsl:when>
			</xsl:choose>
<xsl:text> del resto de la oración. Algunos ejemplos son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//focus/@focus)='yes'">
<example num="xFocus.FocusFocus.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//focus/focusExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//focus/focusExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//focus/focusExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//focus/focusExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xFocus.FocusFocus.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xFocus.FocusFocus.10.1</xsl:text>
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
   <xsl:if test="normalize-space(//focus/@focus)='yes'">
<p>
<xsl:text>De acuerdo con los ejemplos, la frase enfocada en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
	<xsl:when test="//focus/@focusMarker='no'"> no es marcado por un indicador de foco. Solamente la posición en la oración y posiblemente la puntuación distingue a la frase enfocada.</xsl:when>
	<xsl:when test="//focus/@focusMarker='yesWord'"> es indicado por ciertas palabras o frases. </xsl:when>
	<xsl:when test="//focus/@focusMarker='yesClitic'"> es indicado por uno o más clíticos que se unen a la frase enfocada.</xsl:when>
	<xsl:when test="//focus/@focusMarker='yesAffix'"> es indicado por uno o más afijos que se unen a la frase enfocada.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord'">
<xsl:text>Los indicadores de foco se presentan </xsl:text>
<xsl:choose>
	<xsl:when test="//focus/@focusMarkerPos='before'">antes de la frase enfocada sí mismo.</xsl:when>
	<xsl:when test="//focus/@focusMarkerPos='after'">después de la frase enfocada sí mismo.</xsl:when>
	<xsl:when test="//focus/@focusMarkerPos='either'">de cualquier lado de la frase enfocada sí mismo, pero no en ambos lados en la misma oración.</xsl:when>
	<xsl:when test="//focus/@focusMarkerPos='both'">en ambos lados de la frase enfocada sí mismo.</xsl:when>
<xsl:when test="//focus/@focusMarkerPos='unknown'">_______.</xsl:when>
</xsl:choose>
		<xsl:text> El indicador de foco es </xsl:text>
<xsl:choose>
<xsl:when test="//focus/@focusMarkerRequired='no'">opcional</xsl:when>
<xsl:when test="//focus/@focusMarkerRequired='yes'">requerido</xsl:when>
</xsl:choose>
		<xsl:text> siempre que haya una frase enfocada.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord' and normalize-space(//focus/@focusMarkerPos)='either' and normalize-space(//focus/@focusMarkerEither)='no' or normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord' and normalize-space(//focus/@focusMarkerPos)='both' and normalize-space(//focus/@focusMarkerEither)='no'">
<xsl:text> Hay restricciones en cuanto a cuáles indicadores de foco pueden presentarse en cada lado de la frase enfocada.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord' and normalize-space(//focus/@focusMarkerPos)='either' and normalize-space(//focus/@focusMarkerEither)='yes' or normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord' and normalize-space(//focus/@focusMarkerPos)='both' and normalize-space(//focus/@focusMarkerEither)='yes'">
<xsl:text> Todos los indicadores de foco pueden presentarse de cualquier lado de la frase enfocada.</xsl:text>
</xsl:if>
</p>
</xsl:if>
	<xsl:if test="normalize-space(//focus/@focusMarker)!='no' and normalize-space(//focus/@focus)='yes'">
<example num="xFocus.FocusFocus.14">
<table border="1">
<tr>
	<th>Indicadores de foco</th>
	<th>Glosa o restricciones</th>
</tr>
	<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//focus/focusMarkerExample),'.','')" />
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
<xsl:text>ESCRIBA LA GLOSA O RESTRICCIONES</xsl:text>
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
<xsl:text>ESCRIBA LA GLOSA O RESTRICCIONES</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</example>
</xsl:if>


</section2>

  </section1>






































































































</xsl:template>
</xsl:stylesheet>
