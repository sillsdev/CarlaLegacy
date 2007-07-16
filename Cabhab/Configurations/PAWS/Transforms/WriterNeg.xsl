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
</xsl:attribute>-n't</langData>
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
<xsl:value-of select="//language/langName" />
<xsl:text> uses, the data given will be reviewed here by category or phrase type, as well as adding examples used in complete sentences and discussing any co-occurrence restrictions between the various negative elements.</xsl:text>
</p>
		<section2 id="sNegType">
			<secTitle>Type of Negation System</secTitle>
			<p>
<xsl:text>Languages fall into two major classifications with respect to negation: Polarity Changing languages versus Negative Concord languages, exemplified by standard English and Spanish or Black English, respectively.</xsl:text>
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
</xsl:attribute>John didn't see nothing</langData>
<xsl:text> is positive because it means the same as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John saw something</langData>
<xsl:text>.  The version with a negative auxiliary is expressed as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John didn't see anything</langData>
<xsl:text>, using what is known as a </xsl:text>
					<xsl:text>negative polarity item</xsl:text>
				<xsl:text> in object position.  Such negative polarity items may occur as subjects in some contexts without any other negation present, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Anyone may come</langData>
<xsl:text>, but they may only occur in object position when some higher (technically c-commanding) element is negative.  For example, one can say </xsl:text>
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
</xsl:attribute>John didn't see nothing</langData>
<xsl:text> is the correct way to express a negative sentence with a negative object.  In these languages, similarly to the restriction on negative polarity items in Polarity Changing languages, a negative element may normally occur in subject position or a fronted position without any other negative element present, but a negative object may only occur when some higher (technically c-commanding) element is negative.  Some Negative Concord languages have the stronger restriction that any negative argument must co-occur with verbal negation and still others require fronting of the negative argument, similarly to the fronting of question words or phrases in content questions.</xsl:text>
</p>
			<xsl:if test="normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)='yesPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)='noPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)='yesPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)='noPosOnly' and normalize-space(////pron/@negIndef)='no'">
<p>
<xsl:value-of select="//language/langName" />
<xsl:text> is neither a Polarity Changing language nor a Negative Concord language, since the only way to express negation is via the verbal affix.  There are not multiple instances of negation to change the polarity or to concord with.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@npDegree)='yes' or normalize-space(////qp/@npDegree)='yesPos' or normalize-space(////qp/@npDegree)='yesNeg' or normalize-space(////qp/@npDegree)='no' or normalize-space(////pron/@negIndef)='yes'">
<p>
<xsl:value-of select="//language/langName" />
<xsl:text> is a </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@type='changing'">
<xsl:text>Polarity Changing</xsl:text>
</xsl:when>
					<xsl:when test="//neg/@type='concord'">
<xsl:text>Negative Concord</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> language, since </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@type='changing'">
<xsl:text>the polarity changes between positive and negative with each instance of negation. </xsl:text>
</xsl:when>
					<xsl:when test="//neg/@type='concord'">
<xsl:text>any number of negative elements simply agree in making the polarity negative. </xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='no' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no'">
<p>
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@polarityItems='yes'">
<xsl:text> has </xsl:text>
</xsl:when>
					<xsl:when test="//neg/@polarityItems='no'">
<xsl:text> does not have any </xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text>negative polarity items.  </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@polarityItems='yes'">
<xsl:text>The following pronouns, special degree elements, and adverbs occur in object position or the normal adverb position instead of the equivalent negative item when another negative element is present in the sentence.</xsl:text>
</xsl:when>
					<xsl:when test="//neg/@polarityItems='no'">
<xsl:text>The negative pronouns, special degree elements, and adverbs may occur in object position or the normal adverb position even when there is another negative element in the sentence.</xsl:text>
</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='yes' or normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='yesNo'">
<p>
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@polarityItems='yes'">
<xsl:text> has </xsl:text>
</xsl:when>
					<xsl:when test="//neg/@polarityItems='no'">
<xsl:text> does not have any </xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text>negative polarity items.  </xsl:text>
<xsl:choose>
					<xsl:when test="//neg/@polarityItems='yes'">
<xsl:text>The following pronouns, determiners, and adverbs occur in object position or the normal adverb position instead of the equivalent negative item when another negative element is present in the sentence.</xsl:text>
</xsl:when>
					<xsl:when test="//neg/@polarityItems='no'">
<xsl:text>The negative pronouns, determiners, and adverbs may occur in object position or the normal adverb position even when there is another negative element in the sentence.</xsl:text>
</xsl:when>
				</xsl:choose>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='no' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no'">
<example num="xNeg.NegType.18">
<table border="1">
					<caption>
						<xsl:text>Negative Polarity Items</xsl:text>
					</caption>
					<tr>
						<td>
							<xsl:text>Pronouns (and/or Phrases)</xsl:text>
						</td>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//neg/npiPronounExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
					<tr>
						<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo'">
<td>
							<xsl:text>Determiners</xsl:text>
						</td>
</xsl:if>
						<xsl:if test="normalize-space(////qp/@determiner)='no' or normalize-space(////qp/@determiner)='yesSome'">
<td>
							<xsl:text>Special Degree elements</xsl:text>
						</td>
</xsl:if>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//neg/npiDeterminerExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
					<tr>
						<td>
							<xsl:text>Temporal Adverbs</xsl:text>
						</td>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//neg/npiTemporalExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
					<tr>
						<td>
							<xsl:text>Locative Adverbs</xsl:text>
						</td>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//neg/npiLocativeExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
					</tr>
				</table>
</example>
</xsl:if>
		</section2>
		<section2 id="sNegVerbal">
			<secTitle>Auxiliary and Verbal Negation</secTitle>
			<p>
<xsl:text>We saw in section </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text> that </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@negAux='yesOnly'">
<xsl:text> has one or more</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='yesAffix'">
<xsl:text> has one or more</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='yesVerb'">
<xsl:text> has one or more</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='yesAll'">
<xsl:text> has one or more</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixOnly'">
<xsl:text> does not have any</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixAndVerb'">
<xsl:text> does not have any</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='noVerb'">
<xsl:text> does not have any</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> negative auxiliaries which are written as separate words, </xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@negAux='yesOnly'">
<xsl:text>and that is the only type of verbal negation in the language.  There is no negative verbal affix nor negative auxiliary affix. </xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='yesAffix'">
<xsl:text>and there is also a negative auxiliary affix, but no negative verbal affix. </xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='yesVerb'">
<xsl:text>and there is also a negative verbal affix, but no negative auxiliary affix. </xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='yesAll'">
<xsl:text>and there is also a negative auxiliary affix and a negative verbal affix. </xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixOnly'">
<xsl:text>but there is a negative affix which goes on the auxiliary and that is the only type of verbal negation in the language.  There is no negative verbal affix.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='noAffixAndVerb'">
<xsl:text>but there is a negative affix which goes on the auxiliary and a negative verbal affix as well.</xsl:text>
</xsl:when>
					<xsl:when test="//ip/@negAux='noVerb'">
<xsl:text>nor any negative affix which goes on an auxiliary.  The only way to express verbal negation is by one or more negative verbal affixes.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////ip/@negAux)='yesOnly' or normalize-space(////ip/@negAux)='yesAffix' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='yesAll'">
					<xsl:text> The negative auxiliary </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@negAuxRequiresAux='no'">
<xsl:text>may</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@negAuxRequiresAux='yes'">
<xsl:text>may not</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text> be the only auxiliary in the phrase; </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@negAuxRequiresAux='no'">
<xsl:text>no other</xsl:text>
</xsl:when>
						<xsl:when test="//ip/@negAuxRequiresAux='yes'">
<xsl:text>the presence of another</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text> auxiliary is required.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='noAffixAndVerb' or normalize-space(////ip/@negAux)='yesAll'">
					<xsl:text>  Further, </xsl:text>
					<xsl:choose>
						<xsl:when test="//neg/@auxVerbRequired='yes'">
<xsl:text>a negative auxiliary is not allowed without the verb also being negative.</xsl:text>
</xsl:when>
						<xsl:when test="//neg/@auxVerbRequired='no'">
<xsl:text>the verb is not required to be negative when there is a negative auxiliary.</xsl:text>
</xsl:when>
					</xsl:choose>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(////ip/@negAux)='yesOnly' or normalize-space(////ip/@negAux)='yesAffix' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='yesAll'">
<p>
<xsl:text>The negative auxiliary word(s) in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='yesOnly' or normalize-space(////ip/@negAux)='yesAffix' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='yesAll'">
<example num="xNeg.NegVerbal.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/negAuxExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/negAuxExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/negAuxExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/negAuxExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='yesOnly' or normalize-space(////ip/@negAux)='yesAffix' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='yesAll'">
<p>
<xsl:text>Examples of the negative auxiliary word(s) used in a complete sentence (without any negative arguments) include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='yesOnly' or normalize-space(////ip/@negAux)='yesAffix' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='yesAll'">
<example num="xNeg.NegVerbal.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/auxExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//neg/auxExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/auxExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//neg/auxExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.12.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='noAffixOnly' or normalize-space(////ip/@negAux)='yesAffix' or normalize-space(////ip/@negAux)='noAffixAndVerb' or normalize-space(////ip/@negAux)='yesAll'">
<p>
<xsl:text>Examples of the negative auxiliary affixes in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> attached to an auxiliary include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='noAffixOnly' or normalize-space(////ip/@negAux)='yesAffix' or normalize-space(////ip/@negAux)='noAffixAndVerb' or normalize-space(////ip/@negAux)='yesAll'">
<example num="xNeg.NegVerbal.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/negAuxAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/negAuxAffixExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/negAuxAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/negAuxAffixExample)" />
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
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='noAffixOnly' or normalize-space(////ip/@negAux)='yesAffix' or normalize-space(////ip/@negAux)='noAffixAndVerb' or normalize-space(////ip/@negAux)='yesAll'">
<p>
<xsl:text>Examples of the negative auxiliary affixes attached to an auxiliary used in a complete sentence (without any negative arguments) include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='noAffixOnly' or normalize-space(////ip/@negAux)='yesAffix' or normalize-space(////ip/@negAux)='noAffixAndVerb' or normalize-space(////ip/@negAux)='yesAll'">
<example num="xNeg.NegVerbal.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/auxAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//neg/auxAffixExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/auxAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//neg/auxAffixExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.20.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='noVerb' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='noAffixAndVerb' or normalize-space(////ip/@negAux)='yesAll'">
<p>
<xsl:text>Examples of the negative verbal affixes in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> attached to a verb include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='noVerb' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='noAffixAndVerb' or normalize-space(////ip/@negAux)='yesAll'">
<example num="xNeg.NegVerbal.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/negVerbExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//ip/negVerbExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/negVerbExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//ip/negVerbExample)" />
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
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='noVerb' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='noAffixAndVerb' or normalize-space(////ip/@negAux)='yesAll'">
<p>
<xsl:text>Full sentence examples with negative verbs include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////ip/@negAux)='noVerb' or normalize-space(////ip/@negAux)='yesVerb' or normalize-space(////ip/@negAux)='noAffixAndVerb' or normalize-space(////ip/@negAux)='yesAll'">
<example num="xNeg.NegVerbal.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/verbAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//neg/verbAffixExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/verbAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//neg/verbAffixExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegVerbal.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegVerbal.28.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
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
			<p>
<xsl:text>We saw in section </xsl:text>
<sectionRef sec="sAdvPTemporal" />
<xsl:text> that in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> the negative temporal idea of  'no when' is expressed </xsl:text>
<xsl:choose>
<xsl:when test="//advp/@negTemporalType='word'">
<xsl:text>by one or more separate words.  Examples</xsl:text>
</xsl:when>
<xsl:when test="//advp/@negTemporalType='affix'">
<xsl:text>by one or more verbal affixes, rather than by separate words.  Examples of the affix(es) attached to verbs</xsl:text>
</xsl:when>
<xsl:when test="//advp/@negTemporalType='verb'">
<xsl:text>using the verbal negative affix, which may occur with positive temporal adverbs to give a negative temporal meaning.  Examples of temporal adverbs with a negative verb</xsl:text>
</xsl:when>
</xsl:choose>
<xsl:text> include:</xsl:text>
</p>
			<xsl:if test="normalize-space(////advp/@negTemporalType)='affix'">
<example num="xNeg.NegAdverb.6">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//advp/negTemporalAffixExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/negTemporalAffixExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.6</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.6.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////advp/@negTemporalType)='word' or normalize-space(////advp/@negTemporalType)='verb'">
<example num="xNeg.NegAdverb.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negTemporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//advp/negTemporalExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negTemporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/negTemporalExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.8.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<p>
<xsl:text>Complete sentence examples containing a negative temporal include:</xsl:text>
</p>
			<example num="xNeg.NegAdverb.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/advTemporalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//neg/advTemporalExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/advTemporalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//neg/advTemporalExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.12.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sAdvPLocative" />
<xsl:text> we saw that in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> the negative locative idea of  'nowhere' is expressed </xsl:text>
<xsl:choose>
<xsl:when test="//advp/@negLocativeType='word'">
<xsl:text>by one or more separate words.  Examples</xsl:text>
</xsl:when>
<xsl:when test="//advp/@negLocativeType='affix'">
<xsl:text>by one or more verbal affixes, rather than by separate words.  Examples of the affix(es) attached to verbs</xsl:text>
</xsl:when>
<xsl:when test="//advp/@negLocativeType='verb'">
<xsl:text>using the verbal negative affix, which may occur with positive locative adverbs to give a negative locative meaning.  Examples of locative adverbs with a negative verb</xsl:text>
</xsl:when>
</xsl:choose>
<xsl:text> include:</xsl:text>
</p>
			<xsl:if test="normalize-space(////advp/@negLocativeType)='affix'">
<example num="xNeg.NegAdverb.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeAffixExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//advp/negLocativeAffixExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeAffixExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/negLocativeAffixExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.16.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////advp/@negLocativeType)='word' or normalize-space(////advp/@negLocativeType)='verb'">
<example num="xNeg.NegAdverb.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//advp/negLocativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//advp/negLocativeExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//advp/negLocativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//advp/negLocativeExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.18.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<p>
<xsl:text>Complete sentence examples containing a negative locative include:</xsl:text>
</p>
			<example num="xNeg.NegAdverb.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/advLocativeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//neg/advLocativeExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/advLocativeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//neg/advLocativeExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegAdverb.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegAdverb.22.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<xsl:if test="normalize-space(////advp/@negTemporalType)='word' or normalize-space(////advp/@negLocativeType)='word'">
<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:choose>
					<xsl:when test="//neg/@advVerbRequired='yes'">
<xsl:text> a negative adverb written as a separate word is not allowed without the verb also being negative.</xsl:text>
</xsl:when>
					<xsl:when test="//neg/@advVerbRequired='no'">
<xsl:text> the verb is not required to be negative when there is a negative adverb written as a separate word.</xsl:text>
</xsl:when>
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
<xsl:value-of select="//language/langName" />
<xsl:text> will be exemplified in complete sentences when used as subjects and direct objects, and any restrictions will be discussed.</xsl:text>
<xsl:if test="normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='no' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no'">
					<xsl:text>  The use of negative polarity items in </xsl:text>
					<xsl:value-of select="//language/langName" />
					<xsl:text> will also be covered in section</xsl:text>
					<sectionRef sec="sNegNominalObject" />
					<xsl:text>.</xsl:text>
				</xsl:if>
</p>
			<section3 id="sNegNominalSubject">
				<secTitle>Negative Subjects</secTitle>
				<xsl:if test="normalize-space(////qp/@npDegree)='noPosOnly' or normalize-space(////qp/@npDegree)='yesPosOnly'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> we saw that </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have any way to express the negative special degree idea of 'not' modifying the whole nominal phrase.  Neither negative special degree words nor phrasal clitics nor affixes attached to the head noun are used to negate a nominal phrase in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@npDegree)='no' or normalize-space(////qp/@npDegree)='yesPos'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> we saw that </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have any negative special degree words that are written as a separate word and modify the whole nominal phrase.  Instead, they are </xsl:text>
<xsl:choose>
						<xsl:when test="//qp/@npDegreeNegType='proclitic'">
<xsl:text>phrasal proclitics which attach to the front of whatever word begins the nominal phrase,</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@npDegreeNegType='enclitic'">
<xsl:text>phrasal enclitics which attach to the end of whatever word ends the nominal phrase,</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@npDegreeNegType='clitic'">
<xsl:text>phrasal clitics which attach either to the front of whatever word begins the nominal phrase or to the end of whatever word ends the nominal phrase,</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@npDegreeNegType='prefix'">
<xsl:text>prefixes which attach to the head noun of the nominal phrase,</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@npDegreeNegType='suffix'">
<xsl:text>suffixes which attach to the head noun of the nominal phrase,</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@npDegreeNegType='affix'">
<xsl:text>either prefixes or suffixes which attach to the head noun of the nominal phrase,</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text> as shown in the following table.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@npDegree)='yes' or normalize-space(////qp/@npDegree)='yesNeg'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text> we saw that </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has the following special negative degree words that are written as a separate word and modify the whole nominal phrase:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly'">
<example num="xNeg.NegNominal.NegNominalSubject.10">
<table border="1">
						<caption>
							<xsl:text>Negative Special Degree elements</xsl:text>
						</caption>
						<tr>
							<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//qp/not),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
						</tr>
					</table>
</example>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> negative nominal phrase examples using the negative special degree elements include:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly'">
<example num="xNeg.NegNominal.NegNominalSubject.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/negExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//qp/negExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/negExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/negExample)" />
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
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@npDegree)='yes' and normalize-space(////qp/@npDegreeNegCooccur)='yes' or normalize-space(////qp/@npDegree)!='yes' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>Examples which include the positive special degree elements as well are:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@npDegree)='yes' and normalize-space(////qp/@npDegreeNegCooccur)='yes' or normalize-space(////qp/@npDegree)!='yes' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly'">
<example num="xNeg.NegNominal.NegNominalSubject.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/negCooccurExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//qp/negCooccurExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/negCooccurExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/negCooccurExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.18.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>These negative nominal phrases may be used as the subject of a full sentence as shown here:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly'">
<example num="xNeg.NegNominal.NegNominalSubject.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/degreeSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//neg/degreeSubjExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/degreeSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//neg/degreeSubjExample)" />
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
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)='yesPosOnly' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)='yesPosOnly' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)='noPosOnly' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)='noPosOnly'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text> we saw that </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>  does not have a separate set of quantifiers which act as the only determiner in the nominal phrase.  Just as there is not any way to express the negative special degree element 'not', there is not any way to express 'no' modifying a nominal phrase in this language.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text> we saw that </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have a separate set of negative quantifiers that are written as separate words and act as the only determiner in the nominal phrase.  Negation of a nominal phrase is expressed by the special degree elements only. </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sQPDeterminers" />
<xsl:text> we saw that </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has the following negative quantifiers which are written as separate words and act as the only determiner in the nominal phrase:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo'">
<example num="xNeg.NegNominal.NegNominalSubject.30">
<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo'">
<table border="1">
						<caption>
							<xsl:text>Negative Quantifier Determiners</xsl:text>
						</caption>
						<tr>
							<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//qp/determinerNegExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
						</tr>
					</table>
</xsl:if>
</example>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> negative nominal phrase examples using the negative quantifier determiners include:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo'">
<example num="xNeg.NegNominal.NegNominalSubject.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/determinerNegNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//qp/determinerNegNPExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/determinerNegNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/determinerNegNPExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.34.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo'">
<p>
<xsl:text>These negative nominal phrases may be used as the subject of a full sentence as shown here:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo'">
<example num="xNeg.NegNominal.NegNominalSubject.38">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/determinerSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//neg/determinerSubjExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/determinerSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//neg/determinerSubjExample)" />
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
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
			<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sPronIndef" />
<xsl:text>, we saw that </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has the following negative indefinite pronouns and/or nominal phrases:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)='yesPosOnly' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)='yesPosOnly' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)='noPosOnly' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)='noPosOnly'">
<p>
<xsl:text>In section </xsl:text>
<sectionRef sec="sPronIndef" />
<xsl:text>, we saw that </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:choose>
					<xsl:when test="//pron/@negIndef='no'">
<xsl:text>does not have any negative indefinite pronouns and no negative indefinite nominal phrases either, since the language does not have any means of negating a nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//pron/@negIndef='yes'">
<xsl:text> has the following negative indefinite pronouns:</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@npDegree)='yes' or normalize-space(////qp/@npDegree)='yesPos' or normalize-space(////qp/@npDegree)='yesNeg' or normalize-space(////qp/@npDegree)='no' or normalize-space(////pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalSubject.44">
<table border="1">
						<caption>
							<xsl:text>Negative Indefinites</xsl:text>
						</caption>
						<xsl:if test="normalize-space(////pron/@negIndef)='yes'">
<tr>
							<td>
								<xsl:text>Pronouns</xsl:text>
							</td>
							<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/negIndefExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////qp/@npDegree)!='yesPosOnly'">
<tr>
							<td>
								<xsl:text>Nominal Phrases</xsl:text>
							</td>
							<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//pron/negIndefNPExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length($sExampleValue)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length($sExampleValue)" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</td>
						</tr>
</xsl:if>
					</table>
</example>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@npDegree)='yes' or normalize-space(////qp/@npDegree)='yesPos' or normalize-space(////qp/@npDegree)='yesNeg' or normalize-space(////qp/@npDegree)='no' or normalize-space(////pron/@negIndef)='yes'">
<p>
<xsl:text>These negative nominal phrases may be used as the subject of a full sentence as shown here:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@npDegree)='yes' or normalize-space(////qp/@npDegree)='yesPos' or normalize-space(////qp/@npDegree)='yesNeg' or normalize-space(////qp/@npDegree)='no' or normalize-space(////pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalSubject.48">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/pronounSubjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//neg/pronounSubjExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/pronounSubjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//neg/pronounSubjExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNeg.NegNominal.NegNominalSubject.48</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNeg.NegNominal.NegNominalSubject.48.1</xsl:text>
</xsl:attribute>
<lineGroup>
<line>
<langData>
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@npDegree)='yes' or normalize-space(////qp/@npDegree)='yesPos' or normalize-space(////qp/@npDegree)='yesNeg' or normalize-space(////qp/@npDegree)='no' or normalize-space(////pron/@negIndef)='yes'">
<p>
<xsl:text>As the above sentence examples show, </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@subjVerbRequired='yes'">
<xsl:text>a negative subject is not allowed without also having a negative verb or auxiliary</xsl:text>
</xsl:when>
						<xsl:when test="//neg/@subjVerbRequired='no'">
<xsl:text>the verb or auxiliary is not required to be negative when the subject is negative</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text> in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
			</section3>
			<section3 id="sNegNominalObject">
				<secTitle>Negative Objects</secTitle>
<xsl:if test="normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)='yesPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)='noPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)='yesPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)='noPosOnly' and normalize-space(////pron/@negIndef)='no'">
<p>
<xsl:text>Since </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have any means of negating a nominal phrase, nor any negative indefinite pronouns, it cannot have any negative objects.  </xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='no' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no'">
<p>
<xsl:text>As we saw in section </xsl:text>
<sectionRef sec="sNegType" />
<xsl:text>, </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has negative polarity items.  Therefore, a negative nominal phrase is not allowed to occur in object position.  Instead, one of the negative polarity items is used and </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@objVerbRequired='yes'">
<xsl:text>the verb or auxiliary must be negative.</xsl:text>
</xsl:when>
						<xsl:when test="//neg/@objVerbRequired='other'">
<xsl:text>either the verb or auxiliary or some other element in the sentence must be negative.</xsl:text>
</xsl:when>
					</xsl:choose>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@npDegree)='yes' or normalize-space(////qp/@npDegree)='yesPos' or normalize-space(////qp/@npDegree)='yesNeg' or normalize-space(////qp/@npDegree)='no' or normalize-space(////pron/@negIndef)='yes'">
<p>
<xsl:text>Examples in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> with a positive subject and a negative </xsl:text>
<xsl:if test="normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing'">
						<xsl:text>polarity item in the </xsl:text>
					</xsl:if>
<xsl:text>object nominal phrase include:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@npDegree)='yes' or normalize-space(////qp/@npDegree)='yesPos' or normalize-space(////qp/@npDegree)='yesNeg' or normalize-space(////qp/@npDegree)='no' or normalize-space(////pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalObject.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/objectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//neg/objectExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/objectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//neg/objectExample)" />
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
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@npDegree)='yes' or normalize-space(////qp/@npDegree)='yesPos' or normalize-space(////qp/@npDegree)='yesNeg' or normalize-space(////qp/@npDegree)='no' or normalize-space(////pron/@negIndef)='yes'">
<p>
<xsl:text>Examples in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> with a positive subject and a negative </xsl:text>
<xsl:if test="normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing'">
						<xsl:text>polarity item in the </xsl:text>
					</xsl:if>
<xsl:text>indirect object nominal phrase include:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@npDegree)='yes' or normalize-space(////qp/@npDegree)='yesPos' or normalize-space(////qp/@npDegree)='yesNeg' or normalize-space(////qp/@npDegree)='no' or normalize-space(////pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalObject.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/indirectObjectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//neg/indirectObjectExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/indirectObjectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//neg/indirectObjectExample)" />
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
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@npDegree)='yes' or normalize-space(////qp/@npDegree)='yesPos' or normalize-space(////qp/@npDegree)='yesNeg' or normalize-space(////qp/@npDegree)='no' or normalize-space(////pron/@negIndef)='yes'">
<p>
<xsl:text>Finally, examples in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> with both a negative subject and a negative </xsl:text>
<xsl:if test="normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing'">
						<xsl:text>polarity item in the </xsl:text>
					</xsl:if>
<xsl:text>object nominal phrase include:</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////qp/@determiner)='yes' or normalize-space(////qp/@determiner)='yesNo' or normalize-space(////qp/@npDegree)='yes' or normalize-space(////qp/@npDegree)='yesPos' or normalize-space(////qp/@npDegree)='yesNeg' or normalize-space(////qp/@npDegree)='no' or normalize-space(////pron/@negIndef)='yes'">
<example num="xNeg.NegNominal.NegNominalObject.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//neg/subjectObjectExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//neg/subjectObjectExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//neg/subjectObjectExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//neg/subjectObjectExample)" />
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
<xsl:attribute name="lang">l<xsl:value-of select="//language/langAbbr" />
</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</line>
<xsl:call-template name="DoGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
</xsl:if>
				<xsl:if test="normalize-space(////neg/@polarityItems)='no' and normalize-space(////qp/@determiner)='no' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@polarityItems)='no' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@polarityItems)='no' and normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////neg/@polarityItems)='no' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////neg/@type)='concord' and normalize-space(////qp/@determiner)='no' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@type)='concord' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@type)='concord' and normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////neg/@type)='concord' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no'">
<p>
<xsl:text>As these examples show, a negative nominal phrase is </xsl:text>
<xsl:if test="normalize-space(////neg/@objVerbRequired)!='no'">
						<xsl:text>not</xsl:text>
					</xsl:if>
<xsl:text> allowed to occur in object or indirect object position </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@objVerbRequired='yes'">
<xsl:text>unless the verb or auxiliary is negative. </xsl:text>
</xsl:when>
						<xsl:when test="//neg/@objVerbRequired='other'">
<xsl:text>unless either the verb or auxiliary or some other element in the sentence is negative. </xsl:text>
</xsl:when>
						<xsl:when test="//neg/@objVerbRequired='no'">
<xsl:text>without any restriction about other negative elements in the sentence. </xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:if test="normalize-space(////neg/@type)='concord'">
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="//neg/@negFront='yes'">
<xsl:text> A negative object must appear initially in the sentence, similarly to the fronting of question phrases in English.</xsl:text>
</xsl:when>
	<xsl:when test="//neg/@negFront='optional'">
<xsl:text> A negative object may appear initially in the sentence, or it may remain in its normal position.</xsl:text>
</xsl:when>
	<xsl:when test="//neg/@negFront='beforeVerb'">
<xsl:text> A negative object may appear in the position directly before the verb, or it may remain in its normal position.</xsl:text>
</xsl:when>
	<xsl:when test="//neg/@negFront='no'">
<xsl:text> A negative object simply appears in its normal position in the sentence, without any movement.</xsl:text>
</xsl:when>
</xsl:choose>
<xsl:text></xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='no' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////pron/@negIndef)='yes' or normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='no' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no' or normalize-space(////neg/@polarityItems)='yes' and normalize-space(////neg/@type)='changing' and normalize-space(////qp/@determiner)='yesSome' and normalize-space(////qp/@npDegree)!='yesPosOnly' and normalize-space(////qp/@npDegree)!='noPosOnly' and normalize-space(////pron/@negIndef)='no'">
<p>
<xsl:text>As these examples show, a negative polarity item is </xsl:text>
<xsl:if test="normalize-space(////neg/@objVerbRequired)!='no'">
						<xsl:text>not</xsl:text>
					</xsl:if>
<xsl:text> allowed to occur in object or indirect object position </xsl:text>
<xsl:choose>
						<xsl:when test="//neg/@objVerbRequired='yes'">
<xsl:text>unless the verb or auxiliary is negative.</xsl:text>
</xsl:when>
						<xsl:when test="//neg/@objVerbRequired='other'">
<xsl:text>unless either the verb or auxiliary or some other element in the sentence is negative.</xsl:text>
</xsl:when>
						<xsl:when test="//neg/@objVerbRequired='no'">
<xsl:text>without any restriction about other negative elements in the sentence.</xsl:text>
</xsl:when>
					</xsl:choose>
</p>
</xsl:if>

			</section3>
		</section2>
	</section1>

















































































































































































































































































































































































</xsl:template>
</xsl:stylesheet>
