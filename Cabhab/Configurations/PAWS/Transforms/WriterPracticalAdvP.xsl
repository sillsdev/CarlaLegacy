<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="advp">
    <section1 id="sAdvP">
        <secTitle>Adverbs</secTitle>
        <p>
<xsl:text>Adverbs express four basic types of information: time, location, manner, and reason or purpose. Adverbial indefinites are also discussed.  Interrogative adverbs are covered in section </xsl:text>
<sectionRef sec="sQuesContent" />
<xsl:text>.</xsl:text>
</p>

        <section2 id="sAdvPTemporal">
            <secTitle>Temporal Adverbs</secTitle>
            <p contentType="ctComparativeIntro">
<xsl:text>Temporal adverbs include the English words: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>already</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>then</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>soon</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>now</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>later</langData>
<xsl:text>, and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>always</langData>
<xsl:text>. </xsl:text>
</p>

           <p>
<xsl:text>The temporal adverbs in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are: 
              </xsl:text>
</p>           
           <example num="xAdvP.AdvPTemporal.8">
<table border="1">
                 <tr>
                    <th>Temporal adverbs</th>
                    <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
              </table>
</example>
           
           <p contentType="ctComparativeIntro">
<xsl:text>Many languages allow degree words to modify adverbs.  Example English temporal adverbial phrases including degree word modifiers are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>very soon</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>much later</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only now</langData>
<xsl:text>. </xsl:text>
</p>

           <xsl:if test="normalize-space(//advp/@temporalDegree)='no'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, temporal adverbs are not modified or intensified.</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='yes'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, temporal adverbs may be modified by degree words which occur </xsl:text>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='yes' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='no' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='no' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='yes' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='no' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='no' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='yes' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='yes' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='yes' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='no' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='no' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='yes' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='yes' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='yes' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordOther/@checked)='no'">
<xsl:text> the temporal adverb.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='no' and normalize-space(//advp/temporalDegreeWordAfter/@checked)='no' and normalize-space(//advp/temporalDegreeWordBoth/@checked)='no' and normalize-space(//advp/temporalDegreeWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//advp/temporalDegreeWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalDegreeWordBefore/@checked)='yes' and normalize-space(//advp/temporalDegreeWordOther/@checked)='yes' or normalize-space(//advp/temporalDegreeWordAfter/@checked)='yes' and normalize-space(//advp/temporalDegreeWordOther/@checked)='yes' or normalize-space(//advp/temporalDegreeWordBoth/@checked)='yes' and normalize-space(//advp/temporalDegreeWordOther/@checked)='yes'">
<xsl:text> the temporal adverb and may also occur  ___</xsl:text>
<xsl:value-of select="//advp/temporalDegreeWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>The degree words which can modify the temporal adverbs in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='yes'">
<example num="xAdvP.AdvPTemporal.16">
<table border="1">
                 <tr>
                    <th>Degree words</th>
                    <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Examples of temporal adverbs with degree words modifying them are:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
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
<xsl:text>Temporal adverbs may also have </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='no'">
<xsl:text>In </xsl:text>
                 <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, there are </xsl:text>
</xsl:if>
<xsl:text>affixes or clitics that attach to the temporal adverb to intensify it.  The degree affixes or clitics which can modify temporal adverbs are:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeAttaches/@checked)='yes'">
<example num="xAdvP.AdvPTemporal.24">
<table border="1">
                 <tr>
                    <th>Degree affixes or clitics</th>
                    <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Examples of temporal adverbs with a degree affix or clitic attached are:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeAttaches/@checked)='yes'">
<example num="xAdvP.AdvPTemporal.28">
<table border="1">
                 <tr>
                    <th>Modified Temporal Adverbs</th>
                    <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Temporal adverbs may also use reduplication to </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='no' and normalize-space(//advp/temporalDegreeAttaches/@checked)='no'">
<xsl:text>In </xsl:text>
                 <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, reduplication is used to </xsl:text>
</xsl:if>
<xsl:text>intensify the meaning of  the temporal adverb.  Examples of the temporal adverbs with reduplication modifying or intensifying them are:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeRedup/@checked)='yes'">
<example num="xAdvP.AdvPTemporal.32">
<table border="1">
                 <tr>
                    <th>Reduplicated Temporal Adverbs</th>
                    <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Temporal adverbs may also be </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeWord/@checked)='no' and normalize-space(//advp/temporalDegreeAttaches/@checked)='no' and normalize-space(//advp/temporalDegreeRedup/@checked)='no'">
<xsl:text>In </xsl:text>
                 <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, temporal adverbs are </xsl:text>
</xsl:if>
<xsl:text>modified or intensified by ___ </xsl:text>
<xsl:value-of select="//advp/temporalDegreeOther" />
<xsl:text>.  Examples of temporal adverbs which are modified or intensified in this way are:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//advp/@temporalDegree)='yes' and normalize-space(//advp/temporalDegreeOther/@checked)='yes'">
<example num="xAdvP.AdvPTemporal.36">
<table border="1">
                 <tr>
                    <th>Modified or Intensified Temporal Adverbs</th>
                    <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
              </table>
</example>
</xsl:if>
           
           <p>
<xsl:text>The time element of a sentence is often expressed by nouns.  Some examples are: </xsl:text>
</p>
           <example num="xAdvP.AdvPTemporal.40">
<table border="1">
                 <tr>
                    <th>Temporal Nouns</th>
                    <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
              </table>
</example>
           <p>
<xsl:text>These temporal nouns can also be modified, as shown in these temporal nominal phrases: </xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
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
<xsl:text>The time element of a sentence can also be expressed by other types of words or phrases, such as adpositional
phrases and adverbial clauses.  These phrases occur in the same positions as the temporal adverbs, normally either initially or finally in the clause.  See section </xsl:text>
<sectionRef sec="sNP" />
<xsl:text> for the structure of nominal phrases and section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> for information on adpositional phrases.  See also section </xsl:text>
<sectionRef sec="sAdvClTemporal" />
<xsl:text> for examples of temporal adverbial clauses.</xsl:text>
</p>
           <p contentType="ctComparativeIntro">
<xsl:text>The time element of a sentence can also be expressed by other types of words or phrases, such as prepositional
                 phrases </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>for a long time</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>in a little while</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>at 10 o’clock</langData>
<xsl:text>, and
                 adverbial clauses </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>while you are working</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>when Sue arrived</langData>
<xsl:text>.  These phrases occur in the same positions as the temporal adverbs, normally either initially or finally in the clause.  See section </xsl:text>
<sectionRef sec="sNP" />
<xsl:text> for the structure of nominal phrases and section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> for information on adpositional phrases.  See also section </xsl:text>
<sectionRef sec="sAdvClTemporal" />
<xsl:text> for examples of temporal adverbial clauses.</xsl:text>
</p>
        </section2>
       <section2 id="sAdvPLocative">
          <secTitle>Locative Adverbs</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Locative adverbs include the English words: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>here</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there</langData>
<xsl:text>. </xsl:text>
</p>
          
          <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//advp/@locativeClassifier)='yes'">
<p>
<xsl:text>The roots of the locative adverbs in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here  Each one may surface with the apropriate classifier attached.</xsl:text>
</p>
</xsl:if>           
          <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//advp/@locativeClassifier)!='yes'">
<p>
<xsl:text>The locative adverbs in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here:</xsl:text>
</p>
</xsl:if>           
          <example num="xAdvP.AdvPLocative.10">
<table border="1">
                <tr>
                   <th>Locative Adverbs</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
             </table>
</example>          
 
          <p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:if test="normalize-space(//advp/@locativeDem)='someSame'">
<xsl:text>some of </xsl:text>
</xsl:if>
<xsl:text>the forms of these locative adverbs are </xsl:text>
<xsl:choose>
                <xsl:when test="//advp/@locativeDem='distinct'">completely distinct from the demonstrative pronouns. </xsl:when>
                <xsl:when test="//advp/@locativeDem='same'">identical to the demonstrative pronouns, though they are used in different positions in the sentence. </xsl:when>
                <xsl:when test="//advp/@locativeDem='someSame'">identical to the demonstrative pronouns, but others are distinct. </xsl:when>
                <xsl:when test="//advp/@locativeDem='demAffix'">related to the demonstrative pronouns.  An affix is added to a demonstrative to form a locative adverb. </xsl:when>
                <xsl:when test="//advp/@locativeDem='locativeAffix'">related to the demonstrative pronouns.  An affix is added to a locative adverb to form a demonstrative. </xsl:when>
                <xsl:when test="//advp/@locativeDem='other'">related to the demonstrative pronouns in this way: </xsl:when>
             </xsl:choose>
<xsl:if test="normalize-space(//advp/@locativeDem)='other'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//advp/locativeDemOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:text> See section </xsl:text>
<sectionRef sec="sPronDem" />
<xsl:text> for information on the demonstrative pronouns.</xsl:text>
</p>
          
          <p contentType="ctComparativeIntro">
<xsl:text>Many languages allow degree words to modify adverbs. In English, locative adverbs can be modified by </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>right</langData>
<xsl:text>, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only here</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>right here</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>right there</langData>
</p>       
         
          <xsl:if test="normalize-space(//advp/@locativeDegree)='no'">
<p>
<xsl:text>Locative adverbs are not modified or intensified in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
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
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, locative adverbs may be modified by degree words which occur </xsl:text>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='yes' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='no' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='no' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='yes' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='no' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='no' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='yes' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='yes' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='yes' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='no' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='no' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='yes' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='yes' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='yes' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordOther/@checked)='no'">
<xsl:text> the locative adverb.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='no' and normalize-space(//advp/locativeDegreeWordAfter/@checked)='no' and normalize-space(//advp/locativeDegreeWordBoth/@checked)='no' and normalize-space(//advp/locativeDegreeWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//advp/locativeDegreeWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeDegreeWordBefore/@checked)='yes' and normalize-space(//advp/locativeDegreeWordOther/@checked)='yes' or normalize-space(//advp/locativeDegreeWordAfter/@checked)='yes' and normalize-space(//advp/locativeDegreeWordOther/@checked)='yes' or normalize-space(//advp/locativeDegreeWordBoth/@checked)='yes' and normalize-space(//advp/locativeDegreeWordOther/@checked)='yes'">
<xsl:text> the locative adverb and may also occur  ___</xsl:text>
<xsl:value-of select="//advp/locativeDegreeWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>The degree words which can modify the locative adverbs in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='yes'">
<example num="xAdvP.AdvPLocative.20">
<table border="1">
                <tr>
                   <th>Degree words</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Examples of locative adverbs with degree words modifying them are:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
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
<xsl:text>Locative adverbs may also have </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='no'">
<xsl:text>In </xsl:text>
                <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, there are </xsl:text>
</xsl:if>
<xsl:text>affixes or clitics that attach to the locative adverb to intensify it.  The degree affixes or clitics which can modify locative adverbs are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeAttaches/@checked)='yes'">
<example num="xAdvP.AdvPLocative.28">
<table border="1">
                <tr>
                   <th>Degree affixes or clitics</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Examples of locative adverbs with a degree affix or clitic attached are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeAttaches/@checked)='yes'">
<example num="xAdvP.AdvPLocative.32">
<table border="1">
                <tr>
                   <th>Modified Locative Adverbs</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative adverbs may also use reduplication to </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='no' and normalize-space(//advp/locativeDegreeAttaches/@checked)='no'">
<xsl:text>In </xsl:text>
                <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, reduplication is used to </xsl:text>
</xsl:if>
<xsl:text>intensify the meaning of  the locative adverb.  Examples of the locative adverbs with reduplication modifying or intensifying them are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeRedup/@checked)='yes'">
<example num="xAdvP.AdvPLocative.36">
<table border="1">
                <tr>
                   <th>Reduplicated Locative Adverbs</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative adverbs may also be </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeWord/@checked)='no' and normalize-space(//advp/locativeDegreeAttaches/@checked)='no' and normalize-space(//advp/locativeDegreeRedup/@checked)='no'">
<xsl:text>In </xsl:text>
                <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, locative adverbs are </xsl:text>
</xsl:if>
<xsl:text>modified or intensified by ___ </xsl:text>
<xsl:value-of select="//advp/locativeDegreeOther" />
<xsl:text>.  Examples of locative adverbs which are modified or intensified in this way are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@locativeDegree)='yes' and normalize-space(//advp/locativeDegreeOther/@checked)='yes'">
<example num="xAdvP.AdvPLocative.40">
<table border="1">
                <tr>
                   <th>Modified or intensified Locative Adverbs</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
             </table>
</example>
</xsl:if>  
          
            <p contentType="ctPracticalIntro">
<xsl:text>Location is often expressed by an adpositional
phrase or just a nominal phrase, consisting of a proper name or a description of the place.  Locative expressions may normally occur either initially or finally in the clause, or as complements to motion verbs.  See section </xsl:text>
<sectionRef sec="sIPMotion" />
<xsl:text> for examples with motion verbs. 
</xsl:text>
</p>
          <p contentType="ctComparativeIntro">
<xsl:text>Location is often expressed by a prepositional
                phrase, such as: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>in the mountains</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>at San Jose</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>across the river</langData>
<xsl:text>.  Many
                languages allow just a nominal phrase, consisting of a proper name or a description of the place.  Locative expressions may normally occur either initially or finally in the clause, or as complements to motion verbs.  See section </xsl:text>
<sectionRef sec="sIPMotion" />
<xsl:text> for examples with motion verbs. 
             </xsl:text>
</p>
       </section2>
       
       <section2 id="sAdvPManner">
          <secTitle>Manner Adverbs</secTitle>
          <p contentType="ctPracticalIntro">
<xsl:text>Manner adverbs directly modify the verb and may be independent words or attached to the verb.</xsl:text>
</p>
          <p contentType="ctComparativeIntro">
<xsl:text>Manner adverbs directly modify the verb and usually end in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-ly</langData>
<xsl:text> in English.  Some languages do not have independent words, but rather use verbal affixes to express manner.</xsl:text>
</p>
          <xsl:if test="normalize-space(//advp/@mannerType)='word'">
<p>
<xsl:text>Manner adverbs in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are all written as independent words.  Examples are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@mannerType)='word'">
<example num="xAdvP.AdvPManner.10">
<table border="1">
                <tr>
                   <th>Manner adverbs</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Some of the manner adverbs in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are written as independent words, but some attach to the verb. The affix forms are shown with a hyphen in the following table.</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@mannerType)='both'">
<example num="xAdvP.AdvPManner.14">
<table border="1">
                <tr>
                   <th>Manner adverbs</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Manner adverbs in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are all written as affixes on the verb.  These affixes are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@mannerType)='Affix'">
<example num="xAdvP.AdvPManner.18">
<table border="1">
                <tr>
                   <th>Manner adverb affixes</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
             </table>
</example>
</xsl:if>         
          
          <p contentType="ctComparativeIntro">
<xsl:text>Manner adverbs can usually be modified by degree words.  In English,
             manner adverbs can be modified by </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>very</langData>
<xsl:text>
                and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>so</langData>
<xsl:text>, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>very quickly</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>so slowly</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>very well</langData>
<xsl:text>.</xsl:text>
</p>
          
          <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='no'">
<p>
<xsl:text>Manner adverbs are not modified or intensified in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
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
<xsl:text>Manner adverbs which are written as independent words are not modified or intensified in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
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
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the manner adverbs </xsl:text>
<xsl:if test="normalize-space(//advp/@mannerType)='both'">
<xsl:text>which are independent words </xsl:text>
</xsl:if>
<xsl:text>may be modified by degree words which occur </xsl:text>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='yes' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='no' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='no' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='yes' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='no' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='no' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='yes' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='yes' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='yes' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='no' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='no' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='yes' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='yes' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='yes' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordOther/@checked)='no'">
<xsl:text> the manner adverb.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='no' and normalize-space(//advp/mannerDegreeWordAfter/@checked)='no' and normalize-space(//advp/mannerDegreeWordBoth/@checked)='no' and normalize-space(//advp/mannerDegreeWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//advp/mannerDegreeWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerDegreeWordBefore/@checked)='yes' and normalize-space(//advp/mannerDegreeWordOther/@checked)='yes' or normalize-space(//advp/mannerDegreeWordAfter/@checked)='yes' and normalize-space(//advp/mannerDegreeWordOther/@checked)='yes' or normalize-space(//advp/mannerDegreeWordBoth/@checked)='yes' and normalize-space(//advp/mannerDegreeWordOther/@checked)='yes'">
<xsl:text> the manner adverb and may also occur  ___</xsl:text>
<xsl:value-of select="//advp/mannerDegreeWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>The degree words which can modify the manner adverbs in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeWord/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeWord/@checked)='yes'">
<example num="xAdvP.AdvPManner.28">
<table border="1">
                <tr>
                   <th>Degree words</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Examples of manner adverbs with degree words modifying them are:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
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
<xsl:text>Manner adverbs may also have </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerWordDegreeWord/@checked)='no'">
<xsl:text>In </xsl:text>
                <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, there are </xsl:text>
</xsl:if>
<xsl:text>affixes or clitics that attach to the manner adverb to intensify it.  The degree affixes or clitics which can modify manner adverbs are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes'">
<example num="xAdvP.AdvPManner.36">
<table border="1">
                <tr>
                   <th>Degree affixes or clitics</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Examples of manner adverbs with a degree affix or clitic attached are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='yes'">
<example num="xAdvP.AdvPManner.40">
<table border="1">
                <tr>
                   <th>Modified Manner Adverbs</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Manner adverbs may also use reduplication to </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerWordDegreeWord/@checked)='no' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='no'">
<xsl:text>In </xsl:text>
                <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, reduplication is used to </xsl:text>
</xsl:if>
<xsl:text>intensify the meaning of  the manner adverb.  Examples of the manner adverbs with reduplication modifying or intensifying them are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeRedup/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeRedup/@checked)='yes'">
<example num="xAdvP.AdvPManner.44">
<table border="1">
                <tr>
                   <th>Reduplicated Manner Adverbs</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Manner adverbs may also be </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerWordDegreeWord/@checked)='no' and normalize-space(//advp/mannerWordDegreeAttaches/@checked)='no' and normalize-space(//advp/mannerWordDegreeRedup/@checked)='no'">
<xsl:text>In </xsl:text>
                <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, manner adverbs are </xsl:text>
</xsl:if>
<xsl:text>modified or intensified by ___ </xsl:text>
<xsl:value-of select="//advp/mannerDegreeOther" />
<xsl:text>.  Examples of manner adverbs which are modified or intensified in this way are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeOther/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerDegree)='yes' and normalize-space(//advp/mannerWordDegreeOther/@checked)='yes'">
<example num="xAdvP.AdvPManner.48">
<table border="1">
                <tr>
                   <th>Modified or intensified Manner Adverbs</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>The manner adverb affixes are not modified or intensified in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='no'">
<p>
<xsl:text>The manner adverb affxes are not modified or intensified in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
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
<xsl:text>The manner adverb affixes may be modified by degree affixes which occur </xsl:text>
<xsl:if test="normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:text> the manner adverb.  The degree affixes which can modify the manner adverb affixes in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes'">
<example num="xAdvP.AdvPManner.56">
<table border="1">
                <tr>
                   <th>Degree affixes</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Examples of manner adverb affixes attached to a verb with degree affixes also modifying them are:</xsl:text>
</p>
</xsl:if>          
          <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='yes' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='yes'">
<example num="xAdvP.AdvPManner.60">
<table border="1">
                <tr>
                   <th>Modified Verbs</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Manner adverb affixes may also use reduplication to </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='no' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='no'">
<xsl:text>In </xsl:text>
                <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, reduplication is used to </xsl:text>
</xsl:if>
<xsl:text>intensify the meaning of the manner adverb affix.  Examples of the manner adverb affixes attached to a verb with reduplication modifying or intensifying them are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeRedup/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeRedup/@checked)='yes'">
<example num="xAdvP.AdvPManner.64">
<table border="1">
                <tr>
                   <th>Reduplicated Manner Adverb Affixes on Verbs</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Manner adverb affixes may also be </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/mannerAffixDegreeYesBefore/@checked)='no' and normalize-space(//advp/mannerAffixDegreeYesAfter/@checked)='no' and normalize-space(//advp/mannerAffixDegreeRedup/@checked)='no'">
<xsl:text>In </xsl:text>
                <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, manner adverb affixes are </xsl:text>
</xsl:if>
<xsl:text>modified or intensified by ___ </xsl:text>
<xsl:value-of select="//advp/mannerDegreeOther" />
<xsl:text>.  Examples of manner adverb affixes which are modified or intensified in this way are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeOther/@checked)='yes' or normalize-space(//advp/@mannerType)='both' and normalize-space(//advp/@mannerAffixDegree)='yes' and normalize-space(//advp/mannerAffixDegreeOther/@checked)='yes'">
<example num="xAdvP.AdvPManner.68">
<table border="1">
                <tr>
                   <th>Modified or intensified Manner Adverb Affixes</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
             </table>
</example>
</xsl:if>  
          
          <p contentType="ctPracticalIntro">
<xsl:text>Manner adverbs do not seem to have clear counterparts in other phrase types, except possibly some comparatives.  See section </xsl:text>
<sectionRef sec="sIPComparatives" />
<xsl:text> for examples. </xsl:text>
</p>          
          <p contentType="ctComparativeIntro">
<xsl:text>Manner adverbs do not seem to have clear counterparts in other phrase types, except possibly some comparatives,
             such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>as fast as he could</langData>
<xsl:text>.  Comparatives are dealt with in section </xsl:text>
<sectionRef sec="sIPComparatives" />
<xsl:text>. </xsl:text>
</p>          
          
       </section2>
       <section2 id="sAdvPReason">
          <secTitle>Reason or Purpose Adverbs</secTitle>
   <p contentType="ctPracticalIntro">
<xsl:text>Reason or purpose may be expressed by a single adverb or by an adverbial clause or adpositional phrase.</xsl:text>
</p>
          <p contentType="ctComparativeIntro">
<xsl:text>Reason or purpose adverbs include </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>therefore</langData>
<xsl:text> and
             </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>so</langData>
<xsl:text>.  Reason or purpose adverbs do not allow modifiers in English.  Reason or purpose can also be expressed by an adverbial clause beginning with </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>because</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>since</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>in order</langData>
<xsl:text>.  These adverbial phrases or clauses occur either initially or finally in the sentence.  The structure of the adverbial clauses will be addressed in section </xsl:text>
<sectionRef sec="sAdvClReason" />
<xsl:text>. </xsl:text>
</p>
          <p>
<xsl:text>Reason or purpose adverbs which either stand alone or begin an adverbial clause expressing reason or purpose in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are: 
             </xsl:text>
</p>
          <example num="xAdvP.AdvPReason.10">
<table border="1">
                <tr>
                   <th>Reason or purpose adverbs</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
             </table>
</example>           
          <p contentType="ctComparativeIntro">
<xsl:text>Reason or purpose can also be expressed by a prepositional phrase in English, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>for this reason</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>on purpose</langData>
<xsl:text>.  Such phrases are described in section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text>. </xsl:text>
</p>           
          <p>
<xsl:choose>
                <xsl:when test="//pp/@pPos='before'">Prepositional</xsl:when>
                <xsl:when test="//pp/@pPos='after'">Postpositional</xsl:when>
                <xsl:when test="//pp/@pPos='both'">Adpositional</xsl:when>
                <xsl:when test="//pp/@pPos='unknown'">Adpositional</xsl:when>
             </xsl:choose>
<xsl:text> phrases in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> which express reason or purpose are:  </xsl:text>
</p>
          <example num="xAdvP.AdvPReason.16">
<table border="1">
                <tr>
                   <th>Other expressions of reason or purpose</th>
                   <th>Gloss</th>
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
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
             </table>
</example>           
          <p>
<xsl:text>Full sentence examples including adverbs or adverbial clauses or  </xsl:text>
<xsl:choose>
                <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
                <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
             </xsl:choose>
<xsl:text> phrases expressing reason or purpose are: 
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
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
<xsl:text>See section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> for more information on </xsl:text>
<xsl:choose>
             <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
             <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
             <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
             <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
             </xsl:choose>
<xsl:text> phrases and section </xsl:text>
<sectionRef sec="sAdvClReason" />
<xsl:text> for adverbial clauses expressing reason or purpose.</xsl:text>
</p>
       </section2>
       <section2 id="sAdvPIndef">
          <secTitle>Indefinite Adverbs</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>There are two basic sets of indefinite adverbs, though not all languages merge them into a single word: those consisting of a quantifier and a generic noun, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>everytime</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>everywhere</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>anytime</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>anywhere</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>sometime</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>somewhere</langData>
<xsl:text> and those built from an interrogative word and an indefinite, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>whenever</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>wherever</langData>
<xsl:text>.</xsl:text>
</p>	   
          <p contentType="ctPracticalIntro">
<xsl:text>Adverbial indefinites are used to refer to a nonspecific time or location.  They normally consist of either a quantifier and a generic noun or an interrogative word and an indefinite word, and they may not be merged into a single word.</xsl:text>
</p>
          <p>
<xsl:text>Beginning with the first type which includes a quantifier and a generic noun, in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> the temporal indefinites </xsl:text>
<xsl:if test="normalize-space(//advp/temporalIndefTypeQNone/@checked)='yes'">
<xsl:text>are not expressed using a quantifier.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQOther/@checked)='yes' and normalize-space(//advp/temporalIndefQPhrase/@checked)='no' and normalize-space(//advp/temporalIndefQWord/@checked)='no'">
<xsl:text>are expressed by ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefQOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='no' and normalize-space(//advp/temporalIndefQWord/@checked)='yes' and normalize-space(//advp/temporalIndefQOther/@checked)='no'">
<xsl:text>are expressed by a quantifier and a generic noun merged into a single word. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefQWord/@checked)='yes' and normalize-space(//advp/temporalIndefQOther/@checked)='no'">
<xsl:text>are sometimes expressed by a quantifier and a generic noun merged into a single word, but some remain as a phrase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='no' and normalize-space(//advp/temporalIndefQWord/@checked)='yes' and normalize-space(//advp/temporalIndefQOther/@checked)='yes'">
<xsl:text>are sometimes expressed by a quantifier and a generic noun merged into a single word, but some are expressed by ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefQOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefQWord/@checked)='no' and normalize-space(//advp/temporalIndefQOther/@checked)='no'">
<xsl:text>are expressed by a quantifier and a generic noun which do not merge into a single word, but remain as a phrase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefQWord/@checked)='no' and normalize-space(//advp/temporalIndefQOther/@checked)='yes'">
<xsl:text>are sometimes expressed by a quantifier and a generic noun which do not merge into a single word, but remain as a phrase, and some are expressed by ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefQOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefQWord/@checked)='yes' and normalize-space(//advp/temporalIndefQOther/@checked)='yes'">
<xsl:text>are sometimes expressed by a quantifier and a generic noun merged into a single word, but some remain as a phrase, and some are expressed by ___</xsl:text>
<xsl:value-of select="//avdp/temporalIndefQOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> The locative indefinites </xsl:text>
<xsl:if test="normalize-space(//advp/locativeIndefTypeQNone/@checked)='yes'">
<xsl:text>are not expressed using a quantifier.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQOther/@checked)='yes' and normalize-space(//advp/locativeIndefQPhrase/@checked)='no' and normalize-space(//advp/locativeIndefQWord/@checked)='no'">
<xsl:text>are expressed by ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefQOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='no' and normalize-space(//advp/locativeIndefQWord/@checked)='yes' and normalize-space(//advp/locativeIndefQOther/@checked)='no'">
<xsl:text>are expressed by a quantifier and a generic noun merged into a single word. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefQWord/@checked)='yes' and normalize-space(//advp/locativeIndefQOther/@checked)='no'">
<xsl:text>are sometimes expressed by a quantifier and a generic noun merged into a single word, but some remain as a phrase.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='no' and normalize-space(//advp/locativeIndefQWord/@checked)='yes' and normalize-space(//advp/locativeIndefQOther/@checked)='yes'">
<xsl:text>are sometimes expressed by a quantifier and a generic noun merged into a single word, but some are expressed by ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefQOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefQWord/@checked)='no' and normalize-space(//advp/locativeIndefQOther/@checked)='no'">
<xsl:text>are expressed by a quantifier and a generic noun which do not merge into a single word, but remain as a phrase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefQWord/@checked)='no' and normalize-space(//advp/locativeIndefQOther/@checked)='yes'">
<xsl:text>are sometimes expressed by a quantifier and a generic noun which do not merge into a single word, but remain as a phrase, and some are expressed by ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefQOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefQWord/@checked)='yes' and normalize-space(//advp/locativeIndefQOther/@checked)='yes'">
<xsl:text>are sometimes expressed by a quantifier and a generic noun merged into a single word, but some remain as a phrase, and some are expressed by ___</xsl:text>
<xsl:value-of select="//avdp/locativeIndefQOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
          <xsl:if test="normalize-space(//advp/temporalIndefQWord/@checked)='yes' or normalize-space(//advp/locativeIndefQWord/@checked)='yes'">
<p>
<xsl:text>Examples of the indefinite adverbs of this type that are written as a single word are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/temporalIndefQWord/@checked)='yes' or normalize-space(//advp/locativeIndefQWord/@checked)='yes'">
<example num="xAdvP.AdvPIndef.12">
<table border="1">
                <caption>
<xsl:text>Quantifier-based Indefinite Adverbs</xsl:text>
</caption> 
                <tr>
                   <th>Type</th>
                   <th>Adverb</th>
                   <th>Gloss</th>
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
<xsl:text>Temporal</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Temporal</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
                <xsl:text>In the temporal forms that do not merge into a single word, the quantifier occurs </xsl:text>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>on either side or on  both sides of</xsl:text>
</xsl:if>
                <xsl:text> the generic temporal noun. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQOther/@checked)='no'">
                <xsl:text>In the locative forms that do not merge into a single word, the quantifier occurs </xsl:text>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>on either side or on  both sides of</xsl:text>
</xsl:if>
                <xsl:text> the generic locative noun. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'"> 
                <xsl:text>In the temporal forms that do not merge into a single word, the quantifier occurs ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefTypeQPQOther" />
                <xsl:text>. </xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'"> 
                <xsl:text>In the locative forms that do not merge into a single word, the quantifier occurs ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefTypeQPQOther" />
                <xsl:text>. </xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' or normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' or normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
                <xsl:text>In the temporal forms that do not merge into a single word, the quantifier occurs </xsl:text>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>on either side or on  both sides of</xsl:text>
</xsl:if>
                <xsl:text> the generic temporal noun, and they may also occur ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefTypeQPQOther" />
<xsl:text>. </xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' or normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' or normalize-space(//advp/locativeIndefQPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
                <xsl:text>In the locative forms that do not merge into a single word, the quantifier occurs </xsl:text>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeQPQBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeQPQBoth/@checked)='yes'">
<xsl:text>on either side or on  both sides of</xsl:text>
</xsl:if>
                <xsl:text> the generic locative noun, and they may also occur ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefTypeQPQOther" />
<xsl:text>. </xsl:text>
             </xsl:if>
<xsl:text>  Examples of the indefinite phrases are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/temporalIndefQPhrase/@checked)='yes' or normalize-space(//advp/locativeIndefQPhrase/@checked)='yes'">
<example num="xAdvP.AdvPIndef.16">
<table border="1">
                <caption>
<xsl:text>Quantifier-based Indefinite Phrases</xsl:text>
</caption> 
                <tr>
                   <th>Type</th>
                   <th>Adverb</th>
                   <th>Gloss</th>
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
<xsl:text>Temporal</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Temporal</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Examples of the indefinites formed in this other way are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/temporalIndefQOther/@checked)='yes' or normalize-space(//advp/locativeIndefQOther/@checked)='yes'">
<example num="xAdvP.AdvPIndef.20">
<table border="1">
                <caption>
<xsl:text>Quantifier-based Indefinites</xsl:text>
</caption> 
             <tr>
                <th>Type</th>
                <th>Adverb</th>
                <th>Gloss</th>
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
<xsl:text>Temporal</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Temporal</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>For the second type of indefinite which includes an interrogative and an indefinite word, in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> the temporal indefinites </xsl:text>
<xsl:if test="normalize-space(//advp/temporalIndefTypeIntNone/@checked)='yes'">
<xsl:text>are not expressed using an interrogative.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntOther/@checked)='yes' and normalize-space(//advp/temporalIndefIntPhrase/@checked)='no' and normalize-space(//advp/temporalIndefIntWord/@checked)='no'">
<xsl:text>are expressed by ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefIntOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='no' and normalize-space(//advp/temporalIndefIntWord/@checked)='yes' and normalize-space(//advp/temporalIndefIntOther/@checked)='no'">
<xsl:text>are expressed by a temporal interrogative word and an indefinite merged into a single word. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefIntWord/@checked)='yes' and normalize-space(//advp/temporalIndefIntOther/@checked)='no'">
<xsl:text>are sometimes expressed by a temporal interrogative word and an indefinite merged into a single word, but some remain as a phrase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='no' and normalize-space(//advp/temporalIndefIntWord/@checked)='yes' and normalize-space(//advp/temporalIndefIntOther/@checked)='yes'">
<xsl:text>are sometimes expressed by a temporal interrogative word and an indefinite merged into a single word, but some are expressed by ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefIntOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefIntWord/@checked)='no' and normalize-space(//advp/temporalIndefIntOther/@checked)='no'">
<xsl:text>are expressed by a temporal interrogative word and an indefinite which do not merge into a single word, but remain as a phrase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefIntWord/@checked)='no' and normalize-space(//advp/temporalIndefIntOther/@checked)='yes'">
<xsl:text>are sometimes expressed by a temporal interrogative word and an indefinite which do not merge into a single word, but remain as a phrase, and some are expressed by ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefIntOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefIntWord/@checked)='yes' and normalize-space(//advp/temporalIndefIntOther/@checked)='yes'">
<xsl:text>are sometimes expressed by a temporal interrogative word and an indefinite merged into a single word, but some remain as a phrase, and some are expressed by ___</xsl:text>
<xsl:value-of select="//avdp/temporalIndefIntOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> The locative indefinites </xsl:text>
<xsl:if test="normalize-space(//advp/locativeIndefTypeIntNone/@checked)='yes'">
<xsl:text>are not expressed using an interrogative.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntOther/@checked)='yes' and normalize-space(//advp/locativeIndefIntPhrase/@checked)='no' and normalize-space(//advp/locativeIndefIntWord/@checked)='no'">
<xsl:text>are expressed by ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefIntOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='no' and normalize-space(//advp/locativeIndefIntWord/@checked)='yes' and normalize-space(//advp/locativeIndefIntOther/@checked)='no'">
<xsl:text>are expressed by a locative interrogative word and an indefinite merged into a single word. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefIntWord/@checked)='yes' and normalize-space(//advp/locativeIndefIntOther/@checked)='no'">
<xsl:text>are sometimes expressed by a locative interrogative word and an indefinite merged into a single word, but some remain as a phrase.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='no' and normalize-space(//advp/locativeIndefIntWord/@checked)='yes' and normalize-space(//advp/locativeIndefIntOther/@checked)='yes'">
<xsl:text>are sometimes expressed by a locative interrogative word and an indefinite merged into a single word, but some are expressed by ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefIntOther" />
<xsl:text>. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefIntWord/@checked)='no' and normalize-space(//advp/locativeIndefIntOther/@checked)='no'">
<xsl:text>are expressed by a locative interrogative word and an indefinite which do not merge into a single word, but remain as a phrase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefIntWord/@checked)='no' and normalize-space(//advp/locativeIndefIntOther/@checked)='yes'">
<xsl:text>are sometimes expressed by a locative interrogative word and an indefinite which do not merge into a single word, but remain as a phrase, and some are expressed by ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefIntOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefIntWord/@checked)='yes' and normalize-space(//advp/locativeIndefIntOther/@checked)='yes'">
<xsl:text>are sometimes expressed by a locative interrogative word and an indefinite merged into a single word, but some remain as a phrase, and some are expressed by ___</xsl:text>
<xsl:value-of select="//avdp/locativeIndefIntOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
          <xsl:if test="normalize-space(//advp/temporalIndefIntWord/@checked)='yes' or normalize-space(//advp/locativeIndefIntWord/@checked)='yes'">
<p>
<xsl:text>Examples of the indefinite adverbs of this type that are written as a single word are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/temporalIndefIntWord/@checked)='yes' or normalize-space(//advp/locativeIndefIntWord/@checked)='yes'">
<example num="xAdvP.AdvPIndef.26">
<table border="1">
                <caption>
<xsl:text>Interrogative-based Indefinite Adverbs</xsl:text>
</caption> 
                <tr>
                   <th>Type</th>
                   <th>Adverb</th>
                   <th>Gloss</th>
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
<xsl:text>Temporal</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Temporal</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
                <xsl:text>In the temporal forms that do not merge into a single word, the interrogative occurs </xsl:text>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>on either side or on  both sides of</xsl:text>
</xsl:if>
                <xsl:text> the indefinite. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntOther/@checked)='no'">
                <xsl:text>In the locative forms that do not merge into a single word, the interrogative occurs </xsl:text>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>on either side or on  both sides of</xsl:text>
</xsl:if>
                <xsl:text> the indefinite. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'"> 
                <xsl:text>In the temporal forms that do not merge into a single word, the interrogative occurs ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefTypeIntOther" />
                <xsl:text>. </xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'"> 
                <xsl:text>In the locative forms that do not merge into a single word, the interrogative occurs ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefTypeIntOther" />
                <xsl:text>. </xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' or normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' or normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
                <xsl:text>In the temporal forms that do not merge into a single word, the interrogative occurs </xsl:text>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/temporalIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/temporalIndefTypeIntBoth/@checked)='yes'">
<xsl:text>on either side or on  both sides of</xsl:text>
</xsl:if>
                <xsl:text> the indefinite, and they may also occur ___</xsl:text>
<xsl:value-of select="//advp/temporalIndefTypeIntOther" />
<xsl:text>. </xsl:text>
             </xsl:if>
<xsl:if test="normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' or normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' or normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntOther/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
                <xsl:text>In the locative forms that do not merge into a single word, the interrogative occurs </xsl:text>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='no' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
                <xsl:if test="normalize-space(//advp/locativeIndefTypeIntBefore/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntAfter/@checked)='yes' and normalize-space(//advp/locativeIndefTypeIntBoth/@checked)='yes'">
<xsl:text>on either side or on  both sides of</xsl:text>
</xsl:if>
                <xsl:text> the indefinite, and they may also occur ___</xsl:text>
<xsl:value-of select="//advp/locativeIndefTypeIntOther" />
<xsl:text>. </xsl:text>
             </xsl:if>
<xsl:text>  Examples of the indefinite phrases are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/temporalIndefIntPhrase/@checked)='yes' or normalize-space(//advp/locativeIndefIntPhrase/@checked)='yes'">
<example num="xAdvP.AdvPIndef.30">
<table border="1">
                <caption>
<xsl:text>Interrogative-based Indefinite Phrases</xsl:text>
</caption> 
                <tr>
                   <th>Type</th>
                   <th>Adverb</th>
                   <th>Gloss</th>
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
<xsl:text>Temporal</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Temporal</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Examples of the indefinites formed in this other way are:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//advp/temporalIndefIntOther/@checked)='yes' or normalize-space(//advp/locativeIndefIntOther/@checked)='yes'">
<example num="xAdvP.AdvPIndef.34">
<table border="1">
                <caption>
<xsl:text>Interrogative-based Indefinites</xsl:text>
</caption> 
                <tr>
                   <th>Type</th>
                   <th>Adverb</th>
                   <th>Gloss</th>
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
<xsl:text>Temporal</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Temporal</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
<xsl:text>Locative</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
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
