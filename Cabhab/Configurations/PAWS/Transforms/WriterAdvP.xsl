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
<xsl:text>.   Many languages also have a negative temporal adverb meaning ‘no time’, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>never</langData>
<xsl:text> in English.</xsl:text>
</p>

		   <p>
<xsl:text>We will begin with the positive temporal adverbs.</xsl:text>
</p>
		   <p>
<xsl:text>The positive temporal adverbs in </xsl:text>
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
		   <example num="xAdvP.AdvPTemporal.10">
<table border="1">
				 <tr>
					<th>Positive temporal adverbs</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/temporalExample),'.','')" />
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
<xsl:text>Many languages allow degree words to modify adverbs.  Example English positive temporal adverbial phrases including degree word modifiers are: </xsl:text>
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
   <xsl:when test="//advp/@temporalDegree='yesBefore'">a degree word many appear before the positive temporal adverb.</xsl:when>
   <xsl:when test="//advp/@temporalDegree='yesAfter'">a degree word many appear after the positive temporal adverb.</xsl:when>
   <xsl:when test="//advp/@temporalDegree='attaches'">there is an affix or clitic that attaches to the positive temporal adverb to intensify it.</xsl:when>
   <xsl:when test="//advp/@temporalDegree='noRedup'">there are no separate degree words, but reduplication is used to intensify the meaning of the positive temporal adverb.</xsl:when>
   <xsl:when test="//advp/@temporalDegree='no'">positive temporal adverbs are not modified or intensified.</xsl:when>
</xsl:choose>
</p>

 <xsl:if test="normalize-space(//advp/@temporalDegree)='yesBefore' or normalize-space(//advp/@temporalDegree)='yesAfter'">
<p>
<xsl:text>The degree words which can modify the positive temporal adverbs in </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@temporalDegree)='yesBefore' or normalize-space(//advp/@temporalDegree)='yesAfter'">
<example num="xAdvP.AdvPTemporal.18">
<table border="1">
				 <tr>
					<th>Degree words</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/temporalDegreeExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@temporalDegree)='attaches'">
<p>
<xsl:text>The degree affixes or clitics which can modify the positive temporal adverbs in </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@temporalDegree)='attaches'">
<example num="xAdvP.AdvPTemporal.22">
<table border="1">
				 <tr>
					<th>Degree affixes or clitics</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/temporalDegreeAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@temporalDegree)='noRedup'">
<p>
<xsl:text>Examples of the temporal adverbs with reduplication modifying or intensifying them are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@temporalDegree)='noRedup'">
<example num="xAdvP.AdvPTemporal.26">
<table border="1">
				 <tr>
					<th>Reduplicated positive temporal adverbs</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/temporalDegreeRedupExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@temporalDegree)='attaches'">
<p>
<xsl:text>Examples of the degree affixes or clitics attached to the positive temporal adverbs are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@temporalDegree)='attaches'">
<example num="xAdvP.AdvPTemporal.30">
<table border="1">
				 <tr>
					<th>Modified positive temporal adverbs</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/temporalPhraseAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@temporalDegree)='yesBefore' or normalize-space(//advp/@temporalDegree)='yesAfter'">
<p>
<xsl:text>Examples of the positive temporal adverbs with degree words modifying them are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@temporalDegree)='yesBefore' or normalize-space(//advp/@temporalDegree)='yesAfter'">
<example num="xAdvP.AdvPTemporal.34">
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
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.34.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>

		   <p>
<xsl:text>We move now to the negative temporal adverb </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>never</langData>
<xsl:text> which expresses the concept of </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no time’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='word'">
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
<xsl:text>, the negative temporal concept of  </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no time’</xsl:text>
</gloss>
<xsl:text> is expressed by a separate word or phrase unrelated to the positive temporal adverbs.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
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
<xsl:text>, the negative temporal concept of  </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no time’</xsl:text>
</gloss>
<xsl:text> is expressed by a negative affix which is added to the positive temporal adverb(s) to form the negative adverb word(s).</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
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
<xsl:text>, the negative temporal concept of  </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no time’</xsl:text>
</gloss>
<xsl:text> is expressed by a separate negative word which occurs </xsl:text>
<xsl:choose>
				 <xsl:when test="//advp/@negTemporalWordPos='before'">before</xsl:when>
				 <xsl:when test="//advp/@negTemporalWordPos='after'">after</xsl:when>
				 <xsl:when test="//advp/@negTemporalWordPos='unknown'">________</xsl:when>
			  </xsl:choose>
<xsl:text> the positive temporal adverb(s) to form the negative temporal adverb phrase(s).</xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
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
<xsl:text>, the negative temporal concept of  </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no time’</xsl:text>
</gloss>
<xsl:text> is expressed by one or more verbal affixes, rather than by separate words.</xsl:text>
</p>
</xsl:if>


			<xsl:if test="normalize-space(//advp/@negTemporalType)='verb'">
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
<xsl:text>, there is only a verbal negative affix, but a negative verb may occur with the positive temporal adverbs to give a negative temporal meaning.</xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<p>
<xsl:text>The negative word that occurs with the positive temporal adverbs is:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<example num="xAdvP.AdvPTemporal.50">
<table border="1">
				 <tr>
					<th>Negative word</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalAdverbWordExample),'.','')" />
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
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<p>
<xsl:text>Examples of the negative temporal adverb phrases formed by adding the negative word </xsl:text>
<xsl:choose>
			  <xsl:when test="//advp/@negTemporalWordPos='before'">before</xsl:when>
			  <xsl:when test="//advp/@negTemporalWordPos='after'">after</xsl:when>
			  <xsl:when test="//advp/@negTemporalWordPos='unknown'">________</xsl:when>
		   </xsl:choose>
<xsl:text> the positive temporal adverbs are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//advp/@negTemporalType)='adverbWord'">
<example num="xAdvP.AdvPTemporal.54">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalAdverbWordsExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negTemporalAdverbWordsExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalAdverbWordsExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negTemporalAdverbWordsExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.54</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.54.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<p>
<xsl:text>The negative affix that is added to the positive temporal adverbs is:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<example num="xAdvP.AdvPTemporal.58">
<table border="1">
				 <tr>
					<th>Negative affix</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalAdverbAffixExample),'.','')" />
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
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<p>
<xsl:text>Examples of the negative temporal adverbs formed by adding the negative word to the positive temporal adverbs are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='adverb'">
<example num="xAdvP.AdvPTemporal.62">
<table border="1">
				 <tr>
					<th>Negative temporal adverbs</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalAdverbExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='word'">
<p>
<xsl:text>The negative temporal adverbs or phrases in </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='word'">
<example num="xAdvP.AdvPTemporal.66">
<table border="1">
				 <tr>
					<th>Negative temporal adverbs or phrases</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='verb'">
<p>
<xsl:text>Examples of the positive temporal adverbs with a negative verb are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='verb'">
<example num="xAdvP.AdvPTemporal.70">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negTemporalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negTemporalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPTemporal.70</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPTemporal.70.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<p>
<xsl:text>The negative temporal adverbial affix(es) which can attach to verbs are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<example num="xAdvP.AdvPTemporal.74">
<table border="1">
				 <tr>
					<th>Negative temporal adverbial affixes</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<p>
<xsl:text>Examples of the negative temporal adverbial affix(es) attached to verbs are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negTemporalType)='affix'">
<example num="xAdvP.AdvPTemporal.78">
<table border="1">
				 <tr>
					<th>Verbs with negative temporal adverbial affixes</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negTemporalVerbExample),'.','')" />
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
</xsl:attribute>at 10 o’clock</langData>
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
<xsl:text> for information on pre/post-positional phrases.  See also section </xsl:text>
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
<xsl:text>.  Many languages also have a negative locative adverb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nowhere</langData>
<xsl:text>.</xsl:text>
</p>

		   <p>
<xsl:text>We will begin with the positive locative adverbs.</xsl:text>
</p>
		   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//advp/@locativeClassifier)='yes'">
<p>
<xsl:text>The roots of the positive locative adverbs in </xsl:text>
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
<xsl:text>The positive locative adverbs in </xsl:text>
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
		   <example num="xAdvP.AdvPLocative.12">
<table border="1">
				 <tr>
					<th>Positive locative adverbs</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/locativeExample),'.','')" />
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
<xsl:text>The forms of these positive locative adverbs are </xsl:text>
<xsl:choose>
			<xsl:when test="//advp/@advLocDem='no'">completely distinct from the demonstrative pronouns. </xsl:when>
			<xsl:when test="//advp/@advLocDem='same'">identical to the demonstrative pronouns, though they are used in different positions in the sentence. </xsl:when>
			<xsl:when test="//advp/@advLocDem='affix'">related to the demonstrative pronouns.  An affix is added to a demonstrative to form a locative adverb. </xsl:when>
		 </xsl:choose>
<xsl:text> See section </xsl:text>
<sectionRef sec="sPronDem" />
<xsl:text> for information on the demonstrative pronouns.</xsl:text>
</p>

		   <p>
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
				 <xsl:when test="//advp/@locativeDegree='yesBefore'">a degree word many appear before the positive locative adverb.</xsl:when>
				 <xsl:when test="//advp/@locativeDegree='yesAfter'">a degree word many appear after the positive locative adverb.</xsl:when>
				 <xsl:when test="//advp/@locativeDegree='attaches'">there is an affix or clitic that attaches to the positive locative adverb to intensify it.</xsl:when>
				 <xsl:when test="//advp/@locativeDegree='noRedup'">there are no separate degree words, but reduplication is used to intensify the meaning of the positive locative adverb.</xsl:when>
				 <xsl:when test="//advp/@locativeDegree='no'">positive locative adverbs are not modified or intensified.</xsl:when>
			  </xsl:choose>
</p>

		   <xsl:if test="normalize-space(//advp/@locativeDegree)='yesBefore' or normalize-space(//advp/@locativeDegree)='yesAfter'">
<p>
<xsl:text>The degree words which can modify the positive locative adverbs in </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@locativeDegree)='yesBefore' or normalize-space(//advp/@locativeDegree)='yesAfter'">
<example num="xAdvP.AdvPLocative.22">
<table border="1">
				 <tr>
					<th>Degree words</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/locativeDegreeExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@locativeDegree)='attaches'">
<p>
<xsl:text>The degree affixes or clitics which can modify the positive locative adverbs in </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@locativeDegree)='attaches'">
<example num="xAdvP.AdvPLocative.26">
<table border="1">
				 <tr>
					<th>Degree affixes or clitics</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/locativeDegreeAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@locativeDegree)='noRedup'">
<p>
<xsl:text>Examples of the locative adverbs with reduplication modifying or intensifying them are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@locativeDegree)='noRedup'">
<example num="xAdvP.AdvPLocative.30">
<table border="1">
				 <tr>
					<th>Reduplicated positive locative adverbs</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/locativeDegreeRedupExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@locativeDegree)='attaches'">
<p>
<xsl:text>Examples of the degree affixes or clitics attached to the positive locative adverbs are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@locativeDegree)='attaches'">
<example num="xAdvP.AdvPLocative.34">
<table border="1">
				 <tr>
					<th>Modified positive locative adverbs</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/locativePhraseAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@locativeDegree)='yesBefore' or normalize-space(//advp/@locativeDegree)='yesAfter'">
<p>
<xsl:text>Examples of the positive locative adverbs with degree words modifying them are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@locativeDegree)='yesBefore' or normalize-space(//advp/@locativeDegree)='yesAfter'">
<example num="xAdvP.AdvPLocative.38">
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
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.38</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.38.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>

		   <p>
<xsl:text>We move now to the negative locative adverb </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nowhere</langData>
<xsl:text> which expresses the concept of </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no place’</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='word'">
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
<xsl:text>, the negative locative concept of  </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no place’</xsl:text>
</gloss>
<xsl:text> is expressed by a separate word or phrase unrelated to the positive locative adverbs.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
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
<xsl:text>, the negative locative concept of  </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no place’</xsl:text>
</gloss>
<xsl:text> is expressed by a negative affix which is added to the positive locative adverb(s) to form the negative adverb word(s).</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
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
<xsl:text>, the negative locative concept of  </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no place’</xsl:text>
</gloss>
<xsl:text> is expressed by a separate negative word which occurs </xsl:text>
<xsl:choose>
				 <xsl:when test="//advp/@negTemporalWordPos='before'">before</xsl:when>
				 <xsl:when test="//advp/@negTemporalWordPos='after'">after</xsl:when>
				 <xsl:when test="//advp/@negTemporalWordPos='unknown'">________</xsl:when>
			  </xsl:choose>
<xsl:text> the positive locative adverb(s) to form the negative locative adverb phrase(s).</xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
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
<xsl:text>, the negative locative concept of  </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>‘no place’</xsl:text>
</gloss>
<xsl:text> is expressed by one or more verbal affixes, rather than by separate words.</xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='verb'">
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
<xsl:text>, there is only a verbal negative affix, but a negative verb may occur with the positive locative adverbs to give a negative locative meaning.</xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<p>
<xsl:text>The negative word that occurs with the positive locative adverbs is:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<example num="xAdvP.AdvPLocative.54">
<table border="1">
				 <tr>
					<th>Negative word</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeAdverbWordExample),'.','')" />
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
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<p>
<xsl:text>Examples of the negative locative adverb phrases formed by adding the negative word </xsl:text>
<xsl:choose>
			  <xsl:when test="//advp/@negTemporalWordPos='before'">before</xsl:when>
			  <xsl:when test="//advp/@negTemporalWordPos='after'">after</xsl:when>
			  <xsl:when test="//advp/@negTemporalWordPos='unknown'">________</xsl:when>
		   </xsl:choose>
<xsl:text> the positive locative adverbs are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverbWord'">
<example num="xAdvP.AdvPLocative.58">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeAdverbWordsExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negLocativeAdverbWordsExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeAdverbWordsExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negLocativeAdverbWordsExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.58</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.58.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<p>
<xsl:text>The negative affix that is added to the positive locative adverbs is:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<example num="xAdvP.AdvPLocative.62">
<table border="1">
				 <tr>
					<th>Negative affix</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeAdverbAffixExample),'.','')" />
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
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<p>
<xsl:text>Examples of the negative locative adverbs formed by adding the negative word to the positive locative adverbs are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='adverb'">
<example num="xAdvP.AdvPLocative.66">
<table border="1">
				 <tr>
					<th>Negative locative adverbs</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeAdverbExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='word'">
<p>
<xsl:text>The negative locative adverbs or phrases in </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='word'">
<example num="xAdvP.AdvPLocative.70">
<table border="1">
				 <tr>
					<th>Negative locative adverbs or phrases</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='verb'">
<p>
<xsl:text>Examples of the positive locative adverbs with a negative verb are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='verb'">
<example num="xAdvP.AdvPLocative.74">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/negLocativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/negLocativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPLocative.74</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPLocative.74.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<p>
<xsl:text>The negative locative adverbial affix(es) which can attach to verbs are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<example num="xAdvP.AdvPLocative.78">
<table border="1">
				 <tr>
					<th>Negative locative adverbial affixes</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<p>
<xsl:text>Examples of the negative locative adverbial affix(es) attached to verbs are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@negLocativeType)='affix'">
<example num="xAdvP.AdvPLocative.82">
<table border="1">
				 <tr>
					<th>Verbs with negative locative adverbial affixes</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/negLocativeVerbExample),'.','')" />
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
<xsl:text> in English.  Some languages do not have separate words, but rather use verbal affixes to express manner.</xsl:text>
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
<xsl:text> are written as separate words.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='word'">
<p>
<xsl:text>Examples of manner adverbs in </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@mannerType)='word'">
<example num="xAdvP.AdvPManner.10">
<table border="1">
				 <tr>
				 <th>Manner adverbs</th>
				 <th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='affix'">
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
<xsl:text> are all written as affixes on the verb.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='affix'">
<p>
<xsl:text>Examples of the manner adverb affixes in </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@mannerType)='affix'">
<example num="xAdvP.AdvPManner.16">
<table border="1">
				 <tr>
				 <th>Manner adverb affixes</th>
				 <th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='word'">
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
				 <xsl:when test="//advp/@mannerDegree='yesBefore'">a degree word many appear before the manner adverb.</xsl:when>
				 <xsl:when test="//advp/@mannerDegree='yesAfter'">a degree word many appear after the manner adverb.</xsl:when>
				 <xsl:when test="//advp/@mannerDegree='attaches'">there is an affix or clitic that attaches to the manner adverb to intensify it.</xsl:when>
				 <xsl:when test="//advp/@mannerDegree='noRedup'">there are no separate degree words, but reduplication is used to intensify the meaning of the manner adverb.</xsl:when>
				 <xsl:when test="//advp/@mannerDegree='no'">manner adverbs are not modified or intensified.</xsl:when>
			  </xsl:choose>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesBefore' or normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesAfter'">
<p>
<xsl:text>The degree words which can modify the manner adverbs in </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesBefore' or normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesAfter'">
<example num="xAdvP.AdvPManner.24">
<table border="1">
				 <tr>
					<th>Degree words</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerDegreeExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='attaches'">
<p>
<xsl:text>The degree affixes or clitics which can modify the manner adverbs in </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='attaches'">
<example num="xAdvP.AdvPManner.28">
<table border="1">
				 <tr>
					<th>Degree affixes or clitics</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerDegreeAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='noRedup'">
<p>
<xsl:text>Examples of the manner adverbs with reduplication modifying or intensifying them are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='noRedup'">
<example num="xAdvP.AdvPManner.32">
<table border="1">
				 <tr>
					<th>Reduplicated manner adverbs</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerDegreeRedupExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='attaches'">
<p>
<xsl:text>Examples of the degree affixes or clitics attached to the manner adverbs are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='attaches'">
<example num="xAdvP.AdvPManner.36">
<table border="1">
				 <tr>
					<th>Modified manner adverbs</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerPhraseAffixExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesBefore' or normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesAfter'">
<p>
<xsl:text>Examples of the manner adverbs with degree words modifying them are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesBefore' or normalize-space(//advp/@mannerType)='word' and normalize-space(//advp/@mannerDegree)='yesAfter'">
<example num="xAdvP.AdvPManner.40">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/mannerDegreePhraseExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//advp/mannerDegreePhraseExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/mannerDegreePhraseExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//advp/mannerDegreePhraseExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdvP.AdvPManner.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPManner.40.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>


		   <xsl:if test="normalize-space(//advp/@mannerType)='affix'">
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
				 <xsl:when test="//advp/@mannerAffixDegree='yesBefore'">a degree affix many appear before the manner adverb affix.</xsl:when>
				 <xsl:when test="//advp/@mannerAffixDegree='yesAfter'">a degree affix many appear after the manner adverb affix.</xsl:when>
				 <xsl:when test="//advp/@mannerAffixDegree='noRedup'">reduplication is used to intensify the meaning of the manner adverb affix.</xsl:when>
				 <xsl:when test="//advp/@mannerAffixDegree='no'">manner adverb affixes are not modified or intensified.</xsl:when>
			  </xsl:choose>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesBefore' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesAfter'">
<p>
<xsl:text>The degree affixes or clitics which can modify the manner adverb affixes in </xsl:text>
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
		   <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesBefore' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesAfter'">
<example num="xAdvP.AdvPManner.46">
<table border="1">
				 <tr>
					<th>Degree affixes or clitics</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerAffixDegreeExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='noRedup'">
<p>
<xsl:text>Examples of the manner adverb affixes with reduplication modifying or intensifying them within verbs are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='noRedup'">
<example num="xAdvP.AdvPManner.50">
<table border="1">
				 <tr>
					<th>Reduplicated manner adverb affixes</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerAffixDegreeRedupExample),'.','')" />
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

		   <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesBefore' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesAfter'">
<p>
<xsl:text>Examples of the manner adverb affixes with degree affixes modifying them within verbs are:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesBefore' or normalize-space(//advp/@mannerType)='affix' and normalize-space(//advp/@mannerAffixDegree)='yesAfter'">
<example num="xAdvP.AdvPManner.54">
<table border="1">
				 <tr>
					<th>Modified manner adverb affixes</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/mannerAffixPhraseExample),'.','')" />
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
<xsl:text>Manner adverbs do not seem to have clear counterparts of other phrase types, except possibly some comparatives,
		   such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>as fast as he could</langData>
<xsl:text>.  Comparatives are dealt with in sections </xsl:text>
<sectionRef sec="sIPComparatives" />
<xsl:text> and </xsl:text>
<sectionRef sec="sCoordComparative" />
<xsl:text>. </xsl:text>
</p>

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
		   <example num="xAdvP.AdvPReason.8">
<table border="1">
				 <tr>
					<th>Reason or purpose adverbs</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/reasonExample),'.','')" />
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
				 <xsl:when test="//pp/@pPos='both'">Prepositional or postpositional</xsl:when>
				 <xsl:when test="//pp/@pPos='unknown'">Prepositional or postpositional</xsl:when>
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
		   <example num="xAdvP.AdvPReason.14">
<table border="1">
				 <tr>
					<th>Other expressions of reason or purpose</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//advp/reasonPPExample),'.','')" />
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
<xsl:text>Examples of </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> reason or purpose adverbs or adverbial clauses or  </xsl:text>
<xsl:choose>
				 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
				 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
				 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
				 <xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
			  </xsl:choose>
<xsl:text> phrases, included in full sentences are:
</xsl:text>
</p>
			<example num="xAdvP.AdvPReason.18">
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
<xsl:with-param name="sExNumber">xAdvP.AdvPReason.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdvP.AdvPReason.18.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoMorphemeGloss" />
<xsl:call-template name="DoWordGloss" />
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
