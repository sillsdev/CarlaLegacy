<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="neg">
	 <section1 id="sNeg">
		<secTitle>Negation Constructions</secTitle>
		<p>
<xsl:text>All languages have the ability to express negation.  This is usually achieved through the use of:</xsl:text>
</p>
		<ul>
			<li>
				<xsl:text>special negative degree words, such as </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
				<xsl:text> (section </xsl:text>
				<sectionRef sec="sQPAll" />
				<xsl:text>), or negative quantifier determiners, such as </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
				<xsl:text> (section </xsl:text>
				<sectionRef sec="sQPDeterminers" />
				<xsl:text>), which negate a nominal phrase,</xsl:text>
			</li>
			<li>
				<xsl:text>negative indefinite pronouns, such as </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>noboby</langData>
				<xsl:text> or </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nothing</langData>
				<xsl:text> (section </xsl:text>
				<sectionRef sec="sPronIndef" />
				<xsl:text>), which express a negative nominal argument by themselves,</xsl:text>
			</li>
			<li>
				<xsl:text>negative adverbs, such as </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>never</langData>
				<xsl:text> (section </xsl:text>
				<sectionRef sec="sAdvPTemporal" />
				<xsl:text>) or </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nowhere</langData>
				<xsl:text> (section </xsl:text>
				<sectionRef sec="sAdvPLocative" />
				<xsl:text>),</xsl:text>
			</li>
			<li>
				<xsl:text>negative auxiliaries, such as </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
				<xsl:text> or the contraction affixal form </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>-n’t</langData>
				<xsl:text> (section </xsl:text>
				<sectionRef sec="sIPAux" />
				<xsl:text>), and/or</xsl:text>
			</li>
			<li>
				<xsl:text>negative verbal affixes (section </xsl:text>
				<sectionRef sec="sIPAux" />
				<xsl:text>).</xsl:text>
			</li>
		</ul>
		<p>
<xsl:text>All of the above have been covered as individual items in previous sections (as noted).  After discussing the type of negation system </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> uses, the data given will be reviewed here by category or phrase type.  Examples of each construction used in complete sentences will be given and co-occurrence restrictions between the various negative elements will be discussed.</xsl:text>
</p>
		<section2 id="sNegType">
			<secTitle>Type of Negation System</secTitle>
			<p>
<xsl:text>Languages fall into two major classifications with respect to negation: Polarity Changing languages versus Negative Concord languages, exemplified by standard English versus Spanish or Black English, respectively.</xsl:text>
</p>
			<p>
<xsl:text>Polarity Changing languages normally allow only a single negative element in the sentence for negation to be expressed (though technically any odd number of negatives expresses negative polarity) because the presence of two (or any even number of) negative elements changes the polarity back to positive.  For example, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John saw nothing</langData>
<xsl:text> is negative, but </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn’t see nothing</langData>
<xsl:text> is positive because it means the same as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John saw something</langData>
<xsl:text>.  The version with a negative auxiliary is expressed as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn’t see anything</langData>
<xsl:text>, using what is known as a “negative polarity item” in object position.  Such negative polarity items may occur as subjects in some contexts without any other negation present, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Anyone may come</langData>
<xsl:text>, but they may only occur in object position when some earlier element in the sentence is negative.  For example, one can say </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nobody saw anyone</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Nowhere will they find anyone</langData>
<xsl:text> but without the negative subject or fronted negative adverb the negative auxiliary must be used, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>We did not see anyone</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>They will not find anyone anywhere</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>In Negative Concord languages, any number of negative elements expresses negative polarity, so in a Negative Concord version of English (such as Black English) </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn’t see nothing</langData>
<xsl:text> is the correct way to express a negative sentence with a negative object.  In these languages, a negative element may normally occur in subject position or a fronted position without any other negative element present, but a negative object may only occur when some earlier element in the sentence is negative.  Some Negative Concord languages have the stronger restriction that any negative word or phrase must co-occur with verbal negation and still others require fronting of the negative word or phrase, similarly to the fronting of question words or phrases in content questions.</xsl:text>
</p>
			<xsl:if test="normalize-space(//qp/@determinerNeg)='none' and normalize-space(//qp/@npDegreeNeg)='none' and normalize-space(//pron/@negIndef)='no'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is neither a Polarity Changing language nor a Negative Concord language, since the only way to express negation is via the verbal affix.  There are not multiple instances of negation to change the polarity or to concord with.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is a </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@type='changing'">Polarity Changing</xsl:when>
					<xsl:when test="//neg/@type='concord'">Negative Concord</xsl:when>
				</xsl:choose>
<xsl:text> language, since </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@type='changing'">the polarity changes between positive and negative with each instance of negation. </xsl:when>
					<xsl:when test="//neg/@type='concord'">any number of negative elements simply agree in making the polarity negative. </xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
	 <xsl:if test="normalize-space(//neg/@type)='concord'">
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
<xsl:text>, a negative-marked verb </xsl:text>
<xsl:choose>
				<xsl:when test="//neg/@objVerbRequired='no'">is not required when the object is negative.  </xsl:when>
				<xsl:when test="//neg/@objVerbRequired='yes'">is required when the object is negative.  </xsl:when>
				<xsl:when test="//neg/@objVerbRequired='other'"> is not required when the object is negative, but if the verb is not negative then another negative word or phrase must occur earlier in the sentence.  </xsl:when>
</xsl:choose>
<xsl:text>Further, </xsl:text>
<xsl:choose>
			 <xsl:when test="//neg/@negFront='no'">a negative object simply appears in its normal position in the sentence.</xsl:when>
			 <xsl:when test="//neg/@negFront='yes'">fronting of the negative word or phrase is required, similar to the fronting in questions.</xsl:when>
			 <xsl:when test="//neg/@negFront='optional'">a negative object may appear initially in the sentence, or it may remain in its normal position.</xsl:when>
			 <xsl:when test="//neg/@negFront='beforeVerb'">a negative object may appear in the position directly before the verb, or it may remain in its normal position.</xsl:when>
</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='no' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='none' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='no' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='none' and normalize-space(//qp/@npDegreeNeg)='some'">
<p>
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
					<xsl:when test="//neg/@polarityItems='yes'"> has </xsl:when>
					<xsl:when test="//neg/@polarityItems='no'"> does not have any </xsl:when>
				</xsl:choose>
<xsl:text>negative polarity items.  </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@polarityItems='yes'">The following pronouns, special degree elements, and adverbs occur in object position or the normal adverb position instead of the equivalent negative item when another negative element is present in the sentence.</xsl:when>
					<xsl:when test="//neg/@polarityItems='no'">The negative pronouns, special degree elements, and adverbs may occur in object position or the normal adverb position even when there is another negative element in the sentence.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='some'">
<p>
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
					<xsl:when test="//neg/@polarityItems='yes'"> has </xsl:when>
					<xsl:when test="//neg/@polarityItems='no'"> does not have any </xsl:when>
				</xsl:choose>
<xsl:text>negative polarity items.  </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@polarityItems='yes'">The following pronouns, determiners, and adverbs occur in object position or the normal adverb position instead of the equivalent negative item when another negative element is present in the sentence.</xsl:when>
					<xsl:when test="//neg/@polarityItems='no'">The negative pronouns, determiners, and adverbs may occur in object position or the normal adverb position even when there is another negative element in the sentence.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
<example num="xNeg.NegType.20">
<table border="1">
  <tr>
	  <th>Type</th>
	  <th>Negative Polarity Items</th>
	  <th>Gloss</th>
  </tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//neg/npiPronounExample),'.','')" />
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
<td align="left" rowspan="1">
							<xsl:text>Pronouns (and/or Phrases)</xsl:text>
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
<td align="left" rowspan="1">
							<xsl:text>Pronouns (and/or Phrases)</xsl:text>
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
					<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//neg/npiDeterminerExample),'.','')" />
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
<xsl:if test="normalize-space(//qp/@determinerNeg)='no' or normalize-space(//qp/@determinerNeg)='none'">
<td align="left" rowspan="1">
							<xsl:text>Special Degree elements</xsl:text>
						</td>
</xsl:if>
<xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<td align="left" rowspan="1">
							<xsl:text>Determiners</xsl:text>
						</td>
</xsl:if>
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
<xsl:if test="normalize-space(//qp/@determinerNeg)='no' or normalize-space(//qp/@determinerNeg)='none'">
<td align="left" rowspan="1">
							<xsl:text>Special Degree elements</xsl:text>
						</td>
</xsl:if>
<xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<td align="left" rowspan="1">
							<xsl:text>Determiners</xsl:text>
						</td>
</xsl:if>
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
					<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//neg/npiTemporalExample),'.','')" />
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
<td align="left" rowspan="">
							<xsl:text>Temporal Adverbs</xsl:text>
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
<td align="left" rowspan="">
							<xsl:text>Temporal Adverbs</xsl:text>
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
					<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//neg/npiLocativeExample),'.','')" />
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
<td align="left" rowspan="">
							<xsl:text>Locative Adverbs</xsl:text>
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
<td align="left" rowspan="">
							<xsl:text>Locative Adverbs</xsl:text>
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
			<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='some'">
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
<xsl:text>, a negative-marked verb </xsl:text>
<xsl:choose>
			   <xsl:when test="//neg/@objVerbRequired='no'">is not required when there is a negative-polarity item in the object position.  </xsl:when>
			   <xsl:when test="//neg/@objVerbRequired='yes'">is required when there is a negative-polarity item in the object position.  </xsl:when>
			   <xsl:when test="//neg/@objVerbRequired='other'"> is not required when there is a negative-polarity item in the object position, but if the verb is not negative then another negative word or phrase must occur earlier in the sentence.  </xsl:when>
</xsl:choose>
</p>
</xsl:if>
		</section2>
		<section2 id="sNegVerbal">
			<secTitle>Auxiliary and Verbal Negation</secTitle>
			<p>
<xsl:text>We saw in section </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text> that </xsl:text>
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
				  <xsl:when test="//ip/@negAux='yes'"> has one or more</xsl:when>
				  <xsl:when test="//ip/@negAux='no'"> does not have any</xsl:when>
			   </xsl:choose>
<xsl:text> negative auxiliaries which are written as separate words. </xsl:text>
<xsl:if test="normalize-space(//ip/@negAux)='yes'">
				  <xsl:text> The negative auxiliary </xsl:text>
				  <xsl:choose>
					 <xsl:when test="//ip/@negAuxRequiresAux='no'">may</xsl:when>
					 <xsl:when test="//ip/@negAuxRequiresAux='yes'">may not</xsl:when>
				  </xsl:choose>
				  <xsl:text> be the only auxiliary in the phrase; </xsl:text>
				  <xsl:choose>
					 <xsl:when test="//ip/@negAuxRequiresAux='no'">no other</xsl:when>
					 <xsl:when test="//ip/@negAuxRequiresAux='yes'">the presence of another</xsl:when>
				  </xsl:choose>
				  <xsl:text> auxiliary is required.</xsl:text>
			   </xsl:if>
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
<xsl:text></xsl:text>
<xsl:choose>
				 <xsl:when test="//ip/@negAuxAffix='yes'"> there is <xsl:choose>
<xsl:when test="//ip/@negAux='yes'">also</xsl:when>
</xsl:choose> a negative affix which attaches to a positive auxiliary to make it negative, </xsl:when>
				 <xsl:when test="//ip/@negAuxAffix='no'"> there is not any negative affix which attaches to a positive auxiliary to make it negative, </xsl:when>
			  </xsl:choose>
<xsl:choose>

				 <xsl:when test="//ip/@negVAffix='yes'">
<xsl:choose>
<xsl:when test="//ip/@negAuxAffix='yes'">and</xsl:when>
					<xsl:when test="//ip/@negAuxAffix='no'">but there is</xsl:when>
</xsl:choose> a negative verbal affix. </xsl:when>

				 <xsl:when test="//ip/@negVAffix='no'">
<xsl:choose>
<xsl:when test="//ip/@negAuxAffix='yes'">but not</xsl:when>
					<xsl:when test="//ip/@negAuxAffix='no'">nor</xsl:when>
</xsl:choose> any negative verbal affix.</xsl:when>
			  </xsl:choose>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//ip/@negAux)='yes' or normalize-space(//ip/@negAuxAffix)='yes'">
<p>
<xsl:text>  Further, </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@auxVerbRequired='yes'">a negative auxiliary is not allowed without the verb also being negative.</xsl:when>
						<xsl:when test="//neg/@auxVerbRequired='no'">the verb is not required to be negative when there is a negative auxiliary.</xsl:when>
					</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='yes'">
<p>
<xsl:text>The negative auxiliary word(s) in </xsl:text>
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
			<xsl:if test="normalize-space(//ip/@negAux)='yes'">
<example num="xNeg.NegVerbal.12">
<table border="1">
<tr>
	<th>Negative Auxiliary Words</th>
	<th>Gloss</th>
</tr>
	 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/negAuxExample),'.','')" />
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
			<xsl:if test="normalize-space(//ip/@negAux)='yes'">
<p>
<xsl:text>Examples of the negative auxiliary word(s) used in a complete sentence (without any negative arguments) include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAux)='yes'">
<example num="xNeg.NegVerbal.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/auxExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/auxExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/auxExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/auxExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.16.1</xsl:text>
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
			<xsl:if test="normalize-space(//ip/@negAuxAffix)='yes'">
<p>
<xsl:text>Examples of the negative auxiliary affixes in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> attached to a positive auxiliary include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAuxAffix)='yes'">
<example num="xNeg.NegVerbal.20">
<table border="1">
					<tr>
						<th>Negative Auxiliaries</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/negAuxAffixExample),'.','')" />
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
			<xsl:if test="normalize-space(//ip/@negAuxAffix)='yes'">
<p>
<xsl:text>Examples of the negative auxiliary affixes attached to a positive auxiliary used in a complete sentence (without any negative arguments) include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negAuxAffix)='yes'">
<example num="xNeg.NegVerbal.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/auxAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/auxAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/auxAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/auxAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.24.1</xsl:text>
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
			<xsl:if test="normalize-space(//ip/@negVAffix)='yes'">
<p>
<xsl:text>Examples of the negative verbal affixes in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> attached to a verb include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negVAffix)='yes'">
<example num="xNeg.NegVerbal.28">
<table border="1">
					<tr>
						<th>Negative-Marked Verbs</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//ip/negVerbExample),'.','')" />
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
			<xsl:if test="normalize-space(//ip/@negVAffix)='yes'">
<p>
<xsl:text>Full sentence examples with negative verbs include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@negVAffix)='yes'">
<example num="xNeg.NegVerbal.32">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/verbAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/verbAffixExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/verbAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/verbAffixExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.32</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.32.1</xsl:text>
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
		</section2>
		<section2 id="sNegAdverb">
			<secTitle>Adverbial Negation</secTitle>


			   <xsl:if test="normalize-space(//advp/@negTemporalType)='word'">
<p>
<xsl:text>We saw in section </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> that in </xsl:text>
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
<xsl:text>We saw in section </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> that in </xsl:text>
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
<xsl:text>We saw in section </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> that in </xsl:text>
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
<xsl:text>We saw in section </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> that in </xsl:text>
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
<xsl:text>We saw in section </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> that in </xsl:text>
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
<example num="xNeg.NegAdverb.16">
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
<example num="xNeg.NegAdverb.20">
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
<xsl:with-param name="sExNumber">xNeg.NegAdverb.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.20.1</xsl:text>
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
<example num="xNeg.NegAdverb.24">
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
<example num="xNeg.NegAdverb.28">
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
<example num="xNeg.NegAdverb.32">
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
<example num="xNeg.NegAdverb.36">
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
<xsl:with-param name="sExNumber">xNeg.NegAdverb.36</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.36.1</xsl:text>
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
<example num="xNeg.NegAdverb.40">
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
<xsl:text>Vernacular</xsl:text>
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
<example num="xNeg.NegAdverb.44">
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
<xsl:text>Complete sentence examples containing a negative temporal include:</xsl:text>
</p>
			<example num="xNeg.NegAdverb.48">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/advTemporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/advTemporalExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/advTemporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/advTemporalExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.48</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.48.1</xsl:text>
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


			   <xsl:if test="normalize-space(//advp/@negLocativeType)='word'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sAdvPLocative" />
<xsl:text> we saw that in </xsl:text>
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
<xsl:text>In section </xsl:text>
<sectionRef sec="sAdvPLocative" />
<xsl:text> we saw that in </xsl:text>
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
<xsl:text>In section </xsl:text>
<sectionRef sec="sAdvPLocative" />
<xsl:text> we saw that in </xsl:text>
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
<xsl:text>In section </xsl:text>
<sectionRef sec="sAdvPLocative" />
<xsl:text> we saw that in </xsl:text>
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
<xsl:text>In section </xsl:text>
<sectionRef sec="sAdvPLocative" />
<xsl:text> we saw that in </xsl:text>
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
<example num="xNeg.NegAdverb.62">
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
<example num="xNeg.NegAdverb.66">
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
<xsl:with-param name="sExNumber">xNeg.NegAdverb.66</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.66.1</xsl:text>
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
<example num="xNeg.NegAdverb.70">
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
<example num="xNeg.NegAdverb.74">
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
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
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
<example num="xNeg.NegAdverb.78">
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
<example num="xNeg.NegAdverb.82">
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
<xsl:with-param name="sExNumber">xNeg.NegAdverb.82</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.82.1</xsl:text>
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
<example num="xNeg.NegAdverb.86">
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
<example num="xNeg.NegAdverb.90">
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
<xsl:text>Complete sentence examples containing a negative locative include:</xsl:text>
</p>
			<example num="xNeg.NegAdverb.94">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/advLocativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/advLocativeExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/advLocativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/advLocativeExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.94</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.94.1</xsl:text>
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
			<xsl:if test="normalize-space(//advp/@negTemporalType)='word' or normalize-space(//advp/@negLocativeType)='word'">
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
<xsl:choose>
					<xsl:when test="//neg/@advVerbRequired='yes'"> a negative adverb written as a separate word is not allowed without the verb also being negative.</xsl:when>
					<xsl:when test="//neg/@advVerbRequired='no'"> the verb is not required to be negative when there is a negative adverb written as a separate word.</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
		</section2>

		<section2 id="sNegNominal">
			<secTitle>Negation of Nominal Phrases</secTitle>
			<p>
<xsl:text>A nominal phrase may normally be negated by a special degree word, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text>, or by a quantifier determiner, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text>, or by using a negative indefinite pronoun.  Each type allowed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> will be exemplified in complete sentences when used as subjects and direct objects, and any restrictions will be discussed.</xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='some'">
					<xsl:text>  The use of negative polarity items in </xsl:text>
					<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
					<xsl:text> will also be covered in section</xsl:text>
					<sectionRef sec="sNegNominalObject" />
					<xsl:text>.</xsl:text>
				</xsl:if>
</p>

			<section3 id="sNegNominalSubject">
				<secTitle>Negative Subjects</secTitle>

				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)='none'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> we saw that in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, there does not seem to be any way to express </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text> as modifying a whole nominal phrase.</xsl:text>
</p>
</xsl:if>
				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)='no'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> we saw that in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, these are not expressed as separate words which modify the whole nominal phrase.  Instead, they all attach to another word in the nominal phrase.  The negative special degree elements are </xsl:text>
<xsl:choose>
						 <xsl:when test="//qp/@npDegreeNegType='proclitic'">phrasal proclitics which attach to the front of whatever word begins the nominal phrase.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='enclitic'">phrasal enclitics which attach to the end of whatever word ends the nominal phrase.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='clitic'">phrasal clitics which attach either to the front of whatever word begins the nominal phrase or to the end of whatever word ends the nominal phrase.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='prefix'">prefixes which attach to the head noun of the nominal phrase.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='suffix'">suffixes which attach to the head noun of the nominal phrase.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='affix'">either prefixes or suffixes which attach to the head noun of the nominal phrase.</xsl:when>
					  </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)='some'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> we saw that in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, some are separate words but some of these are not expressed as separate words which modify the whole nominal phrase.  Instead, some of the negative special degree elements are </xsl:text>
<xsl:choose>
						 <xsl:when test="//qp/@npDegreeNegType='proclitic'">phrasal proclitics which attach to the front of whatever word begins the nominal phrase.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='enclitic'">phrasal enclitics which attach to the end of whatever word ends the nominal phrase.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='clitic'">phrasal clitics which attach either to the front of whatever word begins the nominal phrase or to the end of whatever word ends the nominal phrase.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='prefix'">prefixes which attach to the head noun of the nominal phrase.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='suffix'">suffixes which attach to the head noun of the nominal phrase.</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegType='affix'">either prefixes or suffixes which attach to the head noun of the nominal phrase.</xsl:when>
					  </xsl:choose>
<xsl:text>  The negative special degree elements which are expressed as separate words occur </xsl:text>
<xsl:choose>
						 <xsl:when test="//qp/@npDegreeNegPos='before'">before</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='after'">after</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='either'">on either side (but not both sides) of</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='beforeOrBoth'">before or on both sides of</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='afterOrBoth'">after or on both sides of</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='both'">on both sides of</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='unknown'">_______</xsl:when>
					  </xsl:choose>
<xsl:text> the rest of the nominal phrase.  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='unrestricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
						 <xsl:text>All of these words can occur on either side of the nominal phrase.</xsl:text>
					  </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='restricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
						 <xsl:text>There are restrictions as to which of these words can occur on each side of the nominal phrase.  </xsl:text>
					  </xsl:if>
</p>
</xsl:if>

				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)='yes'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> we saw that in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the negative special degree elements are expressed as separate words which modify the whole nominal phrase.    They  occur </xsl:text>
<xsl:choose>
						 <xsl:when test="//qp/@npDegreeNegPos='before'">before</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='after'">after</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='either'">on either side (but not both sides) of</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='beforeOrBoth'">before or on both sides of</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='afterOrBoth'">after or on both sides of</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='both'">on both sides of</xsl:when>
						 <xsl:when test="//qp/@npDegreeNegPos='unknown'">_______</xsl:when>
					  </xsl:choose>
<xsl:text> the rest of the nominal phrase.  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='unrestricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
						 <xsl:text>All of these words can occur on either side of the nominal phrase.</xsl:text>
					  </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegreeNegEither)='restricted' and normalize-space(//qp/@npDegreeNegPos)!='before' and normalize-space(//qp/@npDegreeNegPos)!='after'">
						 <xsl:text>There are restrictions as to which of these words can occur on each side of the nominal phrase.  </xsl:text>
					  </xsl:if>
</p>
</xsl:if>
				   <xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none'">
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
<xsl:text> negative nominal phrase examples not including the positive special degree elements are:</xsl:text>
</p>
</xsl:if>
				 <xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none'">
<example num="xNeg.NegNominal.NegNominalSubject.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/negExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/negExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/negExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/negExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.14.1</xsl:text>
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

			   <xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none' and normalize-space(//qp/@npDegreeNegCooccur)='no'">
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
<xsl:text> does not allow the negative special degree elements to co-occur with the positive special degree words in a single nominal phrase.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none' and normalize-space(//qp/@npDegreeNegCooccur)='yes'">
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
<xsl:text> allows the word(s) meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text> to co-occur with the positive special degree words in a single nominal phrase.  The negative special degree words occur </xsl:text>
<xsl:choose>
					 <xsl:when test="//qp/@npDegreeNegNPPos='before'">before</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegNPPos='after'">after</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegNPPos='either'">on either side (but not both sides) of</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegNPPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegNPPos='beforeOrBoth'">before or on both sides of</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegNPPos='afterOrBoth'">after or on both sides of</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegNPPos='both'">on both sides of</xsl:when>
					 <xsl:when test="//qp/@npDegreeNegNPPos='unknown'">_______</xsl:when>
				  </xsl:choose>
<xsl:text> the rest of the nominal phrase (including the positive special degree words).  </xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none' and normalize-space(//qp/@npDegreeNegCooccur)='yes'">
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
<xsl:text> negative nominal phrase examples which include the positive special degree elements are:</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none' and normalize-space(//qp/@npDegreeNegCooccur)='yes'">
<example num="xNeg.NegNominal.NegNominalSubject.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/negCooccurExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/negCooccurExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/negCooccurExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/negCooccurExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.22.1</xsl:text>
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
				<xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none'">
<p>
<xsl:text>These negative nominal phrases may be used as the subject of a full sentence as shown here:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none'">
<example num="xNeg.NegNominal.NegNominalSubject.26">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/degreeSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/degreeSubjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/degreeSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/degreeSubjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.26.1</xsl:text>
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


			   <xsl:if test="normalize-space(//qp/@determinerNeg)='no'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text> we saw that </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> does not have a separate negaitive quantifier which acts as the only determiner in the nominal phrase.  The negative notion of </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> is like </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text> above.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//qp/@determinerNeg)='attaches'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text> we saw that </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> does not have a separate negaitive quantifier which acts as the only determiner in the nominal phrase.  The negative notion of </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> is expressed by a clitic or affix that attaches to another word in the nominal phrase, like </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text> above.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//qp/@determinerNeg)='none' and normalize-space(//qp/@npDegreeNeg)='none'">
<p>
<xsl:text>Just as there was not any way to express the negative special degree element </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text> above, there is not any way to express </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text> when it is modifying a nominal phrase in this language.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text> we saw that </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has negative quantifiers which are written as separate words and act as the only determiner in the nominal phrase.  They occur </xsl:text>
<xsl:choose>
					 <xsl:when test="//qp/@determinerNegPos='before'">before</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='after'">after</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='either'">on either side (but not both sides) of</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='beforeOrBoth'">before or on both sides of</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='afterOrBoth'">after or on both sides of</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='both'">on both sides of</xsl:when>
					 <xsl:when test="//qp/@determinerNegPos='unknown'">_______</xsl:when>
				  </xsl:choose>
<xsl:text> the head noun.  </xsl:text>
<xsl:if test="normalize-space(//qp/@determinerNegEither)='unrestricted' and normalize-space(//qp/@determinerNegPos)!='before' and normalize-space(//qp/@determinerNegPos)!='after'">
					 <xsl:text>All of the negative quantifier determiners can occur on either side of the noun.</xsl:text>
				  </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@determinerNegEither)='restricted' and normalize-space(//qp/@determinerNegPos)!='before' and normalize-space(//qp/@determinerNegPos)!='after'">
					 <xsl:text>There are restrictions as to which of these negative quantifier determiners can occur on each side of the noun.</xsl:text>
				  </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>

			   <xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
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
<xsl:text> examples of negative quantifier determiners in full nominal phrases include:</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<example num="xNeg.NegNominal.NegNominalSubject.38">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/determinerNegNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/determinerNegNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/determinerNegNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/determinerNegNPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.38</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.38.1</xsl:text>
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

			   <xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<p>
<xsl:text>These negative nominal phrases may be used as the subject of a full sentence as shown here:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//qp/@determinerNeg)='some'">
<example num="xNeg.NegNominal.NegNominalSubject.42">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/determinerSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/determinerSubjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/determinerSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/determinerSubjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.42</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.42.1</xsl:text>
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





			   <xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sPronIndef" />
<xsl:text>, we saw that in </xsl:text>
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
					 <xsl:when test="//pron/@negIndef='no'">all of the negative indefinites are nominal phrases, rather than being single-word pronouns.</xsl:when>
					 <xsl:when test="//pron/@negIndef='yes'">some or all of the negative indefinites are merged into single-word pronouns.  Examples of the negative indefinite pronouns include:</xsl:when>
				  </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>

			   <xsl:if test="normalize-space(//qp/@determinerNeg)='none' and normalize-space(//qp/@npDegreeNeg)='none'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sPronIndef" />
<xsl:text>, we saw that in </xsl:text>
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
					 <xsl:when test="//pron/@negIndef='no'">there are no negative indefinite pronouns and no negative indefinite nominal phrases either, since the language does not have any means of negating a nominal phrase.</xsl:when>
					 <xsl:when test="//pron/@negIndef='yes'">all of the negative indefinites are merged into single-word pronouns.  There are no negative indefinite nominal phrases, since the language does not have any means of negating a nominal phrase.  Examples of the negative indefinite pronouns include:</xsl:when>
				  </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalSubject.48">
<table border="1">
					 <tr>
						<th>Negative Indefinite Pronouns</th>
						<th>Gloss</th>
					 </tr>
					 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//pron/negIndefExample),'.','')" />
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
			   <xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none'">
<p>
<xsl:text>Examples of negative indefinite nominal phrases </xsl:text>
<xsl:if test="normalize-space(//pron/@negIndef)='yes'">
					 <xsl:text>(if any) </xsl:text>
				  </xsl:if>
<xsl:text>include:</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none'">
<example num="xNeg.NegNominal.NegNominalSubject.52">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//pron/negIndefNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//pron/negIndefNPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//pron/negIndefNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//pron/negIndefNPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.52</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.52.1</xsl:text>
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


				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>These negative nominal phrases may be used as the subject of a full sentence as shown here:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalSubject.56">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/pronounSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/pronounSubjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/pronounSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/pronounSubjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.56</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.56.1</xsl:text>
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


				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>As the above sentence examples show, </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@subjVerbRequired='yes'">a negative subject is not allowed without also having a negative verb or auxiliary</xsl:when>
						<xsl:when test="//neg/@subjVerbRequired='no'">the verb or auxiliary is not required to be negative when the subject is negative</xsl:when>
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
<xsl:text>.</xsl:text>
</p>
</xsl:if>
			</section3>


			<section3 id="sNegNominalObject">
				<secTitle>Negative Objects</secTitle>
<xsl:if test="normalize-space(//qp/@determinerNeg)='none' and normalize-space(//qp/@npDegreeNeg)='none' and normalize-space(//pron/@negIndef)='no'">
<p>
<xsl:text>Since </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> does not have any means of negating a nominal phrase, nor any negative indefinite pronouns, it cannot have any negative objects.  </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='some'">
<p>
<xsl:text>As we saw in section </xsl:text>
<sectionRef sec="sNegType" />
<xsl:text>, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has negative polarity items.  Therefore, a negative nominal phrase is not allowed to occur in object position.  Instead, one of the negative polarity items is used and </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@objVerbRequired='yes'">the verb or auxiliary must be negative.</xsl:when>
						<xsl:when test="//neg/@objVerbRequired='other'">either the verb or auxiliary or some other element in the sentence must be negative.</xsl:when>
					</xsl:choose>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Examples in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> with a positive subject and a negative </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
						<xsl:text>polarity item in the </xsl:text>
					</xsl:if>
<xsl:text>object nominal phrase include:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalObject.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/objectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/objectExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/objectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/objectExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalObject.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalObject.10.1</xsl:text>
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
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Examples in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> with a positive subject and a negative </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
						<xsl:text>polarity item in the </xsl:text>
					</xsl:if>
<xsl:text>indirect object nominal phrase include:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalObject.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/indirectObjectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/indirectObjectExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/indirectObjectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/indirectObjectExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalObject.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalObject.14.1</xsl:text>
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
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<p>
<xsl:text>Finally, examples in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> with both a negative subject and a negative </xsl:text>
<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing'">
						<xsl:text>polarity item in the </xsl:text>
					</xsl:if>
<xsl:text>object nominal phrase include:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//qp/@determinerNeg)!='none' or normalize-space(//qp/@npDegreeNeg)!='none' or normalize-space(//pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalObject.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/subjectObjectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//neg/subjectObjectExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/subjectObjectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//neg/subjectObjectExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalObject.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalObject.18.1</xsl:text>
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
				<xsl:if test="normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@polarityItems)='no' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='some' or normalize-space(//neg/@type)='concord' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@type)='concord' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@type)='concord' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//neg/@type)='concord' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@type)='concord' and normalize-space(//qp/@npDegreeNeg)='some'">
<p>
<xsl:text>As these examples show, a negative nominal phrase is </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
						<xsl:text>not</xsl:text>
					</xsl:if>
<xsl:text> allowed to occur in object or indirect object position </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@objVerbRequired='yes'">unless the verb or auxiliary is negative. </xsl:when>
						<xsl:when test="//neg/@objVerbRequired='other'">unless either the verb or auxiliary or some other element in the sentence is negative. </xsl:when>
						<xsl:when test="//neg/@objVerbRequired='no'">without any restriction about other negative elements in the sentence. </xsl:when>
					</xsl:choose>
<xsl:if test="normalize-space(//neg/@type)='concord'">
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="//neg/@negFront='yes'"> A negative object must appear initially in the sentence, similarly to the fronting of question phrases in English.</xsl:when>
	<xsl:when test="//neg/@negFront='optional'"> A negative object may appear initially in the sentence, or it may remain in its normal position.</xsl:when>
	<xsl:when test="//neg/@negFront='beforeVerb'"> A negative object may appear in the position directly before the verb, or it may remain in its normal position.</xsl:when>
	<xsl:when test="//neg/@negFront='no'"> A negative object simply appears in its normal position in the sentence, without any movement.</xsl:when>
</xsl:choose>
<xsl:text></xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//pron/@negIndef)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@determinerNeg)='some' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='yes' or normalize-space(//neg/@polarityItems)='yes' and normalize-space(//neg/@type)='changing' and normalize-space(//qp/@npDegreeNeg)='some'">
<p>
<xsl:text>As these examples show, a negative polarity item is </xsl:text>
<xsl:if test="normalize-space(//neg/@objVerbRequired)!='no'">
						<xsl:text>not</xsl:text>
					</xsl:if>
<xsl:text> allowed to occur in object or indirect object position </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@objVerbRequired='yes'">unless the verb or auxiliary is negative.</xsl:when>
						<xsl:when test="//neg/@objVerbRequired='other'">unless either the verb or auxiliary or some other element in the sentence is negative.</xsl:when>
						<xsl:when test="//neg/@objVerbRequired='no'">without any restriction about other negative elements in the sentence.</xsl:when>
					</xsl:choose>
</p>
</xsl:if>

			</section3>
		</section2>
	</section1>


		 
		
		
		
		


		
		
		
		
		

	
		
	
	
		
		
		

		
		
		
	
	
		
		
		

		
		
		
	

		
		
		
	
		

		
		
		
	
		

		
		
		
	
		

		
		
		
	
		


		
		
		


		
		
		
	
		

		
		
		
		
		
	
	
	
	
	
	

		
		
		
	
		

		
		
		
	
		


		


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
		

   
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
   
   
	  
   
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
   
   
	  
	  
	  
	  
	  
	  
	  
   
   
		
   
   
	  
   
   
	  
	  
	  
	  
	  
	  
	  
   
   
	  
	  
	  
   
   
	  
	  
	  
   

</xsl:template>
</xsl:stylesheet>
