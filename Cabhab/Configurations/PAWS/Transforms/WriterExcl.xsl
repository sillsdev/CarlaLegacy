<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="excl">
  <section1 id="sExcl">
	<secTitle>Exclamations and Greetings</secTitle>
	<p>
<xsl:text>This section considers various types of common utterances which are not complete sentences.  We will deal with greetings, interjections and exclamations in turn.</xsl:text>
</p>
<section2 id="sExclGreet">
	<secTitle>Greetings</secTitle>
<p>
<xsl:text>Greetings typically consist of a particular word or phrase, either standing alone or followed by a name or nominal phrase describing the peson or animal being greeted.  Some are full sentences or full questions, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>How do you do? </langData>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>How are you? </langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Have a good day!</langData>
<xsl:text> which do not need to be treated separately.  Some examples of English greetings are:
</xsl:text>
</p>
			<ol>
				<li>
					<xsl:text>Hi!</xsl:text>
				</li>
				<li>
					<xsl:text>Howdy!</xsl:text>
				</li>
				<li>
					<xsl:text>Hello, Jill.</xsl:text>
				</li>
				<li>
					<xsl:text>Goodby.</xsl:text>
				</li>
				<li>
					<xsl:text>Good day, sir.</xsl:text>
				</li>
				<li>
					<xsl:text>Good morning, Bob.</xsl:text>
				</li>
				<li>
					<xsl:text>Good afternoon.</xsl:text>
				</li>
				<li>
					<xsl:text>Good evening.</xsl:text>
				</li>
				<li>
					<xsl:text>Good night, sweet baby.</xsl:text>
				</li>
			</ol>
<p>
<xsl:text>Examples of greetings in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
			<example num="xExcl.ExclGreet.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//excl/greetExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//excl/greetExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//excl/greetExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//excl/greetExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xExcl.ExclGreet.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xExcl.ExclGreet.10.1</xsl:text>
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
</section2>
<section2 id="sExclIntj">
	<secTitle>Interjections</secTitle>
<p>
<xsl:text>Interjections typically consist of a particular word or phrase that is used alone, usually with an exclamation point following it.  Though many of the words in interjections are not used in any other situation, regular adjectives are also used in this way.  Some examples of interjections in English are:
</xsl:text>
</p>
			<ol>
				<li>
					<xsl:text>Ouch!</xsl:text>
				</li>
				<li>
					<xsl:text>Gross!</xsl:text>
				</li>
				<li>
					<xsl:text>Cool!</xsl:text>
				</li>
				<li>
					<xsl:text>Jumping Jehoshaphat!</xsl:text>
				</li>
				<li>
					<xsl:text>Jiminy Cricket!</xsl:text>
				</li>
			</ol>
<p>
<xsl:text>Examples of interjections in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
			<example num="xExcl.ExclIntj.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//excl/intjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//excl/intjExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//excl/intjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//excl/intjExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xExcl.ExclIntj.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xExcl.ExclIntj.10.1</xsl:text>
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
<xsl:text>Yes and No answers to questions will be treated similarly to interjections.  </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> uses the following words to express these answers:</xsl:text>
</p>
<example num="xExcl.ExclIntj.14">
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
<xsl:value-of select="translate(string(//excl/yesExample),'.','')" />
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
							<xsl:text>yes</xsl:text>
						</td>
					</tr>
					<tr>
						<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//excl/noExample),'.','')" />
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
							<xsl:text>no</xsl:text>
						</td>
					</tr>
</table>
</example>
</section2>
<section2 id="sExclExcl">
	<secTitle>Exclamations</secTitle>
<p>
<xsl:text>Exclamations typically consist of a particular word, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>how</langData>
<xsl:text> in English, followed by an adjective phrase and usually punctuated with an exclamation point.  English examples include:</xsl:text>
</p>
<ol>
	  <li>
<xsl:text>How awful for you!</xsl:text>
</li>
	  <li>
<xsl:text>How nice!</xsl:text>
</li>
	  <li>
<xsl:text>How wonderful that your family could come!</xsl:text>
</li>
</ol>
<p>
<xsl:text>Examples of exclamations in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
			<example num="xExcl.ExclExcl.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//excl/exclExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//excl/exclExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//excl/exclExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//excl/exclExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xExcl.ExclExcl.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xExcl.ExclExcl.10.1</xsl:text>
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
<xsl:if test="//excl/@exclM='no'">
<p>
<xsl:value-of select="//language/langName" />
<xsl:text> does not have a special word which marks exclamations of this type, so they are no different than the interjections consisting of adjectives in the previous section.</xsl:text>
</p>
</xsl:if>
<xsl:if test="//excl/@exclM='yes'">
<p>
<xsl:value-of select="//language/langName" />
<xsl:text> has one or more special words which signal an exclamation which occur </xsl:text>
<xsl:choose>
<xsl:when test="//excl/@exclMPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
<xsl:when test="//excl/@exclMPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
<xsl:when test="//excl/@exclMPos='either'">
<xsl:text>on either side of</xsl:text>
</xsl:when>
<xsl:when test="//excl/@exclMPos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
</xsl:choose>
<xsl:text> the adjective phrase.  These exclamation marker words are:</xsl:text>
</p>
</xsl:if>
<xsl:if test="//excl/@exclM='yes'">
<example num="xExcl.ExclExcl.16">
<table border="1">
<tr>
	<th>Exclamation Markers</th>
</tr>
	<tr>
		<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//excl/exclMExample),'.','')" />
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
<xsl:if test="//excl/@exclM='yes' and //excl/@exclMPos='either' and //excl/@exclMEither='no' or //excl/@exclM='yes' and //excl/@exclMPos='both' and //excl/@exclMEither='no'">
<p>
<xsl:text>There are separate sets words which can occur on each side of the adjective phrase.</xsl:text>
</p>
</xsl:if>
<xsl:if test="//excl/@exclM='yes' and //excl/@exclMPos='either' and //excl/@exclMEither='yes' or //excl/@exclM='yes' and //excl/@exclMPos='both' and //excl/@exclMEither='yes'">
<p>
<xsl:text>All of the words may occur on either side of the adjective phrase.</xsl:text>
</p>
</xsl:if>
</section2>
  </section1>
































</xsl:template>
</xsl:stylesheet>
