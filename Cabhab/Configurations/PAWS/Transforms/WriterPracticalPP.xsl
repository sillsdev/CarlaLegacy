<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="pp">
    <section1 id="sPP">
        <secTitle>
            <xsl:choose>
                <xsl:when test="//pp/@pPos='before'">Prepositional Phrases</xsl:when>
                <xsl:when test="//pp/@pPos='after'">Postpositional Phrases</xsl:when>
                <xsl:when test="//pp/@pPos='both'">Adpositional Phrases</xsl:when>
                <xsl:when test="//pp/@pPos='unknown'">Adpositional Phrases</xsl:when>
            </xsl:choose>
            </secTitle>
       <p contentType="ctComparativeIntro">
<xsl:text>This section covers the internal structure of adpositional phrases, which usually express location, accompaniment, goal, instrument, recipient, or agent for languages which do not have case marking on nouns or nominal phrases.    Languages with case marking normally still have locative and temporal adpositional phrases.</xsl:text>
</p>
       <p contentType="ctComparativeIntro">
<xsl:text>Prepositions come before their complements, while postpositions come afterward.  English has prepositions, as shown in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>for Joe</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>by the river</langData>
<xsl:text>.  The prepositions or postpositions may be independent words, or they may be clitics which attach to the edge of the complement or to its head.</xsl:text>
</p>
       <xsl:if test="normalize-space(//np/@caseN)='no'">
<p contentType="ctPracticalIntro">
<xsl:text>Adpositional phrases may express location and time, as well as the  grammatical relations of accompaniment, goal, instrument, recipient, possessor or agent, since case is not marked on the noun or nominal phrase in </xsl:text>
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
       <xsl:if test="normalize-space(//np/@caseN)='yes'">
<p contentType="ctPracticalIntro">
<xsl:text>Adpositional phrases normally express location or time only, since case is marked on the noun or nominal phrase in </xsl:text>
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
       <p>
<xsl:text>Some example locative </xsl:text>
<xsl:choose>
          <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
          <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
          <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
          <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
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
<xsl:text> are:</xsl:text>
</p>
       <example num="xPP.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/ppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/ppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/ppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/ppExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.14.1</xsl:text>
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
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has </xsl:text>
<xsl:choose>
                <xsl:when test="//pp/@pPos='before'">prepositions only.  </xsl:when>
                <xsl:when test="//pp/@pPos='after'">postpositions only.  </xsl:when>
                <xsl:when test="//pp/@pPos='both'">both prepositions and postpositions.  </xsl:when>
                <xsl:when test="//pp/@pPos='unknown'">_____-positions only.  </xsl:when>
            </xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
                <xsl:when test="//pp/@pType='word'">They are all independent words.</xsl:when>
                <xsl:when test="//pp/@pType='clitic'">They are all clitics written attached to another word. </xsl:when>
                <xsl:when test="//pp/@pType='both'">Some are written as independent words, but some are clitics written attached to another word.  </xsl:when>
            </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pType)!='word'">
                <xsl:text>The clitics attach </xsl:text>
                <xsl:choose>
                    <xsl:when test="//pp/@attaches='edge'">at the edge</xsl:when>
                    <xsl:when test="//pp/@attaches='head'">to the head</xsl:when>
                </xsl:choose>
                <xsl:text> of the complement phrase.  </xsl:text>
            </xsl:if>
<xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//pp/@ppClassifier)='yes' and normalize-space(//pp/@pType)!='clitic'">
<xsl:choose>
              <xsl:when test="//pp/@pPos='before'">Prepositions</xsl:when>
           <xsl:when test="//pp/@pPos='after'">Postpositions</xsl:when>
           <xsl:when test="//pp/@pPos='both'">Prepositions and postpositions</xsl:when>
              <xsl:when test="//pp/@pPos='unknown'">Adpositions</xsl:when>
</xsl:choose>
              <xsl:text> are marked with classifiers in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> as part of the concord agreement system.  Only the roots are shown in the tables here, but the phrases show the full forms marked with classifiers.</xsl:text> </xsl:if>
</p>
       <xsl:if test="normalize-space(//pp/@pPos)='before'">
<p>
<xsl:text>Examples of the </xsl:text>
<xsl:if test="normalize-space(//pp/@bodyPart)='yes'">
<xsl:text>regular </xsl:text>
</xsl:if>
<xsl:text>prepositioins used in locative phrases are:</xsl:text>
</p>
</xsl:if>
        <xsl:if test="normalize-space(//pp/@pPos)='before'">
<example num="xPP.20">
<table border="1">
              <tr>
                 <th>Prepositions</th>
                 <th>Gloss</th>
              </tr>				
              <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/locativePrepExample),'.','')" />
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
       <xsl:if test="normalize-space(//pp/@pPos)='after'">
<p>
<xsl:text>Examples of the </xsl:text>
<xsl:if test="normalize-space(//pp/@bodyPart)='yes'">
<xsl:text>regular </xsl:text>
</xsl:if>
<xsl:text>postpositions used in locative phrases are:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='after'">
<example num="xPP.24">
<table border="1">
             <tr>
                <th>Postpositions</th>
                <th>Gloss</th>
             </tr>				
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/locativePostExample),'.','')" />
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
       <xsl:if test="normalize-space(//pp/@pPos)='both' or normalize-space(//pp/@pPos)='unknown'">
<p>
<xsl:text>Examples of the </xsl:text>
<xsl:if test="normalize-space(//pp/@bodyPart)='yes'">
<xsl:text>regular </xsl:text>
</xsl:if>
<xsl:text>prepositions and postpositions used in locative phrases are:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='both' or normalize-space(//pp/@pPos)='unknown'">
<example num="xPP.28">
<table border="1">
             <tr>
                <th>Type</th>
                <th>Morphemes</th>
                <th>Gloss</th>
             </tr>				
             <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//pp/locativePrepExample),'.','')" />
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
<xsl:text>Prepositions</xsl:text>
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
<xsl:text>Prepositions</xsl:text>
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
<xsl:value-of select="translate(string(//pp/locativePostExample),'.','')" />
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
<xsl:text>Postpositions</xsl:text>
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
<xsl:text>Postpositions</xsl:text>
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
       <xsl:if test="normalize-space(//pp/@pPos)='before' or normalize-space(//pp/@pPos)='both'">
<p>
<xsl:text>Some examples of locative prepositional phrases are:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='before' or normalize-space(//pp/@pPos)='both'">
<example num="xPP.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/locativePrepPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/locativePrepPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/locativePrepPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/locativePrepPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.32.1</xsl:text>
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
       <xsl:if test="normalize-space(//pp/@pPos)='after' or normalize-space(//pp/@pPos)='both'">
<p>
<xsl:text>Some examples of locative postpositional phrases are:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='after' or normalize-space(//pp/@pPos)='both'">
<example num="xPP.36">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/locativePostPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/locativePostPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/locativePostPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/locativePostPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.36.1</xsl:text>
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
       <xsl:if test="normalize-space(//pp/@bodyPart)='yes'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> mainly uses body part words to express the location in locative </xsl:text>
<xsl:choose>
          <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
          <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
          <xsl:when test="//pp/@pPos='both'">prepositional and postpositional</xsl:when>
          <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
</xsl:choose>
<xsl:text> phrases.  Examples of the body part </xsl:text>
<xsl:choose>
             <xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
             <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
             <xsl:when test="//pp/@pPos='both'">prepositions and postpositions</xsl:when>
             <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>
</xsl:choose>
<xsl:text> are:</xsl:text>
</p>
</xsl:if>      
       <xsl:if test="normalize-space(//pp/@pPos)='before' and normalize-space(//pp/@bodyPart)='yes'">
<example num="xPP.40">
<table border="1">
             <tr>
                <th>Body Part</th>
                <th>Gloss as Noun</th>
                <th>Gloss as Preposition</th>
             </tr>				
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/bodyPartPrepExample),'.','')" />
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
       <xsl:if test="normalize-space(//pp/@pPos)='after' and normalize-space(//pp/@bodyPart)='yes'">
<example num="xPP.42">
<table border="1">
             <tr>
                <th>Body Part</th>
                <th>Gloss as Noun</th>
                <th>Gloss as Postposition</th>
             </tr>				
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/bodyPartPostExample),'.','')" />
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
       <xsl:if test="normalize-space(//pp/@pPos)='both' and normalize-space(//pp/@bodyPart)='yes' or normalize-space(//pp/@pPos)='unknown' and normalize-space(//pp/@bodyPart)='yes'">
<example num="xPP.44">
<table border="1">
             <tr>
                <th>Type</th>
                <th>Body Part</th>
                <th>Gloss as Noun</th>
                <th>Gloss as Adposition</th>
             </tr>				
             <xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//pp/bodyPartPrepExample),'.','')" />
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
<xsl:text>Prepositions</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
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
<xsl:text>Prepositions</xsl:text>
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
<xsl:value-of select="translate(string(//pp/bodyPartPostExample),'.','')" />
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
<xsl:text>Postpositions</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
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
<xsl:text>Postpositions</xsl:text>
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
       <xsl:if test="normalize-space(//pp/@pPos)='before' or normalize-space(//pp/@pPos)='both' and normalize-space(//pp/@bodyPart)='yes'">
<p>
<xsl:text>Some examples of locative prepositional phrases using the body part words are:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='before' or normalize-space(//pp/@pPos)='both' and normalize-space(//pp/@bodyPart)='yes'">
<example num="xPP.48">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/bodyPartPrepPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/bodyPartPrepPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/bodyPartPrepPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/bodyPartPrepPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.48</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.48.1</xsl:text>
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
       <xsl:if test="normalize-space(//pp/@pPos)='after' or normalize-space(//pp/@pPos)='both' and normalize-space(//pp/@bodyPart)='yes'">
<p>
<xsl:text>Some examples of locative postpositional phrases using the body part words are:</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//pp/@pPos)='after' or normalize-space(//pp/@pPos)='both' and normalize-space(//pp/@bodyPart)='yes'">
<example num="xPP.52">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/bodyPartPostPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/bodyPartPostPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/bodyPartPostPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/bodyPartPostPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.52</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.52.1</xsl:text>
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
       <xsl:if test="normalize-space(//np/@caseN)='no'">
<p>
<xsl:text>The </xsl:text>
<xsl:choose>
          <xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
          <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
          <xsl:when test="//pp/@pPos='both'">prepositions and postpositions</xsl:when>
          <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>
</xsl:choose>
<xsl:text> that are used as a type of case marker for the minor grammatical relations are shown in </xsl:text>
<exampleRef num="xCaseP" equal="no" letterOnly="no" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
       <xsl:if test="normalize-space(//np/@caseN)='no'">
<example num="xCaseP">
<table border="1">
             <caption>
                <xsl:text>Adpositional Case markers</xsl:text>
             </caption>
             <tr>
                <th>Adpositions</th>
                <th>Case</th>
                <th>Use</th>
             </tr>
             <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/genitiveP),'.','')" />
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
                   <xsl:text>genitive</xsl:text>
                </td>
<td align="left">
                   <xsl:text>possessors</xsl:text>
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
                   <xsl:text>genitive</xsl:text>
                </td>
<td align="left">
                   <xsl:text>possessors</xsl:text>
                </td>
</tr>
</xsl:otherwise>
</xsl:choose>
             <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//pp/dativeP),'.','')" />
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
                   <xsl:text>dative</xsl:text>
                </td>
<td align="left">
                   <xsl:text>indirect objects</xsl:text>
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
                   <xsl:text>dative</xsl:text>
                </td>
<td align="left">
                   <xsl:text>indirect objects</xsl:text>
                </td>
</tr>
</xsl:otherwise>
</xsl:choose>
             <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//pp/ablativeP),'.','')" />
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
                   <xsl:text>ablative</xsl:text>
                </td>
<td align="left">
                   <xsl:text>source or origin</xsl:text>
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
                   <xsl:text>ablative</xsl:text>
                </td>
<td align="left">
                   <xsl:text>source or origin</xsl:text>
                </td>
</tr>
</xsl:otherwise>
</xsl:choose>
             <xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//pp/instrumentalP),'.','')" />
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
                   <xsl:text>instrumental</xsl:text>
                </td>
<td align="left">
                   <xsl:text>instrument, means or agency</xsl:text>
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
                   <xsl:text>instrumental</xsl:text>
                </td>
<td align="left">
                   <xsl:text>instrument, means or agency</xsl:text>
                </td>
</tr>
</xsl:otherwise>
</xsl:choose>
             <xsl:variable name="sExampleValue4.0">
<xsl:value-of select="translate(string(//pp/vocativeP),'.','')" />
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
                   <xsl:text>vocative</xsl:text>
                </td>
<td align="left">
                   <xsl:text>direct address</xsl:text>
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
                   <xsl:text>vocative</xsl:text>
                </td>
<td align="left">
                   <xsl:text>direct address</xsl:text>
                </td>
</tr>
</xsl:otherwise>
</xsl:choose>
             <xsl:variable name="sExampleValue5.0">
<xsl:value-of select="translate(string(//pp/obliqueP),'.','')" />
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
                   <xsl:text>oblique</xsl:text>
                </td>
<td align="left">
                   <xsl:text>general minor grammatical relation</xsl:text>
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
                   <xsl:text>oblique</xsl:text>
                </td>
<td align="left">
                   <xsl:text>general minor grammatical relation</xsl:text>
                </td>
</tr>
</xsl:otherwise>
</xsl:choose>
          </table>
</example>
</xsl:if>	      
       
                <p>
<xsl:text>All of the examples above have a noun, proper name or nominal phrase as their commplement.  Possible modifiers of the whole </xsl:text>
<xsl:choose>
                      <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                      <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                      <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
                      <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
</xsl:choose>
<xsl:text> phrase are considered next, then examples of the other types of complements allowed are given in section </xsl:text>
<sectionRef sec="sPPComps" />
<xsl:text>.</xsl:text>
</p>
        <section2 id="sPPModifiers">
            <secTitle>Modifiers</secTitle>
            <p contentType="ctComparativeIntro">
<xsl:text>There are normally a few degree words that can modify a whole </xsl:text>
<xsl:choose>
                    <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                    <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                    <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
                    <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
                </xsl:choose>
<xsl:text> phrase, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>right</langData>
<xsl:text> in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just around the corner</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>right to the last second</langData>
<xsl:text>. Some languages have a set of locative adverbs meaning </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘right here’</xsl:text>
</gloss>
<xsl:text> and </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘right there’</xsl:text>
</gloss>
<xsl:text> that can modify PPs. Ordinals can also modify </xsl:text>
<xsl:choose>
                    <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                    <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                    <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
                    <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
                </xsl:choose>
<xsl:text> phrases, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>next in line</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>first out the door</langData>
<xsl:text>.  In addition, certain manner adverbs can modify </xsl:text>
<xsl:choose>
                    <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                    <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                    <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
                    <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
                </xsl:choose>
<xsl:text> phrases, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>almost in the hole</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>mostly up the tree</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>squarely on the table</langData>
<xsl:text>, and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nearly upon the enemy</langData>
<xsl:text>.</xsl:text>
</p>
           <p contentType="ctPracticalIntro">
<xsl:text>There are normally a few degree words, ordinals, and manner adverbs that can modify a whole </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
              </xsl:choose>
<xsl:text> phrase.</xsl:text>
</p>
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
<xsl:text></xsl:text>
<xsl:choose>
                    <xsl:when test="//pp/@modifiers='no'"> does not have any modifiers which occur either before or after the whole phrase.</xsl:when>
                   <xsl:when test="//pp/@modifiers='yes'"> allows the following independent word categories to modify whole <xsl:choose>
                      <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                      <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                      <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                      <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
                   </xsl:choose> phrase.</xsl:when>
                </xsl:choose>
<xsl:if test="normalize-space(//pp/@modifiers)='no'">
<xsl:text>  Neither degree words nor ordinals nor adverbials can modify </xsl:text>
                    <xsl:choose>
                        <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                        <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                        <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                        <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
                    </xsl:choose>
                    <xsl:text> phrases as independent words.</xsl:text> </xsl:if>
<xsl:text></xsl:text>
</p>
                
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierDegree/@checked)='yes'">
<p>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">Prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">Postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">Prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">Adpositional</xsl:when>
              </xsl:choose>
<xsl:text> phrases may be modified by degree words which occur </xsl:text>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='yes' and normalize-space(//pp/ppDegreePosAfter/@checked)='no' and normalize-space(//pp/ppDegreePosBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='no' and normalize-space(//pp/ppDegreePosAfter/@checked)='yes' and normalize-space(//pp/ppDegreePosBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='no' and normalize-space(//pp/ppDegreePosAfter/@checked)='no' and normalize-space(//pp/ppDegreePosBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='yes' and normalize-space(//pp/ppDegreePosAfter/@checked)='yes' and normalize-space(//pp/ppDegreePosBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='yes' and normalize-space(//pp/ppDegreePosAfter/@checked)='no' and normalize-space(//pp/ppDegreePosBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='no' and normalize-space(//pp/ppDegreePosAfter/@checked)='yes' and normalize-space(//pp/ppDegreePosBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='yes' and normalize-space(//pp/ppDegreePosAfter/@checked)='yes' and normalize-space(//pp/ppDegreePosBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosOther/@checked)='no'">
<xsl:text> the whole phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='no' and normalize-space(//pp/ppDegreePosAfter/@checked)='no' and normalize-space(//pp/ppDegreePosBoth/@checked)='no' and normalize-space(//pp/ppDegreePosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//pp/ppDegreePosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppDegreePosBefore/@checked)='yes' and normalize-space(//pp/ppDegreePosOther/@checked)='yes' or normalize-space(//pp/ppDegreePosAfter/@checked)='yes' and normalize-space(//pp/ppDegreePosOther/@checked)='yes' or normalize-space(//pp/ppDegreePosBoth/@checked)='yes' and normalize-space(//pp/ppDegreePosOther/@checked)='yes'">
<xsl:text> the whole phrase and may also occur ___</xsl:text>
<xsl:value-of select="//pp/ppDegreePosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>The degree words which can modify the whole </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
              </xsl:choose>
<xsl:text> in </xsl:text>
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierDegree/@checked)='yes'">
<example num="xPP.PPModifiers.12">
<table border="1">
                 <tr>
                    <th>Degree words</th>
                    <th>Gloss</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/degree),'.','')" />
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierDegree/@checked)='yes'">
<p>
<xsl:text>Examples of </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
              </xsl:choose>
<xsl:text> phrases with degree words modifying them are:</xsl:text>
</p>
</xsl:if>          
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierDegree/@checked)='yes'">
<example num="xPP.PPModifiers.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/degreeWithPP" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/degreeWithPP))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/degreeWithPP" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/degreeWithPP))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPModifiers.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPModifiers.16.1</xsl:text>
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
           
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOrdinal/@checked)='yes'">
<p>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">Prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">Postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">Prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">Adpositional</xsl:when>
              </xsl:choose>
<xsl:text> phrases may </xsl:text>
<xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierDegree/@checked)='yes'">
<xsl:text>also </xsl:text>
</xsl:if>
<xsl:text>be modified by ordinal numbers or words which occur </xsl:text>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='yes' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='no' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='no' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='yes' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='no' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='no' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='yes' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='yes' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='yes' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='no' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='no' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='yes' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='yes' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='yes' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosOther/@checked)='no'">
<xsl:text> the whole phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='no' and normalize-space(//pp/ppOrdinalPosAfter/@checked)='no' and normalize-space(//pp/ppOrdinalPosBoth/@checked)='no' and normalize-space(//pp/ppOrdinalPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//pp/ppOrdinalPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppOrdinalPosBefore/@checked)='yes' and normalize-space(//pp/ppOrdinalPosOther/@checked)='yes' or normalize-space(//pp/ppOrdinalPosAfter/@checked)='yes' and normalize-space(//pp/ppOrdinalPosOther/@checked)='yes' or normalize-space(//pp/ppOrdinalPosBoth/@checked)='yes' and normalize-space(//pp/ppOrdinalPosOther/@checked)='yes'">
<xsl:text> the whole phrase and may also occur ___</xsl:text>
<xsl:value-of select="//pp/ppOrdinalPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>The ordinal words which can modify the whole </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
              </xsl:choose>
<xsl:text> in </xsl:text>
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOrdinal/@checked)='yes'">
<example num="xPP.PPModifiers.20">
<table border="1">
                 <tr>
                    <th>Ordinal words</th>
                    <th>Gloss</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/ordinal),'.','')" />
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOrdinal/@checked)='yes'">
<p>
<xsl:text>Examples of </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
              </xsl:choose>
<xsl:text> phrases with ordinal words modifying them are:</xsl:text>
</p>
</xsl:if>          
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOrdinal/@checked)='yes'">
<example num="xPP.PPModifiers.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/ordinalWithPP" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/ordinalWithPP))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/ordinalWithPP" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/ordinalWithPP))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPModifiers.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPModifiers.24.1</xsl:text>
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
           
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierManner/@checked)='yes'">
<p>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">Prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">Postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">Prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">Adpositional</xsl:when>
              </xsl:choose>
<xsl:text> phrases may </xsl:text>
<xsl:if test="normalize-space(//pp/ppModifierDegree/@checked)='yes' or normalize-space(//pp/ppModifierOrdinal/@checked)='yes'">
<xsl:text>also </xsl:text>
</xsl:if>
<xsl:text>be modified by manner adverbs which occur </xsl:text>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='yes' and normalize-space(//pp/ppMannerPosAfter/@checked)='no' and normalize-space(//pp/ppMannerPosBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='no' and normalize-space(//pp/ppMannerPosAfter/@checked)='yes' and normalize-space(//pp/ppMannerPosBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='no' and normalize-space(//pp/ppMannerPosAfter/@checked)='no' and normalize-space(//pp/ppMannerPosBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='yes' and normalize-space(//pp/ppMannerPosAfter/@checked)='yes' and normalize-space(//pp/ppMannerPosBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='yes' and normalize-space(//pp/ppMannerPosAfter/@checked)='no' and normalize-space(//pp/ppMannerPosBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='no' and normalize-space(//pp/ppMannerPosAfter/@checked)='yes' and normalize-space(//pp/ppMannerPosBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='yes' and normalize-space(//pp/ppMannerPosAfter/@checked)='yes' and normalize-space(//pp/ppMannerPosBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosOther/@checked)='no'">
<xsl:text> the whole phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='no' and normalize-space(//pp/ppMannerPosAfter/@checked)='no' and normalize-space(//pp/ppMannerPosBoth/@checked)='no' and normalize-space(//pp/ppMannerPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//pp/ppMannerPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppMannerPosBefore/@checked)='yes' and normalize-space(//pp/ppMannerPosOther/@checked)='yes' or normalize-space(//pp/ppMannerPosAfter/@checked)='yes' and normalize-space(//pp/ppMannerPosOther/@checked)='yes' or normalize-space(//pp/ppMannerPosBoth/@checked)='yes' and normalize-space(//pp/ppMannerPosOther/@checked)='yes'">
<xsl:text> the whole phrase and may also occur ___</xsl:text>
<xsl:value-of select="//pp/ppMannerPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>The manner adverbs which can modify the whole </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
              </xsl:choose>
<xsl:text> in </xsl:text>
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierManner/@checked)='yes'">
<example num="xPP.PPModifiers.28">
<table border="1">
                 <tr>
                    <th>Manner Adverbs</th>
                    <th>Gloss</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/manner),'.','')" />
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierManner/@checked)='yes'">
<p>
<xsl:text>Examples of </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
              </xsl:choose>
<xsl:text> phrases with manner adverbs modifying them are:</xsl:text>
</p>
</xsl:if>          
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierManner/@checked)='yes'">
<example num="xPP.PPModifiers.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/mannerWithPP" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/mannerWithPP))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/mannerWithPP" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/mannerWithPP))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPModifiers.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPModifiers.32.1</xsl:text>
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
           
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierLocative/@checked)='yes'">
<p>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">Prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">Postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">Prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">Adpositional</xsl:when>
              </xsl:choose>
<xsl:text> phrases may </xsl:text>
<xsl:if test="normalize-space(//pp/ppModifierDegree/@checked)='yes' or normalize-space(//pp/ppModifierOrdinal/@checked)='yes' or normalize-space(//pp/ppModifierManner/@checked)='yes'">
<xsl:text>also </xsl:text>
</xsl:if>
<xsl:text>be modified by locative adverbs which occur </xsl:text>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='yes' and normalize-space(//pp/ppLocativePosAfter/@checked)='no' and normalize-space(//pp/ppLocativePosBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='no' and normalize-space(//pp/ppLocativePosAfter/@checked)='yes' and normalize-space(//pp/ppLocativePosBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='no' and normalize-space(//pp/ppLocativePosAfter/@checked)='no' and normalize-space(//pp/ppLocativePosBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='yes' and normalize-space(//pp/ppLocativePosAfter/@checked)='yes' and normalize-space(//pp/ppLocativePosBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='yes' and normalize-space(//pp/ppLocativePosAfter/@checked)='no' and normalize-space(//pp/ppLocativePosBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='no' and normalize-space(//pp/ppLocativePosAfter/@checked)='yes' and normalize-space(//pp/ppLocativePosBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='yes' and normalize-space(//pp/ppLocativePosAfter/@checked)='yes' and normalize-space(//pp/ppLocativePosBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosOther/@checked)='no'">
<xsl:text> the whole phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='no' and normalize-space(//pp/ppLocativePosAfter/@checked)='no' and normalize-space(//pp/ppLocativePosBoth/@checked)='no' and normalize-space(//pp/ppLocativePosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//pp/ppLocativePosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//pp/ppLocativePosBefore/@checked)='yes' and normalize-space(//pp/ppLocativePosOther/@checked)='yes' or normalize-space(//pp/ppLocativePosAfter/@checked)='yes' and normalize-space(//pp/ppLocativePosOther/@checked)='yes' or normalize-space(//pp/ppLocativePosBoth/@checked)='yes' and normalize-space(//pp/ppLocativePosOther/@checked)='yes'">
<xsl:text> the whole phrase and may also occur ___</xsl:text>
<xsl:value-of select="//pp/ppLocativePosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>The locative adverbs which can modify the whole </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
              </xsl:choose>
<xsl:text> in </xsl:text>
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierLocative/@checked)='yes'">
<example num="xPP.PPModifiers.36">
<table border="1">
                 <tr>
                    <th>Locative Adverbs</th>
                    <th>Gloss</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/locative),'.','')" />
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierLocative/@checked)='yes'">
<p>
<xsl:text>Examples of </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
              </xsl:choose>
<xsl:text> phrases with locative adverbs modifying them are:</xsl:text>
</p>
</xsl:if>          
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierLocative/@checked)='yes'">
<example num="xPP.PPModifiers.40">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/locativeWithPP" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/locativeWithPP))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/locativeWithPP" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/locativeWithPP))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPModifiers.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPModifiers.40.1</xsl:text>
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
           
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOther/@checked)='yes'">
<p>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">Prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">Postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">Prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">Adpositional</xsl:when>
              </xsl:choose>
<xsl:text> phrases may </xsl:text>
<xsl:if test="normalize-space(//pp/ppModifierDegree/@checked)='yes' or normalize-space(//pp/ppModifierOrdinal/@checked)='yes' or normalize-space(//pp/ppModifierManner/@checked)='yes' or normalize-space(//pp/ppModifierLocative/@checked)='yes'">
<xsl:text>also </xsl:text>
</xsl:if>
<xsl:text>be modified by ___</xsl:text>
<xsl:value-of select="//pp/ppModifierOther" />
<xsl:text>.  Examples of these other elements which can modify the whole </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
              </xsl:choose>
<xsl:text> in </xsl:text>
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOther/@checked)='yes'">
<example num="xPP.PPModifiers.44">
<table border="1">
                 <tr>
                    <th>Modifiers</th>
                    <th>Gloss</th>
                 </tr>
                 <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//pp/otherMod),'.','')" />
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
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOther/@checked)='yes'">
<p>
<xsl:text>Examples of </xsl:text>
<xsl:choose>
                 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                 <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
              </xsl:choose>
<xsl:text> phrases with these other elements modifying them are:</xsl:text>
</p>
</xsl:if>          
           <xsl:if test="normalize-space(//pp/@modifiers)='yes' and normalize-space(//pp/ppModifierOther/@checked)='yes'">
<example num="xPP.PPModifiers.48">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/otherModWithPP" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/otherModWithPP))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/otherModWithPP" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/otherModWithPP))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPModifiers.48</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPModifiers.48.1</xsl:text>
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
           
        </section2>
         <section2 id="sPPComps">
             <secTitle>Complements other than Nominal Phrases</secTitle>
                <p contentType="ctComparativeIntro">
<xsl:text>Some </xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
                        <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
                    </xsl:choose>
<xsl:text>  can stand alone without a complement due to particle movement, such as in the sentences </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Come [right in]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John turned the light [on/off]</langData>
<xsl:text>.  Also, some languages allow </xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
                        <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
                    </xsl:choose>
<xsl:text> to be stranded when its complement is fronted with questions, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Who(m) did you give the book [to _ ]?</langData>
<xsl:text></xsl:text>
</p>
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
<xsl:text></xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@alone='no'"> does not allow any</xsl:when>
                        <xsl:when test="//pp/@alone='yes'"> allows some</xsl:when>
                    </xsl:choose>
<xsl:text> of its </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
                        <xsl:text>prepositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
                        <xsl:text>postpositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
                        <xsl:text>adpositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
                        <xsl:text>prepositions and postpositions</xsl:text>
                    </xsl:if>
<xsl:text> to stand alone without a complement due to movement.  </xsl:text>
<xsl:if test="normalize-space(//pp/@alone)='yes'">
                        <xsl:text>Some examples within full sentences are:</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
</p>
                <xsl:if test="normalize-space(//pp/@alone)='yes'">
<example num="xPP.PPComps.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/aloneExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/aloneExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/aloneExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/aloneExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.8.1</xsl:text>
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
 
            <p contentType="ctComparativeIntro">
<xsl:text>Most languages allow locative adverbs as complements of </xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
                        <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
                    </xsl:choose>
<xsl:text>, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>over there</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>in here</langData>
<xsl:text>.</xsl:text>
</p>
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
<xsl:text></xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@locative='no'"> does not allow</xsl:when>
                        <xsl:when test="//pp/@locative='yes'"> allows</xsl:when>
                    </xsl:choose>
<xsl:text> locative adverbs as complements of its </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
                        <xsl:text>prepositions.</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
                        <xsl:text>postpositions.</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
                        <xsl:text>adpositions.</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
                        <xsl:text>prepositions and postpositions.</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@locative)='yes'">
                        <xsl:text>  Some examples with locative adverb complements are:</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
</p>
                <xsl:if test="normalize-space(//pp/@locative)='yes'">
<example num="xPP.PPComps.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/locExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/locExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/locExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/locExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.14.1</xsl:text>
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

            <p contentType="ctComparativeIntro">
<xsl:text>Locative </xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
                        <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='both'">prepositions and postpositions</xsl:when>
                        <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
                    </xsl:choose>
<xsl:text> are a special group in that they can take another locative </xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                        <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                        <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                        <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>                  
                    </xsl:choose>
<xsl:text> phrase as their complement.  English examples of this type include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>up [to the top]</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>around [behind the shed]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>over [by the table]</langData>
<xsl:text>.</xsl:text>
</p>
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
<xsl:text></xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@ppComp='no'"> does not have any</xsl:when>
                        <xsl:when test="//pp/@ppComp='yes'"> has</xsl:when>
                    </xsl:choose>
<xsl:text> locative </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
                        <xsl:text>prepositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
                        <xsl:text>postpositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
                        <xsl:text>adpositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
                        <xsl:text>prepositions and postpositions</xsl:text>
                    </xsl:if>
<xsl:text> which take a locative </xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
                        <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
                        <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
                        <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>                  
                    </xsl:choose>
<xsl:text> phrase complement.  </xsl:text>
<xsl:if test="normalize-space(//pp/@ppComp)='yes'">
                        <xsl:text>Some examples are:</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
</p>
                <xsl:if test="normalize-space(//pp/@ppComp)='yes'">
<example num="xPP.PPComps.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/compPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/compPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/compPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/compPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.20.1</xsl:text>
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

            <p contentType="ctComparativeIntro">
<xsl:text>Temporals such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after</langData>
<xsl:text> are </xsl:text>
<xsl:choose>
                      <xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
                      <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                      <xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
                      <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
                   </xsl:choose>
<xsl:text> when they take a nominal phrase complement, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before you</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after that</langData>
<xsl:text>.  They can also have a gerund complement, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before [signing the contract]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after [buying our new house]</langData>
<xsl:text>, since gerunds are a special type of nominal phrase.</xsl:text>
</p>
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
<xsl:text></xsl:text>
<xsl:choose>
                        <xsl:when test="//pp/@tempComp='no'"> does not have any</xsl:when>
                        <xsl:when test="//pp/@tempComp='yes'"> has</xsl:when>
                    </xsl:choose>
<xsl:text> temporal </xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='before'">
                        <xsl:text>prepositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='after'">
                        <xsl:text>postpositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='unknown'">
                        <xsl:text>adpositions</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//pp/@pPos)='both'">
                        <xsl:text>prepositions and postpositions</xsl:text>
                    </xsl:if>
<xsl:text> which take a nominal phrase or a gerund complement.  </xsl:text>
<xsl:if test="normalize-space(//pp/@tempComp)='yes'">
                        <xsl:text>Some examples included in full sentences are:</xsl:text>
                    </xsl:if>
<xsl:text></xsl:text>
</p>
                <xsl:if test="normalize-space(//pp/@tempComp)='yes'">
<example num="xPP.PPComps.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pp/tempExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pp/tempExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pp/tempExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pp/tempExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xPP.PPComps.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xPP.PPComps.26.1</xsl:text>
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
            <xsl:if test="normalize-space(//pp/@tempComp)='yes'">
<p contentType="ctPracticalIntro">
<xsl:text>These same temporal </xsl:text>
<xsl:choose>
                  <xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
                  <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                  <xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
                  <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
               </xsl:choose>
<xsl:text> can also have sentences as their complements.  In this usage, they are temporal adverbs instead, and the whole phrase is an adverbial clause which normally modifies the main sentence.  Such examples will be detailed in section </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
            <xsl:if test="normalize-space(//pp/@tempComp)='yes'">
<p contentType="ctComparativeIntro">
<xsl:text>These same temporal </xsl:text>
<xsl:choose>
                  <xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
                  <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                  <xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
                  <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
               </xsl:choose>
<xsl:text> can also have sentences as their complements, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>before [the rain stops]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after [John came home]</langData>
<xsl:text>.  In this usage, they are temporal adverbs instead of </xsl:text>
<xsl:choose>
                  <xsl:when test="//pp/@pPos='before'">prepositions</xsl:when>
                  <xsl:when test="//pp/@pPos='after'">postpositions</xsl:when>
                  <xsl:when test="//pp/@pPos='both'">prepositions or postpositions</xsl:when>
                  <xsl:when test="//pp/@pPos='unknown'">adpositions</xsl:when>                  
               </xsl:choose>
<xsl:text>, and the whole phrase is an adverbial clause which normally modifies the main sentence.  Such examples will be detailed in section </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
         </section2>
    </section1>
   
      
      
      
      
      
   
   
   
        
    
    
        
    
    
        
    
    
        
    
    
        
    
    
        
    
    
        
    
   
      
      
      
   
   
        
    
    
        
    


   

   
      
   
   
      

   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
      
      
   
   
   
      
   
   
      
   
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   

</xsl:template>
</xsl:stylesheet>
