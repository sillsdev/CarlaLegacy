<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="advp">
	<section1 id="sAdvP">
		<secTitle>Adverbs and Adverb Phrases</secTitle>
		<p>
<xsl:text>Adverbs express four basic types of information:</xsl:text>
</p>
		<ul>
			<li>
				<xsl:text> time,</xsl:text>
			</li>
			<li>
				<xsl:text> location,</xsl:text>
			</li>
			<li>
				<xsl:text>manner, and</xsl:text>
			</li>
			<li>
				<xsl:text>reason or purpose.</xsl:text>
			</li>
		</ul>
		<p>
<xsl:text>These types have different characteristics as to
which positions they may occupy and how they may be modified.  Each type will be covered in turn.
</xsl:text>
</p>
		<p>
<xsl:text>Languages normally have degree words which can modify at least some types of adverbs.  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
				<xsl:when test="//advp/@degree='no'"> does not have any such degree words, however.</xsl:when>
				<xsl:when test="//advp/@degree='yes'"> has such degree words.</xsl:when>
			</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//advp/@degree)='yes'">
				<xsl:text> These degree words occur </xsl:text>
				<xsl:choose>
					<xsl:when test="//advp/@degreePos='before'">before</xsl:when>
					<xsl:when test="//advp/@degreePos='after'">after</xsl:when>
					<xsl:when test="//advp/@degreePos='either'">on either side (but not both sides) of</xsl:when>
					<xsl:when test="//advp/@degreePos='eitherOrBoth'">on either side or on both sides of</xsl:when>
					<xsl:when test="//advp/@degreePos='beforeOrBoth'">before or on both sides of</xsl:when>
					<xsl:when test="//advp/@degreePos='afterOrBoth'">after or on both sides of</xsl:when>
					<xsl:when test="//advp/@degreePos='both'">on both sides of</xsl:when>
					<xsl:when test="//advp/@degreePos='unknown'">_______</xsl:when>
				</xsl:choose>
				<xsl:text> the adverb.  </xsl:text>
				<xsl:choose>
					<xsl:when test="//advp/@degreeSet='unrestricted'">The degree words can modify any type of adverb.</xsl:when>
					<xsl:when test="//advp/@degreeSet='exceptReason'">The degree words can modify temporals, locatives, and manner adverbs, but reason or purpose adverbs are not modified.</xsl:when>
					<xsl:when test="//advp/@degreeSet='restricted'">There are distinct sets of the degree words which can modify each type of adverb.</xsl:when>
				</xsl:choose>
				<xsl:text></xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
</p>
		<section2 id="sAdvPTemporal">
			<secTitle>Temporal Adverbs</secTitle>
			<p>
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
<xsl:text>.  Examples including degree word modifiers are: </xsl:text>
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
<xsl:text>.  Many languages also have a negative temporal adverb meaning 'no when', such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>never</langData>
<xsl:text> in English.</xsl:text>
</p>
			<p>
<xsl:text>Examples of </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> positive temporal adverbs and any degree words which can modify them include:
</xsl:text>
</p>
			<example num="xAdvP.AdvPTemporal.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/temporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/temporalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/temporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/temporalExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.8.1</xsl:text>
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
			<xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the negative temporal idea of  'no when' is expressed by one or more verbal affixes, rather than by separate words.  Examples of the affix(es) attached to verbs include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<example num="xAdvP.AdvPTemporal.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/negTemporalAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/negTemporalAffixExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.12.1</xsl:text>
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
			<xsl:if test="normalize-space(//advp/@negTemporalType)='verb'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, there is only a verbal negative affix, but it may occur with positive temporal adverbs to give a negative temporal meaning.  Examples of temporal adverbs with a negative verb include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negTemporalType)='word'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the negative temporal idea of  'no when' is expressed by one or more separate words.  Examples include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negTemporalType)='word' or normalize-space(//advp/@negTemporalType)='verb'">
<example num="xAdvP.AdvPTemporal.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/negTemporalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/negTemporalExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.18.1</xsl:text>
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
<xsl:text>See section </xsl:text>
<sectionRef sec="sNegAdverb" />
<xsl:text> for full sentence examples of the negative temporal expressions.</xsl:text>
</p>
			<p>
<xsl:text>The time element of a sentence can also be expressed by other types of words or phrases, such as: nominal phrases </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>yesterday</langData>
<xsl:text>,
</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>last night</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>next year</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>tomorrow</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>a long time ago</langData>
<xsl:text>; prepositional
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
</xsl:attribute>at 10 o'clock</langData>
<xsl:text>; and
adverbial clauses </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>while you are working</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>when Sue arrived</langData>
<xsl:text>.  These phrases occur in the same positions as the temporal adverbs, normally either initially or finally in the clause.  See section </xsl:text>
<sectionRef sec="sNP" />
<xsl:text> for the structure of nominal phrases and section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> for information on </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='before'">prepositional and postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrases.  See also section </xsl:text>
<sectionRef sec="sAdvClTemporal" />
<xsl:text> for examples of temporal adverbial clauses.</xsl:text>
</p>
		</section2>
		<section2 id="sAdvPLocative">
			<secTitle>Locative Adverbs</secTitle>
			<p>
<xsl:text>Locative adverbs include the English words: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>here</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>there</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>everywhere</langData>
<xsl:text>.  Locative adverbs can be modified by </xsl:text>
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
<xsl:text>.  Many languages also have a negative locative adverb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nowhere</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Examples of </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> positive locative adverbs and any degree words which can modify them include:
</xsl:text>
</p>
			<example num="xAdvP.AdvPLocative.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/locativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/locativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/locativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/locativeExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.8.1</xsl:text>
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
			<xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the negative locative idea of  'nowhere' is expressed by one or more verbal affixes, rather than by separate words.  Examples of the affix(es) attached to verbs include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<example num="xAdvP.AdvPLocative.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/negLocativeAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/negLocativeAffixExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.12.1</xsl:text>
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
			 <xsl:if test="normalize-space(//advp/@negLocativeType)='verb'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, there is only a verbal negative affix, but it may occur with positive locative adverbs to give a negative locative meaning.  Examples of locative adverbs with a negative verb include:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='word'">
<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the negative locative idea of  'nowhere' is expressed by one or more separate words.  Examples include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negLocativeType)='word' or normalize-space(//advp/@negLocativeType)='verb'">
<example num="xAdvP.AdvPLocative.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/negLocativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/negLocativeExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.18.1</xsl:text>
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
<xsl:text>See section </xsl:text>
<sectionRef sec="sNegAdverb" />
<xsl:text> for full sentence examples of the negative locative expressions.</xsl:text>
</p>
			<p>
<xsl:text>Location is often also expressed by a prepositional
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
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>across the river</langData>
<xsl:text>.  Many
languages allow just a nominal phrase, consisting of a proper noun or
description of the place.  Locative expressions may normally occur either initially or finally in the clause, or as complements to motion verbs.  See section </xsl:text>
<sectionRef sec="sIPMotion" />
<xsl:text> for examples with motion verbs.
</xsl:text>
</p>
		</section2>
		<section2 id="sAdvPManner">
			<secTitle>Manner Adverbs</secTitle>
			<p>
<xsl:text>Manner adverbs directly modify the verb and usually end in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-ly</langData>
<xsl:text> in English.  These
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
			<p>
<xsl:text>Examples of </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> manner adverbs and any degree words which can modify them include:
</xsl:text>
</p>
			<example num="xAdvP.AdvPManner.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/mannerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/mannerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/mannerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/mannerExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPManner.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPManner.8.1</xsl:text>
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
			<xsl:if test="normalize-space(//advp/@mannerType)='affix'">
<p>
<xsl:text>Manner adverbs in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are all written as affixes on the verb, rather than being separate words.</xsl:text>
</p>
</xsl:if>
		</section2>
		<section2 id="sAdvPReason">
			<secTitle>Reason or Purpose Adverbs</secTitle>
			<p>
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
<xsl:text>.  These adverbial phrases or clauses occur either initially or finally in the sentence.</xsl:text>
</p>
			<p>
<xsl:text>Examples of </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> reason or purpose adverbs or adverbial clauses, included in full sentences are:
</xsl:text>
</p>
			<example num="xAdvP.AdvPReason.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/reasonExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="normalize-space(string-length(//advp/reasonExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/reasonExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/reasonExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPReason.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPReason.8.1</xsl:text>
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
<xsl:text>The structure of the adverbial clauses will be addressed in section </xsl:text>
<sectionRef sec="sAdvClReason" />
<xsl:text>.  Reason or purpose can also be expressed by a prepositional phrase, such as </xsl:text>
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
<xsl:text>.
</xsl:text>
</p>
		</section2>
	</section1>


































</xsl:template>
</xsl:stylesheet>
