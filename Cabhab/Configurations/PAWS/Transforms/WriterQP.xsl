<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="qp">
	<section1 id="sQP">
		<secTitle>Quantifiers and Quantifier Phrases</secTitle>
		<p>
<xsl:text>Quantifiers can show up in various places in a nominal phrase. Most languages have four sets of quantifiers:</xsl:text>
</p>
		<ul>
			<li>
				<xsl:text>Those meaning </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all</langData>
				<xsl:text> or </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
				<xsl:text>, which modify the whole nominal phrase,</xsl:text>
			</li>
			<li>
				<xsl:text>quantifiers such as </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>some</langData>
				<xsl:text> or </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
				<xsl:text>, which do not co-occur with any other modifers except adjectives,</xsl:text>
			</li>
			<li>
				<xsl:text>other quantifiers such as </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>many</langData>
				<xsl:text>
or </xsl:text>
				<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>few</langData>
				<xsl:text>, and</xsl:text>
			</li>
			<li>
				<xsl:text>numbers.</xsl:text>
			</li>
		</ul>
		<p>
<xsl:text>Each type will be considered in turn.
</xsl:text>
</p>
		<section2 id="sQPAll">
			<secTitle>Quantifiers which modify the whole nominal phrase</secTitle>
			<p>
<xsl:text>Quantifiers meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text> seem to be a category of their
own.  They usually occur first (or last) in a nominal phrase, in a position distinct from
the other quantifiers but in the same place as degree words
like </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just</langData>
<xsl:text> (which can also act as focus markers, to be dscussed in section </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text>) and words that mean the same as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>almost</langData>
<xsl:text> (which can also co-occur with </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all</langData>
<xsl:text>), so we will refer to them as special degree words.  These words modify the whole nominal phrase, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all five children</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only Sue's three children</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>nearly all  John's young children</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just this many children</langData>
<xsl:text>.  Note that </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text> can occur in place of or before these other special degree words, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not the children</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not all five children</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not just this many children</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not only Sue's three children</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> uses the following to express these notions:</xsl:text>
</p>
			<example num="xQP.QPAll.8">
<table border="1">
					<tr>
						<th>
							<xsl:value-of select="//language/langName" />
						</th>
						<th>meaning</th>
					</tr>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//qp/all),'.','')" />
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
						<td>
							<xsl:text>all</xsl:text>
						</td>
					</tr>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//qp/almost),'.','')" />
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
						<td>
							<xsl:text>almost</xsl:text>
						</td>
					</tr>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//qp/only),'.','')" />
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
						<td>
							<xsl:text>only or just</xsl:text>
						</td>
					</tr>
					<xsl:if test="//qp/@npDegree!='noPosOnly' and //qp/@npDegree!='yesPosOnly'">
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
						<td>
							<xsl:text>not</xsl:text>
						</td>
					</tr>
</xsl:if>
				</table>
</example>
			<xsl:if test="//qp/@npDegree='no'">
<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, these are not expressed as separate words which modify the whole nominal phrase.  Instead, they all attach to another word in the nominal phrase.  The positive special degree elements are </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePosType='proclitic'">
<xsl:text>phrasal proclitics which attach to the front of whatever word begins the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='enclitic'">
<xsl:text>phrasal enclitics which attach to the end of whatever word ends the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='clitic'">
<xsl:text>phrasal clitics which attach either to the front of whatever word begins the nominal phrase or to the end of whatever word ends the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='prefix'">
<xsl:text>prefixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='suffix'">
<xsl:text>suffixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='affix'">
<xsl:text>either prefixes or suffixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text>  The negative special degree elements are </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreeNegType='proclitic'">
<xsl:text>phrasal proclitics which attach to the front of whatever word begins the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='enclitic'">
<xsl:text>phrasal enclitics which attach to the end of whatever word ends the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='clitic'">
<xsl:text>phrasal clitics which attach either to the front of whatever word begins the nominal phrase or to the end of whatever word ends the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='prefix'">
<xsl:text>prefixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='suffix'">
<xsl:text>suffixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='affix'">
<xsl:text>either prefixes or suffixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> positive nominal phrase examples include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@npDegree='noPosOnly'">
<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, the positive special degree elements are not expressed as separate words which modify the whole nominal phrase.  Instead, they all attach to another word in the nominal phrase as </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePosType='proclitic'">
<xsl:text>phrasal proclitics which attach to the front of whatever word begins the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='enclitic'">
<xsl:text>phrasal enclitics which attach to the end of whatever word ends the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='clitic'">
<xsl:text>phrasal clitics which attach either to the front of whatever word begins the nominal phrase or to the end of whatever word ends the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='prefix'">
<xsl:text>prefixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='suffix'">
<xsl:text>suffixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='affix'">
<xsl:text>either prefixes or suffixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text>There is not any way to express 'not' modifying a nominal phrase in the language, however.  </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> positive nominal phrase examples include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@npDegree='yesPos'">
<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, the positive special degree elements are expressed as separate words which modify the whole nominal phrase.  They  occur </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the rest of the nominal phrase.  </xsl:text>
<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeEitherRestricted='unrestricted' and //qp/@npDegreePos!='before' and //qp/@npDegreePos!='after'">
					<xsl:text>All of these words can occur on either side of the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeEitherRestricted='restricted' and //qp/@npDegreePos!='before' and //qp/@npDegreePos!='after'">
					<xsl:text>There are restrictions as to which of these words can occur on each side of the nominal phrase.  </xsl:text>
				</xsl:if>
<xsl:text>The negative special degree elements, however, are not expressed as separate words which modify the whole nominal phrase.  Instead, they all attach to another word in the nominal phrase.  These negative special degree elements are </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreeNegType='proclitic'">
<xsl:text>phrasal proclitics which attach to the front of whatever word begins the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='enclitic'">
<xsl:text>phrasal enclitics which attach to the end of whatever word ends the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='clitic'">
<xsl:text>phrasal clitics which attach either to the front of whatever word begins the nominal phrase or to the end of whatever word ends the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='prefix'">
<xsl:text>prefixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='suffix'">
<xsl:text>suffixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegType='affix'">
<xsl:text>either prefixes or suffixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> positive nominal phrase examples include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@npDegree='yesPosOnly'">
<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, the positive special degree elements are expressed as separate words which modify the whole nominal phrase.  They  occur </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the rest of the nominal phrase.  </xsl:text>
<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeEitherRestricted='unrestricted' and //qp/@npDegreePos!='before' and //qp/@npDegreePos!='after'">
					<xsl:text>All of these words can occur on either side of the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeEitherRestricted='restricted' and //qp/@npDegreePos!='before' and //qp/@npDegreePos!='after'">
					<xsl:text>There are restrictions as to which of these words can occur on each side of the nominal phrase.  </xsl:text>
				</xsl:if>
<xsl:text>There is not any way to express 'not' modifying a nominal phrase in the language, however.  </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> positive nominal phrase examples include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@npDegree='yesNeg'">
<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, the positive special degree elements are not expressed as separate words which modify the whole nominal phrase.  Instead, they all attach to another word in the nominal phrase.  These positive special degree elements are </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePosType='proclitic'">
<xsl:text>phrasal proclitics which attach to the front of whatever word begins the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='enclitic'">
<xsl:text>phrasal enclitics which attach to the end of whatever word ends the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='clitic'">
<xsl:text>phrasal clitics which attach either to the front of whatever word begins the nominal phrase or to the end of whatever word ends the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='prefix'">
<xsl:text>prefixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='suffix'">
<xsl:text>suffixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePosType='affix'">
<xsl:text>either prefixes or suffixes which attach to the head noun of the nominal phrase.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text>  The negative special degree elements in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, however, are expressed as separate words which modify the whole nominal phrase.  They  occur </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the rest of the nominal phrase.  </xsl:text>
<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeEitherRestricted='unrestricted' and //qp/@npDegreePos!='before' and //qp/@npDegreePos!='after'">
					<xsl:text>All of these words can occur on either side of the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeEitherRestricted='restricted' and //qp/@npDegreePos!='before' and //qp/@npDegreePos!='after'">
					<xsl:text>There are restrictions as to which of these words can occur on each side of the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> positive nominal phrase examples include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@npDegree='yes'">
<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, these are expressed as separate words which modify the whole nominal phrase.  They  occur </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreePos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreePos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the rest of the nominal phrase.  </xsl:text>
<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeEitherRestricted='unrestricted' and //qp/@npDegreePos!='before' and //qp/@npDegreePos!='after'">
					<xsl:text>All of these words can occur on either side of the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeEitherRestricted='restricted' and //qp/@npDegreePos!='before' and //qp/@npDegreePos!='after'">
					<xsl:text>There are restrictions as to which of these words can occur on each side of the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> positive nominal phrase examples include:</xsl:text>
</p>
</xsl:if>
			<example num="xQP.QPAll.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//qp/example)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/example)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQP.QPAll.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQP.QPAll.22.1</xsl:text>
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
			<xsl:if test="//qp/@npDegree!='noPosOnly' and //qp/@npDegree!='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> negative nominal phrase examples not including the positive special degree elements are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@npDegree!='noPosOnly' and //qp/@npDegree!='yesPosOnly'">
<example num="xQP.QPAll.26">
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
<xsl:with-param name="sExNumber">xQP.QPAll.26</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQP.QPAll.26.1</xsl:text>
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
			<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeNegCooccur='no'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not allow the word(s) meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text> to co-occur with the positive special degree words in a single nominal phrase.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeNegCooccur='yes'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> allows the word(s) meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text> to co-occur with the positive special degree words in a single nominal phrase.  The negative special degree words occur </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@npDegreeNegPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='eitherOrBoth'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@npDegreeNegPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the rest of the nominal phrase (including the positive special degree words).  </xsl:text>
<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeNegEitherRestricted='unrestricted' and //qp/@npDegreeNegPos!='before' and //qp/@npDegreeNegPos!='after'">
					<xsl:text>All of these negative words can occur on either side of the nominal phrase.  </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeNegEitherRestricted='restricted' and //qp/@npDegreeNegPos!='before' and //qp/@npDegreeNegPos!='after'">
					<xsl:text>There are restrictions as to which of these negative words can occur on each side of the nominal phrase.  </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> negative nominal phrase examples which include the positive special degree words are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeNegCooccur='yes' or //qp/@npDegree!='yes' and //qp/@npDegree!='noPosOnly' and //qp/@npDegree!='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> negative nominal phrase examples which include the positive special degree elements are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreeNegCooccur='yes' or //qp/@npDegree!='yes' and //qp/@npDegree!='noPosOnly' and //qp/@npDegree!='yesPosOnly'">
<example num="xQP.QPAll.34">
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
<xsl:with-param name="sExNumber">xQP.QPAll.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQP.QPAll.34.1</xsl:text>
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
			<xsl:if test="//qp/@npDegree!='noPosOnly' and //qp/@npDegree!='yesPosOnly'">
<p>
<xsl:text>See section </xsl:text>
<sectionRef sec="sNegNominal" />
<xsl:text> for examples of the negative elements used in sentences and discussion of the negation constructions in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
		</section2>
		<section2 id="sQPDeterminers">
			<secTitle>Quantifiers which do not co-occur with Determiners</secTitle>
			<p>
<xsl:text>The second set includes quantifiers like </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>some</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>every</langData>
<xsl:text>, and  </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text>, which do not allow any other articles, demonstratives or possessors in the nominal phrase.  English examples include </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>some sad children</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>almost every little girl that I see</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no black dogs</langData>
<xsl:text>.  Because they take the place of articles, demonstratives and possessors, we will treat these quantifiers as determiners with their own phrase structure rule.</xsl:text>
</p>
			<xsl:if test="//qp/@determiner='no' and //qp/@npDegree!='noPosOnly' and //qp/@npDegree!='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have a separate set of quantifiers which act as the only determiner in the nominal phrase.  Negation of a nominal phrase is expressed by the special degree elements only.  The positive notions of </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>some</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>every</langData>
<xsl:text> are either like </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all</langData>
<xsl:text> above or like the quantifiers which may co-occur with articles, demonstratives and/or possessors to be treated in the next section.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@determiner='no' and //qp/@npDegree='noPosOnly' or //qp/@determiner='no' and //qp/@npDegree='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have a separate set of quantifiers which act as the only determiner in the nominal phrase.  Just as there is not any way to express the negative special degree element 'not', there is not any way to express 'no' modifying a nominal phrase in this language.  The positive notions of </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>some</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>every</langData>
<xsl:text> are either like </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all</langData>
<xsl:text> above or like the quantifiers which may co-occur with articles, demonstratives and/or possessors to be treated in the next section.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@determiner='yesSome' and //qp/@npDegree!='noPosOnly' and //qp/@npDegree!='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have a separate set of negative quantifiers which act as the only determiner in the nominal phrase.  Negation of a nominal phrase is expressed by the special degree elements only.                </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has the following positive quantifiers which act as the only determiner in the nominal phrase:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@determiner='yesSome' and //qp/@npDegree='noPosOnly' or //qp/@determiner='yesSome' and //qp/@npDegree='yesPosOnly'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have a separate set of negative quantifiers which act as the only determiner in the nominal phrase, just as there was not any way to express the negative special degree element 'not'.                </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has the following positive quantifiers which act as the only determiner in the nominal phrase:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@determiner='yesNo'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have a separate set of positive quantifiers which act as the only determiner in the nominal phrase.  The positive notions of </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>some</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>every</langData>
<xsl:text> are either like </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all</langData>
<xsl:text> above or like the quantifiers which may co-occur with articles, demonstratives and/or possessors to be treated in the next section.  </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has the following negative quantifiers which act as the only determiner in the nominal phrase:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@determiner='yes'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has the following positive and negative quantifiers which act as the only determiner in the nominal phrase:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@determiner!='no'">
<example num="xQP.QPDeterminers.18">
<table border="1">
					<caption>
						<xsl:text>Quantifier Determiners</xsl:text>
					</caption>
					<xsl:if test="//qp/@determiner='yes' or //qp/@determiner='yesSome'">
<tr>
						<td>
							<xsl:text>positive</xsl:text>
						</td>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//qp/determinerExample),'.','')" />
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
					<xsl:if test="//qp/@determiner='yes' or //qp/@determiner='yesNo'">
<tr>
						<td>
							<xsl:text>negative</xsl:text>
						</td>
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
</xsl:if>
				</table>
</example>
</xsl:if>
			<xsl:if test="//qp/@determiner!='no'">
<p>
<xsl:text>These quantifier determiners occur </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@determinerPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@determinerPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@determinerPos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@determinerPos='eitherOrBoth'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@determinerPos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@determinerPos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@determinerPos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@determinerPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the head noun.  </xsl:text>
<xsl:if test="//qp/@determiner='yes' and //qp/@determinerEitherRestricted='unrestricted' and //qp/@determinerPos!='before' and //qp/@determinerPos!='after'">
					<xsl:text>All of the quantifier determiners can occur on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//qp/@determiner='yes' and //qp/@determinerEitherRestricted='restricted' and //qp/@determinerPos!='before' and //qp/@determinerPos!='after'">
					<xsl:text>There are restrictions as to which of these quantifier determiners can occur on each side of the noun.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@determiner='yes' or //qp/@determiner='yesSome'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> examples of positive quantifier determiners in full nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@determiner='yes' or //qp/@determiner='yesSome'">
<example num="xQP.QPDeterminers.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/determinerNPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//qp/determinerNPExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/determinerNPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/determinerNPExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQP.QPDeterminers.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQP.QPDeterminers.24.1</xsl:text>
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
			<xsl:if test="//qp/@determiner='yes' or //qp/@determiner='yesNo'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> examples of negative quantifier determiners in full nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@determiner='yes' or //qp/@determiner='yesNo'">
<example num="xQP.QPDeterminers.28">
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
<xsl:with-param name="sExNumber">xQP.QPDeterminers.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQP.QPDeterminers.28.1</xsl:text>
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
			<xsl:if test="//qp/@determiner='yes' or //qp/@determiner='yesNo'">
<p>
<xsl:text>See section </xsl:text>
<sectionRef sec="sNegNominal" />
<xsl:text> for examples of the negative elements used in sentences and discussion of the negation constructions in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
		</section2>
		<section2 id="sQPOtherQuantifiers">
			<secTitle>Other Quantifiers and Degree words</secTitle>
			<p>
<xsl:text>Other quantifiers, like </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>many</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>much</langData>
<xsl:text>, and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>few</langData>
<xsl:text>, come
in a different position in the nominal phrase.  In English,
this is after an article, demonstrative or possessor and
before an adjective and noun, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John's many black dogs.</langData>
<xsl:text>.
Further, these quantifiers can be modified by degree words
such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>very</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>so</langData>
<xsl:text>, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>very many dogs</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>so much
waste</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has the following quantifiers of this type:</xsl:text>
</p>
			<example num="xQP.QPOtherQuantifiers.8">
<table border="1">
					<caption>
						<xsl:text>Quantifiers</xsl:text>
					</caption>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//qp/quantifierExample),'.','')" />
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
			<xsl:if test="//qp/@degree='no'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have any degree words which modify the quantifiers.</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@degree='yes'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has degree words which can modify the quantifiers.  These degree words occur </xsl:text>
<xsl:choose>
					<xsl:when test="//qp/@degreePos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@degreePos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@degreePos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@degreePos='eitherOrBoth'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@degreePos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@degreePos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@degreePos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//qp/@degreePos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the quantifier.  </xsl:text>
<xsl:if test="//qp/@degree='yes' and //qp/@degreeEitherRestricted='unrestricted' and //qp/@degreePos!='before' and //qp/@degreePos!='after'">
					<xsl:text>All of the degree words can occur on either side of the quantifier.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//qp/@degree='yes' and //qp/@degreeEitherRestricted='restricted' and //qp/@degreePos!='before' and //qp/@degreePos!='after'">
					<xsl:text>There are restrictions as to which of these degree words can occur on each side of the quantifier.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> examples include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@degree='yes'">
<example num="xQP.QPOtherQuantifiers.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/degreeExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//qp/degreeExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/degreeExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/degreeExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQP.QPOtherQuantifiers.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQP.QPOtherQuantifiers.14.1</xsl:text>
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
		<section2 id="sQPNumbers">
			<secTitle>Numbers</secTitle>
			<p>
<xsl:text>Numbers cannot be modified by the
degree words like the quantifiers can, though they occur in the same
position.  Cardinal numbers can, however, be modified by
ordinal numbers and by </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>next</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>last</langData>
<xsl:text>, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the first twenty boys</langData>
<xsl:text> or
</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the next one hundred years</langData>
<xsl:text>.  Ordinal numbers and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>next</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>last</langData>
<xsl:text> can also modify nouns directly, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the third girl</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the last boy</langData>
<xsl:text>.  Since these modifiers (including ordinal numbers) also act as regular
adjectives in modifying nouns directly, they act
syntactically like adjectives.
</xsl:text>
</p>
			<section3 id="sQPNumbersCardinal">
				<secTitle>Cardinal Numbers</secTitle>
				<p>
<xsl:text>The basic forms for the cardinal numbers are given in the following chart:</xsl:text>
</p>
				<example num="xQP.QPNumbers.QPNumbersCardinal.6">
<table border="1">
						<caption>
							<xsl:text>Cardinal Numbers</xsl:text>
						</caption>
						<tr>
							<td>
								<xsl:text>1 through 10</xsl:text>
							</td>
							<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//qp/cardinalNumbers1to10),'.','')" />
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
								<xsl:text>11 through 20</xsl:text>
							</td>
							<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//qp/cardinalNumbers11to20),'.','')" />
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
								<xsl:text>30 through 100 (by tens)</xsl:text>
							</td>
							<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//qp/cardinalNumbers30to100),'.','')" />
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
				<p>
<xsl:text>Larger cardinal numbers can be compounds which may be
written as separate words, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>one hundred thirty three</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>four thousand and three</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>six thousand one hundred and thirty three</langData>
<xsl:text>.
Examples of compound numbers in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
				<example num="xQP.QPNumbers.QPNumbersCardinal.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/cardinalCompoundExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//qp/cardinalCompoundExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/cardinalCompoundExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/cardinalCompoundExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQP.QPNumbers.QPNumbersCardinal.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQP.QPNumbers.QPNumbersCardinal.10.1</xsl:text>
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
<xsl:text>Based on the position of the unit number and any conjunctions, cardinal numbers in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> are </xsl:text>
<xsl:choose>
						<xsl:when test="//qp/@cardinalHead='before'">
<xsl:text>left-</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@cardinalHead='after'">
<xsl:text>right-</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text>headed.
</xsl:text>
</p>
			</section3>
			<section3 id="sQPNumbersOrdinal">
				<secTitle>Ordinal Numbers</secTitle>
				<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, ordinal numbers </xsl:text>
<xsl:choose>
						<xsl:when test="//qp/@ordinalFormation='affix'">
<xsl:text>are formed by adding an affix to the cardinal number.</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@ordinalFormation='independent'">
<xsl:text>are all independent syntactic words, distinct from the cardinal numbers.</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@ordinalFormation='both'">
<xsl:text>may be formed by adding an affix to the cardinal number, but some forms are independent syntactic words.</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text>  The first ten ordinal numbers are:</xsl:text>
</p>
				<example num="xQP.QPNumbers.QPNumbersOrdinal.6">
<table border="1">
						<caption>
							<xsl:text>Ordinal Numbers</xsl:text>
						</caption>
						<tr>
							<td>
								<xsl:text>first through tenth</xsl:text>
							</td>
							<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//qp/ordinalNumbers),'.','')" />
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
				<p>
<xsl:text>When the ordinal numbers in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> modify a cardinal number, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the first twenty boys</langData>
<xsl:text>, they occur </xsl:text>
<xsl:choose>
						<xsl:when test="//qp/@ordinalPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@ordinalPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@ordinalPos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@ordinalPos='eitherOrBoth'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@ordinalPos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@ordinalPos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@ordinalPos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
						<xsl:when test="//qp/@ordinalPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text> the cardinal number.  </xsl:text>
<xsl:if test="//qp/@ordinalEitherRestricted='unrestricted' and //qp/@ordinalPos!='before' and //qp/@ordinalPos!='after' and //qp/@ordinalPos!='unknown'">
						<xsl:text>All of the ordinal numbers can occur on either side of the cardinal number.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//qp/@ordinalEitherRestricted='restricted' and //qp/@ordinalPos!='before' and //qp/@ordinalPos!='after'">
						<xsl:text>There are restrictions as to which of the ordinal numbers can occur on each side of the cardinal number.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<p>
<xsl:value-of select="//language/langName" />
<xsl:text> examples of the use of ordinal numbers and the modifiers meaning "last" or "next" within a nominal phrase include:</xsl:text>
</p>
				<example num="xQP.QPNumbers.QPNumbersOrdinal.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/ordinalExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//qp/ordinalExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/ordinalExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//qp/ordinalExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xQP.QPNumbers.QPNumbersOrdinal.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xQP.QPNumbers.QPNumbersOrdinal.12.1</xsl:text>
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
			</section3>
		</section2>
	</section1>



































































































































































































</xsl:template>
</xsl:stylesheet>
