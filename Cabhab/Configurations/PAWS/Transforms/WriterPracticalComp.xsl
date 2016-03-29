<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="comp">
    <section1 id="sComp">
        <secTitle>Complement Clauses</secTitle>
        <p>
<xsl:text>The various types of embedded clauses which are complements of main verbs or of adjectives acting as the predicate of the sentence will be presented, after covering the complementizers and their position in declarative embedded clauses.</xsl:text>
</p>
       
          <p contentType="ctComparativeIntro">
<xsl:text>English has two complementizers which mark declarative embedded clauses, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>that</langData>
<xsl:text>  for finite clauses and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>for</langData>
<xsl:text> for nonfinite clauses.  In other languages the complementizers for embedded declarative clauses may or may not be overt, and in some languages they are clitics which are written attached to another word.</xsl:text>
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
<xsl:text>, there is </xsl:text>
<xsl:choose>
                <xsl:when test="//comp/@comp='no'">no complementizer word or clitic or affix for declarative embedded clauses.  Therefore, all embedded clauses have the same structure as regular sentences.  <xsl:choose>
                   <xsl:when test="//ip/@auxNonfinite='yes'">There is still a distinction between finite and nonfinite embedded clauses, since there is a nonfinite auxiliary. </xsl:when>
                   <xsl:when test="//ip/@auxNonfinite='no'">There is still a distinction between finite and nonfinite embedded clauses, since there is a nonfinite marker on the verb. </xsl:when>
                   <xsl:when test="//ip/@auxNonfinite='none'">There is not any distinction between finite and nonfinite embedded clauses either, since there is not any nonfinite form in the language. </xsl:when>
                </xsl:choose>
</xsl:when>
                <xsl:when test="//comp/@comp='yes'">at least one complementizer for declarative embedded clauses.  </xsl:when>
             </xsl:choose>
<xsl:if test="normalize-space(//comp/@comp)='yes'">
<xsl:text>There is </xsl:text>
             <xsl:choose>
                <xsl:when test="//comp/@compNonfinite='yes'">a distinct complementizer for nonfinite clauses. </xsl:when>   
                <xsl:when test="//comp/@compNonfinite='no'">not a distinct complementizer for nonfinite clauses.  <xsl:choose>
                   <xsl:when test="//ip/@auxNonfinite='yes'">There is still a distinction between finite and nonfinite embedded clauses, since there is a nonfinite auxiliary. </xsl:when>
                   <xsl:when test="//ip/@auxNonfinite='no'">There is still a distinction between finite and nonfinite embedded clauses, since there is a nonfinite marker on the verb. </xsl:when>
                   <xsl:when test="//ip/@auxNonfinite='none'">There is not any distinction between finite and nonfinite embedded clauses either, since there is not any nonfinite form in the language. </xsl:when>
                </xsl:choose>
</xsl:when>
          </xsl:choose>
                <xsl:if test="normalize-space(//comp/@compWord)='some' and normalize-space(//comp/@comp)='yes'">
<xsl:text> Some of the</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/@compWord)!='some' and normalize-space(//comp/@comp)='yes'">
<xsl:text> The</xsl:text>
</xsl:if>
<xsl:text> complementizers </xsl:text>
                <xsl:choose>
                   <xsl:when test="//comp/@compWord='yes'">are written as an independent word. </xsl:when>
                   <xsl:when test="//comp/@compWord='some'">are written as an independent word, but some attach </xsl:when>
                   <xsl:when test="//comp/@compWord='no'">attach </xsl:when>
                </xsl:choose>
                <xsl:text></xsl:text>
                <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/@comp)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/@comp)='yes'">
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='no'">
<xsl:text>to the beginning of whatever word begins the complement clause as phrasal proclitics.  </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='no'">
<xsl:text>to the end of whatever word ends the complement clause as phrasal enclitics.    </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='no'">
<xsl:text>either to the beginning of whatever word begins the complement clause or to the end of whatever word ends the complement clause as phrasal clitics.   </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='no'">
<xsl:text>to the verb in the complement clause as a prefix.  </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='yes'">
<xsl:text>to the verb in the complement clause as a suffix.   </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes'">
<xsl:text>to the verb in the complement clause, some as prefixes and some as suffixes.   </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='no' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='no' or normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='no' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compSuffix/@checked)='yes'">
<xsl:text>either to the beginning or end of the complement clause as a phrasal clitic, or to the verb in the complement clause as an affix.  </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='no' and normalize-space(//comp/compEnclitic/@checked)='no' and normalize-space(//comp/compPrefix/@checked)='no' and normalize-space(//comp/compSuffix/@checked)='no' and normalize-space(//comp/compAttachesOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//comp/attachesOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//comp/compProclitic/@checked)='yes' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/compEnclitic/@checked)='yes' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/compPrefix/@checked)='yes' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/compSuffix/@checked)='yes' and normalize-space(//comp/compAttachesOther/@checked)='yes'">
<xsl:text>  Some also attach ___</xsl:text>
<xsl:value-of select="//comp/attachesOther" />  <xsl:text>.</xsl:text>
</xsl:if>              
                </xsl:if>  </xsl:if>
</p>   
       
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compProclitic/@checked)='yes' or normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compProclitic/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compEnclitic/@checked)='yes'">
<p>
<xsl:text>These complementizer clitics are:</xsl:text>
</p>
</xsl:if>   
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compProclitic/@checked)='yes' or normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compEnclitic/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compProclitic/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compEnclitic/@checked)='yes'">
<example num="xComp.12">
<table border="1">
             <tr>
                <th>Complementizer clitics</th>
                <th>Gloss</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//comp/compCliticExample),'.','')" />
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
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compPrefix/@checked)='yes' or normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compPrefix/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compSuffix/@checked)='yes'">
<p>
<xsl:text>These complementizer affixes are:</xsl:text>
</p>
</xsl:if>   
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compPrefix/@checked)='yes' or normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compSuffix/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compPrefix/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compSuffix/@checked)='yes'">
<example num="xComp.16">
<table border="1">
             <tr>
                <th>Complementizer Affixes</th>
                <th>Gloss</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//comp/compAffixExample),'.','')" />
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
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compAttachesOther/@checked)='yes'">
<p>
<xsl:text>The other complementizers which attach as allowed in </xsl:text>
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
       <xsl:if test="normalize-space(//comp/@compWord)='no' and normalize-space(//comp/compAttachesOther/@checked)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/compAttachesOther/@checked)='yes'">
<example num="xComp.20">
<table border="1">
             <tr>
                <th>Other Complementizers that attach</th>
                <th>Gloss</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//comp/comp/AttachesOtherExample),'.','')" />
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
       
       <xsl:if test="normalize-space(//comp/@compWord)='yes' and normalize-space(//comp/@comp)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/@comp)='yes'">
<p>
<xsl:text> The complementizers which are independent words occur </xsl:text>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compAfter/@checked)='no' and normalize-space(//comp/compBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='no' and normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='no' and normalize-space(//comp/compAfter/@checked)='no' and normalize-space(//comp/compBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compAfter/@checked)='no' and normalize-space(//comp/compBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='no' and normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compOther/@checked)='no'">
<xsl:text> the rest of the complement clause. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='no' and normalize-space(//comp/compAfter/@checked)='no' and normalize-space(//comp/compBoth/@checked)='no' and normalize-space(//comp/compOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//comp/compOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//comp/compBefore/@checked)='yes' and normalize-space(//comp/compOther/@checked)='yes' or normalize-space(//comp/compAfter/@checked)='yes' and normalize-space(//comp/compOther/@checked)='yes' or normalize-space(//comp/compBoth/@checked)='yes' and normalize-space(//comp/compOther/@checked)='yes'">
<xsl:text> the rest of the complement clause and may also occur ___</xsl:text> <xsl:value-of select="//comp/compOther" /> <xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> These complementizers are:</xsl:text>
</p>
</xsl:if>          
       <xsl:if test="normalize-space(//comp/@compWord)='yes' and normalize-space(//comp/@comp)='yes' or normalize-space(//comp/@compWord)='some' and normalize-space(//comp/@comp)='yes'">
<example num="xComp.24">
<table border="1">
             <tr>
                <th>Complementizers</th>
                <th>Gloss</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//comp/compExample),'.','')" />
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
<xsl:text>See section </xsl:text>
<sectionRef sec="sQues" />
<xsl:text> for similar discussion on complementizers for questions and section </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text> for relative clauses.</xsl:text>
</p>
       <p>
<xsl:text>Each of the following subsections exemplifies a particular type of complement for a verb or other predicate.  See section </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text> for examples of adverbial clauses. Some adverbs can also take clausal complements similar to these, but the adverbial clauses are not complements of the main verb. </xsl:text>
<object type="tComment">You may need to remove some of the prose and combine examples if your language does not make all the same distinctions.</object>
</p>
       <xsl:if test="normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compNonfinite)='yes' or normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compNonfinite)='no' and normalize-space(//ip/@auxNonfinite)!='none'">
<section2 id="sCompTypeFiniteAndNonfiniteCP">
                <secTitle>Finite and Nonfinite Complement Clauses</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take only a finite clause complement, with or without a complementizer, include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I believe (that) Jill is my friend</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jill insists (that) she is my friend</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I know (that) he likes me</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Some verbs have only a finite clause complement, with or without a complementizer. Examples of this type in </xsl:text>
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
                <example num="xComp.CompTypeFiniteAndNonfiniteCP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteCP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteCP.8.1</xsl:text>
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
                <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take either a finite complement, with or without a complementizer, or a nonfinite complement without a complementizer, include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect that Joe will come to the party</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Some verbs may have either a finite complement, with or without a complementizer, or a nonfinite complement without a complementizer.  Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteCP.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteCP.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteCP.14.1</xsl:text>
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
                <p contentType="ctComparativeIntro">
<xsl:text>Some verbs which take only a nonfinite complement without a complementizer allow either a different subject than the main clause or a dropped subject when it is coreferent with the main clause subject.  English examples include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Some verbs have only a nonfinite complement without a complementizer and allow either a different subject than the main clause or a dropped subject when it is coreferent with the main clause subject.  Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteCP.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteCP.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteCP.20.1</xsl:text>
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
                <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take only a nonfinite complement without a complementizer, but require the subject to be coreferent with the main clause subject and dropped, include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I tried to think of more examples</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Some verbs have only a nonfinite complement without a complementizer, but require the subject to be coreferent with the main clause subject and dropped.  Examples of this type in </xsl:text>
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
                <example num="xComp.CompTypeFiniteAndNonfiniteCP.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteCP.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteCP.26.1</xsl:text>
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
                <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take only a nonfinite complement, but the complementizer </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>for</langData>
<xsl:text> is present when the embedded subject is not coreferent with the main clause subject, include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe would hate for Sue to be at the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Some verbs have only a nonfinite complement, but the complementizer is present when the embedded subject is not coreferent with the main clause subject.  Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteCP.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteCP.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteCP.32.1</xsl:text>
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
                <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take a direct object as well as either a finite or nonfinite clause complement include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe that he should come to the party</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Other verbs have a direct object as well as either a finite or nonfinite clause complement.  Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteCP.38">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/DPCPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/DPCPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteCP.38</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteCP.38.1</xsl:text>
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
            </section2>
</xsl:if>
           
       <xsl:if test="normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compNonfinite)='no' and normalize-space(//ip/@auxNonfinite)='none'">
<section2 id="sCompTypeFiniteCP">
          <secTitle>Complement Clauses</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take a clause complement, with or without a complementizer, include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I believe (that) Jill is my friend</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jill insists (that) she is my friend</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I know (that) he likes me</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect that Joe will come to the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe would hate for Sue to be at the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Some verbs have only a clause complement, with or without a complementizer. Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteCP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteCP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteCP.8.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteCP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteCP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteCP.10.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteCP.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteCP.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteCP.12.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteCP.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteCP.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteCP.14.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteCP.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteCP.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteCP.16.1</xsl:text>
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
          <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take a direct object as well as a clause complement include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe that he should come to the party</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Other verbs have a direct object as well as either a finite or nonfinite clause complement.  Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteCP.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/DPCPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/DPCPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteCP.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteCP.22.1</xsl:text>
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
       </section2>
</xsl:if>
       
       <xsl:if test="normalize-space(//comp/@comp)='no' and normalize-space(//ip/@auxNonfinite)!='none'">
<section2 id="sCompTypeFiniteAndNonfiniteIP">
          <secTitle>Finite and Nonfinite Sentential Complements</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take only a finite sentential complement include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I believe Jill is my friend</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jill insists she is my friend</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I know he likes me</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Some verbs have only a finite sentential complement. Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteIP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteIP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteIP.8.1</xsl:text>
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
          <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take either a finite or a nonfinite sentential complement include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe will come to the party</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Some verbs may have either a finite or a nonfinite sentential complement.  Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteIP.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteIP.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteIP.14.1</xsl:text>
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
          <p contentType="ctComparativeIntro">
<xsl:text>Some verbs which take only a nonfinite sentential complement allow either a different subject than the main clause or a dropped subject when it is coreferent with the main clause subject.  English examples include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Some verbs have only a nonfinite sentential complement and allow either a different subject than the main clause or a dropped subject when it is coreferent with the main clause subject.  Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteIP.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteIP.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteIP.20.1</xsl:text>
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
          <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take only a nonfinite sentential complement, but require the subject to be coreferent with the main clause subject and dropped, include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Other verbs have only a nonfinite sentential complement but require the subject to be coreferent with the main clause subject and dropped.  Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteIP.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteIP.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteIP.26.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteIP.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteIP.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteIP.28.1</xsl:text>
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
          <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take a direct object as well as either a finite or nonfinite sentential complement include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe he should come to the party</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Other verbs have a direct object as well as either a finite or nonfinite sentential complement.  Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteAndNonfiniteIP.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/DPCPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/DPCPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteAndNonfiniteIP.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteAndNonfiniteIP.34.1</xsl:text>
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
       </section2>
</xsl:if>
       
       <xsl:if test="normalize-space(//comp/@comp)='no' and normalize-space(//ip/@auxNonfinite)='none'">
<section2 id="sCompTypeFiniteIP">
          <secTitle>Sentential Complements</secTitle>
          <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take a sentential complement include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I believe Jill is my friend</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jill insists she is my friend</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I know he likes me</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe will come to the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I expect Joe to come to the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want to come to the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I want Joe to come to the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe tried to come to the party</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe hates to dance</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be appreciated</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Some verbs have only a sentential complement. Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteIP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteIP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteIP.8.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteIP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/finiteOrNonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/finiteOrNonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteIP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteIP.10.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteIP.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteIP.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteIP.12.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteIP.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteIP.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteIP.14.1</xsl:text>
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
          <example num="xComp.CompTypeFiniteIP.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/nonfiniteCPOrProDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/nonfiniteCPOrProDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteIP.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteIP.16.1</xsl:text>
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
          <p contentType="ctComparativeIntro">
<xsl:text>Verbs which take a direct object as well as a sentential complement include the following examples in English: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe he should come to the party</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will persuade Joe to come to the party</langData>
<xsl:text>.  Examples of this type in </xsl:text>
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
          <p contentType="ctPracticalIntro">
<xsl:text>Other verbs have a direct object as well as a sentential complement.  Examples of this type in </xsl:text>
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
          <example num="xComp.CompTypeFiniteIP.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/DPCPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/DPCPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/DPCPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeFiniteIP.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeFiniteIP.22.1</xsl:text>
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
       </section2>
</xsl:if>
       
       <section2 id="sCompRaising">
              <secTitle>Raising Constructions</secTitle>
              <p contentType="ctComparativeIntro">
<xsl:text>‘Raising’ verbs seem to include all the perception verbs and copulas. These verbs take either a nonfinite complement or an adjective complement which itself has either a finite complement with a complementizer or a nonfinite complement. The main verb does not have its own subject, so the subject position is filled by the subject of the nonfinite complement, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John seemed to like the tortillas</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe is likely to come</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The weather is certain to change soon</langData>
<xsl:text>.  When the complement clause is finite, the subject cannot be ‘raised’, so a pronoun without features  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>it</langData>
<xsl:text> fills the main clause subject position in English, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>It seems likely that Joe will come</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>It is certain that the weather will change soon</langData>
<xsl:text>.  Some languages simply have the verb without a subject, followed by a complement clause, so no ‘raising’ takes place; the two clauses simply share the same subject. </xsl:text>
</p>
              <p contentType="ctPracticalIntro">
<xsl:text>‘Raising’ verbs seem to include all the perception verbs and copulas. The main verb does not have its own subject, so the subject position is filled by the subject of the nonfinite complement or by a pronoun without features.  Some languages simply have the main verb without a subject, followed by a complement clause, so no ‘raising’ takes place; the two clauses simply share the same subject. </xsl:text>
</p>
              <p>
<xsl:text>Examples of this type in </xsl:text>
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
              <example num="xComp.CompRaising.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/raisingExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/raisingExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/raisingExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/raisingExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompRaising.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompRaising.10.1</xsl:text>
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
           </section2>
           
           <section2 id="sCompCausative">
              <secTitle>Complements of Causatives</secTitle>
              <p contentType="ctComparativeIntro">
<xsl:text>Syntactic causatives are made up of two clauses and have an object that also acts as the subject of the complement clause. That complement clause is always nonfinite, but does not need the nonfinite marker with some verbs in English, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My mother made me clean my room</langData>
<xsl:text>, while it is required with others, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The other girl caused us to break up</langData>
<xsl:text>.</xsl:text>
</p>
              
                 <p contentType="ctPracticalIntro">
<xsl:text>Syntactic causatives are made up of two clauses and have an object that also acts as the subject of the complement clause. </xsl:text>
</p>
              <xsl:if test="normalize-space(//ip/causativeMake/@checked)='no'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> does not have syntactic causatives.</xsl:text>
</p>
</xsl:if>
                 <xsl:if test="normalize-space(//ip/causativeMake/@checked)='yes'">
<p>
<xsl:text>Examples of this type in </xsl:text>
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
              <example num="xComp.CompCausative.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/causeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/causeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/causeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/causeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompCausative.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompCausative.12.1</xsl:text>
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
              <xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<p>
<xsl:text>See section </xsl:text>
<sectionRef sec="sIPCausatives" />
<xsl:text> for examples of single-clause causatives, in which the verb is marked with an affix which introduces an additional argument.</xsl:text>
</p>
</xsl:if>
           </section2>
      
           <section2 id="sCompSpeech">
              <secTitle>Direct and Indirect Speech as Complements</secTitle>
              
              <p contentType="ctComparativeIntro">
<xsl:text>Verbs of speaking can have either direct or indirect speech complements. Direct quotations can be just about any sentence or interjection or greeting, such as: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue said, “I will come to your house tomorrow”</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Joe said, “Bye!”</langData>
</p>
              <p contentType="ctComparativeIntro">
<xsl:text>Indirect quotations as complements are more restricted. In English, some speech verbs take a finite sentence complement with or without a complementizer, and an optional prepositional phrase to express the hearer, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue said (to me) that she would come here tomorrow</langData>
<xsl:text>.  Others require the hearer to be expressed as an object plus either a finite sentential complement, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue told me that she would come here tomorrow</langData>
<xsl:text>, or a nonfinite sentential complement in which the subject must be coreferent with the main clause subject and dropped, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue told me to come here tomorrow</langData>
<xsl:text>.</xsl:text>
</p>
              <p contentType="ctPracticalIntro">
<xsl:text>Verbs of speaking can have either direct or indirect speech complements. Direct quotations can be just about any sentence or interjection or greeting, but indirect quotations as complements are more restricted and depend upon the main verb.</xsl:text>
</p>
              <p>
<xsl:text>Examples of complements of verbs of speaking in </xsl:text>
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
              <example num="xComp.CompSpeech.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/quotationExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/quotationExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/quotationExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/quotationExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompSpeech.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompSpeech.12.1</xsl:text>
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
           </section2>
           
            <xsl:if test="normalize-space(//comp/@compTypeOther)='yes'">
<section2 id="sCompTypeOther">
                <secTitle>Other Restrictions on Complement Clauses</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>Some languages also have verbs which have other restrictions on embedded clauses, such as that the embedded verb must be in the subjunctive mood or in the perfective aspect. </xsl:text>
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
<xsl:text> also has the restriction with some verbs that __</xsl:text>
<xsl:value-of select="//comp/otherRestrictions" />
<xsl:text>.  Examples are shown here:</xsl:text>
</p>
                <example num="xComp.CompTypeOther.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//comp/otherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//comp/otherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//comp/otherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//comp/otherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xComp.CompTypeOther.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xComp.CompTypeOther.8.1</xsl:text>
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
        
        </section2>
</xsl:if>

    </section1>
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
        
    
    
        
        
        
    
    
        
        
        
    
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
      
      
   
   
      
   
   
      
   
</xsl:template>
</xsl:stylesheet>
