<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ip">
	<section1 id="sIP">
		<secTitle>Basic Sentences</secTitle>
		<p>
<xsl:text>This section covers copular, intransitive, transitive, ditransitive, imperative, subjunctive, conditional, passive and causative sentences in their basic word order (i.e. not changed by focus, topic, interrogative, or negation constructions).  As noted in section </xsl:text>
<sectionRef sec="sIntro" />
<xsl:text>,  the typology of </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@wordOrder='SVO'">SVO, so the basic word order is the subject, then any auxiliary elements, then the verb phrase which consists of the verb in initial position and any complements following it.</xsl:when>
				<xsl:when test="//typology/@wordOrder='SOV'">SOV, so the basic word order is the subject, then the verb phrase which consists of the verb in final position with any complements preceding it, then any auxiliary elements.</xsl:when>
				<xsl:when test="//typology/@wordOrder='VSO'">VSO, so the basic word order is the verb in initial position, then the subject, then any complements.</xsl:when>
				<xsl:when test="//typology/@wordOrder='VOS'">VOS, so the basic word order is the verb phrase which consists of the verb in initial position and any complements following it, then any auxiliary elements, then the subject.</xsl:when>
				<xsl:when test="//typology/@wordOrder='OVS'">OVS, so the basic word order is the verb phrase which consists of the verb in final position with any complements preceding it, then any auxiliary elements, then the subject.</xsl:when>
				<xsl:when test="//typology/@wordOrder='OSV'">OSV, so the basic word order is any verbal complements first, then the subject, then the verb in final position.</xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//typology/@wordOrder)='OSV'">
				<xsl:text>  The word order changes with any auxiliaries present were discussed in section </xsl:text>
				<sectionRef sec="sIPAux" />
				<xsl:text>.</xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
</p>
		<p>
<xsl:text>Each of the sentence types are covered in turn here.</xsl:text>
</p>

	   <section2 id="sIPCop">
		  <secTitle>Copular Constructions</secTitle>

		  <p>
<xsl:text>Copular constructions include those with a copular verb, if required, or with a perception verb, plus comparatives and existentials.</xsl:text>
</p>
		  <p contentType="ctComparativeIntro">
<xsl:text>True copular sentences can have an adjective, adpositional phrase, or nominal phrase following the copular verb.  Some languages do not require a copular verb or auxiliary to be present.  English examples include </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl is pretty</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Susan is sick</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My sister is in the hospital</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>He is the leader</langData>
<xsl:text>.</xsl:text>
</p>
	      <p>
<xsl:text>Examples of copular sentences in </xsl:text>
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
	      <example num="xIP.IPCop.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/copularExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/copularExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/copularExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/copularExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.10.1</xsl:text>
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
	      <xsl:if test="normalize-space(//ip/@copular)='yes' or normalize-space(//ip/@copular)='optional'">
<p>
<xsl:text>As the examples show, </xsl:text>
<xsl:choose>
			    <xsl:when test="//ip/@copular='yes'">a copular verb is required </xsl:when>
			    <xsl:when test="//ip/@copular='optional'">a copular verb is optional </xsl:when>
			 </xsl:choose>
<xsl:text>in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> copular sentences.  The copular verbs are: </xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@copular)='yes' or normalize-space(//ip/@copular)='optional'">
<example num="xIP.IPCop.14">
<table border="1">
	            <tr>
	               <th>Copular Verbs</th>
	               <th>Gloss</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularVerb),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@copular)='no'">
<p>
<xsl:text>As the examples show, there is no copular verb in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> copular sentences.  There is </xsl:text>
<xsl:choose>
	            <xsl:when test="//ip/@copularAffix='no'">not any copular affix on the predicate nominal or predicate adjective either.</xsl:when>
	            <xsl:when test="//ip/@copularAffix='yesPrefix'">a copular prefix on the predicate nominal or predicate adjective, however.  This prefix is:</xsl:when>
	            <xsl:when test="//ip/@copularAffix='yesSuffix'">a copular suffix on the predicate nominal or predicate adjective, however  This suffix is:</xsl:when>
	            <xsl:when test="//ip/@copularAffix='yesEither'">either a copular prefix or suffix on the predicate nominal or predicate adjective, however.  These affixes are:</xsl:when>
	         </xsl:choose>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@copular)='no' and normalize-space(//ip/@copularAffix)='yesPrefix'">
<example num="xIP.IPCop.18">
<table border="1">
	            <tr>
	               <th>Copular Prefix</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@copular)='no' and normalize-space(//ip/@copularAffix)='yesSuffix'">
<example num="xIP.IPCop.20">
<table border="1">
	            <tr>
	               <th>Copular Suffix</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@copular)='no' and normalize-space(//ip/@copularAffix)='yesEither'">
<example num="xIP.IPCop.22">
<table border="1">
	            <tr>
	               <th>Copular Affixes</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
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
	      
	      <xsl:if test="normalize-space(//ip/@copular)='optional'">
<p>
<xsl:text>  There is </xsl:text>
<xsl:choose>
				   <xsl:when test="//ip/@copularAffix='no'">not any copular affix on the predicate nominal or predicate adjective that occurs when the copular verb is not present.</xsl:when>
				   <xsl:when test="//ip/@copularAffix='yesPrefix'">also a copular prefix on the predicate nominal or predicate adjective that occurs when there is no copular verb present.  This prefix is:</xsl:when>
				   <xsl:when test="//ip/@copularAffix='yesSuffix'">also a copular suffix on the predicate nominal or predicate adjective that occurs when there is no copular verb present.  This suffix is:</xsl:when>
				   <xsl:when test="//ip/@copularAffix='yesEither'">also either a copular prefix or suffix on the predicate nominal or predicate adjective that occurs when there is no copular verb present.  These affixes are:</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@copular)='optional' and normalize-space(//ip/@copularAffix)='yesPrefix'">
<example num="xIP.IPCop.26">
<table border="1">
	            <tr>
	               <th>Copular Prefix</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@copular)='optional' and normalize-space(//ip/@copularAffix)='yesSuffix'">
<example num="xIP.IPCop.28">
<table border="1">
	            <tr>
	               <th>Copular Suffix</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@copular)='optional' and normalize-space(//ip/@copularAffix)='yesEither'">
<example num="xIP.IPCop.30">
<table border="1">
	            <tr>
	               <th>Copular Affixes</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/copularAffix),'.','')" />
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
<xsl:text>In contrast to copular verbs, perception verbs usually only allow an adjective phrase following them, except in superlative constructions where a nominal phrase follows a perception verb, as shown in the next section.  Some English examples with perception verbs include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl looks pretty</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>She seems nice</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The water appears murky</langData>
<xsl:text>.</xsl:text>
</p>
		  <p>
<xsl:text>Examples of sentences with perception verbs in </xsl:text>
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
		  <example num="xIP.IPCop.36">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/perceptionExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/perceptionExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength0 != 0 and $sExampleValue0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/perceptionExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/perceptionExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.36</xsl:with-param>
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
<xsl:text>xIP.IPCop.36.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>as</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>

		  <p>
<xsl:text>Both copular and perception verbs can also occur with an adjectival clause complement, where a sentence or complement clause follows the adjective.  These constructions will be covered in section </xsl:text>
<sectionRef sec="sCompRaising" />
<xsl:text>.
		  </xsl:text>
</p>
		  <section3 id="sIPComparatives">
			 <secTitle>Comparatives and Superlatives</secTitle>
			 <p>
<xsl:text>Comparatives are a subclass of copular sentences. We will consider two types which rate two parts as equal, then comparatives where one part is better than the other, then superlatives. All of these types may normally use either a copular or perception verb. </xsl:text>
</p>
		     <p contentType="ctComparativeIntro">
<xsl:text>Comparison of equals can use a noun or an adjective for comparison. The noun equality construction uses a formula meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘is the same Noun as’</langData>
<xsl:text> between two nominal phrases. Some English examples are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The curtains look the same color as the walls</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Your backpack is the same size as mine</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue has the same hairstyle as Mary</langData>
<xsl:text>. </xsl:text>
</p>
		     <p contentType="ctPracticalIntro">
<xsl:text>Comparison of equals can use a noun or an adjective for comparison. The noun equality construction uses a formula meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘is the same Noun as’</langData>
<xsl:text> between two nominal phrases.</xsl:text>
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
<xsl:choose>
				<xsl:when test="//ip/@same='yes'"> has a comparative degree word meaning ‘same’ which is used with the noun of comparison in sentences involving comparison of equals, as shown in the following table.</xsl:when>
				<xsl:when test="//ip/@same='attaches'"> attaches a comparative degree affix or clitic meaning ‘same’ to the noun of comparison in sentences involving comparison of equals, as shown in the following table.</xsl:when>
				<xsl:when test="//ip/@same='no'"> does not have a comparative degree word meaning ‘same’.  Only the presence of the two nominal phrases and the noun of comparison with the copular predicate occur in sentences involviong comparison of  equals.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@same)='yes'">
<example num="xIP.IPCop.IPComparatives.12">
<table border="1">
				   <tr>
					  <th>Equal Noun Comparative Degree Word</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/sameWordExample),'.','')" />
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
<xsl:text>same</xsl:text>
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
<xsl:text>same</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>

			 <xsl:if test="normalize-space(//ip/@same)='attaches'">
<example num="xIP.IPCop.IPComparatives.14">
<table border="1">
				   <tr>
					  <th>Equal Noun Comparative Degree Affix or Clitic</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/sameAffixExample),'.','')" />
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
<xsl:text>same</xsl:text>
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
<xsl:text>same</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			 <p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
				<xsl:when test="//ip/@compareN='yes'"> uses the following comparative conjunction meaning ‘as’ before the second nominal phrase in sentences involving comparison of equals:</xsl:when>
				<xsl:when test="//ip/@compareN='no'"> does not have any comparative conjunction meaning ‘as’ before the second nominal phrase in sentences involving comparison of equals.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@compareN)='yes'">
<example num="xIP.IPCop.IPComparatives.18">
<table border="1">
				   <tr>
					  <th>Equal Noun Comparative Conjunction</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/compareNExample),'.','')" />
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
<xsl:text>as</xsl:text>
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
<xsl:text>as</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			 <p>
<xsl:text>Examples of sentences expressing the noun equality construction in </xsl:text>
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
			 <example num="xIP.IPCop.IPComparatives.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/sameExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/sameExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/sameExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/sameExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.22.1</xsl:text>
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
<xsl:text>The second type of comparison of equals uses an adjective for comparison. This construction uses a formula meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘is as Adjective as’</langData>
<xsl:text> between the two nominal phrases. Some English examples are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John is as friendly as Bill</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue is as fast as Mary</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David appears as tall as Michael</langData>
<xsl:text>.</xsl:text>
</p>
		     <p contentType="ctPracticalIntro">
<xsl:text>The second type of comparison of equals uses an adjective for comparison. This construction uses a formula meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘is as Adjective as’</langData>
<xsl:text> between the two nominal phrases.</xsl:text>
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
<xsl:choose>
				<xsl:when test="//ip/@as='yes'"> has a comparative degree word meaning ‘as’ which is used with the adjective of comparison, as shown in the following table.</xsl:when>
				<xsl:when test="//ip/@as='no'"> does not have a comparative degree word meaning ‘as’.  Its meaning is simply implied in the adjective of comparison sentences involving comparison of equals.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@as)='yes'">
<example num="xIP.IPCop.IPComparatives.30">
<table border="1">
				   <tr>
					  <th>Equal Adjective Comparative Degree Word</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/asWordExample),'.','')" />
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
<xsl:text>as</xsl:text>
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
<xsl:text>as</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			 <p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
				<xsl:when test="//ip/@compareAdj='yes'"> uses the following comparative conjunction meaning ‘as’ before the second nominal phrase:</xsl:when>
				<xsl:when test="//ip/@compareAdj='no'"> does not have any comparative conjunction meaning ‘as’ before the second nominal phrase in sentences involving comparison of equal qualitative adjectives.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@compareAdj)='yes'">
<example num="xIP.IPCop.IPComparatives.34">
<table border="1">
				   <tr>
					  <th>Equal Adjective Comparative Conjunction</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/compareAdjExample),'.','')" />
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
<xsl:text>as</xsl:text>
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
<xsl:text>as</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			 <p>
<xsl:text>Examples of sentences expressing the adjective equality construction in </xsl:text>
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
			 <example num="xIP.IPCop.IPComparatives.38">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/asExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/asExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/asExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/asExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.38</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.38.1</xsl:text>
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
<xsl:text>Comparatives where one part is better than the other compare two nominal phrases using a comparative word meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>than</langData>
<xsl:text> and include a copular or perception verb.  Degree marking occurs with the predicate adjective or nominal phrase.  In some languages, this degree marking may either be an independent degree word or an affix on the predicate adjective, as shown in the English examples: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John is more handsome than Bill</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue is a poorer runner than Mary</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David appears taller than Michael</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mary looks prettier than Julie</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John seems less certain of his answers than Sue</langData>
<xsl:text>.</xsl:text>
</p>
			 <p contentType="ctComparativeIntro">
<xsl:text>Note that there is an implied copula following the final nominal phrase in the English examples. A more complex type of comparative has an overt sentence in the place of the second noun phrase. These will be covered below.</xsl:text>
</p>
		     <p contentType="ctPracticalIntro">
<xsl:text>Comparatives where one part is better than the other compare two nominal phrases using a comparative word meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>than</langData>
<xsl:text> and include a copular or perception verb.  Degree marking occurs with the predicate adjective or nominal phrase. </xsl:text>
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
<xsl:choose>
				<xsl:when test="//ip/@comparative='yes'"> has a comparative conjunction meaning ‘than’ which is used in comparatives where one part is better than the other, as shown in the following table.</xsl:when>
				<xsl:when test="//ip/@comparative='no'"> does not have a comparative conjunction meaning ‘than’.  Only the presence of the two noun phrases and the degree word with the copular predicate signal a comparative where one part is better than the other.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@comparative)='yes'">
<example num="xIP.IPCop.IPComparatives.48">
<table border="1">
				   <tr>
					  <th>Comparative Conjunction</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/comparativeWordExample),'.','')" />
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
<xsl:text>than</xsl:text>
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
<xsl:text>than</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
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
				<xsl:when test="//ip/@comparativeAdj='no'">there is not an affix to express the degree of comparison on predicate adjectives.  A separate comparative degree word is used with both predicate adjectives and nominal phrases.</xsl:when>
				<xsl:when test="//ip/@comparativeAdj='yes'">one or more affixes express the degree of comparison on predicate adjectives and one is always used with predicate adjectives in comparatives.  </xsl:when>
				<xsl:when test="//ip/@comparativeAdj='both'">one or more affixes may express the degree of comparison on predicate adjectives.   However, some predicate adjectives use the affixes and some use the separate degree words in comparatives.  </xsl:when>
			 </xsl:choose>
</p>
			 <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<p>
<xsl:text>The comparative degree affixes used on the predicate adjectives are:</xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<example num="xIP.IPCop.IPComparatives.54">
<table border="1">
				   <tr>
					  <th>Comparative Degree Affixes</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/comparativeAffixExample),'.','')" />
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
			 <xsl:if test="normalize-space(//ip/@comparativeAdj)='no' or normalize-space(//ip/@comparativeAdj)='both'">
<p>
<xsl:text>The comparative degree words used with predicate adjectives and predicate nominals are:</xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//ip/@comparativeAdj)='yes'">
<p>
<xsl:text>The comparative degree words used with predicate nominals are:</xsl:text>
</p>
</xsl:if>
			 <example num="xIP.IPCop.IPComparatives.60">
<table border="1">
				   <tr>
					  <th>Comparative Degree Words</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/comparativeDegExample),'.','')" />
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
<xsl:text>Examples of sentences expressing the comparison where one part is better than the other in </xsl:text>
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
			 <example num="xIP.IPCop.IPComparatives.64">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/comparativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/comparativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/comparativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/comparativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.64</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.64.1</xsl:text>
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
<xsl:text>Now consider comparatives which have two sentences surrounding the comparative conjunction, though the second sentence may be missing the adjective.
		              Like the shorter comparatives above, these compare the qualities or actions of the subjects of the sentences and may have a copular verb or a perception verb or an action verb, along with an adjective that is modified by a degree word or affix. Some English examples are:
		           </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John is more handsome than Bill is</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue runs much faster than Mary can run</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David appears lots shorter than Michael does</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mary looks prettier than Julie looks</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John seems less certain of his answers than Sue seems</langData>
<xsl:text>.</xsl:text>
</p>
		        <p contentType="ctComparativeIntro">
<xsl:text>Some languages do not allow any part of the second sentence to be omitted and instead always have two full sentences being compared.  Also, languages which do not have a separate comparative conjunction meaning </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘than’</xsl:text>
</gloss>
<xsl:text> for the shorter comparative constructions will simply have the two sentence parts following one another in this construction.
		        </xsl:text>
</p>
		     <p contentType="ctPracticalIntro">
<xsl:text>Now consider comparatives which have two sentences surrounding the comparative conjunction, though the second sentence may be missing the adjective.
		     </xsl:text>
</p>
		     <p>
<xsl:text>In these fuller comparative constructions, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
		           <xsl:when test="//ip/@gap='yes'"> allows the adjective to be omitted in the second part. </xsl:when>
		           <xsl:when test="//ip/@gap='no'"> requires the full sentence to be repeated for the second part, including the adjective. </xsl:when>
		        </xsl:choose>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
		              <xsl:when test="//ip/@comparative='yes'"> has a comparative conjunction meaning ‘than’ which is used in both the shorter comparatives and these fuller comparatives, as shown above.</xsl:when>
		              <xsl:when test="//ip/@comparative='no'"> does not have a comparative conjunction meaning ‘than’, so this type of comparative has the two sentence parts directly following one another.</xsl:when>
		           </xsl:choose>
</p>
		        <p>
<xsl:text>Examples of these fuller comparative sentences in </xsl:text>
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
		        <example num="xIP.IPCop.IPComparatives.76">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/comparativeSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/comparativeSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/comparativeSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/comparativeSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.76</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.76.1</xsl:text>
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
<xsl:text>Superlatives are another subclass of copular sentences, directly related to comparatives. They compare a nominal phrase to a group, which may be expressed as </xsl:text>
<xsl:choose>
		           <xsl:when test="//pp/@pPos='before'">a prepositional</xsl:when>
		           <xsl:when test="//pp/@pPos='after'">a postpositional</xsl:when>
		           <xsl:when test="//pp/@pPos='both'">an adpositional</xsl:when>
		           <xsl:when test="//pp/@pPos='unknown'">an adpositional</xsl:when>
		        </xsl:choose>
<xsl:text> phrase or simply implied. Like comparatives, superlatives include whatever copula the language uses, or a perception verb, along with special superlative degree marking on the predicate adjective or nominal phrase. In some languages, the superlative degree marking may either be an independent degree word or an affix on the predicate adjective.  This is shown in the English examples: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John is the most handsome of the boys</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue is the worst runner (in the class</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David appears the tallest (of all)</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mary looks prettiest</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John seems the least certain of his answers of all my students</langData>
<xsl:text>.</xsl:text>
</p>
		     <p contentType="ctPracticalIntro">
<xsl:text>Superlatives are another subtype of copular sentences, directly related to comparatives. They compare a nominal phrase to a group, which may be expressed as </xsl:text>
<xsl:choose>
		           <xsl:when test="//pp/@pPos='before'">a prepositional</xsl:when>
		           <xsl:when test="//pp/@pPos='after'">a postpositional</xsl:when>
		           <xsl:when test="//pp/@pPos='both'">an adpositional</xsl:when>
		           <xsl:when test="//pp/@pPos='unknown'">an adpositional</xsl:when>
		        </xsl:choose>
<xsl:text> phrase or simply implied.</xsl:text>
</p>
		     
			 <p>
<xsl:text>As with comparatives in </xsl:text>
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
				<xsl:when test="//ip/@comparativeAdj='no'">there is not an affix to express the superlative degree on predicate adjectives.  A separate superlative degree word is used with both predicate adjectives and nominal phrases.</xsl:when>
				<xsl:when test="//ip/@comparativeAdj='yes'">one or more affixes express the superlative degree on predicate adjectives and one is always used with predicate adjectives in superlatives.  </xsl:when>
				<xsl:when test="//ip/@comparativeAdj='both'">one or more affixes may express the superlative degree on predicate adjectives.   However, some predicate adjectives use the affixes and some use the separate superlative degree words in superlatives.  </xsl:when>
			 </xsl:choose>
</p>
			 <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<p>
<xsl:text>The superlative degree affixes used on the predicate adjectives are:</xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//ip/@comparativeAdj)!='no'">
<example num="xIP.IPCop.IPComparatives.86">
<table border="1">
				   <tr>
					  <th>Superlative Degree Affixes</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/superlativeAffixExample),'.','')" />
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
			 <xsl:if test="normalize-space(//ip/@comparativeAdj)='no' or normalize-space(//ip/@comparativeAdj)='both'">
<p>
<xsl:text>The superlative degree words used with predicate adjectives and predicate nominals are:</xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//ip/@comparativeAdj)='yes'">
<p>
<xsl:text>The superlative degree words used with predicate nominals are:</xsl:text>
</p>
</xsl:if>
			 <example num="xIP.IPCop.IPComparatives.92">
<table border="1">
				   <tr>
					  <th>Superlative Degree Words</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/superlativeDegExample),'.','')" />
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
<xsl:text>Examples of superlative sentences in </xsl:text>
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
			 <example num="xIP.IPCop.IPComparatives.96">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/superlativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/superlativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/superlativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/superlativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.96</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.96.1</xsl:text>
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
		  </section3>

		  <section3 id="sIPExistentials">
			 <secTitle>Existentials</secTitle>

			 <p contentType="ctComparativeIntro">
<xsl:text>Existential sentences are similar to copular sentences, except that they use a word or words meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there exists</langData>
<xsl:text> along with a nominal phrase and usually a location. English examples include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>There is a book on the table</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>There are two men outside</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>There is no more food</langData>
<xsl:text>.</xsl:text>
</p>
			 <p contentType="ctComparativeIntro">
<xsl:text>Some languages instead have a separate existential verb, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hay</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> ‘there exists’</xsl:text>
</gloss>
<xsl:text> in Spanish.  Other languages have a whole set of existential verbs which express the position of the object being described.</xsl:text>
</p>
		     <p contentType="ctPracticalIntro">
<xsl:text>Existential sentences are distinguished from copular sentences by special existential verbs and/or words along with a nominal phrase and usually a location.</xsl:text>
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
<xsl:if test="normalize-space(//ip/existNone/@checked)='yes'">
<xsl:text> does not distinguish existential sentences at all.  They are exactly the same as copular sentences exemplified above in section </xsl:text>
<sectionRef sec="sIPCop" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existVerb/@checked)='no' and normalize-space(//ip/existPosition/@checked)='no'">
<xsl:text> has an independent existential word meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there exists</langData>
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='no' and normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existPosition/@checked)='no'">
<xsl:text> has one or more verbs used especially in existential sentences, and these verbs fully express the existential alone.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existPosition/@checked)='no'">
<xsl:text> has one or more verbs used especially in existential sentences, and there is also an independent existential word meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there exists</langData>
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='no' and normalize-space(//ip/existVerb/@checked)='no' and normalize-space(//ip/existPosition/@checked)='yes'">
<xsl:text> a set of existential verbs which express the position of the object.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existVerb/@checked)='no' and normalize-space(//ip/existPosition/@checked)='yes'">
<xsl:text> has an independent existential word meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there exists</langData>
<xsl:text> and a set of existential verbs which express the position of the object.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='no' and normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existPosition/@checked)='yes'">
<xsl:text> has one or more verbs used especially in existential sentences, along with a set of existential verbs which express the position of the object.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existPosition/@checked)='yes'">
<xsl:text> has one or more verbs used especially in existential sentences, and there is also an independent existential word meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there exists</langData>
<xsl:text>, along with a set of existential verbs which express the position of the object.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='no' and normalize-space(//ip/existVerb/@checked)='no' and normalize-space(//ip/existPosition/@checked)='no' and normalize-space(//ip/existOther/@checked)='yes'">
<xsl:text> marks existential sentences by ___</xsl:text>
<xsl:value-of select="//ip/existOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/existWord/@checked)='yes' and normalize-space(//ip/existOther/@checked)='yes' or normalize-space(//ip/existVerb/@checked)='yes' and normalize-space(//ip/existOther/@checked)='yes' or normalize-space(//ip/existPosition/@checked)='yes' and normalize-space(//ip/existOther/@checked)='yes'">
<xsl:text>  Existential sentences are also marked by ___</xsl:text>
<xsl:value-of select="//ip/existOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
			 <xsl:if test="normalize-space(//ip/existVerb/@checked)='yes'">
<p>
<xsl:text>The verbs used in existential sentences in </xsl:text>
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
			 <xsl:if test="normalize-space(//ip/existVerb/@checked)='yes'">
<example num="xIP.IPCop.IPExistentials.14">
<table border="1">
				   <tr>
					  <th>Existential Verbs</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/existVerbExample),'.','')" />
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
			 <xsl:if test="normalize-space(//ip/existWord/@checked)='yes'">
<p>
<xsl:text>The existential word(s) meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there exists</langData>
<xsl:text> used in existential sentences are:</xsl:text>
</p>
</xsl:if>
			 <xsl:if test="normalize-space(//ip/existWord/@checked)='yes'">
<example num="xIP.IPCop.IPExistentials.18">
<table border="1">
				   <tr>
					  <th>Existential Words</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/existWordExample),'.','')" />
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
		     <xsl:if test="normalize-space(//ip/existPosition/@checked)='yes'">
<p>
<xsl:text>The existential verbs which mark the position of the object are:</xsl:text>
</p>
</xsl:if>
		     <xsl:if test="normalize-space(//ip/existPosition/@checked)='yes'">
<example num="xIP.IPCop.IPExistentials.22">
<table border="1">
		           <tr>
		              <th>Existential Positional Verbs</th>
		              <th>Gloss</th>
		           </tr>
		           <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/existPositionExample),'.','')" />
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
		     <xsl:if test="normalize-space(//ip/existOther/@checked)='yes'">
<p>
<xsl:text>The special markers for existential sentences in </xsl:text>
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
		     <xsl:if test="normalize-space(//ip/existOther/@checked)='yes'">
<example num="xIP.IPCop.IPExistentials.26">
<table border="1">
		           <tr>
		              <th>Existential Markers</th>
		              <th>Gloss</th>
		           </tr>
		           <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/existOtherExample),'.','')" />
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
<xsl:text>Examples of existential sentences in </xsl:text>
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
			 <example num="xIP.IPCop.IPExistentials.30">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/existExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/existExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/existExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/existExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.IPExistentials.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPExistentials.30.1</xsl:text>
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

		  </section3>

	   </section2>

	   <section2 id="sIPMotion">
		  <secTitle>Intransitives and Motion Constructions</secTitle>
		  <p contentType="ctComparativeIntro">
<xsl:text>Simple intransitives do not have any complements after the verb, such as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl swims</langData>
<xsl:text>.  Many intransitives have Experiencer subjects instead of Agent subjects, such as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My sister laughed</langData>
<xsl:text>.  </xsl:text>
</p>  
	      <p contentType="ctPracticalIntro">
<xsl:text>Simple intransitives do not have any complements after the verb.  The subject may be an Agent or an Experiencer, depending on the verb.</xsl:text>
</p>  
	      <p>
<xsl:text>Examples of simple intransitive sentences in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> with an Agent subject are shown in </xsl:text>
<exampleRef num="xIntranAgentNP" equal="no" letterOnly="no" />
<xsl:text>-</xsl:text>
<exampleRef num="xIntranAgentPron" equal="no" letterOnly="no" />
<xsl:text>.  In </xsl:text>
<exampleRef num="xIntranAgentNP" equal="no" letterOnly="no" />
<xsl:text> a nominal phrase or proper name fills the subject position, while in </xsl:text>
<exampleRef num="xIntranAgentPron" equal="no" letterOnly="no" />
<xsl:text> the subject is a pronoun.</xsl:text>
</p>
		  <example num="xIntranAgentNP">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/intExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/intExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/intExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/intExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIntranAgentNP</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIntranAgentNP.1</xsl:text>
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
		  <example num="xIntranAgentPron">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnIntExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnIntExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnIntExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnIntExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIntranAgentPron</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIntranAgentPron.1</xsl:text>
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
<xsl:text>Examples with an Experiencer subject are shown in </xsl:text>
<exampleRef num="xIntranExperiencerNP" equal="no" letterOnly="no" />
<xsl:text>-</xsl:text>
<exampleRef num="xIntranExperiencerPron" equal="no" letterOnly="no" />
<xsl:text>.  In </xsl:text>
<exampleRef num="xIntranExperiencerNP" equal="no" letterOnly="no" />
<xsl:text> a nominal phrase or proper name fills the subject position, while in </xsl:text>
<exampleRef num="xIntranExperiencerPron" equal="no" letterOnly="no" />
<xsl:text> the subject is a pronoun.</xsl:text>
</p>
		  <example num="xIntranExperiencerNP">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerIntExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerIntExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerIntExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerIntExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIntranExperiencerNP</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIntranExperiencerNP.1</xsl:text>
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
		  <example num="xIntranExperiencerPron">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerPnIntExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerPnIntExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerPnIntExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerPnIntExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIntranExperiencerPron</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIntranExperiencerPron.1</xsl:text>
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
<xsl:text>Sentences with a motion verb include a location in the form of either </xsl:text>
<xsl:choose>
			          <xsl:when test="//pp/@pPos='before'">a prepositional</xsl:when>
			          <xsl:when test="//pp/@pPos='after'">a postpositional</xsl:when>
			          <xsl:when test="//pp/@pPos='both'">a prepositional or postpositional</xsl:when>
			          <xsl:when test="//pp/@pPos='unknown'">an adpositional</xsl:when>
</xsl:choose>
<xsl:text> phrase or adverb.  English examples of motion verbs include </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl ran around the track</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My mother went to the store</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My teacher came here</langData>
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>Sentences with a motion verb include a location in the form of either </xsl:text>
<xsl:choose>
	            <xsl:when test="//pp/@pPos='before'">a prepositional</xsl:when>
	            <xsl:when test="//pp/@pPos='after'">a postpositional</xsl:when>
	            <xsl:when test="//pp/@pPos='both'">a prepositional or postpositional</xsl:when>
	            <xsl:when test="//pp/@pPos='unknown'">an adpositional</xsl:when>
</xsl:choose>
<xsl:text> phrase or adverb.</xsl:text>
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
<xsl:text> examples with motion verbs include:</xsl:text>
</p>
		  <example num="xIP.IPMotion.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/motionExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/motionExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/motionExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/motionExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPMotion.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.26.1</xsl:text>
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
	   <section2 id="sIPTrans">
			<secTitle>Transitives and Ditransitives</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Examples of English transitive single-clause sentences with an Agent subject include </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The batter will hit the ball</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The dog might have buried his bone</langData>
<xsl:text>.  Examples with an Experiencer subject include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The baby wants that toy</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My daughter likes her gift</langData>
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
<xsl:text> examples of transitive sentences with an Agent subject are shown in </xsl:text>
<exampleRef num="xTranAgentNP" equal="no" letterOnly="no" />
<xsl:text>-</xsl:text>
<exampleRef num="xTranAgentPron" equal="no" letterOnly="no" />
<xsl:text>.  In </xsl:text>
<exampleRef num="xTranAgentNP" equal="no" letterOnly="no" />
<xsl:text> nominal phrases or proper names fill the subject and direct object positions, while in </xsl:text>
<exampleRef num="xTranAgentPron" equal="no" letterOnly="no" />
<xsl:text> the subject and direct object are pronouns.</xsl:text>
</p>
	      
		  <example num="xTranAgentNP">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTranAgentNP</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTranAgentNP.1</xsl:text>
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
		  <example num="xTranAgentPron">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTranAgentPron</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTranAgentPron.1</xsl:text>
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
<xsl:text>Transitive examples with an Experiencer subject are shown in </xsl:text>
<exampleRef num="xTranExperiencerNP" equal="no" letterOnly="no" />
<xsl:text>-</xsl:text>
<exampleRef num="xTranExperiencerPron" equal="no" letterOnly="no" />
<xsl:text>.  In </xsl:text>
<exampleRef num="xTranExperiencerNP" equal="no" letterOnly="no" />
<xsl:text> nominal phrases or proper names fill the subject and direct object positions, while in </xsl:text>
<exampleRef num="xTranExperiencerPron" equal="no" letterOnly="no" />
<xsl:text> the subject and direct object are pronouns.</xsl:text>
</p>
	      <example num="xTranExperiencerNP">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTranExperiencerNP</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTranExperiencerNP.1</xsl:text>
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
	      <example num="xTranExperiencerPron">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnExperiencerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnExperiencerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnExperiencerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnExperiencerExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xTranExperiencerPron</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xTranExperiencerPron.1</xsl:text>
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
<xsl:text>Ditransitives can have the second object expressed as </xsl:text>
<xsl:choose>
				   <xsl:when test="//pp/@pPos='before'">a prepositional</xsl:when>
				   <xsl:when test="//pp/@pPos='after'">a postpositional</xsl:when>
				   <xsl:when test="//pp/@pPos='both'">a prepositional or postpositional</xsl:when>
				   <xsl:when test="//pp/@pPos='unknown'">an adpositional</xsl:when>
</xsl:choose>
<xsl:text> phrase or as a nominal phrase.  Some languages, like English, allow both types via Dative Movement, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl gave the gift to her mother</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl gave her mother the gift</langData>
<xsl:text>.</xsl:text>
</p>
	      <p>
<xsl:text>In ditransitive sentences in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the second object </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@diCat='pp'">is always <xsl:choose>
					   <xsl:when test="//pp/@pPos='before'">a prepositional phrase.</xsl:when>
					   <xsl:when test="//pp/@pPos='after'">a postpositional phrase.</xsl:when>
					   <xsl:when test="//pp/@pPos='both'">a prepositional or postpositional phrase.</xsl:when>
					   <xsl:when test="//pp/@pPos='unknown'">an adpositional phrase.</xsl:when>
</xsl:choose>
						</xsl:when>
					<xsl:when test="//ip/@diCat='dp'">is always a nominal phrase.  The </xsl:when>
					<xsl:when test="//ip/@diCat='both'">can be either <xsl:choose>
					   <xsl:when test="//pp/@pPos='before'">a prepositional</xsl:when>
					   <xsl:when test="//pp/@pPos='after'">a postpositional</xsl:when>
					   <xsl:when test="//pp/@pPos='both'">a prepositional or postpositional</xsl:when>
					   <xsl:when test="//pp/@pPos='unknown'">an adpositional</xsl:when>
</xsl:choose>
						 phrase or a nominal phrase.  When both objects are nominal phrases, the </xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(//ip/@diCat)!='pp'">
					<xsl:choose>
						<xsl:when test="//ip/@diOrder='direct'">direct object</xsl:when>
						<xsl:when test="//ip/@diOrder='indirect'">indirect object</xsl:when>
					</xsl:choose>
					<xsl:text> appears closest to the verb.</xsl:text>
				</xsl:if>
</p>
			<p>
<xsl:text>  Some examples of ditransitive sentences are:</xsl:text>
</p>
			<example num="xIP.IPTrans.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/diExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/diExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/diExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/diExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPTrans.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.24.1</xsl:text>
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
	   <section2 id="sIPImp">
	      <secTitle>Imperatives</secTitle>
	      <p>
<xsl:text>Imperatives are commands.  In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, a subject </xsl:text>
<xsl:if test="normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>may be missing in imperatives, since it is assumed to be second person.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>is required in imperative sentences.</xsl:text>
</xsl:if>
<xsl:text>  Some examples of imperatives are:</xsl:text>
</p>
	      <example num="xIP.IPImp.6">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/impExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/impExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/impExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/impExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPImp.6</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPImp.6.1</xsl:text>
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
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:choose>
	         <xsl:when test="//ip/@impPolite='yes'"> also has a polite form for imperatives.  Examples are:</xsl:when>
	         <xsl:when test="//ip/@impPolite='no'"> does not have a polite form for imperatives.  </xsl:when>
	      </xsl:choose>
<xsl:text></xsl:text>
</p>
	      <xsl:if test="normalize-space(//ip/@impPolite)='yes'">
<example num="xIP.IPImp.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/impPoliteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/impPoliteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/impPoliteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/impPoliteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPImp.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPImp.10.1</xsl:text>
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
	   
	   <section2 id="sIPConditional">
	      <secTitle>Conditionals</secTitle>
	      
	      <p contentType="ctComparativeIntro">
<xsl:text>Conditionals have two parts: a condition and a consequence.  The condition is introduced by a conditional word, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>if</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>when</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>after</langData>
<xsl:text>, and is set off by a comma.  The consequence may be marked by a word meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>then</langData>
<xsl:text> in examples with the condition first.  English examples include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>If you save enough money, then you can buy that</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>After you clean your room, then you can play</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>When you eat your vegetables, then you can have dessert</langData>
<xsl:text>.  The consequence can also be presented before the condition, in which case there is no marker on the consequence, only on the condition.  English examples include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>You can buy that if you have enough money saved</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>You can play with your friends after you clean your room</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>You can have dessert when you have finished your vegetables</langData>
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>Conditionals have two parts: a condition and a consequence.  The two can appear in either order.</xsl:text>
</p>
	      
	         <p>
<xsl:text>Some examples of conditionals in </xsl:text>
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
	      <example num="xIP.IPConditional.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/conditionalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/conditionalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/conditionalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/conditionalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPConditional.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPConditional.10.1</xsl:text>
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
	      <xsl:if test="normalize-space(//ip/@conditionWord)='mood'">
<p>
<xsl:text>As the  examples show, there is no marker for the condition in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, only the conditional mood itself marked on the verb.</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@conditionWord)='yes' or normalize-space(//ip/@conditionWord)='some'">
<p>
<xsl:text>As the examples show, the condition is </xsl:text>
<xsl:choose>
	         <xsl:when test="//ip/@conditionWord='yes'">marked by independent words which occur </xsl:when>
	         <xsl:when test="//ip/@conditionWord='some'">sometimes marked by independent words which occur </xsl:when>
	      </xsl:choose>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='no' and normalize-space(//ip/conditionWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='no' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='no' and normalize-space(//ip/conditionWordAfter/@checked)='no' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='no' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='no' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordOther/@checked)='no'">
<xsl:text> the rest of the conditional phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='no' and normalize-space(//ip/conditionWordAfter/@checked)='no' and normalize-space(//ip/conditionWordBoth/@checked)='no' and normalize-space(//ip/conditionWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//ip/conditionWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/conditionWordOther/@checked)='yes' or normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/conditionWordOther/@checked)='yes' or normalize-space(//ip/conditionWordBoth/@checked)='yes' and normalize-space(//ip/conditionWordOther/@checked)='yes'">
<xsl:text> the rest of the conditional phrase and may also occur ___ </xsl:text>
<xsl:value-of select="//ip/conditionWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  The words which mark the condition are:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@conditionWord)='yes' or normalize-space(//ip/@conditionWord)='some'">
<example num="xIP.IPConditional.16">
<table border="1">
	            <tr>
	               <th>Condition words</th>
	               <th>Gloss</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/conditionWordExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' or normalize-space(//ip/@conditionWord)='some'">
<p>
<xsl:if test="normalize-space(//ip/@conditionWord)='no'">
<xsl:text>As the examples show, the condition is marked by </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/@conditionWord)='some'">
<xsl:text>The condition may also be marked by </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='no'">
<xsl:text>phrasal proclitics which attach to the front of whatever word begins the conditional phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='no'">
<xsl:text>phrasal enclitics which attach to the end of whatever word ends the conditional phrase.    </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='no'">
<xsl:text>phrasal clitics which attach either to the front of whatever word begins the conditional phrase or to the end of whatever word ends the conditional phrase.   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='no'">
<xsl:text>prefixes which attach to the main verb in the conditional phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<xsl:text>suffixes which attach to the main verb in the conditional phrase.   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<xsl:text>affixes which attach to the main verb in the conditional phrase.   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='no' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='no' or normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='no' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<xsl:text>either clitics which attach to the beginning or end of the conditional phrase, or by affixes which attach to the main verb in the conditional phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='no' and normalize-space(//ip/conditionEnclitic/@checked)='no' and normalize-space(//ip/conditionPrefix/@checked)='no' and normalize-space(//ip/conditionSuffix/@checked)='no' and normalize-space(//ip/conditionOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//ip/conditionOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/conditionPrefix/@checked)='yes' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/conditionSuffix/@checked)='yes' and normalize-space(//ip/conditionOther/@checked)='yes'">
<xsl:text>  Some also attach ___</xsl:text>
<xsl:value-of select="//ip/conditionOther" />  <xsl:text>.</xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>   
	<xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionEnclitic/@checked)='yes'">
<p>
<xsl:text>The clitics which mark the condition are:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionEnclitic/@checked)='yes'">
<example num="xIP.IPConditional.22">
<table border="1">
	            <tr>
	               <th>Condition clitics</th>
	               <th>Gloss</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/conditionCliticExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' or normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionPrefix/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<p>
<xsl:text>The affixes which mark the condition are:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionPrefix/@checked)='yes' or normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionSuffix/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionPrefix/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionSuffix/@checked)='yes'">
<example num="xIP.IPConditional.26">
<table border="1">
	            <tr>
	               <th>Condition affixes</th>
	               <th>Gloss</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/conditionAffixExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionOther/@checked)='yes'">
<p>
<xsl:text>The other elements which mark the condition in </xsl:text>
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
	      <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionOther/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionOther/@checked)='yes'">
<example num="xIP.IPConditional.30">
<table border="1">
	            <tr>
	               <th>Condition markers</th>
	               <th>Gloss</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/conditionOtherExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@conditionWord)!='mood'">
<p>
<xsl:text>The consequence part of the conditional </xsl:text>
<xsl:choose>
	         <xsl:when test="//ip/@consequence='yes'">may be marked by an independent word which is required when the conditional phrase comes first.  </xsl:when>
	         <xsl:when test="//ip/@consequence='optional'">may be marked by an independent word, but it is optional even when the conditional phrase comes first.  </xsl:when>
	         <xsl:when test="//ip/@consequence='no'">is never marked by an independent word.</xsl:when>
</xsl:choose>
<xsl:text>This word occurs </xsl:text>
<xsl:choose>
	         <xsl:when test="//ip/@consequencePos='before'">before</xsl:when>
	      <xsl:when test="//ip/@consequencePos='after'">after</xsl:when>
</xsl:choose>
<xsl:text> the rest of the consequence phrase.</xsl:text>
</p>
</xsl:if>
	      
	   </section2>
	   
	   <section2 id="sIPSubjunctive">
	      <secTitle>Subjunctives</secTitle>
	      <p contentType="ctComparativeIntro">
<xsl:text>The subjunctive mood is used to express notions that are supposed, doubted, feared or desired.  They are not currently reality.  Subjunctives are not used very much in English and the examples look something like conditionals but in first person, such as: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>If I were in charge, I would fix the problem</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>If I were a man, I would be a soccer player</langData>
<xsl:text>
	            In these examples, the subjuctive verb is </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>were</langData>
<xsl:text> and it follows the conditional word </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>if</langData>
<xsl:text>.  The consequence is normally in the future form.  The consequence can also be presented before the subjunctive condition, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would fix the problem if I were in charge</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I would like to be a soccer player if I were a man</langData>
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctComparativeIntro">
<xsl:text>Subjunctives are most commonly used in embedded clauses in many languages, following main verbs such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>demand</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>doubt</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>wish</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>fear</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hope</langData>
<xsl:text> plus the complementizer </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>that</langData>
<xsl:text>.  The embedded clause examples will be discussed further in section </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>. </xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>The subjunctive mood is used to express notions that are supposed, doubted, feared or desired.  They are not currently reality.  Subjunctives may look something like conditionals but in first person. Subjunctives are most commonly used in embedded clauses in many languages.  The embedded clause examples will be discussed in section </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>. </xsl:text>
</p>
	      <p>
<xsl:text>Some examples of main clause subjunctives in </xsl:text>
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
	      <example num="xIP.IPSubjunctive.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/subjunctiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/subjunctiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/subjunctiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/subjunctiveExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPSubjunctive.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPSubjunctive.12.1</xsl:text>
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

	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='mood'">
<p>
<xsl:text>As the examples show, there is no marker for the condition in subjunctives in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, only the subjunctive mood itself marked on the verb.</xsl:text>
</p>
</xsl:if>
	      
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some'">
<p>
<xsl:text>As the examples show, the condition in subjunctives is </xsl:text>
<xsl:choose>
	            <xsl:when test="//ip/@subjunctiveCondWord='yes'">marked by independent words which occur </xsl:when>
	            <xsl:when test="//ip/@subjunctiveCondWord='some'">sometimes marked by independent words which occur </xsl:when>
	         </xsl:choose>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='no' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='no' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='no' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='no' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='no' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='no' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordOther/@checked)='no'">
<xsl:text> the rest of the subjunctive conditional phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='no' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='no' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='no' and normalize-space(//ip/subjunctiveCondWordOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//ip/subjunctiveCondWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes' and normalize-space(//ip/subjunctiveCondWordOther/@checked)='yes'">
<xsl:text> the rest of the subjunctive conditional phrase and may also occur  ___</xsl:text>
<xsl:value-of select="//ip/subjunctiveCondWordOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>  The words which mark the condition in subjunctives are:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some'">
<example num="xIP.IPSubjunctive.18">
<table border="1">
	            <tr>
	               <th>Subjunctive Condition words</th>
	               <th>Gloss</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/subjunctiveCondWordExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' or normalize-space(//ip/@subjunctiveCondWord)='some'">
<p>
<xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no'">
<xsl:text>As the examples show, the condition in subjunctives is marked by </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='some'">
<xsl:text>The condition in subjunctives may also be marked by </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no'">
<xsl:text>phrasal proclitics which attach to the front of whatever word begins the subjunctive conditional phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no'">
<xsl:text>phrasal enclitics which attach to the end of whatever word ends the subjunctive conditional phrase.    </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no'">
<xsl:text>phrasal clitics which attach either to the front of whatever word begins the subjunctive conditional phrase or to the end of whatever word ends the subjunctive conditional phrase.   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no'">
<xsl:text>prefixes which attach to the main verb in the subjunctive conditional phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<xsl:text>suffixes which attach to the main verb in the subjunctive conditional phrase.   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<xsl:text>affixes which attach to the main verb in the subjunctive conditional phrase.   </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<xsl:text>either clitics which attach to the beginning or end of the subjunctive conditional phrase, or by affixes which attach to the main verb in the subjunctive conditional phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='no' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//ip/subjunctiveCondOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes'">
<xsl:text>  Some also attach ___</xsl:text>
<xsl:value-of select="//ip/subjunctiveCondOther" />  <xsl:text>.</xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>   
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes'">
<p>
<xsl:text>The clitics which mark the subjunctive condition are:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes'">
<example num="xIP.IPSubjunctive.24">
<table border="1">
	            <tr>
	               <th>Subjunctive Condition clitics</th>
	               <th>Gloss</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/subjunctiveCondCliticExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<p>
<xsl:text>The affixes which mark the subjunctive condition are:</xsl:text>
</p>
</xsl:if>      
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondPrefix/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondSuffix/@checked)='yes'">
<example num="xIP.IPSubjunctive.28">
<table border="1">
	            <tr>
	               <th>Subjunctive Condition affixes</th>
	               <th>Gloss</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/subjunctiveCondAffixExample),'.','')" />
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
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes'">
<p>
<xsl:text>The other elements which mark the subjunctive condition in </xsl:text>
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
	      <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondOther/@checked)='yes'">
<example num="xIP.IPSubjunctive.32">
<table border="1">
	            <tr>
	               <th>Subjunctive Condition markers</th>
	               <th>Gloss</th>
	            </tr>
	            <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/subjunctiveCondOtherExample),'.','')" />
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
	      
	   </section2>
	   
	   <section2 id="sIPPassive">
		  <secTitle>Passives</secTitle>
		  <p contentType="ctComparativeIntro">
<xsl:text>Most languages also have passive sentences, where the Theme or Patient fills the subject position.  The Agent may be optionally expressed in some languages, but is not allowed at all in others.  If expressed, it may take the form of a PP (as in English with the particular preposition </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>by</langData>
<xsl:text>) or of a nominal phrase, depending on the language.  In addition, a particular auxiliary may be required in passives (a form of </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>be</langData>
<xsl:text> in English).  English examples with and without an agent phrase, including some showing interaction with multiple auxiliaries are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The glass was broken</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The glass was broken by the child</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The ball might have been hit</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The ball might have been hit by the boy</langData>
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>In passive sentences the Theme or Patient fills the subject position.</xsl:text>
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
				<xsl:when test="//ip/@passive='no'"> does not have any passives.</xsl:when>
				<xsl:when test="//ip/@passive='yes'"> has passives as shown here:</xsl:when>
			 </xsl:choose>
</p>
	      <xsl:if test="normalize-space(//ip/@passive)='yes'">
<example num="xIP.IPPassive.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/passiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/passiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/passiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/passiveExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPPassive.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPPassive.10.1</xsl:text>
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
	      
	      <xsl:if test="normalize-space(//ip/@passive)='yes'">
<p>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@passive)='yes'">
				<xsl:text>The Agent </xsl:text>
				<xsl:choose>
				   <xsl:when test="//ip/@passiveAgent='no'">may not be expressed.</xsl:when>
				   <xsl:when test="//ip/@passiveAgent='yes'">may be expressed</xsl:when>
				</xsl:choose>
				<xsl:text></xsl:text>
				<xsl:if test="normalize-space(//ip/@passiveAgent)='yes'">
				   <xsl:text> as </xsl:text>
				   <xsl:choose>
					  <xsl:when test="//ip/@passiveAgentCat='pp'">
						 <xsl:choose>
							<xsl:when test="//pp/@pPos='before'">a prepositional phrase.</xsl:when>
							<xsl:when test="//pp/@pPos='after'">a postpositional phrase.</xsl:when>
							<xsl:when test="//pp/@pPos='both'">a prepositional or postpositional phrase.</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">an adpositional phrase.</xsl:when>
</xsl:choose>
</xsl:when>
					  <xsl:when test="//ip/@passiveAgentCat='dp'">nominal phrase.</xsl:when>
				   </xsl:choose>
				   <xsl:text></xsl:text>
				</xsl:if>
				<xsl:text>  A particular auxiliary </xsl:text>
				<xsl:choose>
				   <xsl:when test="//ip/@passiveAux='no'">is not</xsl:when>
				   <xsl:when test="//ip/@passiveAux='yes'">is</xsl:when>
				</xsl:choose>
				<xsl:text> required in passive sentences.</xsl:text>
			 </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp'">
<p>
<xsl:text>The </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">preposition</xsl:when>
				<xsl:when test="//pp/@pPos='after'">postposition</xsl:when>
				<xsl:when test="//pp/@pPos='both'">preposition or postposition</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">adposition</xsl:when>
</xsl:choose>
<xsl:text> used to mark the Agent phrase in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is:</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp'">
<example num="xIP.IPPassive.16">
<table border="1">
				<tr>
				   <th>Agent marker</th>
				   <th>Gloss</th>
				</tr>
				<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/passiveAgentPExample),'.','')" />
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
		  <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes'">
<p>
<xsl:text>The auxiliary used in passives in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is:</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAux)='yes'">
<example num="xIP.IPPassive.20">
<table border="1">
				<tr>
				   <th>Passive Auxiliary</th>
				   <th>Gloss</th>
				</tr>
				<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/passiveAuxExample),'.','')" />
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

	   </section2>
	   <xsl:if test="normalize-space(//ip/@antipassive)='yes'">
<section2 id="sIPAntipassives">
		  <secTitle>Antipassives</secTitle>
		  <p contentType="ctComparativeIntro">
<xsl:text>Instead of promoting the object to subject as a passive does, antipassive is a verb voice that deletes the object of transitive verbs. Antipassives are found most often in languages with an ergative-absolutive case system, where the deletion of the object changes the subject from ergative case to absolutive case. It is also found in some languages with a nominative-accusative case system where there is verbal agreement with both the subject and object. In these languages, the antipassive is usually formed by deleting the object agreement affix. Most languages with the antipassive voice are Australian Aboriginal or Native American languages. </xsl:text>
</p>
		  <p contentType="ctComparativeIntro">
<xsl:text>Similarly to the subject or Agent in passives, some languages allow the object or Patient to be optionally expressed in a prepositional or postpositional phrase.</xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>Instead of promoting the object to subject as a passive does, antipassive is a verb voice that deletes the object of transitive verbs.</xsl:text>
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
<xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='no' or normalize-space(//typology/@case)='split' and normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='no'">
<xsl:text> the subject of a transitive verb changes to absolutive case when the object is deleted in antipassives. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='no' and normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveAffix/@checked)='no'">
<xsl:text> the object agreement affix on the verb is deleted to signal an antipassive. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='no' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<xsl:text> there is a verbal affix for antipassive that signals the change in grammatical roles. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveAffix/@checked)='no'">
<xsl:text> the subject of a transitive verb changes to absolutive case when the object is deleted in antipassives and the object agreement affix on the verb is deleted to signal an antipassive. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<xsl:text> the subject of a transitive verb changes to absolutive case when the object is deleted in antipassives and there is a verbal affix for antipassive that signals the change in grammatical roles. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<xsl:text> the subject of a transitive verb changes to absolutive case when the object is deleted in antipassives and the object agreement affix on the verb is deleted to signal an antipassive and there is a verbal affix for antipassive that signals the change in grammatical roles. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='no' and normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<xsl:text> the object agreement affix on the verb is deleted to signal an antipassive and there is a verbal affix for antipassive that signals the change in grammatical roles. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='no' and normalize-space(//ip/antipassiveAgr/@checked)='no' and normalize-space(//ip/antipassiveAffix/@checked)='no' and normalize-space(//ip/antipassiveOther/@checked)='yes'">
<xsl:text> antipassives are expressed by ___</xsl:text>
<xsl:value-of select="//ip/antipassiveOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/antipassiveErg/@checked)='yes' and normalize-space(//ip/antipassiveOther/@checked)='yes' or normalize-space(//ip/antipassiveAgr/@checked)='yes' and normalize-space(//ip/antipassiveOther/@checked)='yes' or normalize-space(//ip/antipassiveAffix/@checked)='yes' and normalize-space(//ip/antipassiveOther/@checked)='yes'">
<xsl:text> Antipassives may also be expressed by ___</xsl:text>
<xsl:value-of select="//ip/antipassiveOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
	      <xsl:if test="normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<p>
<xsl:text>The antipassive affix is:</xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/antipassiveAffix/@checked)='yes'">
<example num="xIP.IPAntipassives.14">
<table border="1">
				<tr>
				   <th>Antipassive Affix</th>
				   <th>Gloss</th>
				</tr>
				<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/antipassiveAffixExample),'.','')" />
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
<xsl:text>Examples of antipassives in </xsl:text>
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
		  <example num="xIP.IPAntipassives.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/antipassiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/antipassiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/antipassiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/antipassiveExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPAntipassives.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPAntipassives.18.1</xsl:text>
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


	   <xsl:if test="normalize-space(//ip/@voice)='yes'">
<section2 id="sIPVoice">
		  <secTitle>Other Voice Changes</secTitle>
		  <p contentType="ctComparativeIntro">
<xsl:text>Some languages, such as Tagalog and other Austronesian languages, have affixes on the verb which help define the roles and relationships of the nominal phrases in the sentence.  This is a voice change like passive in that it gives emphasis to a particular nominal phrase.  The verbal affix marks which nominal phrase is prominent, and may involve a change in word order and/or case marking.  For example, in Tagalog the voice marker reflects the role of the nominative argument. </xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>Other affixes on the verb may indicate a voice change similar to passive in that it gives emphasis to a particular nominal phrase. The verbal affix marks which nominal phrase is prominent, and may involve a change in word order and/or case marking.</xsl:text>
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
			 <xsl:when test="//ip/@voiceCase='no'">the voice changes are indicated by word order changes instead of by case marking.</xsl:when>
			 <xsl:when test="//ip/@voiceCase='yesNom'">when a specific voice affix occurs on the verb, the corresponding nominal phrase is mrked with nominative case.</xsl:when>
	         <xsl:when test="//ip/@voiceCase='yesAbs'">when a specific voice affix occurs on the verb, the corresponding nominal phrase is mrked with absolutive case.</xsl:when>
		  </xsl:choose>
<xsl:text>  The following table shows the verbal affixes used to indicate the voice of the sentence:</xsl:text>
</p>
		  <example num="xIP.IPVoice.10">
<table border="1">
				<caption>
				   <xsl:text>Voice affixes on verbs</xsl:text>
				</caption>
				<tr>
				   <th>Voice type</th>
				   <th>
					  Affixes
				   </th>
				</tr>
				<xsl:variable name="sExampleValue0.1">
<xsl:value-of select="translate(string(//ip/actorVoice),'.','')" />
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
					  <xsl:text>Actor or Active</xsl:text>
				   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
					  <xsl:text>Actor or Active</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue1.1">
<xsl:value-of select="translate(string(//ip/objectVoice),'.','')" />
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
					  <xsl:text>Object, Patient, Theme or Conveyance</xsl:text>
				   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
					  <xsl:text>Object, Patient, Theme or Conveyance</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue2.1">
<xsl:value-of select="translate(string(//ip/dativeVoice),'.','')" />
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
<td align="left">
					  <xsl:text>Dative</xsl:text>
				   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
					  <xsl:text>Dative</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue3.1">
<xsl:value-of select="translate(string(//ip/locativeVoice),'.','')" />
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
<td align="left">
					  <xsl:text>Locative</xsl:text>
				   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
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
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue4.1">
<xsl:value-of select="translate(string(//ip/instrumentalVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.1" select="string-length(normalize-space($sExampleValue4.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.1 != 0 and $sExampleValue4.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
					  <xsl:text>Instrumental</xsl:text>
				   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
					  <xsl:text>Instrumental</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				<xsl:variable name="sExampleValue5.1">
<xsl:value-of select="translate(string(//ip/goalVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.1" select="string-length(normalize-space($sExampleValue5.1))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.1 != 0 and $sExampleValue5.1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.1" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
					  <xsl:text>Goal</xsl:text>
				   </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
					  <xsl:text>Goal</xsl:text>
				   </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
			 </table>
</example>
		  <p>
<xsl:text>Some examples of sentences showing changes in this type of voice marking are:</xsl:text>
</p>
		  <example num="xIP.IPVoice.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/voiceExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/voiceExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/voiceExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/voiceExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPVoice.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPVoice.14.1</xsl:text>
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

	   <section2 id="sIPCausatives">
		  <secTitle>Causatives</secTitle>
		  <p contentType="ctComparativeIntro">
<xsl:text>Causatives add an additional argument to the sentence. Some languages have single-clause causative sentences, where the verb is marked with an affix that introduces the additional argument. That is the type of construction addressed in this section.  English and Spanish only have syntactic causatives which consist of two clauses, such as: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My mother made me clean my room</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The other girl caused us to break up</langData>
<xsl:text>.  This second type of causative will be handled more fully in section </xsl:text>
<sectionRef sec="sCompCausative" />
<xsl:text>.</xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>Causatives add an additional argument to the sentence. In single-clause causative sentences, the verb is marked with an affix that introduces the additional argument. That is the type of construction addressed here.  Syntactic causatives consisting of two clauses will be handled more fully in section </xsl:text>
<sectionRef sec="sCompCausative" />
<xsl:text>.</xsl:text>
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
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes' and normalize-space(//ip/causativeMake/@checked)='no'">
<xsl:text>there is a verbal affix for causative that introduces an additional argument. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='no' and normalize-space(//ip/causativeMake/@checked)='yes'">
<xsl:text>there is not any causative verbal affix.  Causative sentences consist of two clauses with a main verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>make</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cause</langData>
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes' and normalize-space(//ip/causativeMake/@checked)='yes'">
<xsl:text>there is a verbal affix for causative that introduces an additional argument and causative sentences may also consist of two clauses with a main verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>make</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>cause</langData>
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='no' and normalize-space(//ip/causativeMake/@checked)='no' and normalize-space(//ip/causativeOther/@checked)='yes'">
<xsl:text>there is not any causative verbal affix.  Causatives are expressed by  ___</xsl:text>
<xsl:value-of select="//ip/causativeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes' and normalize-space(//ip/causativeOther/@checked)='yes' or normalize-space(//ip/causativeMake/@checked)='yes' and normalize-space(//ip/causativeOther/@checked)='yes'">
<xsl:text> Causatives may also be expressed by ___</xsl:text>
<xsl:value-of select="//ip/causativeOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
	      <xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<p>
<xsl:text>The causative affixes are:</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<example num="xIP.IPCausatives.12">
<table border="1">
				<tr>
				   <th>Causative Affixes</th>
				   <th>Gloss</th>
				</tr>
				<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/causativeAffixExample),'.','')" />
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
		  <xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<p>
<xsl:text>Some examples of single-clause causative sentences using the causative affixes are: </xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//ip/causativeAffix/@checked)='yes'">
<example num="xIP.IPCausatives.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/causativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/causativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/causativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/causativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCausatives.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCausatives.16.1</xsl:text>
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
	      <xsl:if test="normalize-space(//ip/causativeMake/@checked)='yes'">
<p>
<xsl:text>Some examples of syntactic causative sentences consisting of two clauses are: </xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/causativeMake/@checked)='yes'">
<example num="xIP.IPCausatives.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/causativeMakeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/causativeMakeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/causativeMakeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/causativeMakeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCausatives.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCausatives.20.1</xsl:text>
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
	      <xsl:if test="normalize-space(//ip/causativeOther/@checked)='yes'">
<p>
<xsl:text>Some examples of the other type of causative sentences allowed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are: </xsl:text>
</p>
</xsl:if>
	      <xsl:if test="normalize-space(//ip/causativeOther/@checked)='yes'">
<example num="xIP.IPCausatives.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/causativeOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/causativeOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/causativeOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/causativeOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCausatives.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCausatives.24.1</xsl:text>
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
		<xsl:if test="normalize-space(//ip/@applicative)='yes'">
<section2 id="sIPApplicatives">
			<secTitle>Applicatives</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Some languages have an additional applicative construction.  Applicative is a verb voice that promotes an oblique argument of the verb to the object argument, and indicates the oblique role within the meaning of the verb.  An intransitive verb becomes transitive and a transitive verb becomes ditransitive when the applicative affix is added.  This is in contrast to expressing these arguments with adpositions.</xsl:text>
</p>
			<p contentType="ctComparativeIntro">
<xsl:text>Applicatives may be used for comitative, locative, instrumental and benefactive roles.  Some languages allow more than one applicative in a single verb.</xsl:text>
</p>
			<p contentType="ctPracticalIntro">
<xsl:text>Applicative is a verb voice that promotes an oblique argument of the verb to the object argument, and indicates the oblique role within the meaning of the verb.  An intransitive verb becomes transitive and a transitive verb becomes ditransitive when the applicative affix is added.</xsl:text>
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
<xsl:text>, the affixes used to mark applicatives are:</xsl:text>
</p>
			<example num="xIP.IPApplicatives.12">
<table border="1">
					<tr>
						<th>Applicative Affix</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/applicativeVoice),'.','')" />
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
<xsl:text>Examples of applicatives in </xsl:text>
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
			<example num="xIP.IPApplicatives.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/applicativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/applicativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/applicativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/applicativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPApplicatives.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPApplicatives.16.1</xsl:text>
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
