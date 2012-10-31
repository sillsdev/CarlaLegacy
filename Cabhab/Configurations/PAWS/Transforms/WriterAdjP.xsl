<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="adjp">
	<section1 id="sAdjP">
		<secTitle>Adjectives and Adjective Phrases</secTitle>
		<p>
<xsl:text>In many grammars, numbers, quantifiers, articles, and demonstratives are considered adjectives, but each of them has a different distribution from the qualitative adjectives, so they will each have distinct syntactic categories.  This section is limited to considering qualitative adjectives that express size, color, age, texture, form, or quality.  One characteristic of this type of adjective is that more than one can modify a noun and in general the order of the adjectives can change (with a slight change in meaning due to the scope of the modification).  For example, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>hard dull brass rods</langData>
<xsl:text> versus </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>dull hard brass rods</langData>
<xsl:text> versus </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>brass hard dull rods</langData>
<xsl:text>.  The position of adjectives within the nominal phrase will be dealt with in section </xsl:text>
<sectionRef sec="sNPAdjP" />
<xsl:text>.
</xsl:text>
</p>
	   <p>
<xsl:text>This section is concerned with adjectives that modify nouns, in contrast to adjectives that acts as predicates.  Predicate adjective constructions will be covered in section </xsl:text>
<sectionRef sec="sIPCop" />
<xsl:text>.</xsl:text>
</p>

	   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//adjp/@adjectiveClassifier)='yes'">
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
<xsl:text> of  the roots of qualitative adjectives which express size, color, age, texture, form or quality are given in the following chart.
  Each one may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//adjp/@adjectiveClassifier)!='yes'">
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
<xsl:text> of qualitative adjectives which express size, color, age, texture, form or quality are given in the following chart:</xsl:text>
</p>
</xsl:if>
	   <example num="xAdjP.12">
<table border="1">
			 <tr>
				<th>Qualitative adjectives</th>
				<th>Gloss</th>
			 </tr>
			 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//adjp/example),'.','')" />
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
<xsl:text>Qualitative adjectives themselves may be modified.  Some English examples are:
</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>very big</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>so blue</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>extremely large</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>very well built</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>very easily forgotten</langData>
<xsl:text>.  Not all combinations of words work due to semantics and other considerations, but in general it seems that certain degree words and manner adverbs or manner adverb phrases can modify adjectives.</xsl:text>
</p>
		<xsl:if test="normalize-space(//adjp/@modifiers)='no'">
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
<xsl:text> does not allow any degree words or manner adverbs to modify adjectives.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//adjp/@modifiers)='yes'">
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
<xsl:text> allows certain degree words to modify adjectives, but manner adverbs may not.  The degree words occur </xsl:text>
<xsl:choose>
				<xsl:when test="//adjp/@degreePos='before'">before</xsl:when>
				<xsl:when test="//adjp/@degreePos='after'">after</xsl:when>
				<xsl:when test="//adjp/@degreePos='either'">on either side (but not both sides) of</xsl:when>
				<xsl:when test="//adjp/@degreePos='eitherOrBoth'">on either side or on both sides of</xsl:when>
				<xsl:when test="//adjp/@degreePos='beforeOrBoth'">before or on both sides of</xsl:when>
				<xsl:when test="//adjp/@degreePos='afterOrBoth'">after or on both sides of</xsl:when>
				<xsl:when test="//adjp/@degreePos='both'">on both sides of</xsl:when>
				<xsl:when test="//adjp/@degreePos='unknown'">_______</xsl:when>
			</xsl:choose>
<xsl:text> the adjective.  </xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesDegree' and normalize-space(//adjp/@degreeEither)='unrestricted' and normalize-space(//adjp/@degreePos)!='before' and normalize-space(//adjp/@degreePos)!='after'">
				<xsl:text>All of the degree words can occur on either side of the adjective.</xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesDegree' and normalize-space(//adjp/@degreeEither)='restricted' and normalize-space(//adjp/@degreePos)!='before' and normalize-space(//adjp/@degreePos)!='after'">
				<xsl:text>There are restrictions as to which of the degree words can occur on each side of the adjective.</xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//adjp/@adjectiveDegreeClassifier)='yes' and normalize-space(//adjp/@modifiers)='yes'">
<p>
<xsl:text>The roots of the degree words which can modify the qualitative adjectives in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here.  Each may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' and normalize-space(//adjp/@modifiers)='yes' or normalize-space(//adjp/@adjectiveDegreeClassifier)!='yes' and normalize-space(//adjp/@modifiers)='yes'">
<p>
<xsl:text>The degree words which can modify the qualitative adjectives in </xsl:text>
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
	   <xsl:if test="normalize-space(//adjp/@modifiers)='yes'">
<example num="xAdjP.24">
<table border="1">
			 <tr>
				<th>Degree words</th>
				<th>Gloss</th>
			 </tr>
			 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//adjp/adjectiveDegreeExample),'.','')" />
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
	   <xsl:if test="normalize-space(//adjp/@modifiers)='yes'">
<p>
<xsl:text>Examples of qualitative adjectives with degree words modifying them are:</xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//adjp/@modifiers)='yes'">
<example num="xAdjP.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//adjp/adjectivePhraseExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//adjp/adjectivePhraseExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//adjp/adjectivePhraseExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//adjp/adjectivePhraseExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.28.1</xsl:text>
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

		<xsl:if test="normalize-space(//adjp/@modifiers)='yesManner'">
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
<xsl:text> allows both certain degree words and manner adverbs to modify adjectives.  These modifiers occur </xsl:text>
<xsl:choose>
				<xsl:when test="//adjp/@mannerPos='before'">before</xsl:when>
				<xsl:when test="//adjp/@mannerPos='after'">after</xsl:when>
				<xsl:when test="//adjp/@mannerPos='either'">on either side (but not both sides) of</xsl:when>
				<xsl:when test="//adjp/@mannerPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
				<xsl:when test="//adjp/@mannerPos='beforeOrBoth'">before or on both sides of</xsl:when>
				<xsl:when test="//adjp/@mannerPos='afterOrBoth'">after or on both sides of</xsl:when>
				<xsl:when test="//adjp/@mannerPos='both'">on both sides of</xsl:when>
				<xsl:when test="//adjp/@mannerPos='unknown'">_______</xsl:when>
			</xsl:choose>
<xsl:text> the adjective.  </xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerEither)='unrestricted' and normalize-space(//adjp/@mannerPos)!='before' and normalize-space(//adjp/@mannerPos)!='after'">
				<xsl:text>All of the degree words and manner adverbs can occur on either side of the adjective.</xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerEither)='restricted' and normalize-space(//adjp/@mannerPos)!='before' and normalize-space(//adjp/@mannerPos)!='after'">
				<xsl:text>There are restrictions as to which of the degree words and manner adverbs can occur on each side of the adjective.</xsl:text>
			</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//adjp/@adjectiveDegreeClassifier)='yes' and normalize-space(//adjp/@modifiers)='yesManner'">
<p>
<xsl:text>The roots of the degree words which can modify qualitative adjectives in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here.  Each may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' and normalize-space(//adjp/@modifiers)='yesManner' or normalize-space(//adjp/@adjectiveDegreeClassifier)!='yes' and normalize-space(//adjp/@modifiers)='yesManner'">
<p>
<xsl:text>The degree words which can modify qualitative adjectives in </xsl:text>
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
	   <xsl:if test="normalize-space(//adjp/@modifiers)='yesManner'">
<example num="xAdjP.36">
<table border="1">
			 <tr>
				<th>Degree words</th>
				<th>Gloss</th>
			 </tr>
			 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//adjp/adjectiveDegreeExample),'.','')" />
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
	   <xsl:if test="normalize-space(//adjp/@modifiers)='yesManner'">
<p>
<xsl:text>Examples of qualitative adjectives with degree words and/or manner adverbs modifying them are:</xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//adjp/@modifiers)='yesManner'">
<example num="xAdjP.40">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//adjp/adjectivePhraseExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//adjp/adjectivePhraseExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//adjp/adjectivePhraseExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//adjp/adjectivePhraseExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.40.1</xsl:text>
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


	   <xsl:if test="normalize-space(//adjp/@modifiers)='attaches'">
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
<xsl:text>, there are affixes or clitics that attach to the qualitative adjective to intensify it.  The degree affixes or clitics which can modify qualitative adjectives in </xsl:text>
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
	   <xsl:if test="normalize-space(//adjp/@modifiers)='attaches'">
<example num="xAdjP.44">
<table border="1">
			 <tr>
				<th>Degree affixes or clitics</th>
				<th>Gloss</th>
			 </tr>
			 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//adjp/adjectiveDegreeAffixExample),'.','')" />
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
	   <xsl:if test="normalize-space(//adjp/@modifiers)='attaches'">
<p>
<xsl:text>Examples of qualitative adjectives with a degree affix or clitic attached are:</xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//adjp/@modifiers)='attaches'">
<example num="xAdjP.48">
<table border="1">
			 <tr>
				<th>Modified qualitative adjectives</th>
				<th>Gloss</th>
			 </tr>
			 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//adjp/adjectivePhraseAffixExample),'.','')" />
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


	   <xsl:if test="normalize-space(//adjp/@modifiers)='noRedup'">
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
<xsl:text>, reduplication is used to intensify the meaning of  the qualitative adjective.  Examples of qualitative adjectives with reduplication modifying or intensifying them are:</xsl:text>
</p>
</xsl:if>
	   <xsl:if test="normalize-space(//adjp/@modifiers)='noRedup'">
<example num="xAdjP.52">
<table border="1">
			 <tr>
				<th>Reduplicated qualitative adjectives</th>
				<th>Gloss</th>
			 </tr>
			 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//adjp/adjectiveDegreeRedupExample),'.','')" />
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



	</section1>
	
		
	
	
		
	
	
		
	
   
	  
   
   
	  
   
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	
	
		
		
		
		
		
		
		
	

   
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
	  
	  
   
</xsl:template>
</xsl:stylesheet>
