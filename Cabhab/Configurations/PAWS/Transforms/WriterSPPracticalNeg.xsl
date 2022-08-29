<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="neg">
    <section1 id="sNeg">
       <secTitle>Las construcciones de negación</secTitle>
       <p>
<xsl:text>A continuación se presentan los elementos verbales negativos, los adverbios de negación, los pronombres indefinidos negativos y la negación para las frases nominales, luego se explica  el tipo de sistema de negación que utiliza el  </xsl:text>
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
       <section2 id="sNegVerbal">
          <secTitle>Negación auxiliar y verbal</secTitle>
          
          <p contentType="ctComparativeIntro">
<xsl:text>En algunas lenguas la negación verbal es un elemento auxiliar, mientras que en otras lenguas es simplemente un afijo verbal. El español utiliza el auxiliar verbal negativo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> antes del verbo.  
                El inglés tiene el auxiliar negativo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘no’</xsl:text>
</gloss>
<xsl:text>, que es una palabra independiente y siempre debe seguir a otro auxiliar, y la forma de la contracción </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-n’t</langData>
<xsl:text>, que se escribe como sufijo en el auxiliar. Algunos ejemplos de las oraciones transitivas negativas en inglés son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy did not hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho no golpeó el beísbol’</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy won’t hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho no golpeará el beísbol’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might not have hit the ball</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘El muchacho no pudo haber golpeado el beísbol’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
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
<xsl:text>,</xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@negVerbal='yes'"> la negación verbal se expresa en la siguiente manera: </xsl:when>				
                <xsl:when test="//neg/@negVerbal='no'"> no hay ninguna manera para expresar la negación en el verbo ni un auxiliar.</xsl:when>			
             </xsl:choose>
</p>
          <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Hay uno o más auxiliares negativos que se escriben como palabras independientes.  El auxiliar negativo </xsl:text>
<xsl:choose>
                <xsl:when test="//ip/@negAuxRequiresAux='no'">puede ser el único auxiliar en la frase.</xsl:when>
                <xsl:when test="//ip/@negAuxRequiresAux='yes'">no puede ser el único auxiliar en la frase; se requiere un auxilair que no sea negativo.</xsl:when>
             </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.10">
<table border="1">
                <tr>
                   <th>Auxiliares negativos</th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negAuxExample),'.','')" />
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
          
          <xsl:if test="normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Hay </xsl:text>
<xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<xsl:text>también  </xsl:text>
</xsl:if>
<xsl:text>un afijo negativo que se une con un auxiliar positivo.   Ejemplos de los auxiliares positivos con el afijo negativo son:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.14">
<table border="1">
                <tr>
                   <th>Auxiliares negativos</th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negAuxAffixExample),'.','')" />
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
          
          <xsl:if test="normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Hay </xsl:text>
<xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes' or normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<xsl:text>también </xsl:text>
</xsl:if>
<xsl:text>un afijo negativo que se une con un verbo para hacerle negativo.  Algunos ejemplos de los verbos con el afijo negativo verbal son:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.18">
<table border="1">
                <tr>
                   <th>Verbos negativos</th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negVerbExample),'.','')" />
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
             <xsl:if test="normalize-space(//neg/negVerbalOther/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Hay </xsl:text>
<xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes' or normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes' or normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<xsl:text>también </xsl:text>
</xsl:if>
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/negVerbalOther" />
<xsl:text>.  Ejemplos de estos elementos verbales negativos son:</xsl:text>
</p>
</xsl:if>  
          <xsl:if test="normalize-space(//neg/negVerbalOther/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.22">
<table border="1">
                <tr>
                   <th>Elementos verbales negativos</th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negVerbalOtherExample),'.','')" />
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
          
          <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Algunos ejemplos de oraciones completas con palabras auxiliares negativas (sin frases negativas) son:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/auxExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/auxExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/auxExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/auxExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.26.1</xsl:text>
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
          <xsl:if test="normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Algunos ejemplos de oraciones completas con afijos auxiliares negativos unidos a un auxiliar (sin frases negativas) son:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/auxAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/auxAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/auxAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/auxAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.30.1</xsl:text>
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
             <xsl:if test="normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Algunos ejemplos de oraciones completas con verbos negativos son: </xsl:text>
</p>
</xsl:if>
             <xsl:if test="normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/verbAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/verbAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/verbAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/verbAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.34.1</xsl:text>
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
          
          <xsl:if test="normalize-space(//neg/negVerbalOther/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Algunos ejemplos de oraciones completas con elementos verbales negativos como se permiten en el </xsl:text>
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
          <xsl:if test="normalize-space(//neg/negVerbalOther/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.38">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negVerbalOtherSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negVerbalOtherSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negVerbalOtherSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negVerbalOtherSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.38</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.38.1</xsl:text>
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
          <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes' or normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text> De acuerdo con los ejemplos, </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@auxVerbRequired='yes'">no se permite a un auxiliar negativo sinoque el verbo también es negativo.</xsl:when>
                <xsl:when test="//neg/@auxVerbRequired='no'">cuando hay un auxiliar negativo, no se requiere que el verbo sea negativo.</xsl:when>
             </xsl:choose>
</p>
</xsl:if>
       </section2>
       <section2 id="sNegAdverb">
            <secTitle>Negación adverbial</secTitle>
          <p>
<xsl:text>El adverbio de tiempo negativo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nunca</langData>
<xsl:text> se expresa en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de la siguiente manera:</xsl:text>
</p>
          
          <xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes'">
<p>
<xsl:text>Hay una o más palabras independientes que no se relacionan con los adverbios de tiempo positivos.  Estos adverbios de tiempo negativos o frases adverbiales negativas son:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes'">
<example num="xNeg.NegAdverb.8">
<table border="1">
                <tr>
                   <th>Adverbios de tiempo negativos</th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalExample),'.','')" />
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
          
          <xsl:if test="normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<p>
<xsl:text>Hay </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes'">
<xsl:text>también </xsl:text>
</xsl:if>
<xsl:text> un afijo negativo que se une con un adverbio de tiempo positivo para formar uno negativo.  Este afijo negativo es:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<example num="xNeg.NegAdverb.12">
<table border="1">
                <tr>
                   <th>Afijo negativo</th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalAdverbAffixExample),'.','')" />
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
          <xsl:if test="normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<p>
<xsl:text>Ejemplos de los adverbios de tiempo negativos que se forman del afijo negativo con un adverbio de tiempo positivo son:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<example num="xNeg.NegAdverb.16">
<table border="1">
                <tr>
                   <th>Adverbios de tiempo negativos </th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalAdverbExample),'.','')" />
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
          
          <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<p>
<xsl:text>Hay </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<xsl:text>también </xsl:text>
</xsl:if>
<xsl:text>una palabra negativa independiente que se presenta </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordOther/@checked)='no'">
<xsl:text> de un adverbio de tiempo positivo para formar una frase adverbial de tiempo negativa.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/negTemporalTypeAdverbWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordOther/@checked)='yes' or normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordOther/@checked)='yes' or normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordOther/@checked)='yes'">
<xsl:text> de un adverbio de tiempo positivo para formar una frase adverbial de tiempo negativa y también puede presentarse ___</xsl:text> <xsl:value-of select="//neg/negTemporalTypeAdverbWordOther" /> <xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text> Esta palabra negativa es:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<example num="xNeg.NegAdverb.20">
<table border="1">
                <tr>
                   <th>Palabra negativa</th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalAdverbWordExample),'.','')" />
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
          <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de las frases adverbiales de tiempo negativas que consiste en esta palabra negativa con un adverbio de tiempo positivo son:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<example num="xNeg.NegAdverb.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negTemporalAdverbWordsExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negTemporalAdverbWordsExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negTemporalAdverbWordsExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negTemporalAdverbWordsExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.24.1</xsl:text>
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
          
          <xsl:if test="normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<p>
<xsl:text>Hay </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<xsl:text>también </xsl:text>
</xsl:if>
<xsl:text>al menos un afijo verbal que se expresa el mismo significado que un adverbio de tiempo negativo.  Estos afijos verbales son:</xsl:text>
</p>
</xsl:if>                     
          <xsl:if test="normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<example num="xNeg.NegAdverb.28">
<table border="1">
                <tr>
                   <th>Afijos adverbiales de tiempo negativos </th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalAffixExample),'.','')" />
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
          
          <xsl:if test="normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los afijos adverbiales de tiempo negativos unidos con verbos son:</xsl:text>
</p>
</xsl:if>                     
          <xsl:if test="normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<example num="xNeg.NegAdverb.32">
<table border="1">
                <tr>
                   <th>Verbos con un afijo adverbial de tiempo negativo </th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalAffixVerbExample),'.','')" />
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
          
          <xsl:if test="normalize-space(//neg/negTemporalTypeVerb/@checked)='yes'">
<p>
<xsl:text>Hay </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<xsl:text>también </xsl:text>
</xsl:if>
<xsl:text>un afijo verbal negativo, pero puede presentarse con adverbios de tiempo positivos para dar el significado del adverbio de tiempo negativo.  Algunos ejemplos de frases con los adverbios de tiempo positivos y un verbo negativo son:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/negTemporalTypeVerb/@checked)='yes'">
<example num="xNeg.NegAdverb.36">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negTemporalVerbExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negTemporalVerbExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negTemporalVerbExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negTemporalVerbExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.36.1</xsl:text>
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
          <xsl:if test="normalize-space(//neg/negTemporalTypeOther/@checked)='yes'">
<p>
<xsl:text>El adverbio de tiempo negativo puede </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAffix/@checked)='yes' or normalize-space(//neg/negTemporalTypeVerb/@checked)='yes'">
<xsl:text>también </xsl:text>
</xsl:if>
<xsl:text>ser expresado con ___</xsl:text>
<xsl:value-of select="//neg/negTemporalTypeOther" />
<xsl:text> como se muestra aquí:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/negTemporalTypeOther/@checked)='yes'">
<example num="xNeg.NegAdverb.40">
<table border="1">
                <tr>
                   <th>Negativo de tiempo</th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negTemporalOtherExample),'.','')" />
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
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
             </table>
</example>
</xsl:if>
          
          <p>
<xsl:text>Algunos ejemplos de oraciones completas con adverbios de tiempo negativos son:</xsl:text>
</p>
          <example num="xNeg.NegAdverb.44">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/advTemporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/advTemporalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/advTemporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/advTemporalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.44</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.44.1</xsl:text>
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
<xsl:text>El adverbio de lugar negativo que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en ninguna parte</langData>
<xsl:text> se expresa en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> de la siguiente manera:</xsl:text>
</p>

          <xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes'">
<p>
<xsl:text>Hay una o más palabras independientes que no se relacionan con los adverbios de lugar positivos.  Estos adverbios de lugar negativos o frases adverbiales negativos son:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes'">
<example num="xNeg.NegAdverb.50">
<table border="1">
                <tr>
                   <th>Adverbios de lugar negativos </th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeExample),'.','')" />
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
          
          <xsl:if test="normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<p>
<xsl:text>Hay </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes'">
<xsl:text>también </xsl:text>
</xsl:if>
<xsl:text> un afijo negativo que se une con un adverbio de lugar positivo para formar uno negativo.  Este afijo negativo es:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<example num="xNeg.NegAdverb.54">
<table border="1">
                <tr>
                   <th>Afijo negativo</th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeAdverbAffixExample),'.','')" />
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
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
             </table>
</example>
</xsl:if>  
          <xsl:if test="normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<p>
<xsl:text>Ejemplos de los adverbios de lugar negativos que se forman del afijo negativo con un adverbio de lugar positivo son:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<example num="xNeg.NegAdverb.58">
<table border="1">
                <tr>
                   <th>Adverbios de lugar negativos </th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeAdverbExample),'.','')" />
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
          
          <xsl:if test="normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<p>
<xsl:text>Hay </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<xsl:text>también </xsl:text>
</xsl:if>
<xsl:text>una palabra negativa independiente que se presenta </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordOther/@checked)='no'">
<xsl:text> de un adverbio de lugar positivo para formar una frase adverbial de lugar negativa.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/negLocativeTypeAdverbWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordOther/@checked)='yes' or normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordOther/@checked)='yes' or normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordOther/@checked)='yes'">
<xsl:text> de un adverbio de lugar positivo para formar una frase adverbial de lugar negativa y también puede presentarse ___</xsl:text> <xsl:value-of select="//neg/negLocativeTypeAdverbWordOther" /> <xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text> Esta palabra negativa es:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<example num="xNeg.NegAdverb.62">
<table border="1">
                <tr>
                   <th>Palabra negativa</th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeAdverbWordExample),'.','')" />
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
          <xsl:if test="normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de las frases adverbiales de lugar negativas que consiste en esta palabra negativa con un adverbio de lugar positivo son:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<example num="xNeg.NegAdverb.66">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negLocativeAdverbWordsExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negLocativeAdverbWordsExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negLocativeAdverbWordsExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negLocativeAdverbWordsExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.66</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.66.1</xsl:text>
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
          
          <xsl:if test="normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<p>
<xsl:text>Hay </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<xsl:text>también </xsl:text>
</xsl:if>
<xsl:text>al menos un afijo verbal que se expresa el mismo significado que un adverbio de lugar negativo.  Estos afijos verbales son:</xsl:text>
</p>
</xsl:if>                     
          <xsl:if test="normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<example num="xNeg.NegAdverb.70">
<table border="1">
                <tr>
                   <th>Afijos adverbiales de lugar negativos </th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeAffixExample),'.','')" />
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
          
          <xsl:if test="normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los afijos adverbiales de lugar negativos unidos con verbos son:</xsl:text>
</p>
</xsl:if>                     
          <xsl:if test="normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<example num="xNeg.NegAdverb.74">
<table border="1">
                <tr>
                   <th>Verbos con un afijo adverbial negativo de lugar</th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeAffixVerbExample),'.','')" />
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
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
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
             </table>
</example>
</xsl:if>  
          
          <xsl:if test="normalize-space(//neg/negLocativeTypeVerb/@checked)='yes'">
<p>
<xsl:text>Hay </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<xsl:text>también </xsl:text>
</xsl:if>
<xsl:text>un afijo negativo verbal, pero puede presentarse con adverbios de lugar positivos para dar el significado del adverbio de lugar negativo.  Algunos ejemplos de frases con los adverbios de lugar positivos y un verbo negativo son:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/negLocativeTypeVerb/@checked)='yes'">
<example num="xNeg.NegAdverb.78">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negLocativeVerbExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negLocativeVerbExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negLocativeVerbExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negLocativeVerbExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.78</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.78.1</xsl:text>
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
          <xsl:if test="normalize-space(//neg/negLocativeTypeOther/@checked)='yes'">
<p>
<xsl:text>El adverbio de lugar negativo puede </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAffix/@checked)='yes' or normalize-space(//neg/negLocativeTypeVerb/@checked)='yes'">
<xsl:text>también </xsl:text>
</xsl:if>
<xsl:text>ser expresado con ___</xsl:text>
<xsl:value-of select="//neg/negLocativeTypeOther" />
<xsl:text> como se muestra aquí:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/negLocativeTypeOther/@checked)='yes'">
<example num="xNeg.NegAdverb.82">
<table border="1">
                <tr>
                   <th>Negativo de lugar</th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//neg/negLocativeOtherExample),'.','')" />
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
          
          <p>
<xsl:text>Algunos ejemplos de oraciones completas con adverbios de lugar negativos o frases negativas son:</xsl:text>
</p>
          <example num="xNeg.NegAdverb.86">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/advLocativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/advLocativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/advLocativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/advLocativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.86</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.86.1</xsl:text>
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
          
          <xsl:if test="normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negLocativeTypeWord/@checked)='yes'">
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
<xsl:choose>
                    <xsl:when test="//neg/@advVerbRequired='yes'"> un adverbio negativo escrito como palabra independiente no se permite sinoque el verbo también es negativo.</xsl:when>
                   <xsl:when test="//neg/@advVerbRequired='no'"> cuando hay un adverbio negativo escrito como palabra independiente, el verbo no tiene que ser negativo.</xsl:when>
                </xsl:choose>
</p>
</xsl:if>
        </section2>
        
       <section2 id="sNegPron">
          <secTitle>Pronombres indefinidos negativos </secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Hay versiones negativas de los pronombres indefinidos, por ejemplo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nadie</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nada</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ninguno</langData>
<xsl:text>.  Observe que algunos se forman de un elemento negativo con un sustantivo genérico o un número.  A veces no combinarse en una sola palabra, como en</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no one</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘nadie’</xsl:text>
</gloss>
<xsl:text>para el inglés. </xsl:text>
</p>
          
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
<xsl:if test="normalize-space(//neg/@negIndef)='some'">
<xsl:text> algunos de</xsl:text>
</xsl:if>
<xsl:text> los pronombres indefinidos negativos </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@negIndef='yes'">son de una sola palabra. </xsl:when>
                <xsl:when test="//neg/@negIndef='no'">son frases nominales, en lugar de pronombres de una sola palabra. </xsl:when>
                <xsl:when test="//neg/@negIndef='some'">son de una sola palabra, pero otros son frases nominales. </xsl:when>
             </xsl:choose>
<xsl:text>Estos indefinidos negativos son:</xsl:text>
</p>
          
          <example num="xNeg.NegPron.8">
<table border="1">
                <caption>
<xsl:text>Indefinidos negativos</xsl:text>
</caption>
                <tr>
                   <th>Tipo</th>
                   <th>Morfemas</th>
                   <th>Glosa</th>
                </tr>				
                <xsl:if test="normalize-space(//neg/@negIndef)='yes' or normalize-space(//neg/@negIndef)='some'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//neg/negIndefExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.1" select="string-length(normalize-space($sExampleValue0.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.1 != 0 and $sExampleValue0.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Pronombres</xsl:text>
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
<xsl:text>Pronombres</xsl:text>
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
                <xsl:if test="normalize-space(//neg/@negIndef)='no' or normalize-space(//neg/@negIndef)='some'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//neg/negIndefNPExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.1" select="string-length(normalize-space($sExampleValue1.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.1 != 0 and $sExampleValue1.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>Frases</xsl:text>
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
<xsl:text>Frases</xsl:text>
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
          <p>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//neg/@negIndef)='yes'">
<xsl:text>Estos pronombres negativos</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@negIndef)='no'">
<xsl:text>Estas frases negativas</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@negIndef)='some'">
<xsl:text>Estos pronombres negativos y frases negativas</xsl:text>
</xsl:if>
<xsl:text> se pueden utilizar como el sujeto de una oración completa, como se muestra a continuación:</xsl:text>
</p>
          <example num="xNeg.NegPron.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negIndefSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negIndefSubjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negIndefSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negIndefSubjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegPron.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegPron.12.1</xsl:text>
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
          
          <xsl:if test="normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Como los ejemplos de las oraciones muestran, en el </xsl:text>
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
                <xsl:when test="//neg/@subjVerbRequired='yes'"> se requiere que el verbo o auxiliar sea negativo cuando el sujeto es negativo.</xsl:when>
                <xsl:when test="//neg/@subjVerbRequired='no'"> no se requiere que el verbo o auxiliar sea negativo cuando el sujeto es negativo.</xsl:when>
             </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
          
       </section2>
       <section2 id="sNegNominal">
          <secTitle>Negación de frases nominales</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text> Los elementos que significan </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún</langData>
<xsl:text> pueden hacer una frase nominal negativa. Observe que  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> puede presentarse en lugar de o antes de las cuantificadores o palabras de grado de ámbito amplio, como en </xsl:text>
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
<xsl:text>. </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ningún</langData>
<xsl:text> se presenta primero en la frase nominal también, como se muestra en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún perro negro</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ninguna hija</langData>
<xsl:text>.   La negación de una frase nominal normalmente se presenta al inicio o al final, y así su alcance o ámbito es el más amplio de todos los modificadores en la frase nominal.</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text> Los elementos que significan </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ningún</langData>
<xsl:text> pueden hacer una frase nominal negativa.  La negación de una frase nominal normalmente se presenta al inicio o al final, y así su alcance o ámbito es el más amplio de todos los modificadores en la frase nominal.</xsl:text>
</p>
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='none'">
<p>
<xsl:text>Parece que no hay ninguna manera en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> para hacer una frase nominal negativa.</xsl:text>
</p>
</xsl:if>      
          
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none'">
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
<xsl:text>, </xsl:text>
<xsl:if test="normalize-space(//neg/@npDegreeNeg)='some'">
<xsl:text>algunos de </xsl:text>
</xsl:if>
<xsl:text>los elementos que pueden hacer una frase nominal negativa </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@npDegreeNeg='yes'">son palabras independientes.  </xsl:when>
                <xsl:when test="//neg/@npDegreeNeg='some'">son palabras independientes, pero otros se unen </xsl:when>
                <xsl:when test="//neg/@npDegreeNeg='no'">se unen </xsl:when>
             </xsl:choose>
<xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' or normalize-space(//neg/@npDegreeNeg)='some'">
                <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no'">
<xsl:text>al inicio de cualquier otra palabra que comienza la frase nominal como proclíticos.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no'">
<xsl:text>al final de cualquier otra palabra que termina la frase nominal como enclíticos.    </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no'">
<xsl:text>al inicio de cualquier otra palabra que comienza la frase nominal como proclíticos o al final de cualquier otra palabra que termina la frase nominal como enclíticos.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no'">
<xsl:text>al sustantivo principal de la frase nominal como prefijos.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<xsl:text>al sustantivo principal de la frase nominal como sufijos   </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<xsl:text>al sustantivo principal de la frase nominal como afijos.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no' or normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<xsl:text>al inicio de cualquier otra palabra que comienza la frase nominal como proclíticos o al final de cualquier otra palabra que termina la frase nominal como enclíticos, o al sustantivo principal de la frase nominal como afijos.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/npDegreeNegOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes' or normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes' or normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes' or normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes'">
<xsl:text>  Además, algunos se unen ___</xsl:text>
<xsl:value-of select="//neg/npDegreeNegOther" />  <xsl:text>.</xsl:text>
</xsl:if>    
             </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>   
          
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de un clítico negativo en una frase nominal son:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes'">
<example num="xNeg.NegNominal.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negCliticExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negCliticExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negCliticExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negCliticExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.14.1</xsl:text>
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
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de un afijo negativo en una frase nominal son:</xsl:text>
</p>
</xsl:if>   
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<example num="xNeg.NegNominal.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.18.1</xsl:text>
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
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegOther/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegOther/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de un elemento negativo en una frase nominal como se permite en el:</xsl:text>
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
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegOther/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegOther/@checked)='yes'">
<example num="xNeg.NegNominal.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.22.1</xsl:text>
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
          
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='yes' or normalize-space(//neg/@npDegreeNeg)='some'">
<p>
<xsl:text>Las palabras independientes negativas se presentan </xsl:text>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='no' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='no' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='no' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='no' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='no' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='no' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordOther/@checked)='no'">
<xsl:text> del resto de la frase nominal. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='no' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='no' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='no' and normalize-space(//neg/npDegreeNegWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/npDegreeNegWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordOther/@checked)='yes' or normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordOther/@checked)='yes' or normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes' and normalize-space(//neg/npDegreeNegWordOther/@checked)='yes'">
<xsl:text> del resto de la frase nominal y también pueden presentarse ___</xsl:text> <xsl:value-of select="//neg/npDegreeNegWordOther" /> <xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> Algunos ejemplos de las frases nominales negativas sin los cuantificadores o palabras de grado de ámbito amplio son:</xsl:text>
</p>
</xsl:if>          
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='yes' or normalize-space(//neg/@npDegreeNeg)='some'">
<example num="xNeg.NegNominal.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.26.1</xsl:text>
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
          
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none' and normalize-space(//neg/@npDegreeNegCooccur)='no'">
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
<xsl:text> no se premite que elementos negativos se presenten con los cuantificadores o palabras de grado de ámbito amplio en la misma frase nominal.</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none' and normalize-space(//neg/@npDegreeNegCooccur)='yes'">
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
<xsl:text> se permite que los elementos negativos se presenten con los cuantificadores o palabras de grado de ámbito amplio en la misma frase nominal, como se muestra aquí:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none' and normalize-space(//neg/@npDegreeNegCooccur)='yes'">
<example num="xNeg.NegNominal.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negCooccurExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negCooccurExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/negCooccurExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/negCooccurExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.32.1</xsl:text>
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
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none'">
<p>
<xsl:text>Cualquiera de estas frases nominales negativas puede funcionar como el sujeto de una oración.  Algunos ejemplos son: </xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none'">
<example num="xNeg.NegNominal.36">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/npDegreeSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/npDegreeSubjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/npDegreeSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/npDegreeSubjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.36.1</xsl:text>
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
          
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>De acuerdo con los ejemplos, </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@subjVerbRequired='yes'">un sujeto negativo no se permite sin también tener un verbo negativo o un auxiliar negativo.</xsl:when>
                <xsl:when test="//neg/@subjVerbRequired='no'">no se requiere un verbo o auxiliar negativos cuando el sujeto es negativo.</xsl:when>
             </xsl:choose>
</p>
</xsl:if>
          
       </section2>

       <section2 id="sNegType">
          <secTitle>Tipo de sistema de negación</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Cuando se habla de negación, las lenguas pueden dividirse en dos tipos principales: las que cambian la polaridad y las de concordancia negativa, ejemplificadas por inglés estándar contra español, respectivamente.</xsl:text>
</p>
          <p contentType="ctComparativeIntro">
<xsl:text>Las lenguas que cambian la polaridad normalmente solo permiten un elemento negativo en la oración para que la negación sea expresada (sin embargo, cualquier número impar de negativas expresa técnico polaridad negativa) porque la presencia de dos (o cualquier número de pares de) elementos negativos cambia la polaridad de nuevo a positivo. Por ejemplo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John saw nothing</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan vio nada’</xsl:text>
</gloss>
<xsl:text> es negativo, pero </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn’t see nothing</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan no vio nada’</xsl:text>
</gloss>
<xsl:text> es positivo porque significa igual que </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan vio algo</langData>
<xsl:text>.  La versión con un auxiliar negativo se expresa como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn’t see anything</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Juan no vio algo’</xsl:text>
</gloss>
<xsl:text>, usando qué se conoce como “elemento especial de polaridad negativa” en la posición del objeto directo.  Tales elementos pueden presentarse como los sujetos en algunos contextos sin ninguna otra palabra negativa presente, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Anyone may come</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Cualquiera persona pueden venir’</xsl:text>
</gloss>
<xsl:text>, pero pueden presentarse en la posición del objeto solamente cuando un elemento anterior en la oración es negativo. Por ejemplo, uno puede decir </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nobody saw anyone</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Nadie vio cualquiera persona’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nowhere will they find anyone</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘En ninguna parte ellos encuentra a cualquiera persona’</xsl:text>
</gloss>
<xsl:text> pero sin el sujeto negativo o el adverbio negativo en la posición inicial, el auxiliar negativo debe ser utilizado, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>We did not see anyone</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘No vimos a cualquiera persona’</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>They will not find anyone anywhere</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘Ellos no encontrarán a cualquiera persona en cualquier lugar’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
          <p contentType="ctComparativeIntro">
<xsl:text>En lenguas de concordancia negativa, cualquier número de elementos negativos expresa polaridad negativa, entonces en español </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan no vio nada</langData>
<xsl:text> es la manera correcta de expresar una oración negativa con un objeto negativo. 
                En estas lenguas, un elemento negativo normalmente puede presentarse en la posición sujeta o una posición desplazada hacia la izquierda sin ningún otro elemento negativo presente, 
                pero un objeto negativo solamente puede presentarse cuando un elemento anterior en la oración es negativo. 
                Algunas lenguas de concordancia negativa tienen la restricción más fuerte que cualquiera palabra o frase negativa debe presentarse con la negación verbal, y 
                todavía otros requieren el desplazamiento hacia la izquierda de la palabra o frase negativa, semejantemente al desplazamiento hacia la izquierda de las palabras o frases interrogativas en preguntas.</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>Cuando se habla de negación, las lenguas pueden dividirse en dos tipos principales: las que cambian la polaridad y las de concordancia negativa. Las lenguas que cambian la polaridad normalmente solo permiten un elemento negativo en la oración con elementos especiales de polaridad negativa en el lugar de un segundo elemento negativo.   En contraste, en lenguas de concordancia negativa, cualquier número de elementos negativos expresa polaridad negativa porque los elementos negativos concuerdan en polaridad.</xsl:text>
</p>
          <p>
<xsl:text>El </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es una </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@type='changing'">lengua que cambia la polaridad</xsl:when>
                <xsl:when test="//neg/@type='concord'">lengua de concordancia negativa</xsl:when>
             </xsl:choose>
<xsl:text>, puesto que </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@type='changing'">la polaridad cambia entre positiva y negativa con cada expresión negativa. </xsl:when>
                <xsl:when test="//neg/@type='concord'">cualquier número de elementos negativos concuerda para hacer la polaridad negativa. </xsl:when>
             </xsl:choose>
<xsl:text></xsl:text>
</p>
          <xsl:if test="normalize-space(//neg/@type)='changing'">
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
<xsl:text></xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@polarityItems='yes'"> hay los </xsl:when>
                <xsl:when test="//neg/@polarityItems='no'"> no hay los </xsl:when>
             </xsl:choose>
<xsl:text>elementos especiales de polaridad negativas.  </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@polarityItems='yes'">Los pronombres, los determinantes y los adverbios siguientes se presentan en la posición del objeto o la posición normal del adverbio en vez del elemento negativo equivalente cuando otro elemento negativo está presente en la oración.</xsl:when>
                <xsl:when test="//neg/@polarityItems='no'">Los pronombres negativos, los determinantes y los adverbios pueden presentarse en la posición del objeto o la posición normal del adverbio incluso cuando hay otro elemento negativo en la oración.</xsl:when>
                </xsl:choose>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
<example num="xNeg.NegType.16">
<table border="1">
                <tr>
                   <th>Tipo</th>
                   <th>Elementos especiales de polaridad negativas </th>
                   <th>Glosa</th>
                </tr>
                <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//neg/npiPronounExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.1" select="string-length(normalize-space($sExampleValue0.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.1 != 0 and $sExampleValue0.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
                      <xsl:text>Pronombres (y/o frases)</xsl:text>
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
                      <xsl:text>Pronombres (y/o frases)</xsl:text>
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
                <xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//neg/npiDeterminerExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.1" select="string-length(normalize-space($sExampleValue1.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.1 != 0 and $sExampleValue1.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="1">
                      <xsl:text>Determinantes</xsl:text>
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
                      <xsl:text>Determinantes</xsl:text>
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
                <xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//neg/npiTemporalExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.1" select="string-length(normalize-space($sExampleValue2.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.1 != 0 and $sExampleValue2.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="">
                      <xsl:text>Adverbios de tiempo</xsl:text>
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
<td align="left" rowspan="">
                      <xsl:text>Adverbios de tiempo</xsl:text>
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
                <xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//neg/npiLocativeExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.1" select="string-length(normalize-space($sExampleValue3.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.1 != 0 and $sExampleValue3.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left" rowspan="">
                      <xsl:text>Adverbios de lugar</xsl:text>
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
<td align="left" rowspan="">
                      <xsl:text>Adverbios de lugar</xsl:text>
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
          
          <p>
<xsl:text>Algunos ejemplos de oraciones con un sujeto positivo y </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
                <xsl:text>un elemento especial de polaridad negativa en vez de </xsl:text>
             </xsl:if>
<xsl:text>una frase nominal negativa como el objeto son:</xsl:text>
</p>
          <example num="xNeg.NegType.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/objectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/objectExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/objectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/objectExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegType.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegType.20.1</xsl:text>
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
<xsl:text>Algunos ejemplos de oraciones con un sujeto positivo y </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
                <xsl:text>un elemento especial de polaridad negativa en vez de </xsl:text>
             </xsl:if>
<xsl:text>una frase nominal negativa como el objeto indirecto son:</xsl:text>
</p>
          <example num="xNeg.NegType.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/indirectObjectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/indirectObjectExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/indirectObjectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/indirectObjectExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegType.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegType.24.1</xsl:text>
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
          <xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
<p>
<xsl:text>Como muestran los ejemplos, </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
                <xsl:text>no</xsl:text>
             </xsl:if>
<xsl:text> se permite que un elemento especial de polaridad negativa funcionae como el objeto directo o el indirecto </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@objVerbRequired='yes'">a menos que el verbo o auxiliar sea negativo.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='other'">a menos que el verbo o auxiliar o algún otro elemento en la oración sea negativo.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='no'">sin restricción acerca la presencia de otro elemento negativo en la oración.</xsl:when>
             </xsl:choose>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='no'">
<p>
<xsl:text>Como muestran los ejemplos, </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
                <xsl:text>no</xsl:text>
             </xsl:if>
<xsl:text> se permite que una frase nominal negativa funcione como el objeto directo o el indirecto </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@objVerbRequired='yes'">a menos que el verbo o auxiliar sea negativo.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='other'">a menos quee el verbo o auxilair o algún otro elemento en la oración sea negativo.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='no'">sin restricción acerca la presencia de otro elemento negativo en la oración.</xsl:when>
             </xsl:choose>
</p>
</xsl:if>
          
          <xsl:if test="normalize-space(//neg/@type)='concord'">
<p>
<xsl:text>Como muestran los ejemplos, </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
                <xsl:text>no</xsl:text>
             </xsl:if>
<xsl:text> se permite que una frase nominal negativa funcione como el objeto directo o el indirecto </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@objVerbRequired='yes'">a menos que el verbo o auxiliar sea negativo.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='other'">a menos que el verbo o auxiliar o algún otro elemento en la oración sea negativo.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='no'">sin restricción acerca la presencia de otro elemento negativo en la oración.</xsl:when>
             </xsl:choose>
<xsl:choose>
             <xsl:when test="//neg/@negFront='yes'"> Un objeto negativo debe presentarse al principio de la oración, del mismo modo que el desplazamiento hacia la izquierda de las frases interrogativas. </xsl:when>
             <xsl:when test="//neg/@negFront='optional'"> Un objeto negativo puede presentarse al principio de la oración, o puede permanecer en su posición normal. </xsl:when>
             <xsl:when test="//neg/@negFront='beforeVerb'"> Un objeto negativo puede presentarse en la posición directamente antes del verbo, o puede permanecer en su posición normal. </xsl:when>
             <xsl:when test="//neg/@negFront='no'"> Un objeto negativo puede presentarse en la posición directamente antes del verbo, o puede permanecer en su posición normal. </xsl:when>
             </xsl:choose>
</p>
</xsl:if>
          
          
          <xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@negTwoAllowed)='yes'">
<p>
<xsl:text>Finalmente, algunos ejemplos de un sujeto negativo y </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
                <xsl:text>un elemento especial de polaridad negativa en vez de </xsl:text>
             </xsl:if>
<xsl:text>una frase nominal negativa como el objeto son:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@negTwoAllowed)='oneOnly'">
<p>
<xsl:text>No se permiten las oraciones con un sujeto negativo y </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
                <xsl:text>un elemento especial de polaridad negativa en vez de </xsl:text>
             </xsl:if>
<xsl:text>una frase nominal negativa como el objeto en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Algunos ejemplos que muestran cómo se expresan estos sentidos utilzando un indefinido o dos oraciones son:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@type)='concord' and normalize-space(//neg/@negFrontTwo)!='oneOnly'">
<p>
<xsl:text>Finalmente, algunos ejemplos de un sujeto negativo y una frase nominal negativa como el objeto son:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@type)='concord' and normalize-space(//neg/@negFrontTwo)='oneOnly' or normalize-space(//neg/@type)='concord' and normalize-space(//neg/@negTwoAllowed)='oneOnly' and normalize-space(//neg/@negFront)='no'">
<p>
<xsl:text>No se permiten las oraciones con un sujeto negativo y una frase nominal negativa como el objeto en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Algunos ejemplos que muestran cómo se expresan estos sentidos utilzando un indefinido o dos oraciones son:</xsl:text>
</p>
</xsl:if>
          <example num="xNeg.NegType.40">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/subjectObjectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/subjectObjectExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/subjectObjectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/subjectObjectExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegType.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegType.40.1</xsl:text>
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
          
          <xsl:if test="normalize-space(//neg/@type)='concord'">
<p>
<xsl:if test="normalize-space(//neg/@type)='concord' and normalize-space(//neg/@negFront)!='no' and normalize-space(//neg/@negFrontTwo)!='oneOnly'">
                <xsl:text> Si tanto el sujeto como el objeto son negativos, </xsl:text>
                <xsl:choose>
                   <xsl:when test="//neg/@negFrontTwo='yes'">ambos deben presentarse al principio de la oración.</xsl:when>
                   <xsl:when test="//neg/@negFrontTwo='optional'">ambos pueden presentarse al principio de la oración, o el objeto negativo puede permanecer en su posición normal. </xsl:when>
                   <xsl:when test="//neg/@negFrontTwo='beforeVerb'">ambos pueden puede presentarse en la posición directamente antes del verbo, o el objeto negativo puede permanecer en su posición normal. </xsl:when>
                   <xsl:when test="//neg/@negFrontTwo='no'">solamente el sujeto negativo se desplaza al principio de la oración, y el objeto negativo permanece en su posición normal.</xsl:when>
                </xsl:choose>
             </xsl:if>
</p>
</xsl:if>
          
       </section2>
    </section1>

   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
      
         
         
         
         
         
         
         
         
         
         
         
      
   
      
      
      
      
      
      
      
      
      
      
      
   
   

   

   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   


    
        
    
   
      
      
      
   
   
        
        
        


    
    
    
   
   

   
      
      
      
   
   
      
      
      
   
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
    
        
    
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
   
   
      
      
      
   
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
      
      
      
      
      
      
      
      
   
   
      
      
      
   

   
   
        
   
   
      
   
   
      
   
  
     
   
   
      
    
   
      
    
   
      
      
      
    
   
      
      
      
    
   
   
</xsl:template>
</xsl:stylesheet>
