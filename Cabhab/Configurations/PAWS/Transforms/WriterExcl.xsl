<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="excl">
  <section1 id="sExcl">
	 <secTitle>Greetings, Interjections and Exclamations</secTitle>
	 <p>
<xsl:text>This section considers various types of common utterances which are not complete sentences.  Greetings, interjections and exclamations are covered in turn.</xsl:text>
</p>
	 <section2 id="sExclGreet">
		<secTitle>Greetings</secTitle>
		<p>
<xsl:text>Greetings typically consist of a particular word or phrase, either standing alone or followed by a name or nominal phrase describing the person or animal being greeted.  Some are full sentences or full questions, such as </xsl:text>
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
<xsl:text> which do not need to be treated separately. </xsl:text>
</p>
		<p>
<xsl:text>Some examples of English greetings are:
		</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Hi! </langData>
<xsl:text> </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Howdy! </langData>
<xsl:text> </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Goodby</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Good day, sir</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Good night, sweet baby</langData>
<xsl:text>.</xsl:text>
</p>
		<p>
<xsl:text>Examples of greetings in </xsl:text>
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
		<example num="xExcl.ExclGreet.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//excl/greetExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//excl/greetExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//excl/greetExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//excl/greetExample))" />
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
	 <section2 id="sExclIntj">
		<secTitle>Interjections</secTitle>
		<p>
<xsl:text>Interjections typically consist of a particular word or phrase that is used alone, usually with an exclamation point following it.  Though many of the words in interjections are not used in any other situation, regular adjectives are also used in this way.  Some examples of interjections in English are:
		</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ouch! </langData>
<xsl:text> </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Gross! </langData>
<xsl:text> </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Cool! </langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jimminy Cricket!</langData>
</p>

		<p>
<xsl:text>Examples of interjections in </xsl:text>
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
		<example num="xExcl.ExclIntj.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//excl/intjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//excl/intjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//excl/intjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//excl/intjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xExcl.ExclIntj.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xExcl.ExclIntj.8.1</xsl:text>
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
		<p>
<xsl:text>Yes and No answers to questions are similar to interjections.  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> uses the following words to express these answers:</xsl:text>
</p>
		<example num="xExcl.ExclIntj.12">
<table border="1">
			  <tr>
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
				 <th>Gloss</th>
			  </tr>
			  <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//excl/yesExample),'.','')" />
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
					<xsl:text>yes</xsl:text>
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
					<xsl:text>yes</xsl:text>
				 </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			  <xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//excl/noExample),'.','')" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
					<xsl:text>no</xsl:text>
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
					<xsl:text>no</xsl:text>
				 </td>
</tr>
</xsl:otherwise>
</xsl:choose>
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
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>How awful for you! </langData>
<xsl:text> </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>How nice!</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>How wonderful that your family could come!</langData>
</p>

		<xsl:if test="normalize-space(//excl/@exclM)='no'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> does not have a special word which marks exclamations of this type, so they are no different than the interjections consisting of adjectives in the previous section.</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//excl/@exclM)='yes'">
<p>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> has one or more special words which signal an exclamation which occur </xsl:text>
<xsl:choose>
		   <xsl:when test="//excl/@exclMPos='before'">before</xsl:when>
		   <xsl:when test="//excl/@exclMPos='after'">after</xsl:when>
		   <xsl:when test="//excl/@exclMPos='either'">on either side of</xsl:when>
		   <xsl:when test="//excl/@exclMPos='both'">on both sides of</xsl:when>
		   <xsl:when test="//excl/@exclMPos='unknown'">________</xsl:when>
		</xsl:choose>
<xsl:text> the adjective phrase.  </xsl:text>
<xsl:if test="normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='either' and normalize-space(//excl/@exclMEither)='no' or normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='both' and normalize-space(//excl/@exclMEither)='no'">
<xsl:text>There are separate sets words which can occur on each side of the adjective phrase. </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='either' and normalize-space(//excl/@exclMEither)='yes' or normalize-space(//excl/@exclM)='yes' and normalize-space(//excl/@exclMPos)='both' and normalize-space(//excl/@exclMEither)='yes'">
<xsl:text>All of the words may occur on either side of the adjective phrase. </xsl:text>
</xsl:if>
<xsl:text>These exclamation marker words are:</xsl:text>
</p>
</xsl:if>
		<xsl:if test="normalize-space(//excl/@exclM)='yes'">
<example num="xExcl.ExclExcl.10">
<table border="1">
		   <tr>
			  <th>Exclamation Markers</th>
			  <th>Gloss</th>
		   </tr>
		   <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//excl/exclMExample),'.','')" />
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
<xsl:text>Examples of exclamations in </xsl:text>
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
		<example num="xExcl.ExclExcl.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//excl/exclExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//excl/exclExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//excl/exclExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//excl/exclExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xExcl.ExclExcl.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xExcl.ExclExcl.14.1</xsl:text>
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
	<section1 id="sTexts">
		<secTitle>Texts</secTitle>
		<p>
<object type="tComment">Include several texts here to demonstrate how larger constructions such as paragraphs, conversations, and narrative stories are formed.  Include examples of various literary types.</object>
</p>
		<p>
<object type="tComment">  A suggested format for presenting the texts is to present it in the vernacular language as a whole first, so the native speakers can appreciate it.  Then present the interlinear form, as in the examples throughout the grammar.  Finally, give a free translation as a whole, so the non-native speaker can appreciate more about the culture.</object>
</p>
	</section1>

	


	


	

	

	

	

	

	


	

	

	

	

	

	

</xsl:template>
</xsl:stylesheet>
