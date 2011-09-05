<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="focus">
  <section1 id="sFocus">
	  <secTitle>Las construcciones de enfoque y asunto</secTitle>
<p>
<xsl:text>
	Esta sección considera dos tipos de construcciones que dibujen la atención a un elemento particular. Puesto que los asuntos se presentan fuera de construcciones de enfoque, serán considerados primero. El ejemplo siguiente demuestra que una sola oración puede tener un asunto y una frase enfocada.
	En este caso, el asunto </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Guillermo</langData>
<xsl:text> es introducido por el indicador del asunto </xsl:text>
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
	<secTitle>Los asuntos y los indicadores del asunto</secTitle>
<p>
<xsl:text>
	Según lo definido aquí, las construcciones del asunto consisten en una frase del asunto seguida por una oración o una pregunta completa y generalmente son fijados aparte por la puntuación. Ciertos indicadores se pueden utilizar para los asuntos, como en los ejemplos en español siguientes:</xsl:text>
</p>
			<ol>
				<li>
					<xsl:text>En cuanto a Juan, pienso que él hará a un buen doctor.</xsl:text>
				</li>
				<li>
					<xsl:text>El discurso de Juliana, ¿dónde está ella?</xsl:text>
				</li>
			</ol>
	<xsl:if test="normalize-space(//focus/@topic)='no'">
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
<xsl:text> no hay frases del asunto. </xsl:text>
</p>
</xsl:if>
	<xsl:if test="normalize-space(//focus/@topic)='yes'">
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
<xsl:text> hay frases del asunto que se presentan </xsl:text>
<xsl:choose>
				<xsl:when test="//focus/@topicPos='before'">antes</xsl:when>
				<xsl:when test="//focus/@topicPos='after'">después</xsl:when>
				<xsl:when test="//focus/@topicPos='unknown'">_______</xsl:when>
			</xsl:choose>
<xsl:text> de la oración o la pregunta principal. Algunos ejemplos son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//focus/@topic)='yes'">
<example num="xFocus.FocusTopics.12">
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
<xsl:with-param name="sExNumber">xFocus.FocusTopics.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xFocus.FocusTopics.12.1</xsl:text>
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
	<xsl:if test="normalize-space(//focus/@topic)='yes'">
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
<xsl:text> la frase del asunto </xsl:text>
<xsl:choose>
	<xsl:when test="//focus/@topicMarker='no'">no es marcado por un indicador del asunto. Solamente la posición en la oración y posiblemente la puntuación distingue a la frase del asunto.</xsl:when>
	<xsl:when test="//focus/@topicMarker='yesWord'">es marcado por ciertas palabras o frases.</xsl:when>
	<xsl:when test="//focus/@topicMarker='yesClitic'">es marcado por uno o más clíticos que se unen a la frase del asunto.</xsl:when>
	<xsl:when test="//focus/@topicMarker='yesAffix'">es marcado por uno o más afijos que se unen a la frase del asunto.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord'">
<xsl:text>Los indicadores del asunto se presentan </xsl:text>
<xsl:choose>
	<xsl:when test="//focus/@topicMarkerPos='before'">antes de la frase sí mismo del asunto.</xsl:when>
	<xsl:when test="//focus/@topicMarkerPos='after'">después de la frase sí mismo del asunto.</xsl:when>
	<xsl:when test="//focus/@topicMarkerPos='either'">de cualquier lado de la frase sí mismo del asunto, pero no en ambos lados en la misma oración.</xsl:when>
	<xsl:when test="//focus/@topicMarkerPos='both'">en ambos lados de la frase del asunto sí mismo.</xsl:when>
<xsl:when test="//focus/@topicMarkerPos='unknown'">_______.</xsl:when>
</xsl:choose>
			<xsl:text> El indicador del asunto es </xsl:text>
<xsl:choose>
				<xsl:when test="//focus/@topicMarkerRequired='no'">opcional</xsl:when>
				<xsl:when test="//focus/@topicMarkerRequired='yes'">requerido</xsl:when>
</xsl:choose>
			<xsl:text> siempre que haya una frase del asunto.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord' and normalize-space(//focus/@topicMarkerPos)='either' and normalize-space(//focus/@topicMarkerEither)='no' or normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord' and normalize-space(//focus/@topicMarkerPos)='both' and normalize-space(//focus/@topicMarkerEither)='no'">
<xsl:text>Hay restricciones en cuanto a cuáles indicadores del asunto pueden presentarse en cada lado de la frase del asunto.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord' and normalize-space(//focus/@topicMarkerPos)='either' and normalize-space(//focus/@topicMarkerEither)='yes' or normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord' and normalize-space(//focus/@topicMarkerPos)='both' and normalize-space(//focus/@topicMarkerEither)='yes'">
<xsl:text>Todos los marcadores del asunto pueden presentarse de cualquier lado de la frase del asunto.</xsl:text>
</xsl:if>
</p>
</xsl:if>
<xsl:if test="normalize-space(//focus/@topicMarker)!='no'">
<example num="xFocus.FocusTopics.16">
<table border="1">
<tr>
	<th>Indicadores del asunto</th>
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
<xsl:with-param name="columnsBefore">
</xsl:with-param>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
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
	<secTitle>Las frases enfocadas y los marcadores de enfoque</secTitle>
	<p>
<xsl:text>En contraste con asuntos, mientras que las construcciones de enfoque también tienen un elemento desplazado que se pueda ser marcado por la puntuación, la frase en foco se mueve desde su posición normal en la oración, dejando un agujero.
	Ciertos indicadores,  como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente</langData>
<xsl:text> en español, se pueden utilizar para marcar la frase enfocada. Las construcciones de enfoque no se utilizan con frecuencia en idiomas del orden SVO, puesto que el sujeto es generalmente en foco y es ya primer en el orden normal.
		Los idiomas con otros órdenes de la palabra, tales como idiomas del orden VSO, pueden hacer el uso extenso de construcciones de enfoque. Algunos ejemplos en español de las construcciones de enfoque son:</xsl:text>
</p>
			<ol>
				<li>
					<xsl:text>De las muchachas, tengo gusto  __.</xsl:text>
				</li>
				<li>
					<xsl:text>El fútbol, Guillermo juega __ fantástico.</xsl:text>
				</li>
				<li>
					<xsl:text>A solamente ese muchacho, Juan golpeó  __ .</xsl:text>
				</li>
			</ol>
	<xsl:if test="normalize-space(//focus/@focus)='no'">
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
<xsl:text> no permite que una frase de enfoque sea desplazada ni antes ni después del resto de la oración de su posición normal. </xsl:text>
</p>
</xsl:if>
<xsl:if test="normalize-space(//focus/@focus)='yes'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> hay las frases de enfoque que se presentan </xsl:text>
<xsl:choose>
				<xsl:when test="//focus/@focusPos='before'">antes</xsl:when>
				<xsl:when test="//focus/@focusPos='after'">después</xsl:when>
				<xsl:when test="//focus/@focusPos='unknown'">_______</xsl:when>
			</xsl:choose>
<xsl:text> del resto de la oración. Algunos ejemplos son:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//focus/@focus)='yes'">
<example num="xFocus.FocusFocus.12">
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
<xsl:with-param name="sExNumber">xFocus.FocusFocus.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xFocus.FocusFocus.12.1</xsl:text>
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
<xsl:if test="normalize-space(//focus/@focus)='yes'">
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
<xsl:text>, la frase enfocada </xsl:text>
<xsl:choose>
	<xsl:when test="//focus/@focusMarker='no'">no es marcado por un indicador de enfoque. Solamente la posición en la oración y posiblemente la puntuación distingue a la frase enfocada.</xsl:when>
	<xsl:when test="//focus/@focusMarker='yesWord'">es marcado por ciertas palabras o frases. </xsl:when>
	<xsl:when test="//focus/@focusMarker='yesClitic'">es marcado por uno o más clíticos que se unen a la frase enfocada.</xsl:when>
	<xsl:when test="//focus/@focusMarker='yesAffix'">es marcado por uno o más afijos que se unen a la frase enfocada.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord'">
<xsl:text>Los indicadores de enfoque se presentan </xsl:text>
<xsl:choose>
	<xsl:when test="//focus/@focusMarkerPos='before'">antes de la frase enfocada sí mismo.</xsl:when>
	<xsl:when test="//focus/@focusMarkerPos='after'">después de la frase enfocada sí mismo.</xsl:when>
	<xsl:when test="//focus/@focusMarkerPos='either'">de cualquier lado de la frase enfocada sí mismo, pero no en ambos lados en la misma oración.</xsl:when>
	<xsl:when test="//focus/@focusMarkerPos='both'">en ambos lados de la frase enfocada sí mismo.</xsl:when>
<xsl:when test="//focus/@focusMarkerPos='unknown'">_______.</xsl:when>
</xsl:choose>
		<xsl:text> El indicador de enfoque es </xsl:text>
<xsl:choose>
<xsl:when test="//focus/@focusMarkerRequired='no'">opcional</xsl:when>
<xsl:when test="//focus/@focusMarkerRequired='yes'">requerido</xsl:when>
</xsl:choose>
		<xsl:text> siempre que haya una frase enfocada.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord' and normalize-space(//focus/@focusMarkerPos)='either' and normalize-space(//focus/@focusMarkerEither)='no' or normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord' and normalize-space(//focus/@focusMarkerPos)='both' and normalize-space(//focus/@focusMarkerEither)='no'">
<xsl:text> Hay restricciones en cuanto a cuáles indicadores de enfoque pueden presentarse en cada lado de la frase enfocado.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord' and normalize-space(//focus/@focusMarkerPos)='either' and normalize-space(//focus/@focusMarkerEither)='yes' or normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord' and normalize-space(//focus/@focusMarkerPos)='both' and normalize-space(//focus/@focusMarkerEither)='yes'">
<xsl:text> Todos los indicadores de enfoque pueden presentarse de cualquier lado de la frase enfocada.</xsl:text>
</xsl:if>
</p>
</xsl:if>
	<xsl:if test="normalize-space(//focus/@focusMarker)!='no'">
<example num="xFocus.FocusFocus.16">
<table border="1">
<tr>
	<th>Indicadores de enfoque</th>
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
<xsl:with-param name="columnsBefore">
</xsl:with-param>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>INCOPORE UN EJEMPLO AQUÍ</langData>
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
