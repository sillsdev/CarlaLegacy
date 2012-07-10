<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ip">
	<section1 id="sIP">
		<secTitle>Basic Sentences</secTitle>
		<p>
<xsl:text>This section covers copular, intransitive, transitive, ditransitive and passive sentences in their basic word order (i.e. not changed by focus, topic, interrogative, or negation constructions).  As noted in section </xsl:text>
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
<xsl:text>Copular constructions include those with a copular verb, if required, or with a perception verb, plus comparatives and existentials.  Each will be discussed in turn.</xsl:text>
</p>
		  <p>
<xsl:text>True copular sentences can have an adjective, prepositional or postpositional phrase, or nominal phrase following the copular verb.  Some languages do not require a copular verb or auxiliary to be present.  English examples include </xsl:text>
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
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> copular sentences, </xsl:text>
<xsl:choose>
				<xsl:when test="//ip/@copular='yes'">a copular verb is required.</xsl:when>
				<xsl:when test="//ip/@copular='yesOptional'">a copular verb is optional, and no auxiliary is required either.</xsl:when>
				<xsl:when test="//ip/@copular='yesAux'">a copular verb is optional, but an auxiliary is required if the copular verb is not present.</xsl:when>
				<xsl:when test="//ip/@copular='noAux'">there is no copular verb, but an auxiliary is required.</xsl:when>
				<xsl:when test="//ip/@copular='noNeither'">neither a copular verb nor an auxiliary is used.</xsl:when>
			 </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@copular)='noNeither' or normalize-space(//ip/@copular)='yesOptional'">
				<xsl:text>  There is </xsl:text>
				<xsl:choose>
				   <xsl:when test="//ip/@copularAffix='no'">not any copular affix on the predicate nominal or predicate adjective either</xsl:when>
				   <xsl:when test="//ip/@copularAffix='yesPrefix'">a copular prefix on the predicate nominal or predicate adjective, however</xsl:when>
				   <xsl:when test="//ip/@copularAffix='yesSuffix'">a copular suffix on the predicate nominal or predicate adjective, however</xsl:when>
				   <xsl:when test="//ip/@copularAffix='yesEither'">either a copular prefix or suffix on the predicate nominal or predicate adjective, however</xsl:when>
				</xsl:choose>
				<xsl:text></xsl:text>
			 </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@copular)='noNeither'">
				<xsl:text>.</xsl:text>
			 </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@copular)='yesOptional'">
				<xsl:text>, that occurs when there is no copular verb present.</xsl:text>
			 </xsl:if>
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
		  <example num="xIP.IPCop.12">
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
<xsl:with-param name="sExNumber">xIP.IPCop.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.12.1</xsl:text>
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
<xsl:text>In contrast to copular verbs, perception verbs usually only allow an adjective phrase following them, except in superlative constructions where a nominal phrase follows a perception verb, as shown in the next section.  Some English examples with perception verbs include:</xsl:text>
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
		  <example num="xIP.IPCop.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/perceptionExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/perceptionExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/perceptionExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/perceptionExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xIP.IPCop.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.18.1</xsl:text>
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
<xsl:text>Both copular and perception verbs can also occur with an adjectival clause complement, where a sentence or complement clause follows the adjective.  These constructions will be covered in section </xsl:text>
<sectionRef sec="sCompRaising" />
<xsl:text>.
		  </xsl:text>
</p>
		  <section3 id="sIPComparatives">
			 <secTitle>Comparatives and Superlatives</secTitle>
			 <p>
<xsl:text>Comparatives are a subtype of copular sentences. We will consider two types which rate two parts as equal, then comparatives where one part is better than the other, then superlatives. All of these types may normally use either a copular verb or a perception verb. </xsl:text>
</p>
			 <p>
<xsl:text>Comparison of equals can use a noun or an adjective for comparison. The noun equality construction uses a formula meaning ‘is the same </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>Noun</xsl:text>
</gloss>
<xsl:text> as’ between two nominal phrases. Some English examples are: </xsl:text>
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
				<xsl:when test="//ip/@same='yes'"> has a comparative degree word meaning ‘same’ which is used with the noun of comparison in sentences involving comparison of equals, as shown in the following chart.</xsl:when>
				<xsl:when test="//ip/@same='attaches'"> attaches an affix or clitic meaning ‘same’ to the noun of comparison in sentences involving comparison of equals, as shown in the following chart.</xsl:when>
				<xsl:when test="//ip/@same='no'"> does not have a comparative degree word meaning ‘same’.  Only the presence of the two nominal phrases and the noun of comparison with the copular predicate occur in sentences involviong comparison of  equals.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@same)='yes'">
<example num="xIP.IPCop.IPComparatives.10">
<table border="1">
				   <tr>
					  <th>Equal Noun Comparative DegreeWord</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/sameWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<example num="xIP.IPCop.IPComparatives.12">
<table border="1">
				   <tr>
					  <th>Equal Noun Comparative Degree Affix or Clitic</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/sameAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<example num="xIP.IPCop.IPComparatives.16">
<table border="1">
				   <tr>
					  <th>Equal Noun Comparative Conjunction</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/compareNExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
			 <example num="xIP.IPCop.IPComparatives.20">
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
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.20.1</xsl:text>
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
<xsl:text>The second type of comparison of equals uses an adjective for comparison. This construction uses a formula meaning ‘is as </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>Adjective</xsl:text>
</gloss>
<xsl:text> as’ between the two nominal phrases. Some English examples are: </xsl:text>
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
				<xsl:when test="//ip/@as='yes'"> has a comparative degree word meaning ‘as’ which is used with the adjective of comparison in sentences involving comparison of equals, as shown in the following chart.</xsl:when>
				<xsl:when test="//ip/@as='no'"> does not have a comparative degree word meaning ‘as’.  Its meaning is simply implied in the adjective of comparison sentences involving comparison of equals.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@as)='yes'">
<example num="xIP.IPCop.IPComparatives.26">
<table border="1">
				   <tr>
					  <th>Equal Adjective Comparative Degree Word</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/asWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
				<xsl:when test="//ip/@compareAdj='yes'"> uses the following comparative conjunction meaning ‘as’ before the second nominal phrase in sentences involving comparison of equal qualitative adjectives:</xsl:when>
				<xsl:when test="//ip/@compareAdj='no'"> does not have any comparative conjunction meaning ‘as’ before the second nominal phrase in sentences involving comparison of equal qualitative adjectives.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@compareAdj)='yes'">
<example num="xIP.IPCop.IPComparatives.30">
<table border="1">
				   <tr>
					  <th>Equal Adjective Comparative Conjunction</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/compareAdjExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
			 <example num="xIP.IPCop.IPComparatives.34">
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
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.34.1</xsl:text>
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
<xsl:text>Comparatives where one part is better than the other compare two nominal phrases using a comparative word meaning ‘than’, and include whatever copula the language uses, or a perception verb.  Degree marking occurs with the predicate adjective or nominal phrase.  In some languages, this degree marking may either be an independent degree word or an affix on the predicate adjective, as shown in the English examples: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John is more handsome than Bill</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue is a better runner than Mary</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>David appears taller than Michael</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mary looks prettier than Julie</langData>
<xsl:text>.</xsl:text>
</p>
			 <p>
<xsl:text>Note that there is an implied copula following the final nominal phrase in the English examples. A more complex type of comparative has an overt sentence in the place of the second noun phrase. These will be covered in section </xsl:text>
<sectionRef sec="sCoordComparative" />
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
<xsl:choose>
				<xsl:when test="//ip/@comparative='yes'"> has a comparative conjunction meaning ‘than’ which is used in comparatives where one part is better than the other, as shown in the following chart.</xsl:when>
				<xsl:when test="//ip/@comparative='no'"> does not have a comparative conjunction meaning ‘than’.  Only the presence of the two noun phrases and the degree word with the copular predicate signal a comparative where one part is better than the other.</xsl:when>
			 </xsl:choose>
</p>

			 <xsl:if test="normalize-space(//ip/@comparative)='yes'">
<example num="xIP.IPCop.IPComparatives.42">
<table border="1">
				   <tr>
					  <th>Comparative Conjunction</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/comparativeWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<example num="xIP.IPCop.IPComparatives.48">
<table border="1">
				   <tr>
					  <th>Comparative Degree Affixes</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/comparativeAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
			 <example num="xIP.IPCop.IPComparatives.54">
<table border="1">
				   <tr>
					  <th>Comparative Degree Words</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/comparativeDegExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
			 <example num="xIP.IPCop.IPComparatives.58">
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
<xsl:with-param name="sExNumber">xIP.IPCop.IPComparatives.58</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPComparatives.58.1</xsl:text>
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
<xsl:text>Superlatives are another subtype of copular sentences, directly related to comparatives. They compare a nominal phrase to a group, which may be expressed as a prepositional or postpositional phrase or simply implied. Like comparatives, superlatives include whatever copula the language uses, or a perception verb, along with special superlative degree marking on the predicate adjective or nominal phrase. In some languages, the superlative degree marking may either be an independent degree word or an affix on the predicate adjective.  This is shown in the English examples: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John is the most handsome of the boys</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Sue is the best runner (in the class</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Mary looks prettiest</langData>
<xsl:text>.</xsl:text>
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
<example num="xIP.IPCop.IPComparatives.66">
<table border="1">
				   <tr>
					  <th>Superlative Degree Affixes</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/superlativeAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
			 <example num="xIP.IPCop.IPComparatives.72">
<table border="1">
				   <tr>
					  <th>Superlative Degree Words</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/superlativeDegExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
			 <example num="xIP.IPCop.IPComparatives.76">
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
		  </section3>

		  <section3 id="sIPExistentials">
			 <secTitle>Existentials</secTitle>

			 <p>
<xsl:text>Existential sentences are similar to copular sentences, except that they use a word or words meaning </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘there is’</xsl:text>
</gloss>
<xsl:text> or </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘there exists’</xsl:text>
</gloss>
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
			 <p>
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
				<xsl:when test="//ip/@existVerb='yes'"> has one or more verbs used especially in existential sentences, and there is also a separate existential word meaning ‘there’ or ‘there exists’.</xsl:when>
				<xsl:when test="//ip/@existVerb='yesOnly'"> has one or more verbs used especially in existential sentences, and these verbs fully express the existential alone, like ‘hay’ in Spanish.</xsl:when>
				<xsl:when test="//ip/@existVerb='noCop'"> does not have special verbs for existential sentences.  The normal copula is used, along with a separate existential word meaning ‘there’ or ‘there exists’.</xsl:when>
				<xsl:when test="//ip/@existVerb='no'"> does not use any verb in existential sentences.  Only the separate existential word meaning ‘there’ or ‘there exists’ is used for existential sentences.</xsl:when>
			 </xsl:choose>
<xsl:text>  </xsl:text>
</p>
			 <xsl:if test="normalize-space(//ip/@existVerb)='yes' or normalize-space(//ip/@existVerb)='yesOnly'">
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
			 <xsl:if test="normalize-space(//ip/@existVerb)='yes' or normalize-space(//ip/@existVerb)='yesOnly'">
<example num="xIP.IPCop.IPExistentials.12">
<table border="1">
				   <tr>
					  <th>Existential Verbs</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/existVerbExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
			 <xsl:if test="normalize-space(//ip/@existVerb)!='yesOnly'">
<p>
<xsl:text>The existential word(s) meaning </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘there’</xsl:text>
</gloss>
<xsl:text> or </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘there exists’</xsl:text>
</gloss>
<xsl:text> used in existential sentences in </xsl:text>
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
			 <xsl:if test="normalize-space(//ip/@existVerb)!='yesOnly'">
<example num="xIP.IPCop.IPExistentials.16">
<table border="1">
				   <tr>
					  <th>Existential Words</th>
					  <th>Gloss</th>
				   </tr>
				   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/existWordExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
			 <example num="xIP.IPCop.IPExistentials.20">
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
<xsl:with-param name="sExNumber">xIP.IPCop.IPExistentials.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCop.IPExistentials.20.1</xsl:text>
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
		  <p>
<xsl:text>Simple intransitives do not have any complements after the verb, such as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The girl swims</langData>
<xsl:text>.  Motion verbs include a location in the form of either a </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
				<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
				<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
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
<xsl:text> with an Agent nominal phrase or proper name in the subject position include:</xsl:text>
</p>
		  <example num="xIP.IPMotion.8">
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
<xsl:with-param name="sExNumber">xIP.IPMotion.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.8.1</xsl:text>
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
<xsl:text>Examples of simple intransitive sentences in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> with an independent Agent pronoun in the subject position include:</xsl:text>
</p>
		  <example num="xIP.IPMotion.12">
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
<xsl:with-param name="sExNumber">xIP.IPMotion.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.12.1</xsl:text>
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
<xsl:text>Examples of simple intransitive sentences in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> with an Experiencer nominal phrase or proper name in the subject position include:</xsl:text>
</p>
		  <example num="xIP.IPMotion.16">
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
<xsl:with-param name="sExNumber">xIP.IPMotion.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.16.1</xsl:text>
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
<xsl:text>Examples of simple intransitive sentences in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> with an independent Experiencer pronoun in the subject position include:</xsl:text>
</p>
		  <example num="xIP.IPMotion.20">
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
<xsl:with-param name="sExNumber">xIP.IPMotion.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.20.1</xsl:text>
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
		  <xsl:if test="normalize-space(//typology/@case)='none'">
<p>
<xsl:text>There is no distinction between the nominal phrases nor the pronouns used for Agent subjects and Experiencer subjects in the examples above, since </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> does not have a case system.</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split'">
<p>
<xsl:text>The examples above verify that </xsl:text>
<xsl:choose>
			 <xsl:when test="//typology/@case='split'">in most constructions </xsl:when>
		  </xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='no'">both Agent and Experiencer subjects use the same nominative </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesObj'">Agent subjects are nominative case while Experiencer subjects use the accusative </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesDat'">Agent subjects are nominative case while Experiencer subjects use the dative </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//np/@caseN='no'">pronouns for intransitive verbs. </xsl:when>
				<xsl:when test="//np/@caseN='yes'">case markers and pronouns for intransitive verbs. </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='yesObj'"> (There is no distinct datve case.)</xsl:when>
</xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@case='split'"> Under certain grammatical conditions, the case system switches to ergative-absolutive, where the normal case of subjects of intransitive verbs is absolutive. </xsl:when>
			 </xsl:choose>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)='ergative'">
<p>
<xsl:text>The examples above verify that </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='no'">both Agent and Experiencer subjects use the same absolutive </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesObj'">both Agent and Experiencer subjects use the same absolutive </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesDat'">Agent subjects are absolutive case while Experiencer subjects use the dative </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//np/@caseN='no'">pronouns for intransitive verbs. </xsl:when>
				<xsl:when test="//np/@caseN='yes'">case markers and pronouns for intransitive verbs. </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='yesObj'"> (There is no distinct datve case.)</xsl:when>
</xsl:choose>
</p>
</xsl:if>
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
		  <example num="xIP.IPMotion.30">
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
<xsl:with-param name="sExNumber">xIP.IPMotion.30</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPMotion.30.1</xsl:text>
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
			<p>
<xsl:text>Examples of English transitive single-clause sentences include </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The batter will hit the ball</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My baby wants that toy</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The dog might have buried his bone</langData>
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
<xsl:text> examples of transitive sentences with an Agent subject which have proper names or nominal phrases in the subject and object positions include:</xsl:text>
</p>
		  <example num="xIP.IPTrans.8">
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
<xsl:with-param name="sExNumber">xIP.IPTrans.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.8.1</xsl:text>
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
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples of transitive sentences with an Agent subject which have pronouns in the subject and object positions include:</xsl:text>
</p>
		  <example num="xIP.IPTrans.12">
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
<xsl:with-param name="sExNumber">xIP.IPTrans.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.12.1</xsl:text>
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
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples of transitive sentences with an Experiencer subject which have proper names or nominal phrases in the subject and object positions include:</xsl:text>
</p>
		  <example num="xIP.IPTrans.16">
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
<xsl:with-param name="sExNumber">xIP.IPTrans.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.16.1</xsl:text>
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
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples of transitive sentences with an Experiencer subject which have pronouns in the subject and object positions include:</xsl:text>
</p>
		  <example num="xIP.IPTrans.20">
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
<xsl:with-param name="sExNumber">xIP.IPTrans.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.20.1</xsl:text>
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
		  <xsl:if test="normalize-space(//typology/@case)='none'">
<p>
<xsl:text>There is no distinction between the nominal phrases nor the pronouns used for Agent subjects and Experiencer subjects in the examples above, since </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> does not have a case system.</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split'">
<p>
<xsl:text>The examples above verify that </xsl:text>
<xsl:choose>
			 <xsl:when test="//typology/@case='split'">in most constructions </xsl:when>
		  </xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='no'">both Agent and Experiencer subjects use the same nominative </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesObj'">Agent subjects are nominative case while Experiencer subjects use the accusative </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesDat'">Agent subjects are nominative case while Experiencer subjects use the dative </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//np/@caseN='no'">pronouns for transitive verbs. </xsl:when>
				<xsl:when test="//np/@caseN='yes'">case markers and pronouns for transitive verbs. </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='yesObj'"> (There is no distinct datve case.)</xsl:when>
</xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@case='split'"> Under certain grammatical conditions, the case system switches to ergative-absolutive, where the normal case of subjects of transitive verbs is ergative. </xsl:when>
			 </xsl:choose>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)='ergative'">
<p>
<xsl:text>The examples above verify that </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='no'">both Agent and Experiencer subjects use the same ergative </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesObj'">Agent subjects are ergative case while Experiencer subjects use the absolutive </xsl:when>
				<xsl:when test="//typology/@caseExperiencer='yesDat'">Agent subjects are absolutive case while Experiencer subjects use the dative </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//np/@caseN='no'">pronouns for transitive verbs. </xsl:when>
				<xsl:when test="//np/@caseN='yes'">case markers and pronouns for transitive verbs. </xsl:when>
			 </xsl:choose>
<xsl:choose>
				<xsl:when test="//typology/@caseExperiencer='yesObj'"> (There is no distinct datve case.)</xsl:when>
</xsl:choose>
</p>
</xsl:if>
		  <p>
<xsl:text>Ditransitives can have the second object expressed as a </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
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
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the second object in a ditransitive </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@diCat='pp'">is always a
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional phrase.</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional phrase.</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional phrase.</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional phrase.</xsl:when>
</xsl:choose>
						</xsl:when>
					<xsl:when test="//ip/@diCat='dp'">is always a nominal phrase.  The </xsl:when>
					<xsl:when test="//ip/@diCat='both'">can be either a
						<xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
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
<xsl:text>  Examples of ditransitive sentences in </xsl:text>
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
			<example num="xIP.IPTrans.34">
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
<xsl:with-param name="sExNumber">xIP.IPTrans.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPTrans.34.1</xsl:text>
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
	   <section2 id="sIPPassive">
		  <secTitle>Passives</secTitle>
		  <p>
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
				<xsl:when test="//ip/@passive='yes'"> has passives</xsl:when>
			 </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@passive)='yes'">
				<xsl:text> in which the Agent </xsl:text>
				<xsl:choose>
				   <xsl:when test="//ip/@passiveAgent='no'">may not be expressed.</xsl:when>
				   <xsl:when test="//ip/@passiveAgent='yes'">may be expressed</xsl:when>
				</xsl:choose>
				<xsl:text></xsl:text>
				<xsl:if test="normalize-space(//ip/@passiveAgent)='yes'">
				   <xsl:text> as a </xsl:text>
				   <xsl:choose>
					  <xsl:when test="//ip/@passiveAgentCat='pp'">
						 <xsl:choose>
							<xsl:when test="//pp/@pPos='before'">prepositional phrase.</xsl:when>
							<xsl:when test="//pp/@pPos='after'">postpositional phrase.</xsl:when>
							<xsl:when test="//pp/@pPos='both'">prepositional or postpositional phrase.</xsl:when>
							<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional phrase.</xsl:when>
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
		  <xsl:if test="normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp'">
<p>
<xsl:text>The </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">preposition</xsl:when>
				<xsl:when test="//pp/@pPos='after'">postposition</xsl:when>
				<xsl:when test="//pp/@pPos='both'">preposition or postposition</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">preposition or postposition</xsl:when>
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
<example num="xIP.IPPassive.10">
<table border="1">
				<tr>
				   <th>Agent marker</th>
				   <th>Gloss</th>
				</tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/passiveAgentPExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<example num="xIP.IPPassive.14">
<table border="1">
				<tr>
				   <th>Passive Auxiliary</th>
				   <th>Gloss</th>
				</tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/passiveAuxExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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

		  <xsl:if test="normalize-space(//ip/@passive)='yes'">
<p>
<xsl:text>Examples of passive sentences in </xsl:text>
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
		  <xsl:if test="normalize-space(//ip/@passive)='yes'">
<example num="xIP.IPPassive.18">
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
<xsl:with-param name="sExNumber">xIP.IPPassive.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPPassive.18.1</xsl:text>
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
	   <xsl:if test="normalize-space(//ip/@antipassive)!='no'">
<section2 id="sIPAntipassives">
		  <secTitle>Antipassives</secTitle>
		  <p>
<xsl:text>Instead of promoting the object to subject as a passive does, antipassive is a verb voice that deletes the object of transitive verbs. Antipassives are found most often in languages with an ergative-absolutive case system, where the deletion of the object changes the subject from ergative case to absolutive case. It is also found in some languages with a nominative-accusative case system where there is verbal agreement with both the subject and object. In these languages, the antipassive is usually formed by deleting the object agreement affix. Most languages with the antipassive voice are Australian Aboriginal or Native American languages. </xsl:text>
</p>
		  <p>
<xsl:text>Similarly to the subject or Agent in passives, some languages allow the object or Patient to be optionally expressed in a prepositional or postpositional phrase.</xsl:text>
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
			 <xsl:when test="//ip/@antipassive='yesErg'"> the subject of a transitive verb changes to absolutive case when the object is deleted in antipassives.</xsl:when>
			 <xsl:when test="//ip/@antipassive='yesAgr'">the object agreement affix on the verb is deleted to signal an antipassive.</xsl:when>
			 <xsl:when test="//ip/@antipassive='yesAffix'">there is a verbal affix for antipassive that signals the change in grammatical roles.  This affix is:</xsl:when>
		  </xsl:choose>
</p>
		  <xsl:if test="normalize-space(//ip/@antipassive)='yesAffix'">
<example num="xIP.IPAntipassives.10">
<table border="1">
				<tr>
				   <th>Antipassive Affix</th>
				   <th>Gloss</th>
				</tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/antipassiveAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
<xsl:text>, with some including the optional object or Patient if allowed, are:</xsl:text>
</p>
		  <example num="xIP.IPAntipassives.14">
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
<xsl:with-param name="sExNumber">xIP.IPAntipassives.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPAntipassives.14.1</xsl:text>
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
		  <p>
<xsl:text>Some languages, such as Tagalog and other Austronesian languages, have affixes on the verb which help define the roles and relationships of the nominal phrases in the sentence.  This is a voice change like passive in that it gives emphasis to a particular nominal phrase.  The verbal affix marks which nominal phrase is prominent, and may involve a change in word order and/or case marking.  For example, in Tagalog the voice marker reflects the role of the nominative argument. </xsl:text>
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
			 <xsl:when test="//ip/@voiceCase='no'">the voice changes are indicated by word order changes instead of case marking.</xsl:when>
			 <xsl:when test="//ip/@voiceCase='yesNom'">the voice affix reflects the role of the nominative argument.</xsl:when>
			 <xsl:when test="//ip/@voiceCase='yesAbs'">the voice affix reflects the role of the absolutive argument.</xsl:when>
		  </xsl:choose>
<xsl:text>  The following chart shows the verbal affixes used to indicate the voice of the sentence:</xsl:text>
</p>
		  <example num="xIP.IPVoice.8">
<table border="1">
				<caption>
				   <xsl:text>Voice affixes on verbs</xsl:text>
				</caption>
				<tr>
				   <th>Voice type</th>
				   <th>
					  <xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
				   </th>
				</tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/actorVoiceExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
				<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//ip/objectVoiceExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1" select="string-length(normalize-space($sExampleValue1))" />
<xsl:choose>
<xsl:when test="$iExampleLength1 != 0 and $sExampleValue1 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1" />
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
				<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//ip/dativeVoiceExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2" select="string-length(normalize-space($sExampleValue2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2 != 0 and $sExampleValue2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2" />
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
				<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//ip/locativeVoiceExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3" select="string-length(normalize-space($sExampleValue3))" />
<xsl:choose>
<xsl:when test="$iExampleLength3 != 0 and $sExampleValue3 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3" />
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
				<xsl:variable name="sExampleValue4">
<xsl:value-of select="translate(string(//ip/instrumentalVoiceExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4" select="string-length(normalize-space($sExampleValue4))" />
<xsl:choose>
<xsl:when test="$iExampleLength4 != 0 and $sExampleValue4 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4" />
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
				<xsl:variable name="sExampleValue5">
<xsl:value-of select="translate(string(//ip/goalVoiceExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5" select="string-length(normalize-space($sExampleValue5))" />
<xsl:choose>
<xsl:when test="$iExampleLength5 != 0 and $sExampleValue5 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5" />
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
<xsl:text>Examples showing changes in this type of voice marking in </xsl:text>
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
		  <example num="xIP.IPVoice.12">
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
<xsl:with-param name="sExNumber">xIP.IPVoice.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPVoice.12.1</xsl:text>
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
		  <p>
<xsl:text>Causatives add an additional argument to the sentence. Some languages have single-clause causative sentences, where the verb is marked with an affix that introduces the additional argument. That is the type of construction addressed in this section.</xsl:text>
</p>
		  <p>
<xsl:text>English and Spanish only have syntactic causatives which consist of two clauses, such as: </xsl:text>
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
			 <xsl:when test="//ip/@causative='no'">the only causative sentences consist of two clauses with a main verb meaning ‘make’ or ‘cause’.  Some examples of syntactic causatives are:</xsl:when>
			 <xsl:when test="//ip/@causative='yes'">there is a verbal affix for causative that introduces an additional argument, and that is the only type of causative in the language.  The causative affixes are:</xsl:when>
			 <xsl:when test="//ip/@causative='yesBoth'">there is a verbal affix for causative that introduces an additional argument, and syntactic causatives with two clauses are also possible.  The causative affixes are:</xsl:when>
		  </xsl:choose>
</p>
		  <xsl:if test="normalize-space(//ip/@causative)='yes' or normalize-space(//ip/@causative)='yesBoth'">
<example num="xIP.IPCausatives.10">
<table border="1">
				<tr>
				   <th>Causative Affixes</th>
				   <th>Gloss</th>
				</tr>
				<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/causativeAffixExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0" select="string-length(normalize-space($sExampleValue0))" />
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
<xsl:value-of select="$sExampleValue0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0" />
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
		  <xsl:if test="normalize-space(//ip/@causative)='yes' or normalize-space(//ip/@causative)='yesBoth'">
<p>
<xsl:text>Some examples of causatives using the causative affixes </xsl:text>
<xsl:choose>
			 <xsl:when test="//ip/@causative='yesBoth'">as well as some syntactic causatives </xsl:when>
		  </xsl:choose>
<xsl:text>are:</xsl:text>
</p>
</xsl:if>
		  <example num="xIP.IPCausatives.14">
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
<xsl:with-param name="sExNumber">xIP.IPCausatives.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xIP.IPCausatives.14.1</xsl:text>
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
