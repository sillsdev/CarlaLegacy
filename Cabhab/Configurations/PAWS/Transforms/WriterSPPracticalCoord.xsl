<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="coord">
  <section1 id="sCoord">
      <secTitle>Las construcciones coordinadas</secTitle>
     <p contentType="ctComparativeIntro">
<xsl:text>Esta sección empieza con las construcciones coordinadas básicas en que una conjunción se presenta entre dos oraciones. Estas incluyen la coordinación a nivel de la oración, la frase verbal, la frase nominal, la frase </xsl:text>
<xsl:choose>
           <xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
           <xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
           <xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
           <xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
        </xsl:choose>
<xsl:text> y la frase adjetival.  Luego, para el nivel de la frase nominal solamente, se describen los elementos consecutivos como en una lista y las aposiciones. </xsl:text>
</p>
     
     <p contentType="ctComparativeIntro">
<xsl:text>En español, las conjunciones que se pueden utilizar entre dos oraciones enlazadas son </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>y</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>o</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pero</langData>
<xsl:text> e </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>y/o</langData>
<xsl:text>.  Además, hay las construcciones coordinadas que requieren una conjunción inicial, como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>o...o</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ni...ni</langData>
<xsl:text> construcciones. Algunas lenguas también utilizan una palabra que significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>con</langData>
<xsl:text> igual que una conjunción entre las frases nominales. </xsl:text>
</p>
     
     <p contentType="ctPracticalIntro">
<xsl:text>Se presentan ejemplos de coordinación a nivel de la oración, de la frase verbal, la frase nominal, la frase </xsl:text>
<xsl:choose>
           <xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
           <xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
           <xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
           <xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
        </xsl:choose>
<xsl:text> y la frase adjetival.  Luego, se describen los elementos consecutivos  y aposiciones. </xsl:text>
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
<xsl:text> usa las siguientes conjunciones entre las oraciones enlazadas:</xsl:text>
</p>
            <example num="xCoord.12">
<table border="1">
                    <tr>
                        <th>Morfemas</th>
                        <th>Glosa</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//coord/and),'.','')" />
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
                            <xsl:text>y</xsl:text>
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
                            <xsl:text>y</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//coord/or),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.0" select="string-length(normalize-space($sExampleValue1.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.0 != 0 and $sExampleValue1.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
                            <xsl:text>o</xsl:text>
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
                            <xsl:text>o</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//coord/andOr),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.0" select="string-length(normalize-space($sExampleValue2.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.0 != 0 and $sExampleValue2.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
                            <xsl:text>y/o</xsl:text>
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
                            <xsl:text>y/o</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//coord/but),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.0" select="string-length(normalize-space($sExampleValue3.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.0 != 0 and $sExampleValue3.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
                            <xsl:text>pero</xsl:text>
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
                            <xsl:text>pero</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue4.0">
<xsl:value-of select="translate(string(//coord/with),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.0" select="string-length(normalize-space($sExampleValue4.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.0 != 0 and $sExampleValue4.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
                            <xsl:text>con</xsl:text>
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
                            <xsl:text>con</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue5.0">
<xsl:value-of select="translate(string(//coord/other),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.0" select="string-length(normalize-space($sExampleValue5.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.0 != 0 and $sExampleValue5.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
                            <xsl:text>otros (si hay)</xsl:text>
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
                            <xsl:text>otros (si hay)</xsl:text>
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
<xsl:text>, las siguientes conjunciones solo se utilizan en las construcciones </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>o...o</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ni...ni</langData>
<xsl:text>:</xsl:text>
</p>
            <example num="xCoord.16">
<table border="1">
                    <tr>
                        <th>Morfemas</th>
                        <th>Glosa</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//coord/either),'.','')" />
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
                            <xsl:text>o (cualquiera) - elemento inicial</xsl:text>
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
                            <xsl:text>o (cualquiera) - elemento inicial</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                   <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//coord/eitherOr),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.0" select="string-length(normalize-space($sExampleValue1.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.0 != 0 and $sExampleValue1.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
                         <xsl:text>o - elemento del medio</xsl:text>
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
                         <xsl:text>o - elemento del medio</xsl:text>
                      </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                   <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//coord/neither),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.0" select="string-length(normalize-space($sExampleValue2.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.0 != 0 and $sExampleValue2.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
                            <xsl:text>ni (ningunos) - elemento inicial</xsl:text>
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
                            <xsl:text>ni (ningunos) - elemento inicial</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                   <xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//coord/nor),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.0" select="string-length(normalize-space($sExampleValue3.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.0 != 0 and $sExampleValue3.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
                         <xsl:text>ni - elemento del medio</xsl:text>
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
                         <xsl:text>ni - elemento del medio</xsl:text>
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
<xsl:choose>
        <xsl:when test="//coord/@conjWord='yes'">todas estas conjunciones se escriben como palabras independientes entre las oraciones enlazadas.</xsl:when>
        <xsl:when test="//coord/@conjWord='some'">algunas de estas conjunciones se escriben como palabras independientes entre las oraciones enlazadas, pero otras se unen </xsl:when>
        <xsl:when test="//coord/@conjWord='no'">todas estas conjunciones se unen </xsl:when>
     </xsl:choose>
<xsl:if test="normalize-space(//coord/@conjWord)!='yes'">
           <xsl:if test="normalize-space(//coord/proclitic/@checked)='yes' and normalize-space(//coord/enclitic/@checked)='no'">
<xsl:text>al principio de la segunda oración como proclíticos</xsl:text>
</xsl:if>
           <xsl:if test="normalize-space(//coord/proclitic/@checked)='no' and normalize-space(//coord/enclitic/@checked)='yes'">
<xsl:text>al final de la primera oración como enclíticos</xsl:text>
</xsl:if>
           <xsl:if test="normalize-space(//coord/proclitic/@checked)='yes' and normalize-space(//coord/enclitic/@checked)='yes'">
<xsl:text>al final de la primera oración o al principio de la segunda oración como clíticos, según lo indicado con los guiones en los cuadros de arriba</xsl:text>
</xsl:if>
           <xsl:if test="normalize-space(//coord/attachesOther/@checked)='no'">
<xsl:text>. </xsl:text>
</xsl:if>
           <xsl:if test="normalize-space(//coord/proclitic/@checked)='no' and normalize-space(//coord/enclitic/@checked)='no' and normalize-space(//coord/attachesOther/@checked)='yes'">
<xsl:text>al ___</xsl:text>
<xsl:value-of select="//coord/attachesOther" />
<xsl:text>. </xsl:text>
</xsl:if>
           <xsl:if test="normalize-space(//coord/proclitic/@checked)='yes' and normalize-space(//coord/attachesOther/@checked)='yes' or normalize-space(//coord/enclitic/@checked)='yes' and normalize-space(//coord/attachesOther/@checked)='yes'">
<xsl:text> y pueden unirse también al ___</xsl:text>
<xsl:value-of select="//coord/attachesOther" />
<xsl:text>. </xsl:text>
</xsl:if>
        </xsl:if>
<xsl:if test="normalize-space(//coord/@noConj)='yes'">
<xsl:text> Además de usar estas conjunciones, dos elementos pueden también ser coordinadas sin ninguna conjunción entre ellas, al menos en los niveles de la frase nominal y la oración.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//coord/@noConj)='no'">
<xsl:text> Cuando solamente se unen dos elementos, se debe presentar una de ellas.</xsl:text>
</xsl:if>
</p>
     
     <section2 id="sCoordLevels">        
        <secTitle>Niveles de coordinación</secTitle>
        
        <p>
<xsl:text>En las siguientes secciones se presentan ejemplos de los varios niveles de coordinación.</xsl:text>
</p>
        <section3 id="sCoordSentence">
            <secTitle>Coordinación a nivel de la oración</secTitle>
           <p contentType="ctComparativeIntro">
<xsl:text>En general, la coordinación ocurre entre categorías similares. Para la coordinación a nivel de la oración, esto significa que dos oraciones declarativas pueden ser coordinadas, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan fue a la oficina esta mañana y él acaba de volver</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>O vendré a la fiesta o enviaré a mi hermana</langData>
<xsl:text>, o dos preguntas, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>¿Cuándo vino el correo y dónde está mi paquete?</langData>
<xsl:text>  Cuando la conjunción significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pero</langData>
<xsl:text>, una de las oraciones enlazadas debe ser negativa, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Juan fue a la oficina esta mañana pero él no volvió</langData>
<xsl:text>.</xsl:text>
</p>
           <p contentType="ctPracticalIntro">
<xsl:text>En general, la coordinación ocurre entre categorías similares. Para la coordinación a nivel de la oración, esto significa que dos oraciones declarativas o dos preguntas pueden ser coordinadas, . Cuando la conjunción significa </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>pero</langData>
<xsl:text>, una de las oraciones enlazadas debe ser negativa.</xsl:text>
</p>
           
            <p>
<xsl:text> Algunos ejemplos de la coordinación a nivel de la oración en el </xsl:text>
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
            <example num="xCoord.CoordLevels.CoordSentence.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/sentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/sentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/sentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/sentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordSentence.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordSentence.10.1</xsl:text>
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
<xsl:text>Véase la sección </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text> para considerar los ejemplos de palabras o cláusulas de introducción, designadas a veces como coordinación, y los ejemplos de cláusulas adverbiales, que son subordinación.</xsl:text>
</p>
</section3>
        <section3 id="sCoordVP">
            <secTitle>Coordinación de la frase verbal</secTitle>
           <p contentType="ctComparativeIntro">
<xsl:text>La coordinación de la frase verbal implica dos frases verbales completas que comparten un solo sujeto. Se ejemplifica en las siguientes oraciones en español: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Guillermo corrió la carrera y ganó el premio</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Susana irá a la fiesta o enviará a su hermana</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Susana ni irá a la fiesta ni enviará a su hermana</langData>
<xsl:text>.</xsl:text>
</p>
           <p contentType="ctPracticalIntro">
<xsl:text>La coordinación de la frase verbal implica dos frases verbales completas que comparten un solo sujeto.</xsl:text>
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
<xsl:text>, algunos ejemplos de coordinación de la frase verbal  son: </xsl:text>
</p>
            <example num="xCoord.CoordLevels.CoordVP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/vpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/vpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/vpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/vpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordVP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordVP.10.1</xsl:text>
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
        <section3 id="sCoordDP">
            <secTitle>Coordinación de la frase nominal</secTitle>
           <p contentType="ctComparativeIntro">
<xsl:text>Las frases nominales coordinadas generalmente pueden presentarse como sujetos, objetos directos, objetos indirectos y objetos de </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">preposiciones</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">posposiciones</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">adposiciones</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adposiciones</xsl:when>
              </xsl:choose>
<xsl:text> como cualquier frase nominal. La coordinación de la frase nominal se ejemplifica en las siguientes oraciones en español: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Guillermo corrió en el maratón de Boston y las Olimpiadas</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mi hermana o yo estará allí</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ni su hermana ni mi hermano estará allí</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Vendré al ensayo pero no a la cena</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Vendré a la boda y/o la recepción</langData>
<xsl:text>.</xsl:text>
</p>   
           <p contentType="ctPracticalIntro">
<xsl:text>Las frases nominales coordinadas generalmente pueden presentarse como sujetos, objetos directos, objetos indirectos y objetos de </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">preposiciones</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">posposiciones</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">adposiciones</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adposiciones</xsl:when>
              </xsl:choose>
<xsl:text> como cualquier frase nominal.</xsl:text>
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
<xsl:text>, algunos ejemplos de coordinación de la frase nominal son: </xsl:text>
</p>
            <example num="xCoord.CoordLevels.CoordDP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/dpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/dpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/dpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/dpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordDP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordDP.10.1</xsl:text>
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
      <section3 id="sCoordPP">
          <secTitle>
          <xsl:choose>
                <xsl:when test="//pp/@pPos='before'">Coordinación de la frase preposicional</xsl:when>
                <xsl:when test="//pp/@pPos='after'">Coordinación de la frase posposcional</xsl:when>
                <xsl:when test="//pp/@pPos='both'">Coordinación de la frase adposcional</xsl:when>
                <xsl:when test="//pp/@pPos='unknown'">Coordinación de la frase adposcional</xsl:when>
            </xsl:choose>
            </secTitle>
         <p contentType="ctComparativeIntro">
<xsl:text>Usualmente también es posible para las frases </xsl:text>
<xsl:choose>
               <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
               <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
               <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
               <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
            </xsl:choose>
<xsl:text> coordinadas presentarse en todas las posiciones en que cualquier frase </xsl:text>
<xsl:choose>
               <xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
               <xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
               <xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
               <xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
            </xsl:choose>
<xsl:text> puede presentarse.  Algunos ejemplos en español de coordinación de la frase preposicional son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Guillermo corrió a través del bosque y sobre el puente</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Vendré con usted al ensayo pero no a su hogar</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Vendré o a la boda o a la recepción</langData>
<xsl:text>.</xsl:text>
</p> 
         <p contentType="ctPracticalIntro">
<xsl:text>Usualmente también es posible para las frases </xsl:text>
<xsl:choose>
               <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
               <xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
               <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
               <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
            </xsl:choose>
<xsl:text> coordinadas presentarse en todas las posiciones en que cualquier frase </xsl:text>
<xsl:choose>
               <xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
               <xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
               <xsl:when test="//pp/@pPos='both'">adposicional</xsl:when>
               <xsl:when test="//pp/@pPos='unknown'">adposicional</xsl:when>
            </xsl:choose>
<xsl:text> puede presentarse.</xsl:text>
</p> 
         <p>
<xsl:text>Algunos ejemplos de coordinación de las frases </xsl:text>
<xsl:choose>
                  <xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
                  <xsl:when test="//pp/@pPos='after'">posposctionales</xsl:when>
                  <xsl:when test="//pp/@pPos='both'">adposicionales</xsl:when>
                  <xsl:when test="//pp/@pPos='unknown'">adposicionales</xsl:when>
</xsl:choose>
<xsl:text> en el </xsl:text>
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
          <example num="xCoord.CoordLevels.CoordPP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/coordppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/coordppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/coordppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/coordppExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordPP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordPP.10.1</xsl:text>
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
        <section3 id="sCoordAdj">
            <secTitle>Coordinación de la frase adjetival</secTitle>
           <p contentType="ctComparativeIntro">
<xsl:text>Finalmente, los adjetivos o frases adjetivales usualmente pueden ser coordinadas cuando modifican a un sustantivo, por ejemplo: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El perro blanco y negro pertenece a mi hijo</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mi hermana quiere una vela roja o azul</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ese parece un dolor terriblemente doloroso y muy peligroso en su pierna</langData>
<xsl:text>, y también cuando actúan como el adjetivo predicativo en una oración copulativa, como en: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El lesión en su pierna es muy feo y doloroso y peligroso</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Este material siente muy liso y sedoso</langData>
<xsl:text>.</xsl:text>
</p>
           <p contentType="ctPracticalIntro">
<xsl:text>Finalmente, los adjetivos o frases adjetivales usualmente pueden ser coordinadas cuando modifican a un sustantivo y también cuando actúan como el adjetivo predicativo en una oración copulativa.</xsl:text>
</p>
           <p>
<xsl:text>Algunos ejemplos de coordinación del adjetivo o la frase adjetival en el </xsl:text>
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
            <example num="xCoord.CoordLevels.CoordAdj.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/adjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/adjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/adjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/adjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordAdj.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordAdj.10.1</xsl:text>
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
     
     <section2 id="sCoordList">
        <secTitle>Elementos consecutivos</secTitle>
        <p contentType="ctComparativeIntro">
<xsl:text>Los elementos consecutivos consisten en tres o más artículos que están coordinados para formar una sola frase nominal. Los elementos iniciales normalmente se separan con comas y una conjunción se presenta antes del elemento final en la lista, aunque existen diversas posibilidades. Algunos ejemplos en español de frases nominales con elementos consecutivos son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Juan, Guillermo, Susana y María]</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Juan, Guillermo, Susana y/o María]</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Juan y Guillermo o Susana y María]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[un gato, dos perros y un pollo pero no un mono]</langData>
<xsl:text>.</xsl:text>
</p>
        <p contentType="ctPracticalIntro">
<xsl:text>Los elementos consecutivos consisten en tres o más artículos que están coordinados para formar una sola frase nominal. Los elementos iniciales normalmente se separan con comas y una conjunción se presenta antes del elemento final en la lista, aunque existen diversas posibilidades. </xsl:text>
</p>
        
        <p>
<xsl:text>Algunos ejemplos de elementos consecutivos en el </xsl:text>
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
        <example num="xCoord.CoordList.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/listExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/listExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/listExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/listExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordList.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordList.10.1</xsl:text>
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
     
     <section2 id="sCoordAppositive">
        <secTitle>Aposiciones</secTitle>
        <p contentType="ctComparativeIntro">
<xsl:text>Las aposiciones también forman una sola frase nominal.  Estas consisten normalmente en un nombre seguido de una coma y entonces una descripción también seguida de una coma o el orden puede invertirse. Algunos ejemplos en español son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[George Washington, el primer Presidente de los Estados Unidos,]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Mi hermano, Jaime,]</langData>
<xsl:text>.</xsl:text>
</p>
        <p contentType="ctPracticalIntro">
<xsl:text>Las aposiciones también forman una sola frase nominal.  Estas consisten normalmente en un nombre seguido de una coma y entonces una descripción también seguida de una coma o el orden puede invertirse.</xsl:text>
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
<xsl:text>, algunos ejemplos de frases nominales que contienen aposiciones son:</xsl:text>
</p>
        <example num="xCoord.CoordAppositive.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/appositiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/appositiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/appositiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/appositiveExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordAppositive.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordAppositive.10.1</xsl:text>
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
