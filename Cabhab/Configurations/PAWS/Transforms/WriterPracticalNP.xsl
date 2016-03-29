<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="np">
	<section1 id="sNP">
		<secTitle>Nominal Phrases</secTitle>
		<p>
<xsl:text>Nominal phrases can be very complex.  This section concentrates on the ordering of the modifiers which are written as independent words allowed in nominal phrases with common nouns as the lexical head.  Modification by articles, demonstratives, possessors, quantifiers and degree words, adjective phrases, and </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
				<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
				<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
			</xsl:choose>
<xsl:text> phrases is considered.  Participles and gerunds are covered at the end of this section, but see section </xsl:text>
<sectionRef sec="sNPCompounds" />
<xsl:text> for noun compounds whether or not they are written as a single word.  Nominal phrases headed by proper names are discussed in section </xsl:text>
<sectionRef sec="sProp" />
<xsl:text> and those headed by pronouns of all types and quantifiers are handled in sections </xsl:text>
<sectionRef sec="sPronNP" />
<xsl:text> and </xsl:text>
<sectionRef sec="sQPPartitive" />
<xsl:text>.  Relative clauses, which normally come at the end of a nominal phrase, are covered in section </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
	   <p>
<xsl:text>We begin with the modifiers which have the widest scope and then work in toward the noun.</xsl:text>
</p>
		<section2 id="sNPDegree">
			<secTitle>Wide Scope Quantifiers and  Degree Words </secTitle>
			<p contentType="ctPracticalIntro">
<xsl:text>The wide scope quantifiers and degree words that modify the whole nominal phrase were discussed in section </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text>. </xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>The wide scope quantifiers and degree words that modify the whole nominal phrase, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>almost</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just</langData>
<xsl:text>, and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only</langData>
<xsl:text>, were discussed in section </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text>. </xsl:text>
</p>
		   
		   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@npDegreeClassifier)='yes'">
<p>
<xsl:text>The following table reviews how the wide scope quantifiers and degree elements which modify the whole nominal phrase are expressed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  The forms shown in the table are the roots; each one may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//qp/@npDegreeClassifier)!='yes'">
<p>
<xsl:text>The following table reviews how the wide scope quantifiers and degree elements which modify the whole nominal phrase are expressed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
</xsl:if>
		   <example num="xNP.NPDegree.12">
<table border="1">
		         <tr>
		            <th>Morphemes</th>
		            <th>Gloss</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//qp/all),'.','')" />
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
<xsl:text>all</xsl:text>
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
<xsl:text>all</xsl:text>
</gloss>
		            </td>
</tr>
</xsl:otherwise>
</xsl:choose>
		         <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//qp/almost),'.','')" />
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
		               <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>almost or nearly</xsl:text>
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
<xsl:text>almost or nearly</xsl:text>
</gloss>
		            </td>
</tr>
</xsl:otherwise>
</xsl:choose>
		         <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//qp/only),'.','')" />
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
		               <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>only or just</xsl:text>
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
<xsl:text>only or just</xsl:text>
</gloss>
		            </td>
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
			<xsl:if test="normalize-space(//qp/@npDegree)='no'">
<p>
<xsl:text>These elements are not expressed as independent words which modify the whole nominal phrase.  Instead, they all attach to another word in the nominal phrase.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>Some of these elements are not expressed as independent words which modify the whole nominal phrase.  Instead, they attach to another word in the nominal phrase.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes'">
<p>
<xsl:text>Examples of the clitic forms included in full nominal phrases are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeProclitic/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeEnclitic/@checked)='yes'">
<example num="xNP.NPDegree.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/npDegreeCliticExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/npDegreeCliticExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/npDegreeCliticExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/npDegreeCliticExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.20.1</xsl:text>
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
			<xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes'">
<p>
<xsl:text>Examples of the affix forms included in full nominal phrases are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypePrefix/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeSuffix/@checked)='yes'">
<example num="xNP.NPDegree.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/npDegreeAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/npDegreeAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/npDegreeAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/npDegreeAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.24.1</xsl:text>
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
			<xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes'">
<p>
<xsl:text>Examples of the forms which attach as allowed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> included in full nominal phrases are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='no' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/npDegreeTypeOther/@checked)='yes'">
<example num="xNP.NPDegree.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/npDegreeOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/npDegreeOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/npDegreeOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/npDegreeOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.28.1</xsl:text>
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
			
		   <xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>The wide scope quantifiers and degree elements which are independent words occur </xsl:text>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosAfter/@checked)='no' and normalize-space(//qp/npDegreePosBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='no' and normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='no' and normalize-space(//qp/npDegreePosAfter/@checked)='no' and normalize-space(//qp/npDegreePosBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosAfter/@checked)='no' and normalize-space(//qp/npDegreePosBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='no' and normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosOther/@checked)='no'">
<xsl:text> the rest of the nominal phrase.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='no' and normalize-space(//qp/npDegreePosAfter/@checked)='no' and normalize-space(//qp/npDegreePosBoth/@checked)='no' and normalize-space(//qp/NPDegreePosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//qp/npDegreePosOther" />
<xsl:text>.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//qp/npDegreePosBefore/@checked)='yes' and normalize-space(//qp/npDegreePosOther/@checked)='yes' or normalize-space(//qp/npDegreePosAfter/@checked)='yes' and normalize-space(//qp/npDegreePosOther/@checked)='yes' or normalize-space(//qp/npDegreePosBoth/@checked)='yes' and normalize-space(//qp/npDegreePosOther/@checked)='yes'">
<xsl:text> the rest of the nominal phrase and may also occur  ___</xsl:text>
<xsl:value-of select="//qp/npDegreePosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
</p>
</xsl:if>
		   
		   <xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>Examples of the independent word forms included in full nominal phrases are:</xsl:text>
</p>
</xsl:if>                        
		   <example num="xNP.NPDegree.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.34.1</xsl:text>
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
			
			<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//qp/@npDegree)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>In these nominal phrases with the words meaning ‘all’, ‘almost’, ‘only’ or ‘just’, </xsl:text>
<xsl:choose>
<xsl:when test="//np/@classifierPresent='yes'"> a classifier is required.</xsl:when>
					<xsl:when test="//np/@classifierPresent='some'"> a classifier is present in some nominal phrases of this type, but is not required in all of them.</xsl:when>
					<xsl:when test="//np/@classifierPresent='no'"> a classifier is never used.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//qp/@npDegree)='yes' and normalize-space(//np/@classifierPresent)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//qp/@npDegree)='some' and normalize-space(//np/@classifierPresent)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//qp/@npDegree)='yes' and normalize-space(//np/@classifierPresent)='some' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//qp/@npDegree)='some' and normalize-space(//np/@classifierPresent)='some'">
<xsl:text> The classifier </xsl:text>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosOther/@checked)='no'">
<xsl:text>occurs before both the wide scope quantifier or degree word and the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>may occur before both the wide scope quantifier or degree word and the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes'">
<xsl:text> It also occurs after both the noun and the wide scope quantifier or degree word.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosOther/@checked)='no'">
<xsl:text>occurs after both the noun and the wide scope quantifier or degree word.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>may occur after both the noun and the wide scope quantifier or degree word.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes'">
<xsl:text> It also occurs after the wide scope quantifier or degree word but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosOther/@checked)='no'">
<xsl:text>occurs after the wide scope quantifier or degree word but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>may occur after the wide scope quantifier or degree word but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes'">
<xsl:text> It also occurs after the noun but before the wide scope quantifier or degree word.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosOther/@checked)='no'">
<xsl:text>occurs after the noun but before the wide scope quantifier or degree word.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>may occur after the noun but before the wide scope quantifier or degree word.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes'">
<xsl:text> It may also attach as a prefix on the wide scope quantifier or degree word.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosOther/@checked)='no'">
<xsl:text>attaches as a prefix on the wide scope quantifier or degree word.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>may attach as a prefix on the wide scope quantifier or degree word.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes'">
<xsl:text> It may also attach as a suffix on the wide scope quantifier or degree word.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='no'">
<xsl:text>attaches as a suffix on the wide scope quantifier or degree word.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>may attach as a suffix on the wide scope quantifier or degree word.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='yes' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text> It may also occur ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificPosOther/@checked)='yes'">
<xsl:text>occurs ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>	
				</xsl:if>
</p>
</xsl:if>
			
			
		   <p>
<xsl:text>Negation of a nominal phrase also occurs in this wide scope position.  See section </xsl:text>
<sectionRef sec="sNegNominal" />
<xsl:text> for examples.</xsl:text>
</p>
		   
		</section2>
		<section2 id="sNPArtDem">
			<secTitle>
<xsl:choose>
			   <xsl:when test="//np/@artAndDem='no'">Articles and Demonstratives</xsl:when>
			   <xsl:when test="//np/@artAndDem='article'">Articles</xsl:when>
			   <xsl:when test="//np/@artAndDem='demonstrative'">Demonstratives</xsl:when>
			   <xsl:when test="//np/@artAndDem='both'">Articles and Demonstratives</xsl:when>
			</xsl:choose>
</secTitle>
			<xsl:if test="normalize-space(//np/@artAndDem)='both'">
<p contentType="ctComparativeIntro">
<xsl:text>In English, articles and demonstratives do not co-occur in the same nominal phrase, but they both occur before the noun.  Some languages allow both to co-occur in the same phrase, and they may occur in different positions with respect to the noun.  Therefore, they need distinct syntactic categories.</xsl:text>
</p>
</xsl:if>
			<p>
<xsl:text>As seen in section </xsl:text>
<sectionRef sec="sAdjArtDem" />
<xsl:text>, </xsl:text>
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
					<xsl:when test="//np/@artAndDem='no'"> does not have either articles or demonstratives that are realized as independent words.</xsl:when>
					<xsl:when test="//np/@artAndDem='article'"> has only articles that are realized as independent words, no demonstratives.</xsl:when>
					<xsl:when test="//np/@artAndDem='demonstrative'"> has only demonstratives that are realized as independent words, no articles.</xsl:when>
					<xsl:when test="//np/@artAndDem='both'"> has both articles and demonstratives that are realized as independent words.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
					<xsl:text> The </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artAndDem='article'">articles</xsl:when>
						<xsl:when test="//np/@artAndDem='demonstrative'">demonstratives</xsl:when>
						<xsl:when test="//np/@artAndDem='both'">articles and demonstratives</xsl:when>
					</xsl:choose>
					<xsl:text> are </xsl:text>
					<xsl:if test="normalize-space(//np/@artAndDem)!='no' and normalize-space(//np/@artCase)='no'">
						<xsl:text>not </xsl:text>
					</xsl:if>
					<xsl:text>marked for case.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//np/@artAndDem)='article'">
<p>
<xsl:text>The article occurs </xsl:text>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyAfter/@checked)='no' and normalize-space(//np/artOnlyBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='no' and normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='no' and normalize-space(//np/artOnlyAfter/@checked)='no' and normalize-space(//np/artOnlyBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyAfter/@checked)='no' and normalize-space(//np/artOnlyBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='no' and normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/artOnlyOther/@checked)='no'">
<xsl:text> the noun.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='no' and normalize-space(//np/artOnlyAfter/@checked)='no' and normalize-space(//np/artOnlyBoth/@checked)='no' and normalize-space(//np/artOnlyOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/artOnlyOther" />
<xsl:text>.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/artOnlyBefore/@checked)='yes' and normalize-space(//np/artOnlyOther/@checked)='yes' or normalize-space(//np/artOnlyAfter/@checked)='yes' and normalize-space(//np/artOnlyOther/@checked)='yes' or normalize-space(//np/artOnlyBoth/@checked)='yes' and normalize-space(//np/artOnlyOther/@checked)='yes'">
<xsl:text> the noun and may also occur ___</xsl:text>
<xsl:value-of select="//np/artOnlyOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@artPl)='yes'">
<xsl:text> The presence of an article is </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artRequired='no'">always optional.</xsl:when>
						<xsl:when test="//np/@artRequired='mass'">optional with plural or mass nouns, but is required with singular nouns.</xsl:when>
						<xsl:when test="//np/@artRequired='yes'">always required.</xsl:when>
					</xsl:choose>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='no' or normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@artPl)='no'">
<xsl:text>  The presence of an article is </xsl:text>
				<xsl:choose>
					<xsl:when test="//np/@artRequired='no'">always optional.</xsl:when>
					<xsl:when test="//np/@artRequired='yes'">always required.</xsl:when>
				</xsl:choose>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative'">
<p>
<xsl:text>The demonstrative occurs </xsl:text>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyAfter/@checked)='no' and normalize-space(//np/demOnlyBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='no' and normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='no' and normalize-space(//np/demOnlyAfter/@checked)='no' and normalize-space(//np/demOnlyBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyAfter/@checked)='no' and normalize-space(//np/demOnlyBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='no' and normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOnlyOther/@checked)='no'">
<xsl:text> the noun.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='no' and normalize-space(//np/demOnlyAfter/@checked)='no' and normalize-space(//np/demOnlyBoth/@checked)='no' and normalize-space(//np/demOnlyOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/demOnlyOther" />
<xsl:text>r.  </xsl:text>
			   </xsl:if>
<xsl:if test="normalize-space(//np/demOnlyBefore/@checked)='yes' and normalize-space(//np/demOnlyOther/@checked)='yes' or normalize-space(//np/demOnlyAfter/@checked)='yes' and normalize-space(//np/demOnlyOther/@checked)='yes' or normalize-space(//np/demOnlyBoth/@checked)='yes' and normalize-space(//np/demOnlyOther/@checked)='yes'">
<xsl:text> the noun and may also occur ___</xsl:text>
<xsl:value-of select="//np/demOnlyOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@demPl)='yes'">
<xsl:text>  The presence of a demonstrative is </xsl:text>
				<xsl:choose>
					<xsl:when test="//np/@demRequired='no'">always optional.</xsl:when>
					<xsl:when test="//np/@demRequired='mass'">optional with plural or mass nouns, but is required with singular nouns.</xsl:when>
					<xsl:when test="//np/@demRequired='yes'">always required.</xsl:when>
				</xsl:choose>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='no' or normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@demPl)='no'">
<xsl:text> The presence of a demonstrative is </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artRequired='no'">always optional.</xsl:when>
						<xsl:when test="//np/@artRequired='yes'">always required.</xsl:when>
					</xsl:choose>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no'">
<p>
<xsl:text>The articles and demonstratives both appear in the same position, so they do not co-occur in the same nominal phrase.  Articles or demonstratives appear </xsl:text>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosAfter/@checked)='no' and normalize-space(//np/demOrArtPosBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='no' and normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='no' and normalize-space(//np/demOrArtPosAfter/@checked)='no' and normalize-space(//np/demOrArtPosBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosAfter/@checked)='no' and normalize-space(//np/demOrArtPosBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='no' and normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosOther/@checked)='no'">
<xsl:text> the noun.  </xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='no' and normalize-space(//np/demOrArtPosAfter/@checked)='no' and normalize-space(//np/demOrArtPosBoth/@checked)='no' and normalize-space(//np/demOrArtPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/demOrArtPosOther" />
<xsl:text>.  </xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/demOrArtPosBefore/@checked)='yes' and normalize-space(//np/demOrArtPosOther/@checked)='yes' or normalize-space(//np/demOrArtPosAfter/@checked)='yes' and normalize-space(//np/demOrArtPosOther/@checked)='yes' or normalize-space(//np/demOrArtPosBoth/@checked)='yes' and normalize-space(//np/demOrArtPosOther/@checked)='yes'">
<xsl:text> the noun and may also occur ___</xsl:text>
<xsl:value-of select="//np/demOrArtPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@artPl)='yes' or normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@demPl)='yes'">
<xsl:text>  The presence of an article or demonstrative is </xsl:text>
				<xsl:choose>
					<xsl:when test="//np/@demOrArtRequired='no'">always optional.</xsl:when>
					<xsl:when test="//np/@demOrArtRequired='mass'">optional with plural or mass nouns, but is required with singular nouns.</xsl:when>
					<xsl:when test="//np/@demOrArtRequired='yes'">always required.</xsl:when>
				</xsl:choose>
</xsl:if>
<xsl:if test="normalize-space(//np/@agreeNumber)='no' or normalize-space(//np/@agreeNumber)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@demPl)='no'">
<xsl:text>  The presence of an article or demonstrative is </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demOrArtRequired='no'">always optional.</xsl:when>
						<xsl:when test="//np/@demOrArtRequired='yes'">always required.</xsl:when>
					</xsl:choose>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>The articles and demonstratives do not appear in the same position with respect to the noun, </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artBothCooccur='different'">but both may not </xsl:when>
					<xsl:when test="//np/@artBothCooccur='yes'">and both may </xsl:when>
				</xsl:choose>
<xsl:text>co-occur in the same nominal phrase.  </xsl:text>
</p>
</xsl:if>
		   
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>  The article occurs </xsl:text>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtAfter/@checked)='no' and normalize-space(//np/demAndArtArtBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='no' and normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='no' and normalize-space(//np/demAndArtArtAfter/@checked)='no' and normalize-space(//np/demAndArtArtBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtAfter/@checked)='no' and normalize-space(//np/demAndArtArtBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='no' and normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtOther/@checked)='no'">
<xsl:text> the noun.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='no' and normalize-space(//np/demAndArtArtAfter/@checked)='no' and normalize-space(//np/demAndArtArtBoth/@checked)='no' and normalize-space(//np/demAndArtArtOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/demAndArtArtOther" />
<xsl:text>.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/demAndArtArtBefore/@checked)='yes' and normalize-space(//np/demAndArtArtOther/@checked)='yes' or normalize-space(//np/demAndArtArtAfter/@checked)='yes' and normalize-space(//np/demAndArtArtOther/@checked)='yes' or normalize-space(//np/demAndArtArtBoth/@checked)='yes' and normalize-space(//np/demAndArtArtOther/@checked)='yes'">
<xsl:text> the noun and may also occur ___</xsl:text>
<xsl:value-of select="//np/demAndArtArtOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  The presence of an article is </xsl:text>
<xsl:choose>
		      <xsl:when test="//np/@demAndArtArtRequired='no'">always optional.</xsl:when>
		      <xsl:when test="//np/@demAndArtArtRequired='mass'">optional with plural or mass nouns, but is required with singular nouns.</xsl:when>
		      <xsl:when test="//np/@demAndArtArtRequired='yes'">always required.</xsl:when>
		   </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>The demonstrative occurs </xsl:text>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemAfter/@checked)='no' and normalize-space(//np/demAndArtDemBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='no' and normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='no' and normalize-space(//np/demAndArtDemAfter/@checked)='no' and normalize-space(//np/demAndArtDemBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemAfter/@checked)='no' and normalize-space(//np/demAndArtDemBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='no' and normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemOther/@checked)='no'">
<xsl:text> the noun.  </xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='no' and normalize-space(//np/demAndArtDemAfter/@checked)='no' and normalize-space(//np/demAndArtDemBoth/@checked)='no' and normalize-space(//np/demAndArtDemOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/demAndArtDemOther" />
<xsl:text>.  </xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/demAndArtDemBefore/@checked)='yes' and normalize-space(//np/demAndArtDemOther/@checked)='yes' or normalize-space(//np/demAndArtDemAfter/@checked)='yes' and normalize-space(//np/demAndArtDemOther/@checked)='yes' or normalize-space(//np/demAndArtDemBoth/@checked)='yes' and normalize-space(//np/demAndArtDemOther/@checked)='yes'">
<xsl:text> the noun and may also occur ___</xsl:text>
<xsl:value-of select="//np/demAndArtDemOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  The presence of a demonstrative is </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtDemRequired='no'">always optional.</xsl:when>
					<xsl:when test="//np/@demAndArtDemRequired='mass'">optional with plural or mass nouns, but is required with singular nouns.</xsl:when>
					<xsl:when test="//np/@demAndArtDemRequired='yes'">always required.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
		   
		
			<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<p>
<xsl:text>Examples of nominal phrases including </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artAndDem='article'">articles</xsl:when>
					<xsl:when test="//np/@artAndDem='demonstrative'">demonstratives</xsl:when>
					<xsl:when test="//np/@artAndDem='both'">articles and/or demonstratives</xsl:when>
				</xsl:choose>
<xsl:text> as allowed in </xsl:text>
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
			<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<example num="xNP.NPArtDem.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPArtDem.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPArtDem.22.1</xsl:text>
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
	
			<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@artAndDem)='demonstrative'">
<p>
<xsl:text>In these nominal phrases with demonstratives, </xsl:text>
<xsl:choose>
<xsl:when test="//np/@classifierPresentDem='yes'"> a classifier is required.</xsl:when>
					<xsl:when test="//np/@classifierPresentDem='some'"> a classifier is present in some nominal phrases of this type, but is not required in all of them.</xsl:when>
					<xsl:when test="//np/@classifierPresentDem='no'"> a classifier is never used.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@classifierPresentDem)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@classifierPresentDem)='some'">
<xsl:text> The classifier </xsl:text>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='no'">
<xsl:text>occurs before both the demonstrative and the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>may occur before both the demonstrative and the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes'">
<xsl:text> It also occurs after both the noun and the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='no'">
<xsl:text>occurs after both the noun and the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>may occur after both the noun and the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes'">
<xsl:text> It also occurs after the demonstrative but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='no'">
<xsl:text>occurs after the demonstrative but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>may occur after the demonstrative but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes'">
<xsl:text> It also occurs after the noun but before the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='no'">
<xsl:text>occurs after the noun but before the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>may occur after the noun but before the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes'">
<xsl:text> It may also attach as a prefix on the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='no'">
<xsl:text>attaches as a prefix on the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>may attach as a prefix on the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes'">
<xsl:text> It may also attach as a suffix on the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='no'">
<xsl:text>attaches as a suffix on the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>may attach as a suffix on the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text> It may also occur ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificDemPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemPosOther/@checked)='yes'">
<xsl:text>occurs ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificDemPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>	
				</xsl:if>
</p>
</xsl:if>
			
			<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@artAndDem)='both'">
<p>
<xsl:text>In these nominal phrases with demonstratives, </xsl:text>
<xsl:choose>
<xsl:when test="//np/@classifierPresentDemBoth='yes'"> a classifier is required.</xsl:when>
					<xsl:when test="//np/@classifierPresentDemBoth='some'"> a classifier is present in some nominal phrases of this type, but is not required in all of them.</xsl:when>
					<xsl:when test="//np/@classifierPresentDemBoth='no'"> a classifier is never used.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@classifierPresentDemBoth)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@classifierPresentDemBoth)='some'">
<xsl:text> The classifier </xsl:text>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='no'">
<xsl:text>occurs before both the demonstrative and the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>may occur before both the demonstrative and the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes'">
<xsl:text> It also occurs after both the noun and the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='no'">
<xsl:text>occurs after both the noun and the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>may occur after both the noun and the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes'">
<xsl:text> It also occurs after the demonstrative but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='no'">
<xsl:text>occurs after the demonstrative but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>may occur after the demonstrative but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes'">
<xsl:text> It also occurs after the noun but before the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='no'">
<xsl:text>occurs after the noun but before the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>may occur after the noun but before the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes'">
<xsl:text> It may also attach as a prefix on the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='no'">
<xsl:text>attaches as a prefix on the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>may attach as a prefix on the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes'">
<xsl:text> It may also attach as a suffix on the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='no'">
<xsl:text>attaches as a suffix on the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>may attach as a suffix on the demonstrative.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='yes' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text> It may also occur ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificDemBothPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificDemBothPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterDemBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosAfterNBeforeDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosPrefixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosSuffixDem/@checked)='no' and normalize-space(//np/classifierSpecificDemBothPosOther/@checked)='yes'">
<xsl:text>occurs ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificDemBothPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>	
				</xsl:if>
</p>
</xsl:if>
			
		</section2>
		<section2 id="sNPPoss">
			<secTitle>Possessors</secTitle>
		   <p contentType="ctPracticalIntro">
<xsl:text>Possession can normally be expressed by a pronoun or by a nominal phrase which may consist of a proper name, a simple noun, or a fully modified noun.</xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Possession can normally be expressed by a pronoun or by a nominal phrase which may consist of a proper name, a simple noun, or a fully modified noun.  
					However, Spanish only allows pronouns in the possessor position before the noun, with all noun and full nominal phrase possessors expressed in a prepositional phrase with </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>de</langData>
<xsl:text> after the noun.</xsl:text>
</p>
			<p contentType="ctComparativeIntro">
<xsl:text>Within the languages which express possessors by nouns or full nominal phrases as well as by pronouns, many also add some kind of marking, such as the </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>’s</langData>
<xsl:text> in English, as an indication of possession.  These markings are either affixes or clitics on the head noun or phrasal clitics which attach to one end of the whole phrase.  Sometimes the possessor phrase marker is written as an independent word.  The English marking is this second type, because alongside phrases where the </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>’s</langData>
<xsl:text> appears to attach to the head noun, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s mother</langData>
<xsl:text>, there are phrases which clearly show that the clitic attaches to the end of the whole nominal phrase, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy that I just talked to’s mother</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the girl in green’s wonderful speech</langData>
<xsl:text>.  These examples show that possessors can include </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrases and relative clauses.  Possessors can also be embedded in one another, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s sister’s dog</langData>
<xsl:text>.  This is allowed in Spanish within the prepositional phrase after the noun.</xsl:text>
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
<xsl:text>, </xsl:text>
<xsl:choose>
		      <xsl:when test="//np/@possNP='yes'">both nominal phrases and pronouns may possess a noun directly, and both may also occur within <xsl:choose>
		         <xsl:when test="//pp/@pPos='before'">a prepositional</xsl:when>
		         <xsl:when test="//pp/@pPos='after'">a postpositional</xsl:when>
		         <xsl:when test="//pp/@pPos='both'">an adpositional</xsl:when>
		         <xsl:when test="//pp/@pPos='unknown'">an adpositional</xsl:when>
		      </xsl:choose> phrase.  </xsl:when>
		      <xsl:when test="//np/@possNP='yesOnly'">both nominal phrases and pronouns may possess a noun directly, but <xsl:choose>
		         <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
		         <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
		         <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
		         <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
		      </xsl:choose> phrase possessors are not allowed.  </xsl:when>
		   <xsl:when test="//np/@possNP='no'">only pronouns may possess a noun directly; nominal phrase possessors only occur within <xsl:choose>
		      <xsl:when test="//pp/@pPos='before'">a prepositional</xsl:when>
		      <xsl:when test="//pp/@pPos='after'">a postpositional</xsl:when>
		      <xsl:when test="//pp/@pPos='both'">an adpositional</xsl:when>
		      <xsl:when test="//pp/@pPos='unknown'">an adpositional</xsl:when>
		   </xsl:choose> phrase.  </xsl:when>
		      <xsl:when test="//np/@possNP='none'">neither nominal phrases nor pronouns may possess a noun directly; possession is only expressed  within <xsl:choose>
		         <xsl:when test="//pp/@pPos='before'">a prepositional</xsl:when>
		         <xsl:when test="//pp/@pPos='after'">a postpositional</xsl:when>
		         <xsl:when test="//pp/@pPos='both'">an adpositional</xsl:when>
		         <xsl:when test="//pp/@pPos='unknown'">an adpositional</xsl:when>
		      </xsl:choose> phrase.  </xsl:when>
		   </xsl:choose>
<xsl:if test="normalize-space(//np/@possNP)!='yesOnly'">
<xsl:text>The </xsl:text>
<xsl:choose>
		         <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
		         <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
		         <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
		         <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
		      </xsl:choose>
<xsl:text> phrase possessor occurs </xsl:text>
<xsl:choose>
		         <xsl:when test="//np/@possPPPos='before'">before</xsl:when>
		         <xsl:when test="//np/@possPPPos='after'">after</xsl:when>
		         <xsl:when test="//np/@possPPPos='either'">on either side of</xsl:when>
		      </xsl:choose>
<xsl:text> the noun. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possNP)='yes' or normalize-space(//np/@possNP)='yesOnly'">
<xsl:text>The nominal phrase or pronoun possessor occurs </xsl:text>
<xsl:choose>
		         <xsl:when test="//np/@possNounPos='before'">before</xsl:when>
		         <xsl:when test="//np/@possNounPos='after'">after</xsl:when>
		         <xsl:when test="//np/@possNounPos='either'">on either side of</xsl:when>
		      </xsl:choose>
<xsl:text> the noun. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possNP)='no'">
<xsl:text>The pronoun possessor occurs </xsl:text>
<xsl:choose>
		         <xsl:when test="//np/@possPronPos='before'">before</xsl:when>
		         <xsl:when test="//np/@possPronPos='after'">after</xsl:when>
		         <xsl:when test="//np/@possPronPos='either'">on either side of</xsl:when>
		      </xsl:choose>
<xsl:text> the noun.</xsl:text>
</xsl:if>
</p>
		   
			<p>
<xsl:text>Examples of simple possessed nominal phrases in </xsl:text>
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
			<example num="xNP.NPPoss.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/possessorExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/possessorExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/possessorExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/possessorExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.14.1</xsl:text>
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
<xsl:text>Examples of possessed nominal phrases with embedded possessors in </xsl:text>
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
			<example num="xNP.NPPoss.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/embeddedExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/embeddedExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/embeddedExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/embeddedExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.18.1</xsl:text>
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
			<xsl:if test="normalize-space(//np/@possNP)!='yesOnly'">
<p>
<xsl:text>Examples with </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrases as the possessor include:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@possNP)!='yesOnly'">
<example num="xNP.NPPoss.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/ppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/ppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/ppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/ppExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.22.1</xsl:text>
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
			<p>
<xsl:text>Examples with relative clauses within the possessor, included in simple full sentences are:</xsl:text>
</p>
			<example num="xNP.NPPoss.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/relClExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/relClExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/relClExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/relClExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.26.1</xsl:text>
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
			<xsl:if test="normalize-space(//np/@possNP)='yes' or normalize-space(//np/@possNP)='yesOnly'">
<p>
<xsl:text>As seen in the examples above, </xsl:text>
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
					<xsl:when test="//np/@possMarked='no'"> does not have any special marking to distinguish possessors from any other nominal phrase.</xsl:when>
					<xsl:when test="//np/@possMarked='yesAffix'"> marks the head noun within the possessor with an affix to distinguish possessors from any other nominal phrase.  The affix is:</xsl:when>
				   <xsl:when test="//np/@possMarked='yesProclitic'"> marks the whole phrase with a phrasal proclitic which attaches to the first word in the possessor to distinguish possessors from any other nominal phrase.  The clitic is:</xsl:when>
				   <xsl:when test="//np/@possMarked='yesEnclitic'"> marks the whole phrase with a phrasal enclitic which attaches to the final word in the possessor to distinguish possessors from any other nominal phrase.  The clitic is:</xsl:when>
				   <xsl:when test="//np/@possMarked='yesWord'"> marks the whole possessor phrase with an independent word to distinguish it from any other nominal phrase.  The presence of the marker word is <xsl:choose>
				      <xsl:when test="//np/@possWordRequired='no'">optional in some cases.</xsl:when>
				      <xsl:when test="//np/@possWordRequired='yes'">always required.</xsl:when>
				   </xsl:choose>  It occurs </xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordAfter/@checked)='no' and normalize-space(//np/possWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='no' and normalize-space(//np/possWordAfter/@checked)='no' and normalize-space(//np/possWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordAfter/@checked)='no' and normalize-space(//np/possWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordOther/@checked)='no'">
<xsl:text> the possessor phrase.  This word is:</xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='no' and normalize-space(//np/possWordAfter/@checked)='no' and normalize-space(//np/possWordBoth/@checked)='no' and normalize-space(//np/possWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/possWordOther" />
<xsl:text>.  This word is:</xsl:text>
				   </xsl:if>
<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/possWordOther/@checked)='yes' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/possWordOther/@checked)='yes' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/possWordOther/@checked)='yes'">
<xsl:text> the possessor phrase and may also occur  ___</xsl:text>
<xsl:value-of select="//np/possWordOther" />
<xsl:text>.  This word is:</xsl:text>
</xsl:if>
</p>
</xsl:if>
	<xsl:if test="normalize-space(//np/@possMarked)='yesAffix'">
<example num="xNP.NPPoss.30">
<table border="1">
	      <tr>
	         <th>Possessor Marker Affix</th>
	      </tr>
	      <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possMarkerAffix),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
	   </table>
</example>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@possMarked)='yesProclitic' or normalize-space(//np/@possMarked)='yesEnclitic'">
<example num="xNP.NPPoss.32">
<table border="1">
		         <tr>
		            <th>Possessor Marker Clitic</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possMarkerClitic),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@possMarked)='yesWord'">
<example num="xNP.NPPoss.34">
<table border="1">
		         <tr>
		            <th>Possessor Marker Word</th>
		         </tr>
		         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//np/possMarkerWord),'.','')" />
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
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
		      </table>
</example>
</xsl:if>
		   
				<p contentType="ctComparativeIntro">
<xsl:text>In English, possessors and articles or demonstratives do not co-occur in the same nominal phrase, unless the possessor is expressed in a prepositional phrase.  For example, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those [the boy’s] books</langData>
<xsl:text> is ungrammatical; instead one would use </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those books [of his]</langData>
<xsl:text> to express the same thought.  Some languages allow both possessors and articles or demonstratives to occur in the same phrase, so the first example above would be grammatical.</xsl:text>
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
<xsl:text>, nominal and/or pronominal possessors </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCooccur='yes'">may</xsl:when>
					   	<xsl:when test="//np/@possCooccur='no'">may not</xsl:when>
					</xsl:choose>
<xsl:text> occur in the same phrase as </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@artAndDem='article'">articles</xsl:when>
						<xsl:when test="//np/@artAndDem='demonstrative'">demonstratives</xsl:when>
						<xsl:when test="//np/@artAndDem='both'">articles and/or demonstratives</xsl:when>
					</xsl:choose>
<xsl:text> in the normal possessor position</xsl:text>
<xsl:choose>
				      <xsl:when test="//np/@possCooccur='yes'">.</xsl:when>
				      <xsl:when test="//np/@possCooccur='no'">.  Instead, </xsl:when>
				   </xsl:choose>
<xsl:if test="normalize-space(//np/@possCooccur)='no'">
<xsl:text>the possessor is expressed in a </xsl:text>
				      <xsl:choose>
				         <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
				         <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
				         <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
				         <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
				      </xsl:choose>
				      <xsl:text> phrase.</xsl:text>
				   </xsl:if>
</p>
		
		</section2>
		<section2 id="sNPQP">
			<secTitle>Quantifier Phrases</secTitle>
			<p contentType="ctPracticalIntro">
<xsl:text>Quantifier phrases include both numbers (section </xsl:text>
<sectionRef sec="sAdjNumbers" />
<xsl:text>) and the narrower scope quantifiers (section </xsl:text>
<sectionRef sec="sQPOtherQuantifiers" />
<xsl:text>).</xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Quantifier phrases include both numbers (section </xsl:text>
<sectionRef sec="sAdjNumbers" />
<xsl:text>) and the narrower scope quantifiers (section </xsl:text>
<sectionRef sec="sQPOtherQuantifiers" />
<xsl:text>).  Such modifiers mark the number of the whole nominal phrase.  English examples of quantified nominal phrases include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those very few books</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s many dogs</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only the first one hundred boys</langData>
<xsl:text>.  All the quantifier phrases occur before the noun in English.</xsl:text>
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
<xsl:text>, quantifier phrases occur </xsl:text>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='no' and normalize-space(//np/qpPosBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='no' and normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='no' and normalize-space(//np/qpPosAfter/@checked)='no' and normalize-space(//np/qpPosBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='no' and normalize-space(//np/qpPosBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='no' and normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/qpPosOther/@checked)='no'">
<xsl:text> the noun.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='no' and normalize-space(//np/qpPosAfter/@checked)='no' and normalize-space(//np/qpPosBoth/@checked)='no' and normalize-space(//np/qpPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/qpPosOther" />
<xsl:text>.   </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosOther/@checked)='yes' or normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//np/qpPosOther/@checked)='yes' or normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//np/qpPosOther/@checked)='yes'">
<xsl:text> the noun and may also occur ___</xsl:text>
<xsl:value-of select="//np/qpPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/@qpEitherRestrictedNumPos)='before' and normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='yes' or normalize-space(//np/@qpEitherRestrictedNumPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes'">
						<xsl:text>All of the numbers occur before the noun. </xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@qpEitherRestrictedNumPos)='after' and normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//np/qpPosAfter/@checked)='yes' or normalize-space(//np/@qpEitherRestrictedNumPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes'">
						<xsl:text>All of the numbers occur after the noun. </xsl:text>
					</xsl:if>
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
<xsl:text> examples of quantified nominal phrases include:</xsl:text>
</p>
			<example num="xNP.NPQP.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/qpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/qpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/qpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/qpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPQP.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPQP.12.1</xsl:text>
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
			
			<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific'">
<p>
<xsl:text>In these nominal phrases with numbers or other quantifiers, </xsl:text>
<xsl:choose>
<xsl:when test="//np/@classifierPresentQ='yes'"> a classifier is required.</xsl:when>
					<xsl:when test="//np/@classifierPresentQ='some'"> a classifier is present in some nominal phrases of this type, but is not required in all of them.</xsl:when>
					<xsl:when test="//np/@classifierPresentQ='no'"> a classifier is never used.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)='some'">
<xsl:text> The classifier </xsl:text>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosOther/@checked)='no'">
<xsl:text>occurs before both the quantifier and the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>may occur before both the quantifier and the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes'">
<xsl:text> It also occurs after both the noun and the quantifier.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosOther/@checked)='no'">
<xsl:text>occurs after both the noun and the quantifier.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>may occur after both the noun and the quantifier.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes'">
<xsl:text> It also occurs after the quantifier but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosOther/@checked)='no'">
<xsl:text>occurs after the quantifier but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>may occur after the quantifier but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes'">
<xsl:text> It also occurs after the noun but before the quantifier.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosOther/@checked)='no'">
<xsl:text>occurs after the noun but before the quantifier.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>may occur after the noun but before the quantifier.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes'">
<xsl:text> It may also attach as a prefix on the quantifier.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosOther/@checked)='no'">
<xsl:text>attaches as a prefix on the quantifier.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>may attach as a prefix on the quantifier.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' or normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes'">
<xsl:text> It may also attach as a suffix on the quantifier.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='no'">
<xsl:text>attaches as a suffix on the quantifier.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>may attach as a suffix on the quantifier.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text> It may also occur ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificQPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosPrefixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosSuffixQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosOther/@checked)='yes'">
<xsl:text>occurs ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificQPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>	
				</xsl:if>
</p>
</xsl:if>
			
			
		</section2>
		<section2 id="sNPAdjP">
			<secTitle>Adjective Phrases</secTitle>
			<p contentType="ctPracticalIntro">
<xsl:text>Qualitative adjectives and their modifiers were discussed earlier in section </xsl:text>
<sectionRef sec="sAdjQual" />
<xsl:text>. </xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Qualitative adjectives and their modifiers were discussed earlier in section </xsl:text>
<sectionRef sec="sAdjQual" />
<xsl:text>.  Adjective phrases occur close to the noun, yielding nominal phrases such as:</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just those very few old, dirty books</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all the boy’s many black dogs</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only the first one hundred very eager young boys</langData>
<xsl:text>.  As the English examples show, adjectives all occur before the noun, and, unlike the other modifiers discussed so far, more than one adjective phrase is allowed.</xsl:text>
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
<xsl:text>, adjective phrases occur </xsl:text>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//np/adjPosOther/@checked)='no'">
<xsl:text> the noun.  </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='no' and normalize-space(//np/adjAfter/@checked)='no' and normalize-space(//np/adjBoth/@checked)='no' and normalize-space(//np/adjPosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//np/adjPosOther" />
<xsl:text>.   </xsl:text>
		      </xsl:if>
<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//np/adjPosOther/@checked)='yes' or normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//np/adjPosOther/@checked)='yes' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//np/adjPosOther/@checked)='yes'">
<xsl:text> the noun and may also occur ___</xsl:text>
<xsl:value-of select="//np/adjPosOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
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
<xsl:text> examples of nominal phrases which are modified by qualitative adjectives or adjective phrases include:</xsl:text>
</p>
			<example num="xNP.NPAdjP.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/adjpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/adjpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/adjpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/adjpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPAdjP.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPAdjP.12.1</xsl:text>
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
			<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific'">
<p>
<xsl:text>In these nominal phrases with adjectives, </xsl:text>
<xsl:choose>
<xsl:when test="//np/@classifierPresentAdj='yes'"> a classifier is required.</xsl:when>
					<xsl:when test="//np/@classifierPresentAdj='some'"> a classifier is present in some nominal phrases of this type, but is not required in all of them.</xsl:when>
					<xsl:when test="//np/@classifierPresentAdj='no'"> a classifier is never used.</xsl:when>
</xsl:choose>
<xsl:if test="normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)='yes' or normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)='some'">
<xsl:text> The classifier </xsl:text>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='no'">
<xsl:text>occurs before both the adjective and the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>may occur before both the adjective and the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes'">
<xsl:text> It also occurs after both the noun and the adjective.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='no'">
<xsl:text>occurs after both the noun and the adjective.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>may occur after both the noun and the adjective.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes'">
<xsl:text> It also occurs after the adjective but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='no'">
<xsl:text>occurs after the adjective but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>may occur after the adjective but before the noun.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes'">
<xsl:text> It also occurs after the noun but before the adjective.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='no'">
<xsl:text>occurs after the noun but before the adjective.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>may occur after the noun but before the adjective.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes'">
<xsl:text> It may also attach as a prefix on the adjective.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='no'">
<xsl:text>attaches as a prefix on the adjective.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>may attach as a prefix on the adjective.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes'">
<xsl:text> It may also attach as a suffix on the adjective.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='no'">
<xsl:text>attaches as a suffix on the adjective.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>may attach as a suffix on the adjective.</xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes' or normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='yes' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text> It may also occur ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificAdjPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>
					<xsl:if test="normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosPrefixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosSuffixAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosOther/@checked)='yes'">
<xsl:text>occurs ___</xsl:text>
<xsl:value-of select="//np/classifierSpecificAdjPosOther" />
<xsl:text>. </xsl:text>
</xsl:if>	
				</xsl:if>
</p>
</xsl:if>
			
			
		</section2>
		<section2 id="sNPPP">
			<secTitle>            <xsl:choose>
				<xsl:when test="//pp/@pPos='before'">Prepositional Phrases</xsl:when>
				<xsl:when test="//pp/@pPos='after'">Postpositional Phrases</xsl:when>
				<xsl:when test="//pp/@pPos='both'">Prepositional and Postpositional Phrases</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">Adpositional Phrases</xsl:when>
			</xsl:choose>
</secTitle>
			<p contentType="ctPracticalIntro">
<xsl:text>Both simple and compound nouns may have </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrase modifiers or complements. </xsl:text>
</p>
		   <p contentType="ctComparativeIntro">
<xsl:text>Both simple and compound nouns may have </xsl:text>
<xsl:choose>
		         <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
		         <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
		         <xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
		         <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
		      </xsl:choose>
<xsl:text> phrase modifiers or complements, such as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the large, round bottle [of syrup]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s letter [to that girl]</langData>
<xsl:text>.  In addition, genitive </xsl:text>
<xsl:choose>
		         <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
		         <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
		         <xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
		         <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
		      </xsl:choose>
<xsl:text> phrases may take the place of the possessor, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those dogs [of his]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the tablecloth [of my mother’s]</langData>
<xsl:text>.    In English, the prepositional phrase always comes after the noun.</xsl:text>
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
<xsl:text>, the </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrase occurs </xsl:text>
<xsl:choose>
				         <xsl:when test="//np/@ppPos='before'">before</xsl:when>
				         <xsl:when test="//np/@ppPos='after'">after</xsl:when>
				         <xsl:when test="//np/@ppPos='either'">on either side of</xsl:when>
				         <xsl:when test="//np/@ppPos='unknown'">_______</xsl:when>
				      </xsl:choose>
<xsl:text> the noun it is modifying.  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples with </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrase modifiers or complements include:</xsl:text>
</p>
			<example num="xNP.NPPP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/compPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/compPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/compPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/compPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPP.10.1</xsl:text>
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
<xsl:text>See section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> for more details on </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and postpositional</xsl:when>
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
<xsl:text>.</xsl:text>
</p>
		</section2>
<section2 id="sNPParticiple">
	<secTitle>Participles and Gerunds</secTitle>
   <p contentType="ctPracticalIntro">
<xsl:text>Participles or participle phrases may act like qualitative adjectives modifying a noun. </xsl:text>
</p>
   <p contentType="ctComparativeIntro">
<xsl:text>Participles or participle phrases may act like qualitative adjectives modifying a noun.  Some English examples with the participle or participle phrase bracketed  include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the bright, [shining] sun, my [crying] child</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the books [loved by millions].</langData>
</p>
   <p>
<xsl:text>  Examples in </xsl:text>
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
   <example num="xNP.NPParticiple.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/partExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/partExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPParticiple.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiple.10.1</xsl:text>
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
<xsl:text>A gerund or gerund phrase may look like a noun and a complement.  This whole phrase occupies a normal argument position, such as subject, object, indirect object or the object of an adposition. </xsl:text>
</p>
   <p contentType="ctComparativeIntro">
<xsl:text>A gerund or gerund phrase may look like a noun and a complement. This whole phrase occupies a normal argument position, such as subject, object, indirect object or the object of an adposition.  Some English examples in full sentences with the gerund phrase bracketed include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Studying participles] is challenging, He likes [reading Latin poetry]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The receiver showed his worth by [making the catch].</langData>
<xsl:text>  Such phrases may be possessed or be modified as well, and sometimes only the gerund stands alone as the head of a nominal phrase, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the badly wounded, the dying</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>your following.</langData>
</p>
   <p>
<xsl:text>Examples from </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> of gerunds or gerund phrases that can take the place of a nominal phrase include:</xsl:text>
</p>
   <example num="xNP.NPParticiple.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partHeadExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/partHeadExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partHeadExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/partHeadExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPParticiple.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiple.18.1</xsl:text>
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
<xsl:text>These gerund phrases can be used in full sentences as shown here:</xsl:text>
</p>
   <example num="xNP.NPParticiple.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partHeadSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/partHeadSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partHeadSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/partHeadSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPParticiple.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiple.22.1</xsl:text>
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
	</section1>
	
	
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
		
		
		
	
	
		
		
		
		
		
		
		
	

	
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
   
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	

   
      
   
   
      
   
   
      
      
      
   
   
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
      
      
      
      
   
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
      
   
   
   
      
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
      
      
      
      
     
   
      
   
   
      
      
      
      
      
      
      
   
   
      
      
      
      
      
      
      
      
      
      
            
   
   
      
         
         
         
         
         
         
         
        
      
         
         
         
         
         
         
         
        
      
         
         
         
         
         
         
         
        
      
         
         
         
         
         
         
         
        
      
         
         
         
         
         
         
         
        
      
         
         
         
         
         
         
         
        
      
         
         
         
         
         
         
         
        
      
         
         
         
      
      
         
         
         
         
         
         
         
         
         
      
      
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
               
      
   
      
   
   
      
      
      
   
   
      
   
   
      
   
   
      
   
   
      
      
      
   
   
   
   
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
		
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
	
	
		
		
		
		
		
		
		
	
   
 
   
	
		
	
	
		
		
		
	
	
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
	
	
		
		
		
		
		
	
	
		
		
		
		
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
		 
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
	
	
		
		
		
		
		
		
	   
	   
	   
	
	
	   
	   
	   
	   
	   
	   
	   
	   
	   
	
	
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
   
	
	
		
	
	
	
	
		
		
		
	
	
	
		
		
		
	
		
		
	
	
		
		
		

		
		
		
	
	
		
		
		
	
	
		
	
	
		
	
   
   
   
      
      
      
      
      
      
         
      
      
      
      
      
      
      
        
      
      
      
      
      
      
      
        
      
      
      
      
      
      
      
        
      
      
      
      
      
      
      
        
   
   
      
      
      
      
      
      
         
      
      
      
      
      
      
      
        
      
      
      
      
      
      
      
        
      
      
      
      
      
      
      
        
      
      
      
      
      
      
      
        
   
   
      
      
      
   
   
      
      
      
   

	
	
	
		
	
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	
	
		
	
		
	
		
		
		
		
		
		
		
		
		
		
		
	
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
		
	
		
	
		
		
		
		
		
		
		
		
		
		
		
	
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
		
	
		
		
		
		
		
		
		
	
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	
		
		
		
		
		
		
		
	
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		


</xsl:template>
</xsl:stylesheet>
