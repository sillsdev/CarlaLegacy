<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ques">
   <section1 id="sQues">
        <secTitle>Questions</secTitle>
        <p>
<xsl:text>There are two types of questions: those which require a </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Yes</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>No</langData>
<xsl:text> answer and those which are seeking information.  This section considers the main clause and embedded clause varieties of both types.</xsl:text>
</p>
        <section2 id="sQuesYN">
            <secTitle>Yes/No Questions</secTitle>
            <p contentType="ctComparativeIntro">
<xsl:text> In English, main clause Yes/No questions are formed by moving an auxiliary verb in front of the subject.  Other languages use a Yes/No question marker or special complementizer instead of the fronted auxiliary.  This is the case in embedded Yes/No questions in English; no auxiliary fronting is allowed but </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>whether</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>if</langData>
<xsl:text> fills the complementizer position.  Since languages may act differently in main clause and embedded clause Yes/No questions, each will be covered separately.</xsl:text>
</p>
           <p contentType="ctPracticalIntro">
<xsl:text> Main clause and embedded Yes/No questions  may be formed differently with respect to auxiliary movement and question markers or complementizers.</xsl:text>
</p>
           <section3 id="sQuesYNMain">
                <secTitle>Main Clause Yes/No Questions</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>English examples of main clause Yes/No questions, showing the required fronting of an auxiliary, include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Are you going to the store?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Will Sue buy the present for her mother?</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Could the boy have hit the ball?</langData>
<xsl:text></xsl:text>
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
<xsl:text> examples of main clause Yes/No questions include:</xsl:text>
</p>
              <example num="xQues.QuesYN.QuesYNMain.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//q/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//q/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQues.QuesYN.QuesYNMain.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQues.QuesYN.QuesYNMain.8.1</xsl:text>
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
<xsl:text>As the examples show, </xsl:text>
<xsl:choose>
                        <xsl:when test="//q/@mainYN='no'"> there is no marker or word order change, just a difference in intonation or tone or other non-syntactic marking.</xsl:when>
                        <xsl:when test="//q/@mainYN='noAux'">movement of an auxiliary</xsl:when>
                        <xsl:when test="//q/@mainYN='yes'">there are one or more question markers or complementizers</xsl:when>
                    </xsl:choose>
<xsl:if test="normalize-space(//q/@mainYN)='noAux'">
                        <xsl:text> to the </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@mainYNAuxPos='before'">beginning</xsl:when>
                            <xsl:when test="//q/@mainYNAuxPos='after'">end</xsl:when>
                            <xsl:when test="//q/@mainYNAuxPos='unknown'">_______</xsl:when>
                        </xsl:choose>
                        <xsl:text> of the question is required.</xsl:text>
                    </xsl:if>
<xsl:if test="normalize-space(//q/@mainYN)='yes'">
                        <xsl:text> which </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@mainYNWord='yes'">are written as independent words.</xsl:when>
                           <xsl:when test="//q/@mainYNWord='some'">either are written as an independent word or attach </xsl:when>
                           <xsl:when test="//q/@mainYNWord='no'">attach </xsl:when>
                        </xsl:choose>
                        <xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/@mainYN)='yes'">
                           <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>to the beginning of whatever word begins the Yes/No question as phrasal proclitics.  </xsl:text>
</xsl:if>
                           <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>to the end of whatever word ends the Yes/No question as phrasal enclitics.    </xsl:text>
</xsl:if>
                           <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>either to the beginning of whatever word begins the Yes/No question or to the end of whatever word ends the Yes/No question as phrasal clitics.   </xsl:text>
</xsl:if>
                           <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>to the verb in the Yes/No question as a prefix.  </xsl:text>
</xsl:if>
                           <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>to the verb in the Yes/No question as a suffix.   </xsl:text>
</xsl:if>
                           <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>to the verb in the Yes/No question, some as prefixes and some as suffixes.   </xsl:text>
</xsl:if>
                           <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>either to the beginning or end of the Yes/No question as a phrasal clitic, or to the verb in the Yes/No question as an affix.  </xsl:text>
</xsl:if>
                           <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='no' and normalize-space(//q/mainYNEnclitic/@checked)='no' and normalize-space(//q/mainYNPrefix/@checked)='no' and normalize-space(//q/mainYNSuffix/@checked)='no' and normalize-space(//q/mainYNCliticOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/mainYNCliticOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                           <xsl:if test="normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/mainYNCliticOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/mainYNCliticOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/mainYNCliticOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/mainYNCliticOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>  Some also attach ___</xsl:text>
<xsl:value-of select="//q/mainYNCliticOther" />  <xsl:text>.</xsl:text>
</xsl:if>              
                         </xsl:if>  <xsl:text></xsl:text>
                    </xsl:if>
</p>   
              <xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<p>
<xsl:text>The clitics which mark main clause Yes/No questions are:</xsl:text>
</p>
</xsl:if>      
              <xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNProclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNEnclitic/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<example num="xQues.QuesYN.QuesYNMain.14">
<table border="1">
                    <tr>
                       <th>Yes/No clitics</th>
                       <th>Gloss</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/mainYNCliticExample),'.','')" />
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
              <xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<p>
<xsl:text>The affixes which mark main clause Yes/No questions are:</xsl:text>
</p>
</xsl:if>      
              <xsl:if test="normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='no' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNPrefix/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/mainYNSuffix/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<example num="xQues.QuesYN.QuesYNMain.18">
<table border="1">
                    <tr>
                       <th>Yes/No affixes</th>
                       <th>Gloss</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/mainYNAffixExample),'.','')" />
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
                    <xsl:if test="normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/@mainYN)='yes'">
<p>
<xsl:text> The question marker or complementizer words occur </xsl:text>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordBoth/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordOther/@checked)='no' and normalize-space(//q/@mainYN)='yes'">
<xsl:text> the rest of the Yes/No question.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='no' and normalize-space(//q/mainYNWordAfter/@checked)='no' and normalize-space(//q/mainYNWordBoth/@checked)='no' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/mainYNWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/mainYNWordBefore/@checked)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNWordAfter/@checked)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/mainYNWordBoth/@checked)='yes' and normalize-space(//q/mainYNWordOther/@checked)='yes' and normalize-space(//q/@mainYN)='yes'">
<xsl:text> the rest of the Yes/No question and may also occur ___</xsl:text> <xsl:value-of select="//q/mainYNWordOther" /> <xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> These markers are:</xsl:text>
</p>
</xsl:if>
              <xsl:if test="normalize-space(//q/@mainYNWord)='yes' and normalize-space(//q/@mainYN)='yes' or normalize-space(//q/@mainYNWord)='some' and normalize-space(//q/@mainYN)='yes'">
<example num="xQues.QuesYN.QuesYNMain.22">
<table border="1">
                    <tr>
                       <th>Yes/No question marker words</th>
                       <th>Gloss</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/mainYNWordExample),'.','')" />
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
            </section3>
            <section3 id="sQuesYNEmb">
                <secTitle>Embedded Clause Yes/No Questions</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>English examples of Yes/No questions in embedded clauses, showing the presence of the question markers or complementizers, include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I wonder whether she will come</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will know if she goes</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue wonders whether the boy could have hit the ball</langData>
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
<xsl:text> examples of embedded clause Yes/No questions include:</xsl:text>
</p>
               <example num="xQues.QuesYN.QuesYNEmb.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/embYNExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//q/embYNExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/embYNExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//q/embYNExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQues.QuesYN.QuesYNEmb.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQues.QuesYN.QuesYNEmb.8.1</xsl:text>
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
<xsl:text>As the examples show, </xsl:text>
<xsl:choose>
                     <xsl:when test="//q/@embYN='no'"> there is no marker or word order change, just a difference in intonation or tone or other non-syntactic marking.</xsl:when>
                     <xsl:when test="//q/@embYN='noAux'">movement of an auxiliary</xsl:when>
                     <xsl:when test="//q/@embYN='yes'">there are one or more question markers or complementizers</xsl:when>
                  </xsl:choose>
<xsl:if test="normalize-space(//q/@embYN)='noAux'">
                     <xsl:text> to the </xsl:text>
                     <xsl:choose>
                        <xsl:when test="//q/@embYNAuxPos='before'">beginning</xsl:when>
                        <xsl:when test="//q/@embYNAuxPos='after'">end</xsl:when>
                        <xsl:when test="//q/@embYNAuxPos='unknown'">_______</xsl:when>
                     </xsl:choose>
                     <xsl:text> of the question is required.</xsl:text>
                  </xsl:if>
<xsl:if test="normalize-space(//q/@embYN)='yes'">
                     <xsl:text> which </xsl:text>
                     <xsl:choose>
                        <xsl:when test="//q/@embYNWord='yes'">are written as independent words.</xsl:when>
                        <xsl:when test="//q/@embYNWord='some'">either are written as an independent word or attach </xsl:when>
                        <xsl:when test="//q/@embYNWord='no'">attach </xsl:when>
                     </xsl:choose>
                 
                  <xsl:if test="normalize-space(//q/@embYNWord)='no' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/@embYN)='yes'">
                     <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>to the beginning of whatever word begins the Yes/No question as phrasal proclitics.  </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>to the end of whatever word ends the Yes/No question as phrasal enclitics.    </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>either to the beginning of whatever word begins the Yes/No question or to the end of whatever word ends the Yes/No question as phrasal clitics.   </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>to the verb in the Yes/No question as a prefix.  </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>to the verb in the Yes/No question as a suffix.   </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>to the verb in the Yes/No question, some as prefixes and some as suffixes.   </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>either to the beginning or end of the Yes/No question as a phrasal clitic, or to the verb in the Yes/No question as an affix.  </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='no' and normalize-space(//q/embYNEnclitic/@checked)='no' and normalize-space(//q/embYNPrefix/@checked)='no' and normalize-space(//q/embYNSuffix/@checked)='no' and normalize-space(//q/embYNCliticOther/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/embYNCliticOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/embYNCliticOther/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/embYNCliticOther/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/embYNCliticOther/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/embYNCliticOther/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>  Some also attach ___</xsl:text>
<xsl:value-of select="//q/embYNCliticOther" />  <xsl:text>.</xsl:text>
</xsl:if>              
                  </xsl:if>  <xsl:text></xsl:text>
                  </xsl:if>
</p>   
               <xsl:if test="normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<p>
<xsl:text>The clitics which mark embedded clause Yes/No questions are:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNProclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNEnclitic/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<example num="xQues.QuesYN.QuesYNEmb.14">
<table border="1">
                     <tr>
                        <th>Yes/No clitics</th>
                        <th>Gloss</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/embYNCliticExample),'.','')" />
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
               <xsl:if test="normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<p>
<xsl:text>The affixes which mark embedded clause Yes/No questions are:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='no' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNPrefix/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/embYNSuffix/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<example num="xQues.QuesYN.QuesYNEmb.18">
<table border="1">
                     <tr>
                        <th>Yes/No affixes</th>
                        <th>Gloss</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/embYNAffixExample),'.','')" />
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
               <xsl:if test="normalize-space(//q/@embYNWord)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/@embYN)='yes'">
<p>
<xsl:text> The question marker or complementizer words occur </xsl:text>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='yes' and normalize-space(//q/embYNWordAfter/@checked)='no' and normalize-space(//q/embYNWordBoth/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='no' and normalize-space(//q/embYNWordAfter/@checked)='yes' and normalize-space(//q/embYNWordBoth/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='no' and normalize-space(//q/embYNWordAfter/@checked)='no' and normalize-space(//q/embYNWordBoth/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='yes' and normalize-space(//q/embYNWordAfter/@checked)='yes' and normalize-space(//q/embYNWordBoth/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='yes' and normalize-space(//q/embYNWordAfter/@checked)='no' and normalize-space(//q/embYNWordBoth/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='no' and normalize-space(//q/embYNWordAfter/@checked)='yes' and normalize-space(//q/embYNWordBoth/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='yes' and normalize-space(//q/embYNWordAfter/@checked)='yes' and normalize-space(//q/embYNWordBoth/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordOther/@checked)='no' and normalize-space(//q/@embYN)='yes'">
<xsl:text> the rest of the Yes/No question.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='no' and normalize-space(//q/embYNWordAfter/@checked)='no' and normalize-space(//q/embYNWordBoth/@checked)='no' and normalize-space(//q/embYNWordOther/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/embYNWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//q/embYNWordBefore/@checked)='yes' and normalize-space(//q/embYNWordOther/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNWordAfter/@checked)='yes' and normalize-space(//q/embYNWordOther/@checked)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/embYNWordBoth/@checked)='yes' and normalize-space(//q/embYNWordOther/@checked)='yes' and normalize-space(//q/@embYN)='yes'">
<xsl:text> the rest of the Yes/No question and may also occur ___</xsl:text> <xsl:value-of select="//q/embYNWordOther" /> <xsl:text>. </xsl:text>
</xsl:if>
<xsl:text> These markers are:</xsl:text>
</p>
</xsl:if>
               <xsl:if test="normalize-space(//q/@embYNWord)='yes' and normalize-space(//q/@embYN)='yes' or normalize-space(//q/@embYNWord)='some' and normalize-space(//q/@embYN)='yes'">
<example num="xQues.QuesYN.QuesYNEmb.22">
<table border="1">
                     <tr>
                        <th>Yes/No question marker words</th>
                        <th>Gloss</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/embYNWordExample),'.','')" />
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
               
            </section3>
        </section2>
        <section2 id="sQuesContent">
            <secTitle>Content Questions</secTitle>
            <p contentType="ctComparativeIntro">
<xsl:text>Content questions differ from Yes/No questions in that they contain an interrogative word or phrase, known as wh-phrases in English because they almost all begin with </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>wh</langData>
<xsl:text>.  In some languages, some or all of these interrogatives are expressed as affixes.  The corresponding interrogative words or phrases or affixes in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown in </xsl:text>
<exampleRef num="xWh" equal="no" letterOnly="no" />
<xsl:text>.</xsl:text>
</p>
           <p contentType="ctPracticalIntro">
<xsl:text>Content questions differ from Yes/No questions in that they contain an interrogative word or phrase.  The interrogative words or phrases or affixes in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown in </xsl:text>
<exampleRef num="xWh" equal="no" letterOnly="no" />
<xsl:text>.</xsl:text>
</p>
           <example num="xWh">
<table border="1">
                    <caption>
                        <xsl:text>Interrogatives used in content questions</xsl:text>
                    </caption>
                    <tr>
                        <th>Morphemes</th>
                        <th>Gloss</th>
                    </tr>
                    <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/who),'.','')" />
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
                            <xsl:text>who</xsl:text>
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
                            <xsl:text>who</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//q/what),'.','')" />
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
                            <xsl:text>what</xsl:text>
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
                            <xsl:text>what</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//q/why),'.','')" />
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
                            <xsl:text>why</xsl:text>
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
                            <xsl:text>why</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//q/where),'.','')" />
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
                            <xsl:text>where</xsl:text>
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
                            <xsl:text>where</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue4.0">
<xsl:value-of select="translate(string(//q/when),'.','')" />
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
                            <xsl:text>when</xsl:text>
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
                            <xsl:text>when</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue5.0">
<xsl:value-of select="translate(string(//q/how),'.','')" />
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
                            <xsl:text>how</xsl:text>
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
                            <xsl:text>how</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                   <xsl:variable name="sExampleValue6.0">
<xsl:value-of select="translate(string(//q/howMany),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.0" select="string-length(normalize-space($sExampleValue6.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.0 != 0 and $sExampleValue6.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
                         <xsl:text>how many or how much</xsl:text>
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
                         <xsl:text>how many or how much</xsl:text>
                      </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                   <xsl:variable name="sExampleValue7.0">
<xsl:value-of select="translate(string(//q/which),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.0" select="string-length(normalize-space($sExampleValue7.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.0 != 0 and $sExampleValue7.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
                            <xsl:text>which</xsl:text>
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
                            <xsl:text>which</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue8.0">
<xsl:value-of select="translate(string(//q/whose),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.0" select="string-length(normalize-space($sExampleValue8.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.0 != 0 and $sExampleValue8.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
                            <xsl:text>whose</xsl:text>
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
                            <xsl:text>whose</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                    <xsl:variable name="sExampleValue9.0">
<xsl:value-of select="translate(string(//q/other),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.0" select="string-length(normalize-space($sExampleValue9.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.0 != 0 and $sExampleValue9.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
                            <xsl:text>other interrogatives</xsl:text>
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
                            <xsl:text>other interrogatives</xsl:text>
                        </td>
</tr>
</xsl:otherwise>
</xsl:choose>
                </table>
</example>
            <p contentType="ctComparativeIntro">
<xsl:text>Depending on the basic word order of the language, content questions may be formed with or without fronting an interrogative phrase.  Head-final languages (SOV, OVS, and OSV) usually do not have movement of an interrogative phrase in content questions, while head-initial languages (SVO, VOS, and VSO) usually require fronting of an interrogative phrase.</xsl:text>
</p>
           <p contentType="ctComparativeIntro">
<xsl:text>In languages without fronting for interrogatives, the phrase structure of a content question is either the same as a Yes/No question with a question marker or auxiliary in the complementizer position or just the same as a normal sentence.  In either case, the interrogative phrase appears in its normal argument positon.  Many SOV languages optionally allow movement of an interrogative phrase to the position immediately before the verb.
</xsl:text>
</p>
            <p>
<xsl:text>In both main clause and embedded content questions in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, an interrogative phrase </xsl:text>
<xsl:choose>
                    <xsl:when test="//q/@contFront='no'">does not front; it simply remains in place.</xsl:when>
                    <xsl:when test="//q/@contFront='after'">may remain in place or it may move to the position immediately before the verb.</xsl:when>
                    <xsl:when test="//q/@contFront='before'">moves to the beginning of the clause.</xsl:when>
                    <xsl:when test="//q/@contFront='unknown'">_______.</xsl:when>
                </xsl:choose>
</p>
            <section3 id="sQuesContentMain">
                <secTitle>Main Clause Content Questions</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>Main clause content questions in English require an interrogative phrase to be fronted and also have an auxiliary move to the position directly after the fronted interrogrative phrase when something other than the subject is being questioned. 
                      Some examples of English main clause content questions are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Which boy hit the ball?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Who might have hit the ball?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>What did the boy hit?</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>When will she come?</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Where is the leader?</langData>
<xsl:text> </xsl:text>
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
<xsl:text> examples of main clause content questions include:</xsl:text>
</p>
               <example num="xQues.QuesContent.QuesContentMain.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/contentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//q/contentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/contentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//q/contentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQues.QuesContent.QuesContentMain.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQues.QuesContent.QuesContentMain.8.1</xsl:text>
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
<xsl:text>As the examples show, </xsl:text>
<xsl:choose>
                        <xsl:when test="//q/@mainCont='no'">there is no marker or auxiliary fronting,</xsl:when>
                        <xsl:when test="//q/@mainCont='noAux'">movement of an auxiliary</xsl:when>
                        <xsl:when test="//q/@mainCont='yes'">there is at least one question marker or complementizer in main clause content questions. </xsl:when>
                    </xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@mainCont)='no'">
                        <xsl:text> just </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@contFront='no'">a difference in</xsl:when>
                            <xsl:when test="//q/@contFront='after'">optional movement of an interrogative phrase and possibly a difference in</xsl:when>
                            <xsl:when test="//q/@contFront='before'">fronting of an interrogative phrase and possibly a difference in</xsl:when>
                            <xsl:when test="//q/@contFront='unknown'">_______ of an interrogative phrase and possibly a difference in</xsl:when>
                        </xsl:choose>
                        <xsl:text> intonation or tone or other non-syntactic marking.</xsl:text>
                    </xsl:if>
<xsl:if test="normalize-space(//q/@mainCont)='noAux'">
                        <xsl:text> to the </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@mainContAuxPos='before'">beginning</xsl:when>
                            <xsl:when test="//q/@mainContAuxPos='after'">end</xsl:when>
                            <xsl:when test="//q/@mainContAuxPos='unknown'">_______</xsl:when>
                        </xsl:choose>
                        <xsl:text> of the question is </xsl:text>
                        <xsl:choose>
                            <xsl:when test="//q/@mainContAuxRequired='no'">allowed but not required</xsl:when>
                            <xsl:when test="//q/@mainContAuxRequired='yes'">required</xsl:when>
                           <xsl:when test="//q/@mainContAuxRequired='object'">required to be fronted except when the subject is questioned</xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="//q/@contFront='no'">.</xsl:when>
                            <xsl:when test="//q/@contFront='after'">.</xsl:when>
                            <xsl:when test="//q/@contFront='before'"> in addition to the fronting of an interrogative phrase.</xsl:when>
                           <xsl:when test="//q/@contFront='unknown'">.</xsl:when>
                        </xsl:choose>
                  </xsl:if>
<xsl:if test="normalize-space(//q/@mainCont)='yes'">
                    <xsl:if test="normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
<xsl:text> Some of the question markers or complementizers are independent words but some attach </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text> The question markers or complementizers are written as an independent word. </xsl:text>
</xsl:if>
                    <xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text> The question markers or complementizers attach </xsl:text>
</xsl:if>
                      <xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>to the beginning of whatever word begins the question as phrasal proclitics.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>to the beginning of whatever word begins the question or following the fronted interrogative phrase to the beginning of whatever word begins the rest of the question as phrasal proclitics.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>to the beginning of whatever word begins the question as phrasal proclitics or to the end of the last word in the fronted interrogative phrase as phrasal enclitics, before the rest of the question.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>to the beginning of whatever word begins the question or following the fronted interrogative phrase to the beginning of whatever word begins the rest of the question as phrasal proclitics or to the end of the last word in the fronted interrogative phrase as phrasal enclitics, before the rest of the question.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>following the fronted interrogative phrase to the beginning of whatever word begins the rest of the question as phrasal proclitics.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>to the end of whatever word ends the question as phrasal enclitics.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>to the end of whatever word ends the question as phrasal enclitics or following the fronted interrogative phrase to the beginning of whatever word begins the rest of the question as phrasal proclitics.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>to the end of whatever word ends the question or to the end of the last word in the fronted interrogative phrase, before the rest of the question, as phrasal enclitics.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>to the end of whatever word ends the question or to the end of the last word in the fronted interrogative phrase, before the rest of the question, as phrasal enclitics or following the fronted interrogative phrase to the beginning of whatever word begins the rest of the question as phrasal proclitics.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>to the end of the last word in the fronted interrogative phrase as phrasal enclitics, before the rest of the question.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>following the fronted interrogative phrase to the beginning of whatever word begins the rest of the question as phrasal proclitics or to the end of the last word in the fronted interrogative phrase as phrasal enclitics, before the rest of the question.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>either to the beginning of whatever word begins the question or to the end of whatever word ends the question as phrasal clitics.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>either to the beginning of whatever word begins the question or to the end of whatever word ends the question or following the fronted interrogative phrase to the beginning of whatever word begins the rest of the question as phrasal clitics.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>either to the beginning of whatever word begins the question or to the end of whatever word ends the question or to the end of the last word in the fronted interrogative phrase, before the rest of the question, as phrasal clitics.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>either to the beginning of whatever word begins the question or to the end of whatever word ends the question or following the fronted interrogative phrase to the beginning of whatever word begins the rest of the question or to the end of the last word in the fronted interrogative phrase, before the rest of the question, as phrasal clitics.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>to the verb in the question as a prefix.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>to the verb in the question as a suffix.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>to the verb in the question, some as prefixes and some as suffixes.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>either to the beginning or end of the question as a phrasal clitic, or to the verb in the question as an affix.</xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='no' and normalize-space(//q/mainContEnclitic/@checked)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='no' and normalize-space(//q/mainContPrefix/@checked)='no' and normalize-space(//q/mainContSuffix/@checked)='no' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/mainYNCliticOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                         <xsl:if test="normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/mainContCliticOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>  Some also attach ___</xsl:text>
<xsl:value-of select="//q/mainYNCliticOther" />  <xsl:text>.</xsl:text>
</xsl:if>              
                      </xsl:if>
                 </xsl:if>
</p>
               <xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<p>
<xsl:text>The clitics which mark main clause questions are:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContBetweenProclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContBetweenEnclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContProclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContEnclitic/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<example num="xQues.QuesContent.QuesContentMain.14">
<table border="1">
                     <tr>
                        <th>Question marker clitics</th>
                        <th>Gloss</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/mainContCliticExample),'.','')" />
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
               <xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<p>
<xsl:text>The affixes which mark main clause questions are:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='no' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContPrefix/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/mainContSuffix/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<example num="xQues.QuesContent.QuesContentMain.18">
<table border="1">
                     <tr>
                        <th>Question marker affixes</th>
                        <th>Gloss</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/mainContAffixExample),'.','')" />
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
               
                <xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
<p>
<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO'">
                        <xsl:text> The question markers or complementizers </xsl:text>
<xsl:if test="normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>which are independent words </xsl:text>
</xsl:if>
                      <xsl:text>occur </xsl:text>
                   <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='yes' and normalize-space(//q/mainContWordAfter/@checked)='no' and normalize-space(//q/mainContWordBoth/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>before</xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='no' and normalize-space(//q/mainContWordAfter/@checked)='yes' and normalize-space(//q/mainContWordBoth/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>after</xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='no' and normalize-space(//q/mainContWordAfter/@checked)='no' and normalize-space(//q/mainContWordBoth/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='yes' and normalize-space(//q/mainContWordAfter/@checked)='yes' and normalize-space(//q/mainContWordBoth/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='yes' and normalize-space(//q/mainContWordAfter/@checked)='no' and normalize-space(//q/mainContWordBoth/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='no' and normalize-space(//q/mainContWordAfter/@checked)='yes' and normalize-space(//q/mainContWordBoth/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='yes' and normalize-space(//q/mainContWordAfter/@checked)='yes' and normalize-space(//q/mainContWordBoth/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//q/mainContWordOther/@checked)='no' and normalize-space(//q/@mainCont)='yes'">
<xsl:text> the rest of the question.  </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='no' and normalize-space(//q/mainContWordAfter/@checked)='no' and normalize-space(//q/mainContWordBoth/@checked)='no' and normalize-space(//q/mainContWordOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/mainContWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                   <xsl:if test="normalize-space(//q/mainContWordBefore/@checked)='yes' and normalize-space(//q/mainContWordOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContWordAfter/@checked)='yes' and normalize-space(//q/mainContWordOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/mainContWordBoth/@checked)='yes' and normalize-space(//q/mainContWordOther/@checked)='yes' and normalize-space(//q/@mainCont)='yes'">
<xsl:text> the rest of the question and may also occur ___</xsl:text> <xsl:value-of select="//q/mainContWordOther" /> <xsl:text>. </xsl:text>
</xsl:if>
                  </xsl:if>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
                     <xsl:text> The question markers or complementizers </xsl:text>
<xsl:if test="normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
<xsl:text>which are independent words </xsl:text>
</xsl:if>
                        <xsl:text>occur </xsl:text>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='yes' and normalize-space(//q/mainContVSOAfterWh/@checked)='no' and normalize-space(//q/mainContVSOEnd/@checked)='no'">
<xsl:text>before a fronted interrogative phrase.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='no' and normalize-space(//q/mainContVSOAfterWh/@checked)='yes' and normalize-space(//q/mainContVSOEnd/@checked)='no'">
<xsl:text>immediately after a fronted interrogative phrase.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='no' and normalize-space(//q/mainContVSOAfterWh/@checked)='no' and normalize-space(//q/mainContVSOEnd/@checked)='yes'">
<xsl:text>at the end of the question.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='yes' and normalize-space(//q/mainContVSOAfterWh/@checked)='yes' and normalize-space(//q/mainContVSOEnd/@checked)='no'">
<xsl:text>either before a fronted interrogative phrase or immediately after it.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='yes' and normalize-space(//q/mainContVSOAfterWh/@checked)='no' and normalize-space(//q/mainContVSOEnd/@checked)='yes'">
<xsl:text>either before a fronted interrogative phrase or at the end of the question.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='no' and normalize-space(//q/mainContVSOAfterWh/@checked)='yes' and normalize-space(//q/mainContVSOEnd/@checked)='yes'">
<xsl:text>either immediately after a fronted interrogative phrase or at the end of the question.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='yes' and normalize-space(//q/mainContVSOAfterWh/@checked)='yes' and normalize-space(//q/mainContVSOEnd/@checked)='yes'">
<xsl:text>either before a fronted interrogative phrase or immediately after it or at the end of the question.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='no' and normalize-space(//q/mainContVSOAfterWh/@checked)='no' and normalize-space(//q/mainContVSOEnd/@checked)='no' and normalize-space(//q/mainContVSOOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/mainContVSOOther" />
<xsl:text>.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/mainContVSOBeforeWh/@checked)='yes' and normalize-space(//q/mainContVSOOther/@checked)='yes' or normalize-space(//q/mainContVSOAfterWh/@checked)='yes' and normalize-space(//q/mainContVSOOther/@checked)='yes' or normalize-space(//q/mainContVSOEnd/@checked)='yes' and normalize-space(//q/mainContVSOOther/@checked)='yes'">
<xsl:text>  Some may also occur ___</xsl:text>
<xsl:value-of select="//q/mainContVSOOther" />
<xsl:text>.</xsl:text>
</xsl:if>
                  </xsl:if>
<xsl:text> A question marker or complementizer is </xsl:text>
<xsl:choose>
                           <xsl:when test="//q/@mainContRequired='yes'">required in every content question.</xsl:when>
                           <xsl:when test="//q/@mainContRequired='no'">optional in content questions.</xsl:when>
                        </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//q/@mainContRequired)='special'">
<xsl:text>not used when ___</xsl:text>
<xsl:value-of select="//q/mainContSpecialConditions" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:text> These question markers are:</xsl:text>
</p>
</xsl:if>
            
               <xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
<example num="xQues.QuesContent.QuesContentMain.22">
<table border="1">
                     <tr>
                        <th>Question marker words</th>
                        <th>Gloss</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/mainContWordExample),'.','')" />
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
               
               
            </section3>
            <section3 id="sQuesContentEmb">
                <secTitle>Embedded Clause Content Questions</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>In English embedded content questions, an interrogative phrase is required to be fronted to the beginning of the embedded clause. However, in contrast to the main clause content questions, there is no auxiliary fronting. Examples of English embedded content questions include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I know who hit the ball</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I wonder when she will come</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will ask what the boy hit</langData>
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
<xsl:text> examples of embedded clause content questions include:</xsl:text>
</p>
               <example num="xQues.QuesContent.QuesContentEmb.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//q/embContentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//q/embContentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//q/embContentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//q/embContentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQues.QuesContent.QuesContentEmb.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQues.QuesContent.QuesContentEmb.8.1</xsl:text>
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
<xsl:text>As the examples show, </xsl:text>
<xsl:choose>
                     <xsl:when test="//q/@embCont='no'">there is no marker or auxiliary fronting,</xsl:when>
                     <xsl:when test="//q/@embCont='noAux'">movement of an auxiliary</xsl:when>
                     <xsl:when test="//q/@embCont='yes'">there is at least one question marker or complementizer in embedded clause content questions. </xsl:when>
                  </xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//q/@embCont)='no'">
                     <xsl:text> just </xsl:text>
                     <xsl:choose>
                        <xsl:when test="//q/@contFront='no'">a difference in</xsl:when>
                        <xsl:when test="//q/@contFront='after'">optional movement of an interrogative phrase and possibly a difference in</xsl:when>
                        <xsl:when test="//q/@contFront='before'">fronting of an interrogative phrase and possibly a difference in</xsl:when>
                        <xsl:when test="//q/@contFront='unknown'">_______ of an interrogative phrase and possibly a difference in</xsl:when>
                     </xsl:choose>
                     <xsl:text> intonation or tone or other non-syntactic marking.</xsl:text>
                  </xsl:if>
<xsl:if test="normalize-space(//q/@embCont)='noAux'">
                     <xsl:text> to the </xsl:text>
                     <xsl:choose>
                        <xsl:when test="//q/@embContAuxPos='before'">beginning</xsl:when>
                        <xsl:when test="//q/@embContAuxPos='after'">end</xsl:when>
                        <xsl:when test="//q/@embContAuxPos='unknown'">_______</xsl:when>
                     </xsl:choose>
                     <xsl:text> of the embedded question is </xsl:text>
                     <xsl:choose>
                        <xsl:when test="//q/@embContAuxRequired='no'">allowed but not required</xsl:when>
                        <xsl:when test="//q/@embContAuxRequired='yes'">required</xsl:when>
                        <xsl:when test="//q/@embContAuxRequired='object'">required to be fronted except when the subject is questioned</xsl:when>
                     </xsl:choose>
                     <xsl:choose>
                        <xsl:when test="//q/@contFront='no'">.</xsl:when>
                        <xsl:when test="//q/@contFront='after'">.</xsl:when>
                        <xsl:when test="//q/@contFront='before'"> in addition to the fronting of an interrogative phrase.</xsl:when>
                        <xsl:when test="//q/@contFront='unknown'">.</xsl:when>
                     </xsl:choose>
                  </xsl:if>
<xsl:if test="normalize-space(//q/@embCont)='yes'">
                     <xsl:if test="normalize-space(//q/@embContWord)='some' and normalize-space(//q/@embCont)='yes'">
<xsl:text> Some of the question markers or complementizers are independent words but some attach </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text> The question markers or complementizers are written as an independent word. </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text> The question markers or complementizers attach </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/@embCont)='yes'">
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>to the beginning of whatever word begins the embedded question as phrasal proclitics.  </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>to the beginning of whatever word begins the embedded question or following the fronted interrogative phrase to the beginning of whatever word begins the rest of the embedded question as phrasal proclitics.  </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>to the beginning of whatever word begins the embedded question as phrasal proclitics or to the end of the last word in the fronted interrogative phrase as phrasal enclitics, before the rest of the embedded question.    </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>to the beginning of whatever word begins the embedded question or following the fronted interrogative phrase to the beginning of whatever word begins the rest of the embedded question as phrasal proclitics or to the end of the last word in the fronted interrogative phrase as phrasal enclitics, before the rest of the embedded question.    </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>following the fronted interrogative phrase to the beginning of whatever word begins the rest of the embedded question as phrasal proclitics.  </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>to the end of whatever word ends the embedded question as phrasal enclitics.    </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>to the end of whatever word ends the embedded question as phrasal enclitics or following the fronted interrogative phrase to the beginning of whatever word begins the rest of the embedded question as phrasal proclitics.  </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>to the end of whatever word ends the embedded question or to the end of the last word in the fronted interrogative phrase, before the rest of the embedded question, as phrasal enclitics.    </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>to the end of whatever word ends the embedded question or to the end of the last word in the fronted interrogative phrase, before the rest of the embedded question, as phrasal enclitics or following the fronted interrogative phrase to the beginning of whatever word begins the rest of the embedded question as phrasal proclitics.  </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>to the end of the last word in the fronted interrogative phrase as phrasal enclitics, before the rest of the embedded question.    </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>following the fronted interrogative phrase to the beginning of whatever word begins the rest of the embedded question as phrasal proclitics or to the end of the last word in the fronted interrogative phrase as phrasal enclitics, before the rest of the embedded question.    </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>either to the beginning of whatever word begins the embedded question or to the end of whatever word ends the embedded question as phrasal clitics.   </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>either to the beginning of whatever word begins the embedded question or to the end of whatever word ends the embedded question as phrasal clitics or following the fronted interrogative phrase to the beginning of whatever word begins the rest of the embedded question as phrasal proclitics.  </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>either to the beginning of whatever word begins the embedded question or to the end of whatever word ends the embedded question as phrasal clitics or to the end of the last word in the fronted interrogative phrase, before the rest of the embedded question, as phrasal enclitics.    </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>either to the beginning of whatever word begins the embedded question or to the end of whatever word ends the embedded question as phrasal clitics or following the fronted interrogative phrase to the beginning of whatever word begins the rest of the embedded question as phrasal proclitics or to the end of the last word in the fronted interrogative phrase, before the rest of the embedded question, as phrasal enclitics.    </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>to the verb in the embedded question as a prefix.  </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>to the verb in the embedded question as a suffix.   </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>to the verb in the embedded question, some as prefixes and some as suffixes.   </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>either to the beginning or end of the embedded question as a phrasal clitic, or to the verb in the embedded question as an affix.  </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='no' and normalize-space(//q/embContEnclitic/@checked)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='no' and normalize-space(//q/embContPrefix/@checked)='no' and normalize-space(//q/embContSuffix/@checked)='no' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/embYNCliticOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                        <xsl:if test="normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/embContCliticOther/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>  Some also attach ___</xsl:text>
<xsl:value-of select="//q/embYNCliticOther" />  <xsl:text>.</xsl:text>
</xsl:if>              
                     </xsl:if>
                  </xsl:if>
</p>
               <xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<p>
<xsl:text>The clitics which mark embedded clause questions are:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContBetweenProclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContBetweenEnclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContProclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContEnclitic/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<example num="xQues.QuesContent.QuesContentEmb.14">
<table border="1">
                     <tr>
                        <th>Question marker clitics</th>
                        <th>Gloss</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/embContCliticExample),'.','')" />
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
               <xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<p>
<xsl:text>The affixes which mark embedded clause questions are:</xsl:text>
</p>
</xsl:if>      
               <xsl:if test="normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='no' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContPrefix/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/embContSuffix/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<example num="xQues.QuesContent.QuesContentEmb.18">
<table border="1">
                     <tr>
                        <th>Question marker affixes</th>
                        <th>Gloss</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/embContAffixExample),'.','')" />
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
               
               <xsl:if test="normalize-space(//q/@embContWord)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/@embContWord)='some' and normalize-space(//q/@embCont)='yes'">
<p>
<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO'">
                     <xsl:text> The question markers or complementizers </xsl:text>
<xsl:if test="normalize-space(//q/@embContWord)='some' and normalize-space(//q/@embCont)='yes'">
<xsl:text>which are independent words </xsl:text>
</xsl:if>
                     <xsl:text>occur </xsl:text>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='yes' and normalize-space(//q/embContWordAfter/@checked)='no' and normalize-space(//q/embContWordBoth/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>before</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='no' and normalize-space(//q/embContWordAfter/@checked)='yes' and normalize-space(//q/embContWordBoth/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>after</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='no' and normalize-space(//q/embContWordAfter/@checked)='no' and normalize-space(//q/embContWordBoth/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='yes' and normalize-space(//q/embContWordAfter/@checked)='yes' and normalize-space(//q/embContWordBoth/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='yes' and normalize-space(//q/embContWordAfter/@checked)='no' and normalize-space(//q/embContWordBoth/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='no' and normalize-space(//q/embContWordAfter/@checked)='yes' and normalize-space(//q/embContWordBoth/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='yes' and normalize-space(//q/embContWordAfter/@checked)='yes' and normalize-space(//q/embContWordBoth/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordOther/@checked)='no' and normalize-space(//q/@embCont)='yes'">
<xsl:text> the rest of the embedded question.  </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='no' and normalize-space(//q/embContWordAfter/@checked)='no' and normalize-space(//q/embContWordBoth/@checked)='no' and normalize-space(//q/embContWordOther/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/embContWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContWordBefore/@checked)='yes' and normalize-space(//q/embContWordOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContWordAfter/@checked)='yes' and normalize-space(//q/embContWordOther/@checked)='yes' and normalize-space(//q/@embCont)='yes' or normalize-space(//q/embContWordBoth/@checked)='yes' and normalize-space(//q/embContWordOther/@checked)='yes' and normalize-space(//q/@embCont)='yes'">
<xsl:text> the rest of the embedded question and may also occur ___</xsl:text> <xsl:value-of select="//q/embContWordOther" /> <xsl:text>. </xsl:text>
</xsl:if>
                  </xsl:if>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
                     <xsl:text> The question markers or complementizers </xsl:text>
<xsl:if test="normalize-space(//q/@embContWord)='some' and normalize-space(//q/@embCont)='yes'">
<xsl:text>which are independent words </xsl:text>
</xsl:if>
                     <xsl:text>occur </xsl:text>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='yes' and normalize-space(//q/embContVSOAfterWh/@checked)='no' and normalize-space(//q/embContVSOEnd/@checked)='no'">
<xsl:text>before a fronted interrogative phrase.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='no' and normalize-space(//q/embContVSOAfterWh/@checked)='yes' and normalize-space(//q/embContVSOEnd/@checked)='no'">
<xsl:text>immediately after a fronted interrogative phrase.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='no' and normalize-space(//q/embContVSOAfterWh/@checked)='no' and normalize-space(//q/embContVSOEnd/@checked)='yes'">
<xsl:text>at the end of the embedded question.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='yes' and normalize-space(//q/embContVSOAfterWh/@checked)='yes' and normalize-space(//q/embContVSOEnd/@checked)='no'">
<xsl:text>either before a fronted interrogative phrase or immediately after it.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='yes' and normalize-space(//q/embContVSOAfterWh/@checked)='no' and normalize-space(//q/embContVSOEnd/@checked)='yes'">
<xsl:text>either before a fronted interrogative phrase or at the end of the embedded question.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='no' and normalize-space(//q/embContVSOAfterWh/@checked)='yes' and normalize-space(//q/embContVSOEnd/@checked)='yes'">
<xsl:text>either immediately after a fronted interrogative phrase or at the end of the embedded question.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='yes' and normalize-space(//q/embContVSOAfterWh/@checked)='yes' and normalize-space(//q/embContVSOEnd/@checked)='yes'">
<xsl:text>either before a fronted interrogative phrase or immediately after it or at the end of the embedded question.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='no' and normalize-space(//q/embContVSOAfterWh/@checked)='no' and normalize-space(//q/embContVSOEnd/@checked)='no' and normalize-space(//q/embContVSOOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//q/embContVSOOther" />
<xsl:text>.</xsl:text>
</xsl:if>
                     <xsl:if test="normalize-space(//q/embContVSOBeforeWh/@checked)='yes' and normalize-space(//q/embContVSOOther/@checked)='yes' or normalize-space(//q/embContVSOAfterWh/@checked)='yes' and normalize-space(//q/embContVSOOther/@checked)='yes' or normalize-space(//q/embContVSOEnd/@checked)='yes' and normalize-space(//q/embContVSOOther/@checked)='yes'">
<xsl:text>  Some may also occur ___</xsl:text>
<xsl:value-of select="//q/embContVSOOther" />
<xsl:text>.</xsl:text>
</xsl:if>
                  </xsl:if>
<xsl:text> A question marker or complementizer is </xsl:text>
<xsl:choose>
                     <xsl:when test="//q/@embContRequired='yes'">required in every embedded content question.</xsl:when>
                     <xsl:when test="//q/@embContRequired='no'">optional in embedded content questions.</xsl:when>
                  </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//q/@embContRequired)='special'">
<xsl:text>not used when ___</xsl:text>
<xsl:value-of select="//q/embContSpecialConditions" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:text> These question markers are:</xsl:text>
</p>
</xsl:if>
               
               <xsl:if test="normalize-space(//q/@mainContWord)='yes' and normalize-space(//q/@mainCont)='yes' or normalize-space(//q/@mainContWord)='some' and normalize-space(//q/@mainCont)='yes'">
<example num="xQues.QuesContent.QuesContentEmb.22">
<table border="1">
                     <tr>
                        <th>Question marker words</th>
                        <th>Gloss</th>
                     </tr>
                     <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//q/embContWordExample),'.','')" />
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
            </section3>
        </section2>
    </section1>
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
   
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
   
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
  
   
      
      
      
      
      
   
      
         
         
         
         
         
      
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
   
   
      
   
   
      
   

   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
  
   
      
      
      
      
      
   
      
         
         
         
         
         
      
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
   

</xsl:template>
</xsl:stylesheet>
