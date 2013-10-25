<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="neg">
    <section1 id="sNeg">
        <secTitle>Negation Constructions</secTitle>
        <p>
<xsl:text>The negative verbal elements, negative adverbs, negative indefinite pronouns and negation for nominal phrases will all be presented, then the type of negation system that </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has will be determined.</xsl:text>
</p>
        <section2 id="sNegVerbal">
            <secTitle>Auxiliary and Verbal Negation</secTitle>
              
              <p contentType="ctComparativeIntro">
<xsl:text>In some languages verbal negation is an auxiliary element, while in others it is simply a verbal affix. English has both the negative auxiliary </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text>, which is an independent word that must always follow another auxiliary, and the contraction form </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-n’t</langData>
<xsl:text>, which is written as a suffix on the auxiliary.  Examples of English negative transitive sentences include:</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy did not hit the ball</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy didn’t hit the ball</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might not have hit the ball</langData>
<xsl:text>.</xsl:text>
</p>
           <p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
                    <xsl:when test="//neg/@negVerbal='yes'"> expresses verbal negation in the following ways. </xsl:when>				
                    <xsl:when test="//neg/@negVerbal='no'"> does not have any way to express negation on either an auxiliary or the verb.</xsl:when>			
                 </xsl:choose>
</p>
           <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>There are negative auxiliaries which are written as independent words. The negative auxiliary </xsl:text>
<xsl:choose>
                 <xsl:when test="//neg/@negAuxRequiresAux='no'">may be the only auxiliary in the phrase.</xsl:when>
                 <xsl:when test="//neg/@negAuxRequiresAux='yes'">may not be the only auxiliary in the phrase; the presence of a positive auxiliary is required.</xsl:when>
           </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.10">
<table border="1">
              <tr>
                 <th>Negative Auxiliaries</th>
                 <th>Gloss</th>
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
           
           
              <xsl:if test="normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>There is </xsl:text>
<xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<xsl:text>also </xsl:text>
</xsl:if>
<xsl:text>a negative affix which attaches to a positive auxiliary to make it negative.   Examples of the negative auxiliary affixes attached to a positive auxiliary include:</xsl:text>
</p>
</xsl:if>
                 <xsl:if test="normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.14">
<table border="1">
                       <tr>
                          <th>Negative Auxiliaries</th>
                          <th>Gloss</th>
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
          
           <xsl:if test="normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>There is </xsl:text>
<xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes' or normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<xsl:text>also  </xsl:text>
</xsl:if>
<xsl:text>a negative affix that attaches to the verb to make it negative.  Examples of the negative verbal affixes attached to a verb include:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.18">
<table border="1">
                 <tr>
                    <th>Negative-Marked Verbs</th>
                    <th>Gloss</th>
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
           <xsl:if test="normalize-space(//neg/negVerbalOther/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>There is </xsl:text>
<xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes' or normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes' or normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<xsl:text>also  </xsl:text>
</xsl:if>
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/negVerbalOther" />
<xsl:text>.  Examples of these negative verbal elements are:</xsl:text>
</p>
</xsl:if>  
           <xsl:if test="normalize-space(//neg/negVerbalOther/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<example num="xNeg.NegVerbal.22">
<table border="1">
                 <tr>
                    <th>Negative Verbal elements</th>
                    <th>Gloss</th>
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
           
           <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Examples of the negative auxiliary word(s) used in a complete sentence (without any negative arguments) include:</xsl:text>
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
           <xsl:if test="normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Examples of the negative auxiliary affixes attached to a positive auxiliary used in a complete sentence (without any negative arguments) include:</xsl:text>
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
           <xsl:if test="normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Full sentence examples with negative verbs include:</xsl:text>
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
           
           <xsl:if test="normalize-space(//neg/negVerbalOther/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>Full sentence examples with the other negative verbal elements allowed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> include:</xsl:text>
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
           <xsl:if test="normalize-space(//neg/negAuxWord/@checked)='yes' and normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes' or normalize-space(//neg/negAuxAffix/@checked)='yes' and normalize-space(//neg/negVAffix/@checked)='yes' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text> As these examples show, </xsl:text>
<xsl:choose>
                 <xsl:when test="//neg/@auxVerbRequired='yes'">a negative auxiliary is not allowed without the verb also being negative.</xsl:when>
                 <xsl:when test="//neg/@auxVerbRequired='no'">the verb is not required to be negative when there is a negative auxiliary.</xsl:when>
              </xsl:choose>
</p>
</xsl:if>
           
    
        </section2>
        <section2 id="sNegAdverb">
            <secTitle>Negative Adverbs</secTitle>
          
           <p>
<xsl:text>The negative temporal adverb </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>never</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no time</langData>
<xsl:text> is expressed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> in the following ways:</xsl:text>
</p>
           
           <xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes'">
<p>
<xsl:text>There is at least one independent word or phrase which is unrelated to the positive temporal adverbs.  These negative temporal adverbs or phrases are:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes'">
<example num="xNeg.NegAdverb.8">
<table border="1">
                 <tr>
                    <th>Negative temporal adverbs or phrases</th>
                    <th>Gloss</th>
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
           
           <xsl:if test="normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<p>
<xsl:text>There is </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes'">
<xsl:text>also </xsl:text>
</xsl:if>
<xsl:text> a negative affix which may be added to a positive temporal adverb to form a negative temporal adverb word.  The negative affix is:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<example num="xNeg.NegAdverb.12">
<table border="1">
                 <tr>
                    <th>Negative affix</th>
                    <th>Gloss</th>
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
           <xsl:if test="normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<p>
<xsl:text>Examples of the negative temporal adverbs formed by adding the negative affix to the positive temporal adverbs are:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<example num="xNeg.NegAdverb.16">
<table border="1">
                 <tr>
                    <th>Negative temporal adverbs</th>
                    <th>Gloss</th>
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
                    
           <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<p>
<xsl:text>There is </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes'">
<xsl:text>also </xsl:text>
</xsl:if>
<xsl:text>an independent negative word which occurs </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordOther/@checked)='no'">
<xsl:text> a positive temporal adverb to form a negative temporal adverb phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='no' and normalize-space(//neg/negTemporalAdverbWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/negTemporalTypeAdverbWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negTemporalAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordOther/@checked)='yes' or normalize-space(//neg/negTemporalAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordOther/@checked)='yes' or normalize-space(//neg/negTemporalAdverbWordBoth/@checked)='yes' and normalize-space(//neg/negTemporalAdverbWordOther/@checked)='yes'">
<xsl:text> a positive temporal adverb to form a negative temporal adverb phrase and may also occur ___</xsl:text> <xsl:value-of select="//neg/negTemporalTypeAdverbWordOther" /> <xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text> The negative word that occurs with the positive temporal adverbs is:</xsl:text>
</p>
</xsl:if>
              <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<example num="xNeg.NegAdverb.20">
<table border="1">
                    <tr>
                       <th>Negative word</th>
                       <th>Gloss</th>
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
              <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<p>
<xsl:text>Examples of the negative temporal adverb phrases formed by the negative word and the positive temporal adverbs are:</xsl:text>
</p>
</xsl:if>   
              <xsl:if test="normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<example num="xNeg.NegAdverb.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/negTemporalAdverbWordsExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/negTemporalAdverbWordsExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
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
           
           <xsl:if test="normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<p>
<xsl:text>There is </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes'">
<xsl:text>also </xsl:text>
</xsl:if>
<xsl:text>at least one verbal affix that expresses the negative temporal adverbial.  These negative temporal adverbial affixes which can attach to verbs are:</xsl:text>
</p>
</xsl:if>                     
           <xsl:if test="normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<example num="xNeg.NegAdverb.28">
<table border="1">
                 <tr>
                    <th>Negative temporal adverbial affixes</th>
                    <th>Gloss</th>
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
           
           <xsl:if test="normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<p>
<xsl:text>Examples of the negative temporal adverbial affixes attached to verbs are:</xsl:text>
</p>
</xsl:if>                     
           <xsl:if test="normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<example num="xNeg.NegAdverb.32">
<table border="1">
                 <tr>
                    <th>Verbs with negative temporal adverbial affixes</th>
                    <th>Gloss</th>
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
               
           <xsl:if test="normalize-space(//neg/negTemporalTypeVerb/@checked)='yes'">
<p>
<xsl:text>There is </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAffix/@checked)='yes'">
<xsl:text>also  </xsl:text>
</xsl:if>
<xsl:text>a negative verbal affix, and a negative verb may occur with the positive temporal adverbs to give a negative temporal meaning.  Examples of the positive temporal adverbs with a negative verb are:</xsl:text>
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
           <xsl:if test="normalize-space(//neg/negTemporalTypeOther/@checked)='yes'">
<p>
<xsl:text>The negative temporal may </xsl:text>
<xsl:if test="normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes' or normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes' or normalize-space(//neg/negTemporalTypeAffix/@checked)='yes' or normalize-space(//neg/negTemporalTypeVerb/@checked)='yes'">
<xsl:text>also  </xsl:text>
</xsl:if>
<xsl:text>be expressed by ___</xsl:text>
<xsl:value-of select="//neg/negTemporalTypeOther" />
<xsl:text> as shown here:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negTemporalTypeOther/@checked)='yes'">
<example num="xNeg.NegAdverb.40">
<table border="1">
                 <tr>
                    <th>Negative Temporal</th>
                    <th>Gloss</th>
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
<xsl:text>Complete sentence examples containing a negative temporal include:</xsl:text>
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
          
              
           <p>
<xsl:text>The negative locative adverb </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nowhere</langData>
<xsl:text> is expressed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> in the following ways:</xsl:text>
</p>
           
           <xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes'">
<p>
<xsl:text>There is at least one independent word or phrase which is unrelated to the positive locative adverbs.  These negative locative adverbs or phrases are:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes'">
<example num="xNeg.NegAdverb.50">
<table border="1">
                 <tr>
                    <th>Negative locative adverbs or phrases</th>
                    <th>Gloss</th>
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
           
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<p>
<xsl:text>There is </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes'">
<xsl:text>also </xsl:text>
</xsl:if>
<xsl:text> a negative affix which may be added to a positive locative adverb to form a negative locative adverb word.  The negative affix is:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<example num="xNeg.NegAdverb.54">
<table border="1">
                 <tr>
                    <th>Negative affix</th>
                    <th>Gloss</th>
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
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<p>
<xsl:text>Examples of the negative locative adverbs formed by adding the negative affix to the positive locative adverbs are:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<example num="xNeg.NegAdverb.58">
<table border="1">
                 <tr>
                    <th>Negative locative adverbs</th>
                    <th>Gloss</th>
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
           
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<p>
<xsl:text>There is </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes'">
<xsl:text>also </xsl:text>
</xsl:if>
<xsl:text>an independent negative word which occurs </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordOther/@checked)='no'">
<xsl:text> a positive locative adverb to form a negative locative adverb phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='no' and normalize-space(//neg/negLocativeAdverbWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/negLocativeTypeAdverbWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/negLocativeAdverbWordBefore/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordOther/@checked)='yes' or normalize-space(//neg/negLocativeAdverbWordAfter/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordOther/@checked)='yes' or normalize-space(//neg/negLocativeAdverbWordBoth/@checked)='yes' and normalize-space(//neg/negLocativeAdverbWordOther/@checked)='yes'">
<xsl:text> a positive locative adverb to form a negative locative adverb phrase and may also occur ___</xsl:text> <xsl:value-of select="//neg/negLocativeTypeAdverbWordOther" /> <xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text> The negative word that occurs with the positive locative adverbs is:</xsl:text>
</p>
</xsl:if>
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<example num="xNeg.NegAdverb.62">
<table border="1">
                 <tr>
                    <th>Negative word</th>
                    <th>Gloss</th>
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
           <xsl:if test="normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<p>
<xsl:text>Examples of the negative locative adverb phrases formed by the negative word and the positive locative adverbs are:</xsl:text>
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
           
           <xsl:if test="normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<p>
<xsl:text>There is </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes'">
<xsl:text>also </xsl:text>
</xsl:if>
<xsl:text>at least one verbal affix that expresses the negative locative adverbial.  These negative locative adverbial affixes which can attach to verbs are:</xsl:text>
</p>
</xsl:if>                     
           <xsl:if test="normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<example num="xNeg.NegAdverb.70">
<table border="1">
                 <tr>
                    <th>Negative locative adverbial affixes</th>
                    <th>Gloss</th>
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
           
           <xsl:if test="normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<p>
<xsl:text>Examples of the negative locative adverbial affixes attached to verbs are:</xsl:text>
</p>
</xsl:if>                     
           <xsl:if test="normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<example num="xNeg.NegAdverb.74">
<table border="1">
                 <tr>
                    <th>Verbs with negative locative adverbial affixes</th>
                    <th>Gloss</th>
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
           
           <xsl:if test="normalize-space(//neg/negLocativeTypeVerb/@checked)='yes'">
<p>
<xsl:text>There is </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAffix/@checked)='yes'">
<xsl:text>also  </xsl:text>
</xsl:if>
<xsl:text>a negative verbal affix, and a negative verb may occur with the positive locative adverbs to give a negative locative meaning.  Examples of the positive locative adverbs with a negative verb are:</xsl:text>
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
           <xsl:if test="normalize-space(//neg/negLocativeTypeOther/@checked)='yes'">
<p>
<xsl:text>The negative locative may </xsl:text>
<xsl:if test="normalize-space(//neg/negLocativeTypeWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes' or normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes' or normalize-space(//neg/negLocativeTypeAffix/@checked)='yes' or normalize-space(//neg/negLocativeTypeVerb/@checked)='yes'">
<xsl:text>also  </xsl:text>
</xsl:if>
<xsl:text>be expressed by ___</xsl:text>
<xsl:value-of select="//neg/negLocativeTypeOther" />
<xsl:text> as shown here:</xsl:text>
</p>
</xsl:if>   
           <xsl:if test="normalize-space(//neg/negLocativeTypeOther/@checked)='yes'">
<example num="xNeg.NegAdverb.82">
<table border="1">
                 <tr>
                    <th>Negative Locative</th>
                    <th>Gloss</th>
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
<xsl:text>Complete sentence examples containing a negative locative include:</xsl:text>
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
           
           <xsl:if test="normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negTemporalTypeAdverb/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negTemporalTypeAdverbWord/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negTemporalTypeWord/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negLocativeTypeAdverb/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negLocativeTypeAdverbWord/@checked)='yes' or normalize-space(//neg/@negVerbal)='yes' and normalize-space(//neg/negLocativeTypeWord/@checked)='yes'">
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
<xsl:choose>
                    <xsl:when test="//neg/@advVerbRequired='yes'"> a negative adverb written as an independent word is not allowed without the verb or auxiliary also being negative.</xsl:when>
                    <xsl:when test="//neg/@advVerbRequired='no'"> a negative verb or auxiliary is not required when there is a negative adverb written as an independent word.</xsl:when>
                </xsl:choose>
</p>
</xsl:if>
        </section2>
 
 <section2 id="sNegPron">
    <secTitle>Negative Indefinite Pronouns</secTitle>
    <p contentType="ctComparativeIntro">
<xsl:text>There are also negative versions of the indefinite pronouns, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nobody</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nothing</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>none</langData>
<xsl:text>.  Note that these are formed from a negative and a generic noun or number.  Sometimes these negative indefinites are not merged into a single word, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no  one</langData>
<xsl:text>. </xsl:text>
</p>
    
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
<xsl:if test="normalize-space(//neg/@negIndef)='some'">
<xsl:text> some of</xsl:text>
</xsl:if>
<xsl:text> the negative indefinite pronouns </xsl:text>
<xsl:choose>
       <xsl:when test="//neg/@negIndef='yes'">are all single-word pronouns. </xsl:when>
       <xsl:when test="//neg/@negIndef='no'">are all nominal phrases instead of single-word pronouns. </xsl:when>
       <xsl:when test="//neg/@negIndef='some'">are single-word pronouns, but others are nominal phrases. </xsl:when>
    </xsl:choose>
<xsl:text> These negative indefinite forms are:</xsl:text>
</p>
    
    <example num="xNeg.NegPron.8">
<table border="1">
          <caption>
<xsl:text>Negative Indefinites</xsl:text>
</caption>
          <tr>
             <th>Type</th>
             <th>Morphemes</th>
             <th>Gloss</th>
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
<xsl:text>Pronouns</xsl:text>
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
<xsl:text>Pronouns</xsl:text>
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
<xsl:text>Phrases</xsl:text>
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
<xsl:text>Phrases</xsl:text>
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
    <p>
<xsl:text>Examples of the negative indefinite </xsl:text>
<xsl:if test="normalize-space(//neg/@negIndef)='yes'">
<xsl:text>pronouns</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@negIndef)='no'">
<xsl:text>nominal phrases</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/@negIndef)='some'">
<xsl:text>pronouns and/or nominal phrases</xsl:text>
</xsl:if>
<xsl:text> used as the subject of a sentence are:</xsl:text>
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
    
    <xsl:if test="normalize-space(//neg/@negVerbal)='yes'">
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
<xsl:choose>
          <xsl:when test="//neg/@subjVerbRequired='yes'"> a negative subject is not allowed without the verb or auxiliary also being negative.</xsl:when>
          <xsl:when test="//neg/@subjVerbRequired='no'"> the verb or auxiliary is not required to be negative when the subject is negative.</xsl:when>
       </xsl:choose>
</p>
</xsl:if>
    
 </section2>
       
       <section2 id="sNegNominal">
            <secTitle>Negation of Nominal Phrases</secTitle>
            <p contentType="ctComparativeIntro">
<xsl:text> The negatives meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> can negate a nominal phrase.   Note that </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text> can occur in place of or before the other wide scope degree words or quantifiers, as in the English examples: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not the children</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not all five children</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not just this many children</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not only Sue's three children</langData>
<xsl:text>.  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>No</langData>
<xsl:text> also occurs first in the nominal phrase, as shown in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no little children</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no big boys</langData>
<xsl:text>.  Negation of a nominal phrase normally occurs either first or last, so that it has the widest scope of all the modifiers of the noun in the phrase.</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text> The negatives meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> can negate a nominal phrase.  Negation of a nominal phrase normally occurs either first or last, so that it has the widest scope of all the modifiers of the noun in the phrase.</xsl:text>
</p>
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='none'">
<p>
<xsl:text>There does not seem to be any way to negate a nominal phrase in </xsl:text>
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

<xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none'">
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
<xsl:if test="normalize-space(//neg/@npDegreeNeg)='some'">
<xsl:text>some of </xsl:text>
</xsl:if>
<xsl:text>the elements that negate a nominal phrase </xsl:text>
<xsl:choose>
   <xsl:when test="//neg/@npDegreeNeg='yes'">are all independent words.  </xsl:when>
   <xsl:when test="//neg/@npDegreeNeg='some'">are independent words, but some attach </xsl:when>
   <xsl:when test="//neg/@npDegreeNeg='no'">attach </xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' or normalize-space(//neg/@npDegreeNeg)='some'">
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no'">
<xsl:text>to the beginning of whatever word begins the nominal phrase as phrasal proclitics.  </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no'">
<xsl:text>to the end of whatever word ends the nominal phrase as phrasal enclitics.    </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no'">
<xsl:text>either to the beginning of whatever word begins the nominal phrase or to the end of whatever word ends the nominal phrase as phrasal clitics.   </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no'">
<xsl:text>to the head noun in the nominal phrase as a prefix.  </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<xsl:text>to the head noun in the nominal phrase as a suffix.   </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<xsl:text>to the head noun in the nominal phrase, some as prefixes and some as suffixes.   </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no' or normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<xsl:text>either to the beginning or end of the nominal phrase as a phrasal clitic, or to the head noun in the nominal phrase as an affix.  </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='no' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/npDegreeNegOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
      <xsl:if test="normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes' or normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes' or normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes' or normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' and normalize-space(//neg/npDegreeNegCliticOther/@checked)='yes'">
<xsl:text>  Some also attach ___</xsl:text>
<xsl:value-of select="//neg/npDegreeNegOther" />  <xsl:text>.</xsl:text>
</xsl:if>              
   </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>   

          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegProclitic/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegEnclitic/@checked)='yes'">
<p>
<xsl:text>Examples of negative nominal phrases with the negative clitics attached  are:</xsl:text>
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
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegPrefix/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegSuffix/@checked)='yes'">
<p>
<xsl:text>Examples of negative nominal phrases with the negative affixes attached  are:</xsl:text>
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
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='no' and normalize-space(//neg/npDegreeNegOther/@checked)='yes' or normalize-space(//neg/@npDegreeNeg)='some' and normalize-space(//neg/npDegreeNegOther/@checked)='yes'">
<p>
<xsl:text>Examples of negative nominal phrases with the negative elements attached as allowed in </xsl:text>
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
          
          <xsl:if test="normalize-space(//neg/@npDegreeNeg)='yes' or normalize-space(//neg/@npDegreeNeg)='some'">
<p>
<xsl:text>The independent negative words occur </xsl:text>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='no' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='no' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='no' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='no' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='no' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='no' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordOther/@checked)='no'">
<xsl:text> the rest of the nominal phrase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='no' and normalize-space(//neg/npDegreeNegWordAfter/@checked)='no' and normalize-space(//neg/npDegreeNegWordBoth/@checked)='no' and normalize-space(//neg/npDegreeNegWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//neg/npDegreeNegWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//neg/npDegreeNegWordBefore/@checked)='yes' and normalize-space(//neg/npDegreeNegWordOther/@checked)='yes' or normalize-space(//neg/npDegreeNegWordAfter/@checked)='yes' and normalize-space(//neg/npDegreeNegWordOther/@checked)='yes' or normalize-space(//neg/npDegreeNegWordBoth/@checked)='yes' and normalize-space(//neg/npDegreeNegWordOther/@checked)='yes'">
<xsl:text> the rest of the nominal phrase and may also occur ___</xsl:text> <xsl:value-of select="//neg/npDegreeNegWordOther" /> <xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> Negative nominal phrase examples without the positive wide scope quantifiers or degree elements are:</xsl:text>
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
                   
               <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none' and normalize-space(//neg/@npDegreeNegCooccur)='no'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> does not allow the negative elements to co-occur with the positive wide scope quantifiers or degree elements in a single nominal phrase.</xsl:text>
</p>
</xsl:if>
               <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none' and normalize-space(//neg/@npDegreeNegCooccur)='yes'">
<p>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> allows the negative elements to co-occur with the positive wide scope quantifiers or degree elements in a single nominal phrase as shown here::</xsl:text>
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
                <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none'">
<p>
<xsl:text>Any of these negative nominal phrases may be used as the subject of a full sentence.  Some examples are: </xsl:text>
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
               
                <xsl:if test="normalize-space(//neg/@npDegreeNeg)!='none' and normalize-space(//neg/@negVerbal)='yes'">
<p>
<xsl:text>As the above sentence examples show, </xsl:text>
<xsl:choose>
                        <xsl:when test="//neg/@subjVerbRequired='yes'">a negative subject is not allowed without also having a negative verb or auxiliary.</xsl:when>
                        <xsl:when test="//neg/@subjVerbRequired='no'">a negative verb or auxiliary is not required when the subject is negative.</xsl:when>
                    </xsl:choose>
</p>
</xsl:if>
        
        </section2>
       <section2 id="sNegType">
          <secTitle>Type of Negation System</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Languages fall into two major classifications with respect to negation: Polarity Changing languages versus Negative Concord languages, exemplified by standard English versus Spanish or Black English, respectively.</xsl:text>
</p>
          <p contentType="ctComparativeIntro">
<xsl:text>Polarity Changing languages normally allow only a single negative element in the sentence for negation to be expressed (though technically any odd number of negatives expresses negative polarity) because the presence of two (or any even number of) negative elements changes the polarity back to positive.  For example, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John saw nothing</langData>
<xsl:text> is negative, but </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn’t see nothing</langData>
<xsl:text> is positive because it means the same as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John saw something</langData>
<xsl:text>.  The version with a negative auxiliary is expressed as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn’t see anything</langData>
<xsl:text>, using what is known as a “negative polarity item” in object position.  Such negative polarity items may occur as subjects in some contexts without any other negation present, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Anyone may come</langData>
<xsl:text>, but they may only occur in object position when some earlier element in the sentence is negative.  For example, one can say </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nobody saw anyone</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nowhere will they find anyone</langData>
<xsl:text> but without the negative subject or fronted negative adverb the negative auxiliary must be used, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>We did not see anyone</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>They will not find anyone anywhere</langData>
<xsl:text>.</xsl:text>
</p>
          <p contentType="ctComparativeIntro">
<xsl:text>In Negative Concord languages, any number of negative elements expresses negative polarity, so in a Negative Concord version of English (such as Black English) </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn’t see nothing</langData>
<xsl:text> is the correct way to express a negative sentence with a negative object.  In these languages, a negative element may normally occur in subject position or a fronted position without any other negative element present, but a negative object may only occur when some earlier element in the sentence is negative.  Some Negative Concord languages have the stronger restriction that any negative word or phrase must co-occur with verbal negation and still others require fronting of the negative word or phrase, similarly to the fronting of question words or phrases in content questions.</xsl:text>
</p>
          <p contentType="ctPracticalIntro">
<xsl:text>The two major classifications with respect to negation are Polarity Changing languages versus Negative Concord languages.  Polarity Changing languages normally allow only a single negative element in the sentence with special negative polarity items which appear in place of a second negative element.  In contrast, any number of negative elements expresses negative polarity in Negative Concord languages, since the negative elements concord or agree in polarity.</xsl:text>
</p>
          <p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is a </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@type='changing'">Polarity Changing</xsl:when>
                <xsl:when test="//neg/@type='concord'">Negative Concord</xsl:when>
             </xsl:choose>
<xsl:text> language, since </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@type='changing'">the polarity changes between positive and negative with each instance of negation. </xsl:when>
                <xsl:when test="//neg/@type='concord'">any number of negative elements simply agree in making the polarity negative. </xsl:when>
             </xsl:choose>
<xsl:text></xsl:text>
</p>
          <xsl:if test="normalize-space(//neg/@type)='changing'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@polarityItems='yes'"> has </xsl:when>
                <xsl:when test="//neg/@polarityItems='no'"> does not have any </xsl:when>
             </xsl:choose>
<xsl:text>negative polarity items.  </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@polarityItems='yes'">The following pronouns, determiners, and adverbs occur in object position or the normal adverb position instead of the equivalent negative element when another negative element is present in the sentence.</xsl:when>
                <xsl:when test="//neg/@polarityItems='no'">The negative pronouns, determiners, and adverbs may occur in object position or the normal adverb position even when there is another negative element in the sentence.</xsl:when>
             </xsl:choose>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
<example num="xNeg.NegType.16">
<table border="1">
                <tr>
                   <th>Type</th>
                   <th>Negative Polarity Items</th>
                   <th>Gloss</th>
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
                      <xsl:text>Pronouns</xsl:text>
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
<td align="left" rowspan="1">
                      <xsl:text>Pronouns</xsl:text>
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
                      <xsl:text>Determiners</xsl:text>
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
<td align="left" rowspan="1">
                      <xsl:text>Determiners</xsl:text>
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
                      <xsl:text>Temporal Adverbs</xsl:text>
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
<td align="left" rowspan="">
                      <xsl:text>Temporal Adverbs</xsl:text>
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
                      <xsl:text>Locative Adverbs</xsl:text>
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
<td align="left" rowspan="">
                      <xsl:text>Locative Adverbs</xsl:text>
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
             </table>
</example>
</xsl:if>
          
          <p>
<xsl:text>Examples with a positive subject and a negative </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
                <xsl:text>polarity item in the </xsl:text>
             </xsl:if>
<xsl:text>object nominal phrase include:</xsl:text>
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
          <p>
<xsl:text>Examples with a positive subject and a negative </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
                <xsl:text>polarity item in the </xsl:text>
             </xsl:if>
<xsl:text>indirect object nominal phrase include:</xsl:text>
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
          <xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
<p>
<xsl:text>As these examples show, a negative polarity item is </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
                <xsl:text>not</xsl:text>
             </xsl:if>
<xsl:text> allowed to occur in object or indirect object position </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@objVerbRequired='yes'">unless the verb or auxiliary is negative.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='other'">unless either the verb or auxiliary or some other element in the sentence is negative.</xsl:when>
                <xsl:when test="//neg/@objVerbRequired='no'">without any restriction about other negative elements in the sentence.</xsl:when>
             </xsl:choose>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@polarityItems)='no'">
<p>
<xsl:text>As these examples show, a negative nominal phrase is </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
                <xsl:text>not</xsl:text>
             </xsl:if>
<xsl:text> allowed to occur in object or indirect object position </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@objVerbRequired='yes'">unless the verb or auxiliary is negative. </xsl:when>
                <xsl:when test="//neg/@objVerbRequired='other'">unless either the verb or auxiliary or some other element in the sentence is negative. </xsl:when>
                <xsl:when test="//neg/@objVerbRequired='no'">without any restriction about other negative elements in the sentence. </xsl:when>
             </xsl:choose>
</p>
</xsl:if>
          
          <xsl:if test="normalize-space(//neg/@type)='concord'">
<p>
<xsl:text>As these examples show, a negative nominal phrase is </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
                <xsl:text>not</xsl:text>
             </xsl:if>
<xsl:text> allowed to occur in object or indirect object position </xsl:text>
<xsl:choose>
                <xsl:when test="//neg/@objVerbRequired='yes'">unless the verb or auxiliary is negative. </xsl:when>
                <xsl:when test="//neg/@objVerbRequired='other'">unless either the verb or auxiliary or some other element in the sentence is negative. </xsl:when>
                <xsl:when test="//neg/@objVerbRequired='no'">without any restriction about other negative elements in the sentence. </xsl:when>
             </xsl:choose>
<xsl:choose>
                <xsl:when test="//neg/@negFront='yes'"> A negative object must appear initially in the sentence, similarly to the fronting of interrogative phrases. </xsl:when>
                <xsl:when test="//neg/@negFront='optional'"> A negative object may appear initially in the sentence, or it may remain in its normal position. </xsl:when>
                <xsl:when test="//neg/@negFront='beforeVerb'"> A negative object may appear in the position directly before the verb, or it may remain in its normal position. </xsl:when>
                <xsl:when test="//neg/@negFront='no'"> A negative object simply appears in its normal position in the sentence, without any movement. </xsl:when>
             </xsl:choose>
</p>
</xsl:if>
          
          
          <xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@negTwoAllowed)='yes'">
<p>
<xsl:text>Finally, examples with both a negative subject and a negative </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
                <xsl:text>polarity item in the </xsl:text>
             </xsl:if>
<xsl:text>object nominal phrase include:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//neg/@negTwoAllowed)='oneOnly'">
<p>
<xsl:text>Examples with both a negative subject and a negative </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
                <xsl:text>polarity item in the </xsl:text>
             </xsl:if>
<xsl:text>object nominal phrase are not allowed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Examples showing how these meanings are expressed using an indefinite or split into two sentences.include:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@type)='concord' and normalize-space(//neg/@negFrontTwo)!='oneOnly'">
<p>
<xsl:text>Finally, examples with both a negative subject and a negative object nominal phrase include:</xsl:text>
</p>
</xsl:if>
          <xsl:if test="normalize-space(//neg/@type)='concord' and normalize-space(//neg/@negFrontTwo)='oneOnly' or normalize-space(//neg/@type)='concord' and normalize-space(//neg/@negTwoAllowed)='oneOnly' and normalize-space(//neg/@negFront)='no'">
<p>
<xsl:text>Examples with both a negative subject and a negative object nominal phrase are not allowed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  Examples showing how these meanings are expressed using an indefinite or split into two sentences.include:</xsl:text>
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
          
             
          <xsl:if test="normalize-space(//neg/@type)='concord'">
<p>
<xsl:if test="normalize-space(//neg/@type)='concord' and normalize-space(//neg/@negFront)!='no' and normalize-space(//neg/@negFrontTwo)!='oneOnly'">
                   <xsl:text> If both the subject and object are negative, </xsl:text>
                   <xsl:choose>
                      <xsl:when test="//neg/@negFrontTwo='yes'">both negative elements must appear initially in the sentence.</xsl:when>
                      <xsl:when test="//neg/@negFrontTwo='optional'">both negative elements may appear initially in the sentence, or the negative object  may remain in its normal position.</xsl:when>
                      <xsl:when test="//neg/@negFrontTwo='beforeVerb'">both negative elements may appear in the position directly before the verb, or the negative object may remain in its normal position.</xsl:when>
                      <xsl:when test="//neg/@negFrontTwo='no'">only the negative subject is fronted, and the negative object simply appears in its normal position in the sentence.</xsl:when>
                   </xsl:choose>
                </xsl:if>
</p>
</xsl:if>
          
       </section2>
       
    </section1>
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
      
         
         
         
         
         
         
         
         
         
         
         
      
   
      
      
      
      
      
      
      
      
      
      
      
   
   

   

   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   


    
        
    
   
      
      
      
   
   
        
        
        


    
    
    
   
   

   
      
      
      
   
   
      
      
      
   
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
    
        
    
   
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
   
   
      
      
      
   
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
      
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
         
         
         
         
      
      
         
      
      
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
      
      
      
      
      
      
      
      
   
   
      
      
      
   

   
   
        
   
   
      
   
   
      
   
  
     
   
   
      
    
   
      
    
   
      
      
      
    
   
      
      
      
    
   
   
</xsl:template>
</xsl:stylesheet>
