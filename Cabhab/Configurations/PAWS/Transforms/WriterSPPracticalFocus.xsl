<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="focus">
  <section1 id="sFocus">
     <secTitle>Las construcciones de tópico y foco</secTitle>
     <p contentType="ctPracticalIntro">
<xsl:text>
        En esta sección se consideran dos tipos de construcciones que se enfocan en un elemento específico. Se presentan los tópicos primero porque tienen el ámbito más amplio y por eso se encuentran fuera de las construcciones de foco.  Es posible que una oración tenga un tópico y una frase enfocada.</xsl:text>
</p>
     <p contentType="ctComparativeIntro">
<xsl:text>
        En esta sección se consideran dos tipos de construcciones que se enfocan en un elemento específico. Se presentan los tópicos primero porque tienen el ámbito más amplio y por eso se encuentran fuera de las construcciones de foco.  El ejemplo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>En cuanto a Guillermo, el fútbol él juega ___ fantástico</langData>
<xsl:text> muestra que una sola oración puede tener un tópico y una frase enfocada.  
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
     
     <section2 id="sFocusTopics">
   <secTitle>Tópicos e indicadores de tópico</secTitle>
        <p contentType="ctPracticalIntro">
<xsl:text>
           En esta gramática, las construcciones de tópico se definen como una frase de tópico seguida de una oración o una pregunta completa y generalmente se separan con la puntuación. Se pueden utilizar ciertos indicadores para marcar los tópicos. </xsl:text>
</p>
        <p contentType="ctComparativeIntro">
<xsl:text>
           En esta gramática, las construcciones de tópico se definen como una frase de tópico seguida de una oración o una pregunta completa y generalmente se separan con la puntuación. Se pueden utilizar ciertos indicadores para marcar los tópicos, como en los siguientes ejemplos en español: </xsl:text>
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
<xsl:text>En el </xsl:text>
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
<xsl:text>En el </xsl:text>
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
<xsl:text>De acuerdo con los ejemplos, la frase de tópico</xsl:text>
<xsl:choose>
   <xsl:when test="//focus/@topicMarker='no'"> no se marca con un indicador de tópico. Solamente la posición en la oración y posiblemente la puntuación distingue a la frase de tópico.</xsl:when>
    <xsl:when test="//focus/@topicMarker='yesWord'"> se marca con ciertas palabras o frases. </xsl:when>
   <xsl:when test="//focus/@topicMarker='yesClitic'"> se marca con uno o más clíticos que se unen a la frase de tópico. Estos clíticos son:</xsl:when>
   <xsl:when test="//focus/@topicMarker='yesAffix'"> se marca con uno o más afijos que se unen al sustantivo principal en la frase de tópico. Estos afijos son:</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord'">
<xsl:text>Los indicadores de tópico se presentan </xsl:text>
          <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='yes' and normalize-space(//focus/topicMarkerAfter/@checked)='no' and normalize-space(//focus/topicMarkerBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
          <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='no' and normalize-space(//focus/topicMarkerAfter/@checked)='yes' and normalize-space(//focus/topicMarkerBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
          <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='no' and normalize-space(//focus/topicMarkerAfter/@checked)='no' and normalize-space(//focus/topicMarkerBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
          <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='yes' and normalize-space(//focus/topicMarkerAfter/@checked)='yes' and normalize-space(//focus/topicMarkerBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
          <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='yes' and normalize-space(//focus/topicMarkerAfter/@checked)='no' and normalize-space(//focus/topicMarkerBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
          <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='no' and normalize-space(//focus/topicMarkerAfter/@checked)='yes' and normalize-space(//focus/topicMarkerBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
          <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='yes' and normalize-space(//focus/topicMarkerAfter/@checked)='yes' and normalize-space(//focus/topicMarkerBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
          <xsl:if test="normalize-space(//focus/topicMarkerOther/@checked)='no'">
<xsl:text> de la frase sí mismo de tópico.  </xsl:text>
          </xsl:if>
          <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='no' and normalize-space(//focus/topicMarkerAfter/@checked)='no' and normalize-space(//focus/topicMarkerBoth/@checked)='no' and normalize-space(//focus/topicMarkerOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//focus/topicMarkerOther" />
<xsl:text>.  </xsl:text>
          </xsl:if>
          <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='yes' and normalize-space(//focus/topicMarkerOther/@checked)='yes' or normalize-space(//focus/topicMarkerAfter/@checked)='yes' and normalize-space(//focus/topicMarkerOther/@checked)='yes' or normalize-space(//focus/topicMarkerBoth/@checked)='yes' and normalize-space(//focus/topicMarkerOther/@checked)='yes'">
<xsl:text> de la frase sí mismo de tópico y también pueden presentarse ___</xsl:text>
<xsl:value-of select="//focus/topicMarkerOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
          <xsl:text> El indicador de tópico es </xsl:text>
<xsl:choose>
                <xsl:when test="//focus/@topicMarkerRequired='no'">opcional</xsl:when>
                <xsl:when test="//focus/@topicMarkerRequired='yes'">requerido</xsl:when>
</xsl:choose>
          <xsl:text> siempre que haya una frase de tópico.  Los indicadores de tópico son:</xsl:text> 
</xsl:if>
</p>
</xsl:if>
<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord'">
<example num="xFocus.FocusTopics.16">
<table border="1">
<tr>
   <th>Indicadores de tópico</th>
    <th>Glosa</th>
</tr>
    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//focus/topicMarkerExample),'.','')" />
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
        <xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesClitic'">
<example num="xFocus.FocusTopics.18">
<table border="1">
              <tr>
                 <th>Clíticos de tópico</th>
                 <th>Glosa</th>
              </tr>
              <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//focus/topicMarkerCliticExample),'.','')" />
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
        <xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesAffix'">
<example num="xFocus.FocusTopics.20">
<table border="1">
              <tr>
                 <th>Afijos de tópico</th>
                 <th>Glosa</th>
              </tr>
              <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//focus/topicMarkerAffixExample),'.','')" />
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

<section2 id="sFocusFocus">
    <secTitle>Frases enfocadas e indicadores de foco</secTitle>
   <p contentType="ctPracticalIntro">
<xsl:text>Las frases enfocadas también tienen una frase nominal que se presenta al principio o al final de la oración y se pueden separar con puntuación.  Sin embargo, en contraste con los tópicos, las frases enfocadas se mueven de su posición normal en la oración dejándola vacía.  Ciertos indicadores se pueden utilizar para marcar la frase enfocada.</xsl:text>
</p>
   <p contentType="ctComparativeIntro">
<xsl:text>Las frases enfocadas también tienen una frase nominal que se presenta al principio o al final de la oración y se pueden separar con puntuación.  Sin embargo, en contraste con los tópicos, las frases enfocadas se mueven de su posición normal en la oración dejándola vacía.
        Ciertos indicadores,  como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente</langData>
<xsl:text> en español, se pueden utilizar para marcar la frase enfocada. Las construcciones de foco no se utilizan con frecuencia en lenguas del orden SVO, puesto que el sujeto es generalmente en foco y es ya primera en el orden normal.  
        Las lenguas con otros órdenes de la palabra, como lenguas del orden VSO, pueden hacer el uso extenso de construcciones de foco. Algunos ejemplos en español de las construcciones de foco son: </xsl:text>
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
<xsl:text>En el </xsl:text>
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
<xsl:text>En el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> hay frases enfocadas que se presentan </xsl:text>
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
<xsl:text>De acuerdo con los ejemplos, la frase enfocada</xsl:text>
<xsl:choose>
    <xsl:when test="//focus/@focusMarker='no'"> no se marca con un indicador de foco. Solamente la posición en la oración y posiblemente la puntuación distingue a la frase enfocada.</xsl:when>
    <xsl:when test="//focus/@focusMarker='yesWord'"> se marca con ciertas palabras o frases. </xsl:when>
   <xsl:when test="//focus/@focusMarker='yesClitic'"> se marca con uno o más clíticos que se unen a la frase enfocada. Estos clíticos son:</xsl:when>
    <xsl:when test="//focus/@focusMarker='yesAffix'"> se marca con uno o más afijos que se unen al sustantivo principal en la frase enfocada. Estos afijos son:</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord'">
<xsl:text>Los indicadores de foco se presentan </xsl:text>
       <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='yes' and normalize-space(//focus/topicMarkerAfter/@checked)='no' and normalize-space(//focus/topicMarkerBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
       <xsl:if test="normalize-space(//focus/topicMarkerBefore/@checked)='no' and normalize-space(//focus/focusMarkerAfter/@checked)='yes' and normalize-space(//focus/focusMarkerBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
       <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='no' and normalize-space(//focus/focusMarkerAfter/@checked)='no' and normalize-space(//focus/focusMarkerBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
       <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='yes' and normalize-space(//focus/focusMarkerAfter/@checked)='yes' and normalize-space(//focus/focusMarkerBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
       <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='yes' and normalize-space(//focus/focusMarkerAfter/@checked)='no' and normalize-space(//focus/focusMarkerBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
       <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='no' and normalize-space(//focus/focusMarkerAfter/@checked)='yes' and normalize-space(//focus/focusMarkerBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
       <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='yes' and normalize-space(//focus/focusMarkerAfter/@checked)='yes' and normalize-space(//focus/focusMarkerBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
       <xsl:if test="normalize-space(//focus/focusMarkerOther/@checked)='no'">
<xsl:text> de la frase enfocada sí mismo.  </xsl:text>
       </xsl:if>
       <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='no' and normalize-space(//focus/focusMarkerAfter/@checked)='no' and normalize-space(//focus/focusMarkerBoth/@checked)='no' and normalize-space(//focus/focusMarkerOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//focus/focusMarkerOther" />
<xsl:text>.  </xsl:text>
       </xsl:if>
       <xsl:if test="normalize-space(//focus/focusMarkerBefore/@checked)='yes' and normalize-space(//focus/focusMarkerOther/@checked)='yes' or normalize-space(//focus/focusMarkerAfter/@checked)='yes' and normalize-space(//focus/focusMarkerOther/@checked)='yes' or normalize-space(//focus/focusMarkerBoth/@checked)='yes' and normalize-space(//focus/focusMarkerOther/@checked)='yes'">
<xsl:text> de la frase enfocada sí mismo y también pueden presentarse ___</xsl:text>
<xsl:value-of select="//focus/focusMarkerOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
       <xsl:text> El indicador de foco es </xsl:text>
<xsl:choose>
<xsl:when test="//focus/@focusMarkerRequired='no'">opcional</xsl:when>
<xsl:when test="//focus/@focusMarkerRequired='yes'">requerido</xsl:when>
</xsl:choose>
        <xsl:text> siempre que haya una frase enfocada. Los indicadores de foco son:</xsl:text> 
</xsl:if>
</p>
</xsl:if>
    <xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord'">
<example num="xFocus.FocusFocus.16">
<table border="1">
<tr>
    <th>Indicadores de foco</th>
    <th>Glosa</th>
</tr>
    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//focus/focusMarkerExample),'.','')" />
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

   <xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesClitic'">
<example num="xFocus.FocusFocus.18">
<table border="1">
         <tr>
            <th>Clíticos de foco</th>
            <th>Glosa</th>
         </tr>
         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//focus/focusMarkerCliticExample),'.','')" />
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
   <xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesAffix'">
<example num="xFocus.FocusFocus.20">
<table border="1">
         <tr>
            <th>Afijos de foco</th>
            <th>Glosa</th>
         </tr>
         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//focus/focusMarkerAffixExample),'.','')" />
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
     
  </section1>
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
</xsl:template>
</xsl:stylesheet>
