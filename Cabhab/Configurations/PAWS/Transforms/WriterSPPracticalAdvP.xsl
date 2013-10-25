<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="advp">
    <section1 id="sAdvP">
        <secTitle>Los adverbios</secTitle>
       <p>
<xsl:text>Los adverbios expresan cuatro tipos básicos de información: tiempo, lugar, modo, y razón o propósito.  También se presentan los adverbios indefinidos.  Los adverbios interrogativos se presentan en </xsl:text>
<sectionRef sec="sQuesContent" />
<xsl:text>.</xsl:text>
</p>
        <section2 id="sAdvPTemporal">
            <secTitle>Adverbios de tiempo</secTitle>
            <p contentType="ctComparativeIntro">
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
<xsl:text>. </xsl:text>
</p>
           <p>
<xsl:text>Los adverbios de tiempo en el </xsl:text>
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
<table border="1">
                 <tr>
                    <th>Adverbios de tiempo</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/temporalExample),'.','')" />
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

           <p contentType="ctComparativeIntro">
<xsl:text>En muchas lenguas los abverbios de tiempo puenden ser modificado por palabras de grado.  Algunos ejemplos en español son: </xsl:text>
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
           
           <xsl:if test="normalize-space(//advp/@temporalDegree)='no'">
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
<xsl:text> los adverbios de tiempo no se modifican ni intensifican.</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='yes'">
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
<xsl:text>, los adverbios de tiempo pueden ser modificados por palabras de grado que se presentan  </xsl:text>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='yes' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='no' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='no' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='yes' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='no' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='no' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='yes' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='yes' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='yes' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='no' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='no' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='yes' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='yes' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='yes' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordOther/@checked)='no'">
<xsl:text> del adverbio.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='no' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='no' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='no' and normalize-space(//advp/temporalDegreeWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//advp/temporalDegreeWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='yes' and normalize-space(//advp/temporalDegreeWordOther/@checked)='yes' or normalize-space(//advp/temporalDegreeWordAfter/@checked)='yes' and normalize-space(//advp/temporalDegreeWordOther/@checked)='yes' or normalize-space(//advp/temporalDegreeWordBoth/@checked)='yes' and normalize-space(//advp/temporalDegreeWordOther/@checked)='yes'">
<xsl:text> del adverbio y también pueden presentarse  ___</xsl:text>
<xsl:value-of select="//advp/temporalDegreeWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>Las palabras de grado que pueden modificar a un adverbio de tiempo en el  </xsl:text>
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
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='yes'">
<example num="xAdvP.AdvPTemporal.16">
<table border="1">
                 <tr>
                    <th>Palabras de grado</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/temporalDegreeExample),'.','')" />
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
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los adverbios de tiempo con una palabra de grado que los modifica son::</xsl:text>
</p>
</xsl:if>          
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='yes'">
<example num="xAdvP.AdvPTemporal.20">
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
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.20.1</xsl:text>
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
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeAttaches/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='yes'">
<xsl:text>Los adverbios de tiempo también pueden tener afijos o clíticos que se unen al adverbio para intensificarlo.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='no'">
<xsl:text>En el </xsl:text>
                 <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, hay afijos o clíticos que se unen al adverbio de tiempo para intensificarlo.</xsl:text>
</xsl:if>
<xsl:text>  Los afijos o clíticos de grado que pueden modificar a un adverbio de tiempo son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeAttaches/@checked)='yes'">
<example num="xAdvP.AdvPTemporal.24">
<table border="1">
                 <tr>
                    <th>Afijos o clíticos de grado</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/temporalDegreeAffixExample),'.','')" />
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
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeAttaches/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los afijos o clíticos de grado unidos con un adverbio de tiempo son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeAttaches/@checked)='yes'">
<example num="xAdvP.AdvPTemporal.28">
<table border="1">
                 <tr>
                    <th>Adverbios de tiempo modificados</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/temporalPhraseAffixExample),'.','')" />
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

           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeRedup/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/temporalDegreeWord/@checked)='yes' or normalize-space(//advp/temporalDegreeAttaches/@checked)='yes'">
<xsl:text>Además, los adverbios de tiempo pueden utilizar reduplicación para intensificar el significado del adverbio.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='no' and normalize-space(//advp/temporalDegreeAttaches/@checked)='no'">
<xsl:text>En el </xsl:text>
                 <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, utiliza reduplicación para intensificar el significado del adverbio de tiempo.</xsl:text>
</xsl:if>
<xsl:text>  Algunos ejemplos de los adverbios de tiempo con reduplicación son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeRedup/@checked)='yes'">
<example num="xAdvP.AdvPTemporal.32">
<table border="1">
                 <tr>
                    <th>Adverbios de tiempo con reduplicación</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/temporalDegreeRedupExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeOther/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/temporalDegreeWord/@checked)='yes' or normalize-space(//advp/temporalDegreeAttaches/@checked)='yes' or normalize-space(//advp/temporalDegreeRedup/@checked)='yes'">
<xsl:text>Además, los adverbios de tiempo pueden ser </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='no' and normalize-space(//advp/temporalDegreeAttaches/@checked)='no' and normalize-space(//advp/temporalDegreeRedup/@checked)='no'">
<xsl:text>En el </xsl:text>
                 <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los adverbios de tiempo son </xsl:text>
</xsl:if>
<xsl:text>modificados o intensificados por ___ </xsl:text>
<xsl:value-of select="//advp/temporalDegreeOther" />
<xsl:text>.  Algunos ejemplos son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeOther/@checked)='yes'">
<example num="xAdvP.AdvPTemporal.36">
<table border="1">
                 <tr>
                    <th>Adverbios de tiempo modificados</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/temporalDegreeOtherExample),'.','')" />
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
<xsl:text>A menudo, información de tiempo en una oración se expresa con sustantivos.  Algunos ejemplos son: </xsl:text>
</p>
           <example num="xAdvP.AdvPTemporal.40">
<table border="1">
                 <tr>
                    <th>Sustantivos de tiempo</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/temporalNounExample),'.','')" />
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
           <p>
<xsl:text>Los sustantivos de tiempo también pueden ser modificados, como se muestra en estas frases nominales de tiempo: </xsl:text>
</p>
           <example num="xAdvP.AdvPTemporal.44">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/temporalNounModifierExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/temporalNounModifierExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/temporalNounModifierExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/temporalNounModifierExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.44</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.44.1</xsl:text>
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
           
           <p contentType="ctPracticalIntro">
<xsl:text>Otra forma de expresar ‘tiempo’ en una oración es con otros tipos de palabras o de frases, como frases adposicionales y cláusulas adverbiales.  Estas frases se presentan en las mismas posiciones que los adverbios de tiempo, normalmente al inicio o al final de la cláusula. Véase la sección </xsl:text>
<sectionRef sec="sNP" />
<xsl:text> para la estructura de las frases nominales y la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> para un análisis de las frases </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='before'">adposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
              </xsl:choose>
<xsl:text>.  Véase también la sección </xsl:text>
<sectionRef sec="sAdvClTemporal" />
<xsl:text> para ejemplos de cláusulas adverbiales de tiempo. </xsl:text>
</p>
           <p contentType="ctComparativeIntro">
<xsl:text>Otra forma de expresar ‘tiempo’ en una oración es con otros tipos de palabras o de frases, como frases adposicionales </xsl:text>
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
<xsl:text>.  Estas frases se presentan en las mismas posiciones que los adverbios de tiempo, normalmente al inicio o al final de la cláusula. Véase la sección </xsl:text>
<sectionRef sec="sNP" />
<xsl:text> para la estructura de las frases nominales y la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> para un análisis de las frases </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='before'">adposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
              </xsl:choose>
<xsl:text>.  Véase también la sección </xsl:text>
<sectionRef sec="sAdvClTemporal" />
<xsl:text> para ejemplos de cláusulas adverbiales de tiempo. </xsl:text>
</p>
        </section2>
        <section2 id="sAdvPLocative">
            <secTitle>Adverbios de lugar</secTitle>
            <p contentType="ctComparativeIntro">
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
<xsl:text>.</xsl:text>
</p>
 
           <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//advp/@locativeClassifier)='yes'">
<p>
<xsl:text>Las raíces de los adverbios de lugar en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se muestran aquí.  Cada adverbio puede presentarse con el clasificador apropiado.</xsl:text>
</p>
</xsl:if>           
           <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//advp/@locativeClassifier)!='yes'">
<p>
<xsl:text>Los adverbios de lugar en el </xsl:text>
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
           <example num="xAdvP.AdvPLocative.10">
<table border="1">
                 <tr>
                    <th>Adverbios de lugar</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/locativeExample),'.','')" />
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
<xsl:if test="normalize-space(//advp/@locativeDem)='someSame'">
<xsl:text>algunas de </xsl:text>
</xsl:if>
<xsl:text>las formas de los adverbios de lugar </xsl:text>
<xsl:choose>
                 <xsl:when test="//advp/@locativeDem='distinct'">son completemente diferentes de los pronombres demostrativos. </xsl:when>
                 <xsl:when test="//advp/@locativeDem='same'">son idénticas a los pronombres demostrativos, pero se presentan en posiciones distintos en la oración. </xsl:when>
                 <xsl:when test="//advp/@locativeDem='someSame'">son idénticas a los pronombres demostrativos, pero otras son diferentes. </xsl:when>
                 <xsl:when test="//advp/@locativeDem='demAffix'">se relacionan a los pronombres demostrativos por medio de un afijo que se une a un pronombre demostrativo para formar un adverbio de lugar. </xsl:when>
                 <xsl:when test="//advp/@locativeDem='locativeAffix'">se relacionan a los pronombres demostrativos por medio de un afijo que se une a un adverbio de lugar para formar un pronombre demostrativo. </xsl:when>
                 <xsl:when test="//advp/@locativeDem='other'">se relacionan a los pronombres demostrativos en esta manera: </xsl:when>
              </xsl:choose>
<xsl:if test="normalize-space(//advp/@locativeDem)='other'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//advp/locativeDemOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:text> Véase la  sección </xsl:text>
<sectionRef sec="sPronDem" />
<xsl:text> para información acerca de los pronombres demostrativos.</xsl:text>
</p>
           
           <p contentType="ctComparativeIntro">
<xsl:text>En muchas lenguas los abverbios de lugar pueden ser modificados por palabras de grado.  Los adverbios de lugar en español se pueden modificar por </xsl:text>
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
 
           <xsl:if test="normalize-space(//advp/@locativeDegree)='no'">
<p>
<xsl:text>Los adverbios de lugar no se modifican ni intensifican en.el </xsl:text>
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
           <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='yes'">
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
<xsl:text>, los adverbios de lugar pueden ser modificados por palabras de grado que se presentan  </xsl:text>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='yes' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='no' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='no' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='yes' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='no' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='no' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='yes' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='yes' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='yes' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='no' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='no' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='yes' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='yes' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='yes' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordOther/@checked)='no'">
<xsl:text> del adverbio.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='no' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='no' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='no' and normalize-space(//advp/locativeDegreeWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//advp/locativeDegreeWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='yes' and normalize-space(//advp/locativeDegreeWordOther/@checked)='yes' or normalize-space(//advp/locativeDegreeWordAfter/@checked)='yes' and normalize-space(//advp/locativeDegreeWordOther/@checked)='yes' or normalize-space(//advp/locativeDegreeWordBoth/@checked)='yes' and normalize-space(//advp/locativeDegreeWordOther/@checked)='yes'">
<xsl:text> del adverbio y también pueden presentarse  ___</xsl:text>
<xsl:value-of select="//advp/locativeDegreeWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>Las palabras de grado que pueden modificar a un adverbio de lugar son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='yes'">
<example num="xAdvP.AdvPLocative.20">
<table border="1">
                 <tr>
                    <th>Palabras de grado</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/locativeDegreeExample),'.','')" />
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
           <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los adverbios de lugar con una palabra de grado que los modifica son:</xsl:text>
</p>
</xsl:if>        
           <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='yes'">
<example num="xAdvP.AdvPLocative.24">
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
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.24.1</xsl:text>
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

           <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeAttaches/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='yes'">
<xsl:text>Los adverbios de lugar también pueden tener afijos o clíticos que se unen al adverbio para intensificarlo.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='no'">
<xsl:text>En el </xsl:text>
                 <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, hay afijos o clíticos que se unen al adverbio de lugar para intensificarlo.</xsl:text>
</xsl:if>
<xsl:text>  Los afijos o clíticos de grado que pueden modificar a un adverbio de lugar son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeAttaches/@checked)='yes'">
<example num="xAdvP.AdvPLocative.28">
<table border="1">
                 <tr>
                    <th>Afijos o clíticos de grado</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/locativeDegreeAffixExample),'.','')" />
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
           <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeAttaches/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los afijos o clíticos de grado unidos con un adverbio de lugar son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeAttaches/@checked)='yes'">
<example num="xAdvP.AdvPLocative.32">
<table border="1">
                 <tr>
                    <th>Adverbios de lugar modificados</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/locativePhraseAffixExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeRedup/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/locativeDegreeWord/@checked)='yes' or normalize-space(//advp/locativeDegreeAttaches/@checked)='yes'">
<xsl:text>Además, los adverbios de lugar pueden utilizar reduplicación para intensificar el significado del adverbio.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='no' and normalize-space(//advp/locativeDegreeAttaches/@checked)='no'">
<xsl:text>En el </xsl:text>
                 <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, utiliza reduplicación para intensificar el significado del adverbio de lugar.</xsl:text>
</xsl:if>
<xsl:text>  Algunos ejemplos de los adverbios de lugar con reduplicación son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeRedup/@checked)='yes'">
<example num="xAdvP.AdvPLocative.36">
<table border="1">
                 <tr>
                    <th>Adverbios de lugar con reduplicación</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/locativeDegreeRedupExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeOther/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/locativeDegreeWord/@checked)='yes' or normalize-space(//advp/locativeDegreeAttaches/@checked)='yes' or normalize-space(//advp/locativeDegreeRedup/@checked)='yes'">
<xsl:text>Además, los adverbios de lugar pueden ser </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='no' and normalize-space(//advp/locativeDegreeAttaches/@checked)='no' and normalize-space(//advp/locativeDegreeRedup/@checked)='no'">
<xsl:text>En el </xsl:text>
                 <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los adverbios de lugar son </xsl:text>
</xsl:if>
<xsl:text>modificados o intensificados por ___ </xsl:text>
<xsl:value-of select="//advp/locativeDegreeOther" />
<xsl:text>.  Algunos ejemplos son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeOther/@checked)='yes'">
<example num="xAdvP.AdvPLocative.40">
<table border="1">
                 <tr>
                    <th>Adverbios de lugar modificados</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/locativeDegreeOtherExample),'.','')" />
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
           
            <p contentType="ctPracticalIntro">
<xsl:text>Un lugar también se puede expresar con una frase adposicional o solo una frase nominal, la cual consiste en un nombre propio o una descripción del lugar. Las expresiones de lugar normalmente pueden presentarse al inicio o al final de una cláusula, o como complementos de verbos de movimiento. Véase la sección </xsl:text>
<sectionRef sec="sIPMotion" />
<xsl:text> para otros ejemplos con verbos de movimiento. 
</xsl:text>
</p>
           <p contentType="ctComparativeIntro">
<xsl:text>El lugar también se puede expresar con una frase adposicional, por ejemplo: </xsl:text>
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
<xsl:text>.  Muchas lenguas permiten solo una frase nominal, la cual consiste en un nombre propio o una descripción del lugar. Las expresiones de lugar normalmente pueden presentarse al inicio o al final de una cláusula, o como complementos de verbos de movimiento. Véase la sección </xsl:text>
<sectionRef sec="sIPMotion" />
<xsl:text> para otros ejemplos con verbos de movimiento. 
              </xsl:text>
</p>
        
        </section2>
       
        <section2 id="sAdvPManner">
            <secTitle>Adverbios de modo</secTitle>
           <p contentType="ctPracticalIntro">
<xsl:text>Los adverbios de modo modifican al verbo directamente y se pueden escribir como palabras independientes o como afijos en el verbo.</xsl:text>
</p>
           <p contentType="ctComparativeIntro">
<xsl:text>Los adverbios de modo modifican al verbo directamente y generalmente terminan con el sufijo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-mente</langData>
<xsl:text> en español.  En algunas lenguas, los adverbios de modo se escriben como afijos en el verbo, en vez de como palabras independientes.</xsl:text>
</p>
           
           <xsl:if test="normalize-space(//advp/@mannerType)='word'">
<p>
<xsl:text>Los adverbios de modo en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se escriben como palabras independientes. Algunos ejemplos son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@mannerType)='word'">
<example num="xAdvP.AdvPManner.10">
<table border="1">
                 <tr>
                    <th>Alverbios de modo</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/mannerExample),'.','')" />
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
           <xsl:if test="normalize-space(//advp/@mannerType)='both'">
<p>
<xsl:text>Algunos de los adverbios de modo en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> se escriben como palabras independientes, pero otros se unen con el verbo.  Los afijos se muestran con un guion en el siguiente cuadro:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@mannerType)='both'">
<example num="xAdvP.AdvPManner.14">
<table border="1">
                 <tr>
                    <th>Alverbios de modo</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/mannerExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//advp/@mannerType)='Affix'">
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
<xsl:text> se escriben como afijos en el verbo.  Ejemplos de estos afijos son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@mannerType)='Affix'">
<example num="xAdvP.AdvPManner.18">
<table border="1">
                 <tr>
                    <th>Afijos adverbiales de modo</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/mannerExample),'.','')" />
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
           
           <p contentType="ctComparativeIntro">
<xsl:text>Los adverbios de modo normalmente se pueden modificar por palabras de grado.  En español, los adverbios de modo se pueden modificar por </xsl:text>
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
           
           <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='no'">
<p>
<xsl:text>Los adverbios de modo no se modifican ni intensifican en.el </xsl:text>
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
           <xsl:if test="normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='no'">
<p>
<xsl:text>Los adverbios de modo que se escriben como palabras independientes no se modifican ni intensifican en.el </xsl:text>
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
           <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeWord/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeWord/@checked)='yes'">
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
<xsl:text>, los adverbios de modo </xsl:text>
<xsl:if test="normalize-space(//advp/@mannerType)='both'">
<xsl:text>que se escriben como palabras independientes </xsl:text>
</xsl:if>
<xsl:text>pueden ser modificados por palabras de grado que se presentan </xsl:text>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='yes' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='no' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='no' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='yes' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='no' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='no' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='yes' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='yes' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='yes' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='no' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='no' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='yes' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='yes' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='yes' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordOther/@checked)='no'">
<xsl:text> del adverbio.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='no' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='no' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='no' and normalize-space(//advp/mannerDegreeWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//advp/mannerDegreeWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='yes' and normalize-space(//advp/mannerDegreeWordOther/@checked)='yes' or normalize-space(//advp/mannerDegreeWordAfter/@checked)='yes' and normalize-space(//advp/mannerDegreeWordOther/@checked)='yes' or normalize-space(//advp/mannerDegreeWordBoth/@checked)='yes' and normalize-space(//advp/mannerDegreeWordOther/@checked)='yes'">
<xsl:text> del adverbio y también pueden presentarse  ___</xsl:text>
<xsl:value-of select="//advp/mannerDegreeWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>Las palabras de grado que pueden modificar a un adverbio de modo son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeWord/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeWord/@checked)='yes'">
<example num="xAdvP.AdvPManner.28">
<table border="1">
                 <tr>
                    <th>Palabras de grado</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/mannerDegreeExample),'.','')" />
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
              <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeWord/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeWord/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los adverbios de modo con una palabra de grado que los modifica son:</xsl:text>
</p>
</xsl:if>        
           <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeWord/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeWord/@checked)='yes'">
<example num="xAdvP.AdvPManner.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/mannerPhraseExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/mannerPhraseExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/mannerPhraseExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/mannerPhraseExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPManner.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPManner.32.1</xsl:text>
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
           
              <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/mannerWordDegreeWord/@checked)='yes'">
<xsl:text>Los adverbios de modo también pueden tener afijos o clíticos que se unen al adverbio para intensificarlo.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerWordDegreeWord/@checked)='no'">
<xsl:text>En el </xsl:text>
                    <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, hay afijos o clíticos que se unen al adverbio de modo para intensificarlo.</xsl:text>
</xsl:if>
<xsl:text>  Los afijos o clíticos de grado que pueden modificar a un adverbio de modo son:</xsl:text>
</p>
</xsl:if>
              <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes'">
<example num="xAdvP.AdvPManner.36">
<table border="1">
                    <tr>
                       <th>Afijos o clíticos de grado</th>
                       <th>Glosa</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/mannerDegreeAffixExample),'.','')" />
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
              <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los afijos o clíticos de grado unidos con un adverbio de modo son:</xsl:text>
</p>
</xsl:if>
              <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes'">
<example num="xAdvP.AdvPManner.40">
<table border="1">
                    <tr>
                       <th>Adverbios de modo modificados</th>
                       <th>Glosa</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/mannerPhraseAffixExample),'.','')" />
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
              
              <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeRedup/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeRedup/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/mannerWordDegreeWord/@checked)='yes' or normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes'">
<xsl:text>Además, los adverbios de modo pueden utilizar reduplicación para intensificar el significado del adverbio.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerWordDegreeWord/@checked)='no' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='no'">
<xsl:text>En el para intensificar el significado del adverbio de modo.</xsl:text>
                    <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, utiliza reduplicación </xsl:text>
</xsl:if>
<xsl:text>  Algunos ejemplos de los adverbios de modo con reduplicación son:</xsl:text>
</p>
</xsl:if>
              <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeRedup/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeRedup/@checked)='yes'">
<example num="xAdvP.AdvPManner.44">
<table border="1">
                    <tr>
                       <th>Adverbios de modo con reduplicación</th>
                       <th>Glosa</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/mannerDegreeRedupExample),'.','')" />
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
              
              <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeOther/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeOther/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/mannerWordDegreeWord/@checked)='yes' or normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes' or normalize-space(//advp/mannerWordDegreeRedup/@checked)='yes'">
<xsl:text>Además, los adverbios de modo pueden ser </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerWordDegreeWord/@checked)='no' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='no' and normalize-space(//advp/mannerWordDegreeRedup/@checked)='no'">
<xsl:text>En el </xsl:text>
                    <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los adverbios de modo son </xsl:text>
</xsl:if>
<xsl:text>modificados o intensificados por ___ </xsl:text>
<xsl:value-of select="//advp/mannerDegreeOther" />
<xsl:text>.  Algunos ejemplos son:</xsl:text>
</p>
</xsl:if>
              <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeOther/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeOther/@checked)='yes'">
<example num="xAdvP.AdvPManner.48">
<table border="1">
                    <tr>
                       <th>Adverbiois de modo modificados</th>
                       <th>Glosa</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/mannerDegreeOtherExample),'.','')" />
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
              
           <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='no'">
<p>
<xsl:text>Los afijos adverbiales de modo no se modifican ni intensifican en.el </xsl:text>
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
</xsl:if>        <xsl:if test="normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='no'">
<p>
<xsl:text>Los afijos adverbiales de modo no se modifican ni intensifican en.el </xsl:text>
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
           <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes'">
<p>
<xsl:text>Los afijos adverbiales de modo pueden ser modificados por afijos de grado que se presentan </xsl:text>
<xsl:if test="normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
<xsl:text> del afijo adverbial.  Los afijos de grado que pueden modificar a un afijo adverbial de modo en el  </xsl:text>
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
           <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes'">
<example num="xAdvP.AdvPManner.56">
<table border="1">
                 <tr>
                    <th>Afijos de grado</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/mannerAffixDegreeExample),'.','')" />
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
           <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los afijos adverbiales de modo unidoa a un verbo con afijos de grado que también los modifican son:</xsl:text>
</p>
</xsl:if>          
           <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes'">
<example num="xAdvP.AdvPManner.60">
<table border="1">
                 <tr>
                    <th>Verbos modificados</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/mannerAffixDegreePhraseExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeRedup/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeRedup/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes'">
<xsl:text>Además, los afijos adverbiales de modo pueden utilizar reduplicación para intensificar el significado del afijo adverbial.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='no' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='no'">
<xsl:text>En el </xsl:text>
                 <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, utiliza reduplicación para intensificar el significado del afijo adverbial de modo.</xsl:text>
</xsl:if>
<xsl:text>  Algunos ejemplos de los afijos adverbiales de modo unidos a un verbo con reduplicación son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeRedup/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeRedup/@checked)='yes'">
<example num="xAdvP.AdvPManner.64">
<table border="1">
                 <tr>
                    <th>Afijos adverbiales de modo en verbos con reduplicación</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/mannerAffixDegreeRedupExample),'.','')" />
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
           
           <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeOther/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeOther/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes' or normalize-space(//advp/mannerAffixDegreeRedup/@checked)='yes'">
<xsl:text>Además, los afijos adverbiales de modo pueden ser </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='no' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='no' and normalize-space(//advp/mannerAffixDegreeRedup/@checked)='no'">
<xsl:text>En el </xsl:text>
                 <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los afijos adverbiales de modo son </xsl:text>
</xsl:if>
<xsl:text>modificados o intensificados por ___ </xsl:text>
<xsl:value-of select="//advp/mannerDegreeOther" />
<xsl:text>.  Algunos ejemplos son:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeOther/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeOther/@checked)='yes'">
<example num="xAdvP.AdvPManner.68">
<table border="1">
                 <tr>
                    <th>Afijos adverbiales de modo modificados</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/mannerAffixDegreeOtherExample),'.','')" />
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
           
           <p contentType="ctComparativeIntro">
<xsl:text>Los adverbios de modo no parecen tener el mismo significado que otros tipos de frases, con la excepción de oraciones comparativas como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tan rápido como puede</langData>
<xsl:text>.  Las oraciones comparativas se tratan en la sección </xsl:text>
<sectionRef sec="sIPComparatives" />
<xsl:text>. </xsl:text>
</p>          
           <p contentType="ctPracticalIntro">
<xsl:text>Los adverbios de modo no parecen tener el mismo significado que otros tipos de frases, con la excepción de oraciones comparativas que se discuten en la sección </xsl:text>
<sectionRef sec="sIPComparatives" />
<xsl:text>. </xsl:text>
</p>                  
           
        </section2>
       
        <section2 id="sAdvPReason">
            <secTitle>Adverbios que expresan razón o propósito</secTitle>
           <p contentType="ctPracticalIntro">
<xsl:text>Los adverbios que expresan razón o propósito se pueden expresar con un adverbio, una cláusula adverbial o una frase adposicional.</xsl:text>
</p>
           <p contentType="ctComparativeIntro">
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
<xsl:text>La razón o el propósito también se puede expresar con una cláusula adverbial que empieza con </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>porque</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>desde que</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ya que</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>para</langData>
<xsl:text>.  Estas frases o cláusulas adverbiales se presentan al inicio o al final de la oración.  La estructura de las cláusulas adverbiales se analiza en la sección </xsl:text>
<sectionRef sec="sAdvClReason" />
<xsl:text>. </xsl:text>
</p>
 
           <p>
<xsl:text>Los adverbios independientes que expresan razón o propósito o están al inicio de una cláusula adverbial que expresa razón o propósito en el </xsl:text>
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
           <example num="xAdvP.AdvPReason.12">
<table border="1">
                 <tr>
                    <th>Adverbios que expresan razón o propósito</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/reasonExample),'.','')" />
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
           <p contentType="ctComparativeIntro">
<xsl:text> La razón o el propósito también se pueden expresar con una frase preposicional en español, por ejemplo </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por esta razón</langData>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en propósito</langData>
<xsl:text>.  Las frases adposicionales se analizan en la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>.
              </xsl:text>
</p>
           <p>
<xsl:text>Las frases </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
              </xsl:choose>
<xsl:text> que expresan razón o propósito son:  </xsl:text>
</p>
           <example num="xAdvP.AdvPReason.18">
<table border="1">
                 <tr>
                    <th>Otros expresiones de razón o propósito</th>
                    <th>Glosa</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//advp/reasonPPExample),'.','')" />
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
           
           <p>
<xsl:text>Algunos ejemplos de oraciones con adverbios que expresan razón o propósito o de cláusulas adverbiales o frases </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
              </xsl:choose>
<xsl:text> que expresan razón o propósito son:
</xsl:text>
</p>
            <example num="xAdvP.AdvPReason.22">
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
<xsl:with-param name="sExNumber">xAdvP.AdvPReason.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPReason.22.1</xsl:text>
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
           <p contentType="ctPracticalIntro">
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> para más información acerca de las frases </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
              </xsl:choose>
<xsl:text> y la sección </xsl:text>
<sectionRef sec="sAdvClReason" />
<xsl:text> para cláusulas adverbiales que expresan razón o propósito. </xsl:text>
</p>
           
        </section2>
        <section2 id="sAdvPIndef">
          <secTitle>Adverbios indefinidos</secTitle>
           <p contentType="ctComparativeIntro">
<xsl:text>Hay dos sistemas básicas de adverbios indefinidos, aunque no todas las lenguas fusionan en una sola palabra: aquellos que constan de un cuantificador y un sustantivo genérico, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cada vez</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>por todas partes</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en cualquier momento</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en cualquier lugar</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en algún momento</langData>
<xsl:text>,</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>en algún lugar</langData>
<xsl:text> y aquellos construídos de una palabra interrogativa y una palabra indefinida, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cuandoquiera</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dondequiera</langData>
<xsl:text>.</xsl:text>
</p>	   
           <p contentType="ctPracticalIntro">
<xsl:text>Los adverbios indefinidos se utilizan para referirse a un tiempo o un lugar no especificado. Normalmente constan de un cuantificador y un sustantivo genérico o una palabra interrogativa y una palabra indefinida, y no se pueden fusionar en una sola palabra.</xsl:text>
</p>
          <p>
<xsl:text>El primer tipo, los adverbios indefinidos de tiempo que incluyen un cuantificador y un sustantivo genérico, en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='no' and normalize-space(//advp/temporalIndefQWord/@checked)='yes' and normalize-space(//advp/temporalIndefQOther/@checked)='no'">
<xsl:text> se expresan con un cuantificador y un sustantivo genérico de tiempo que se fusionan en una sola palabra. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefQWord/@checked)='yes' and normalize-space(//advp/temporalIndefQOther/@checked)='no'">
<xsl:text> se expresan a veces con un cuantificador y un sustantivo genérico de tiempo que se fusionan en una sola palabra, pero otros se permanecen independientes como una frase.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='no' and normalize-space(//advp/temporalIndefQWord/@checked)='yes' and normalize-space(//advp/temporalIndefQOther/@checked)='yes'">
<xsl:text> se expresan a veces con un cuantificador y un sustantivo genérico de tiempo que se fusionan en una sola palabra, pero otros se expresan con  ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefQOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefQWord/@checked)='no' and normalize-space(//advp/temporalIndefQOther/@checked)='no'">
<xsl:text> se expresan con un cuantificador y un sustantivo genérico de tiempo que no se pueden fusionar en una sola palabra sino que se permanecen independientes como una frase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefQWord/@checked)='no' and normalize-space(//advp/temporalIndefQOther/@checked)='yes'">
<xsl:text> se expresan con un cuantificador y un sustantivo genérico de tiempo que no se pueden fusionar en una sola palabra sino que se permanecen independientes como una frase, pero otros se expresan con  ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefQOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefQWord/@checked)='yes' and normalize-space(//advp/temporalIndefQOther/@checked)='yes'">
<xsl:text> se expresan con un cuantificador y un sustantivo genérico de tiempo que a veces se fusionan en una sola palabra y otros veces se permanecen independientes como una frase, pero otros se expresan con  ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefQOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> Los adverbio indefinidos de lugar </xsl:text>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='no' and normalize-space(//advp/locativeIndefQWord/@checked)='yes' and normalize-space(//advp/locativeIndefQOther/@checked)='no'">
<xsl:text>se expresan con un cuantificador y un sustantivo genérico de lugar que se fusionan en una sola palabra. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefQWord/@checked)='yes' and normalize-space(//advp/locativeIndefQOther/@checked)='no'">
<xsl:text>se expresan a veces con un cuantificador y un sustantivo genérico de lugar que se fusionan en una sola palabra, pero otros se permanecen independientes como una frase.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='no' and normalize-space(//advp/locativeIndefQWord/@checked)='yes' and normalize-space(//advp/locativeIndefQOther/@checked)='yes'">
<xsl:text>se expresan a veces con un cuantificador y un sustantivo genérico de lugar que se fusionan en una sola palabra, pero otros se expresan con ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefQOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefQWord/@checked)='no' and normalize-space(//advp/locativeIndefQOther/@checked)='no'">
<xsl:text>se expresan con un cuantificador y un sustantivo genérico de lugar que no se pueden fusionar en una sola palabra sino que se permanecen independientes como una frase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefQWord/@checked)='no' and normalize-space(//advp/locativeIndefQOther/@checked)='yes'">
<xsl:text>se expresan con un cuantificador y un sustantivo genérico de lugar que no se pueden fusionar en una sola palabra sino que se permanecen independientes como una frase, pero otros se expresan con ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefQOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefQWord/@checked)='yes' and normalize-space(//advp/locativeIndefQOther/@checked)='yes'">
<xsl:text>se expresan con un cuantificador y un sustantivo genérico de lugar que a veces se fusionan en una sola palabra y otros veces se permanecen independientes como una frase, pero otros se expresan con  ___</xsl:text>
<xsl:value-of select="//avdp/locativeIndefQOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
          <xsl:if test="normalize-space(//advp/temporalIndefQWord/@checked)='yes' or normalize-space(//advp/locativeIndefQWord/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los adverbios indefinidos de este tipo que se escriben como una sola palabra son:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/temporalIndefQWord/@checked)='yes' or normalize-space(//advp/locativeIndefQWord/@checked)='yes'">
<example num="xAdvP.AdvPIndef.12">
<table border="1">
                <caption>
<xsl:text>Adverbios indefinidos con cuantificadores</xsl:text>
</caption> 
                <tr>
                   <th>Tipo</th>
                   <th>Adverbio</th>
                   <th>Glosa</th>
                </tr>				
                <xsl:if test="normalize-space(//advp/temporalIndefQWord/@checked)='yes'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//advp/temporalIndefTypeQWordExample),'.','')" />
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
<xsl:text>Tiempo</xsl:text>
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
<xsl:text>Tiempo</xsl:text>
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
                <xsl:if test="normalize-space(//advp/locativeIndefQWord/@checked)='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//advp/locativeIndefTypeQWordExample),'.','')" />
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
<xsl:text>Lugar</xsl:text>
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
<xsl:text>Lugar</xsl:text>
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
          <xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' or normalize-space(//advp/locativeIndefQPhrase/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQOther/@checked)='no'">
                <xsl:text>En los adverbios indefinidos de tiempo que son frases, el cuantificador se presenta </xsl:text>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
                <xsl:text> del sustantivo genérico. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQOther/@checked)='no'">
                <xsl:text>En los adverbios indefinidos de lugar que son frases, el cuantificador se presenta </xsl:text>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
                <xsl:text> del sustantivo genérico. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'"> 
                <xsl:text>En los adverbios indefinidos de tiempo que son frases, el cuantificador se presenta  ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefTypeQPQOther" />
                <xsl:text>. </xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'"> 
                <xsl:text>En los adverbios indefinidos de lugar que son frases, el cuantificador se presenta  ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefTypeQPQOther" />
                <xsl:text>. </xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' or normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' or normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
                <xsl:text>En los adverbios indefinidos de tiempo que son frases, el cuantificador se presenta </xsl:text>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
                <xsl:text> del sustantivo genérico, y también puede presentarse ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefTypeQPQOther" />
<xsl:text>. </xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' or normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' or normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
                <xsl:text>En los adverbios indefinidos de lugar que son frases, el cuantificador se presenta </xsl:text>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
                <xsl:text> del sustantivo genérico, y también puede presentarse ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefTypeQPQOther" />
<xsl:text>. </xsl:text>
             </xsl:if>
<xsl:text>  Algunos ejemplos de frases indefinidas son:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' or normalize-space(//advp/locativeIndefQPhrase/@checked)='yes'">
<example num="xAdvP.AdvPIndef.16">
<table border="1">
                <caption>
<xsl:text>Frases adverbiales indefinidas con cuantificadores</xsl:text>
</caption> 
                <tr>
                   <th>Tipo</th>
                   <th>Adverbio</th>
                   <th>Glosa</th>
                </tr>				
                <xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//advp/temporalIndefTypeQPhraseExample),'.','')" />
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
<xsl:text>Tiempo</xsl:text>
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
<xsl:text>Tiempo</xsl:text>
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
                <xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//advp/locativeIndefTypeQPhraseExample),'.','')" />
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
<xsl:text>Lugar</xsl:text>
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
<xsl:text>Lugar</xsl:text>
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
          <xsl:if test="normalize-space(//advp/temporalIndefQOther/@checked)='yes' or normalize-space(//advp/locativeIndefQOther/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los indefinidos como se permite en el </xsl:text>
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
          <xsl:if test="normalize-space(//advp/temporalIndefQOther/@checked)='yes' or normalize-space(//advp/locativeIndefQOther/@checked)='yes'">
<example num="xAdvP.AdvPIndef.20">
<table border="1">
                <caption>
<xsl:text>Adverbios indefinidos con cuantificadores</xsl:text>
</caption> 
             <tr>
                <th>Tipo</th>
                <th>Adverbio</th>
                <th>Glosa</th>
             </tr>				
             <xsl:if test="normalize-space(//advp/temporalIndefQOther/@checked)='yes'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//advp/temporalIndefTypeQOtherExample),'.','')" />
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
<xsl:text>Tiempo</xsl:text>
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
<xsl:text>Tiempo</xsl:text>
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
             <xsl:if test="normalize-space(//advp/locativeIndefQOther/@checked)='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//advp/locativeIndefTypeQOtherExample),'.','')" />
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
<xsl:text>Lugar</xsl:text>
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
<xsl:text>Lugar</xsl:text>
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
          <p>
<xsl:text>Para el segundo tipo de indefinido que incluye una palabra interrogativa y una palabra indefinida, en el </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> los adverbios indefinidos de tiempo </xsl:text>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='no' and normalize-space(//advp/temporalIndefIntWord/@checked)='yes' and normalize-space(//advp/temporalIndefIntOther/@checked)='no'">
<xsl:text>se expresan con una palabra interrogativa de tiempo y un indefinido unidos en una sola palabra. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefIntWord/@checked)='yes' and normalize-space(//advp/temporalIndefIntOther/@checked)='no'">
<xsl:text>se expresan a veces con una palabra interrogativa de tiempo y un indefinido unidos en una sola palabra, pero otros se escriben como frases. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='no' and normalize-space(//advp/temporalIndefIntWord/@checked)='yes' and normalize-space(//advp/temporalIndefIntOther/@checked)='yes'">
<xsl:text>se expresan a veces con una palabra interrogativa de tiempo y un indefinido unidos en una sola palabra, pero otros se expresan por ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefIntOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefIntWord/@checked)='no' and normalize-space(//advp/temporalIndefIntOther/@checked)='no'">
<xsl:text>se expresan con una palabra interrogativa de tiempo y un indefinido que no se pueden fusionar en una sola palabra sino que  permanecen independientes como una frase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefIntWord/@checked)='no' and normalize-space(//advp/temporalIndefIntOther/@checked)='yes'">
<xsl:text>se expresan a veces con una palabra interrogativa de tiempo y un indefinido que no se pueden fusionar en una sola palabra sino que  permanecen independientes como una frase, pero otros se expresan por ___</xsl:text>
<xsl:value-of select="//advp/temporralIndefIntOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefIntWord/@checked)='yes' and normalize-space(//advp/temporalIndefIntOther/@checked)='yes'">
<xsl:text>se expresan con una palabra interrogativa de tiempo y un indefinido que a veces se fusionan en una sola palabra y otros veces se permanecen independientes en una frase, pero otros se expresan por ___</xsl:text>
<xsl:value-of select="//avdp/temporalIndefIntOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> Los adverbios indefinidos de lugar </xsl:text>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='no' and normalize-space(//advp/locativeIndefIntWord/@checked)='yes' and normalize-space(//advp/locativeIndefIntOther/@checked)='no'">
<xsl:text>se expresan con una palabra interrogativa de lugar y un indefinido unidos en una sola palabra. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefIntWord/@checked)='yes' and normalize-space(//advp/locativeIndefIntOther/@checked)='no'">
<xsl:text>se expresan a veces con una palabra interrogativa de lugar y un indefinido unidos en una sola palabra, pero otros se escriben como frases. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='no' and normalize-space(//advp/locativeIndefIntWord/@checked)='yes' and normalize-space(//advp/locativeIndefIntOther/@checked)='yes'">
<xsl:text>se expresan a veces con una palabra interrogativa de lugar y un indefinido unidos en una sola palabra, pero otros se expresan por ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefIntOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefIntWord/@checked)='no' and normalize-space(//advp/locativeIndefIntOther/@checked)='no'">
<xsl:text>se expresan con una palabra interrogativa de lugar y un indefinido que no se pueden fusionar en una sola palabra sino que  permanecen independientes como una frase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefIntWord/@checked)='no' and normalize-space(//advp/locativeIndefIntOther/@checked)='yes'">
<xsl:text>se exprrsan a veces con una palabra interrogativa de lugar y un indefinido que no se pueden fusionar en una sola palabra sino que  permanecen independientes como una frase, pero otros se expresan por ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefIntOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefIntWord/@checked)='yes' and normalize-space(//advp/temporalIndefIntOther/@checked)='yes'">
<xsl:text>se expresan con una palabra interrogativa de lugar y un indefinido que a veces se fusionan en una sola palabra y otros veces se permanecen independientes en una frase, pero otros se expresan por ___</xsl:text>
<xsl:value-of select="//avdp/locativeIndefIntOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
          <xsl:if test="normalize-space(//advp/temporalIndefIntWord/@checked)='yes' or normalize-space(//advp/locativeIndefIntWord/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los adverbios indefinidos de este tipo que se escriben como una sola palabra son:</xsl:text>
</p>
</xsl:if>
             <xsl:if test="normalize-space(//advp/temporalIndefIntWord/@checked)='yes' or normalize-space(//advp/locativeIndefIntWord/@checked)='yes'">
<example num="xAdvP.AdvPIndef.26">
<table border="1">
                <caption>
<xsl:text>Adverbios indefinidos con interrogativos</xsl:text>
</caption> 
                <tr>
                   <th>Tipo</th>
                   <th>Adverbio</th>
                   <th>Glosa</th>
                </tr>				
                <xsl:if test="normalize-space(//advp/temporalIndefIntWord/@checked)='yes'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//advp/temporalIndefTypeIntWordExample),'.','')" />
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
<xsl:text>Tiempo</xsl:text>
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
<xsl:text>Tiempo</xsl:text>
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
                <xsl:if test="normalize-space(//advp/locativeIndefIntWord/@checked)='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//advp/locativeIndefTypeIntWordExample),'.','')" />
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
<xsl:text>Lugar</xsl:text>
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
<xsl:text>Lugar</xsl:text>
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
          <xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' or normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes'">
<p>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntOther/@checked)='no'">
                <xsl:text>En los adverbios indefinidos de tiempo que son frases, la palabra interrogativa se presenta </xsl:text>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
                <xsl:text> del indefinido. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntOther/@checked)='no'">
                <xsl:text>En los adverbios indefinidos de lugar que son frases, la palabra interrogativa se presenta </xsl:text>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
                <xsl:text> del indefinido. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'"> 
                <xsl:text>En los adverbios indefinidos de tiempo que son frases, la palabra interrogativa se presenta ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefTypeIntOther" />
                <xsl:text>. </xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'"> 
                <xsl:text>En los adverbios indefinidos de lugar que son frases, la palabral interrogativa se presenta ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefTypeIntOther" />
                <xsl:text>. </xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' or normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' or normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
                <xsl:text>En los adverbios indefinidos de tiempo que son frases, la palabra interrogativa se presenta </xsl:text>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
                <xsl:text> del indefinido, y también puede presentarse ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefTypeIntOther" />
<xsl:text>. </xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' or normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' or normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
                <xsl:text>En los adverbios indefinidos de lugar que son frases, la palabra interrogativa se presenta </xsl:text>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'">
<xsl:text>antes</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'">
<xsl:text>después</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'">
<xsl:text>de cualquier lado</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>antes o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>después o en ambos lados</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>de cualquier lado o en ambos lados</xsl:text>
</xsl:if>
                <xsl:text> del indefinido, y también puede presentarse ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefTypeIntOther" />
<xsl:text>. </xsl:text>
             </xsl:if>
<xsl:text>  Algunos ejemplos de las frases indefinidas son:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' or normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes'">
<example num="xAdvP.AdvPIndef.30">
<table border="1">
                <caption>
<xsl:text>Frases adverbiales indefinidas con palabras interrogativas</xsl:text>
</caption> 
                <tr>
                   <th>Tipo</th>
                   <th>Adverbio</th>
                   <th>Glosa</th>
                </tr>			
                <xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//advp/temporalIndefTypeIntPhraseExample),'.','')" />
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
<xsl:text>Tiempo</xsl:text>
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
<xsl:text>Tiempo</xsl:text>
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
                <xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//advp/locativeIndefTypeIntPhraseExample),'.','')" />
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
<xsl:text>Lugar</xsl:text>
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
<xsl:text>Lugar</xsl:text>
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
           <xsl:if test="normalize-space(//advp/temporalIndefIntOther/@checked)='yes' or normalize-space(//advp/locativeIndefIntOther/@checked)='yes'">
<p>
<xsl:text>Algunos ejemplos de los indefinidos formados como se permiten en el </xsl:text>
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
          <xsl:if test="normalize-space(//advp/temporalIndefIntOther/@checked)='yes' or normalize-space(//advp/locativeIndefIntOther/@checked)='yes'">
<example num="xAdvP.AdvPIndef.34">
<table border="1">
                <caption>
<xsl:text>Adverbios indefinidos con palabras interrogativas</xsl:text>
</caption> 
                <tr>
                   <th>Tipo</th>
                   <th>Adverbio</th>
                   <th>Glosa</th>
                </tr>				
                <xsl:if test="normalize-space(//advp/temporalIndefIntOther/@checked)='yes'">
<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//advp/temporalIndefTypeIntOtherExample),'.','')" />
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
<xsl:text>Tiempo</xsl:text>
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
<xsl:text>Tiempo</xsl:text>
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
                <xsl:if test="normalize-space(//advp/locativeIndefIntOther/@checked)='yes'">
<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//advp/locativeIndefTypeIntOtherExample),'.','')" />
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
<xsl:text>Lugar</xsl:text>
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
<xsl:text>Lugar</xsl:text>
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
       </section2>
       
    </section1>
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   


   

   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
      
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
    
       
         
   
      
        
   
      
      
      
      
      
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
      
         
         
         
         
         
         
   
      
      
      
         
   
      
      
      
         
   
      
      
      
      
      

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
         
   
      
      
      
      
   
      
      
      
      
   
      
      
      
      
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
         
 
   
      
      
      
   
   
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
   
   
      
   
   
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
   
   
    
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
   
   
      
   
   
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
   
   
    
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
   
   
      
   
   
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
   
   
   
      
      
      
      
      
      
      
   
    
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
   
   
      
   
   
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
   
   
    
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
   
</xsl:template>
</xsl:stylesheet>
