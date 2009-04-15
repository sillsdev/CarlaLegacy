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
<xsl:text>, etc.  The position of adjectives within the nominal phrase will be dealt with in section </xsl:text>
<sectionRef sec="sNPAdjP" />
<xsl:text>.
</xsl:text>
</p>
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
<xsl:text></xsl:text>Vernacular<xsl:text> does not allow any degree words or manner adverbs to modify adjectives.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//adjp/@modifiers)='yes'">
<p>
<xsl:text></xsl:text>Vernacular<xsl:text> allows certain degree words to modify adjectives, but manner adverbs may not.  The degree words occur </xsl:text>
<xsl:choose>
				<xsl:when test="//adjp/@degreePos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@degreePos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@degreePos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@degreePos='eitherOrBoth'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@degreePos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@degreePos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@degreePos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@degreePos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
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
		<xsl:if test="normalize-space(//adjp/@modifiers)='yesManner'">
<p>
<xsl:text></xsl:text>Vernacular<xsl:text> allows both certain degree words and manner adverbs to modify adjectives.  These modifiers occur </xsl:text>
<xsl:choose>
				<xsl:when test="//adjp/@mannerPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@mannerPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@mannerPos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@mannerPos='eitherOrBoth'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@mannerPos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@mannerPos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@mannerPos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
				<xsl:when test="//adjp/@mannerPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
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
		<p>
<xsl:text>Examples of adjectives or adjective phrases in </xsl:text>Vernacular<xsl:text> include:
</xsl:text>
</p>
		<example num="xAdjP.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//adjp/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//adjp/example)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//adjp/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//adjp/example)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xAdjP.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xAdjP.16.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
	</section1>













































</xsl:template>
</xsl:stylesheet>
