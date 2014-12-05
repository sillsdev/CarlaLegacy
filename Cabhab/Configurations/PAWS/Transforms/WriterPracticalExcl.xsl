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
   <p contentType="ctComparativeIntro">
<xsl:text>Greetings typically consist of a particular word or phrase, either standing alone or followed by a name or nominal phrase describing the person or animal being greeted.  Some are full sentences or full questions, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>How do you do?</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>How are you?</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Have a good day!</langData>
<xsl:text> which do not need to be treated separately. </xsl:text>
</p>
   <p contentType="ctComparativeIntro">
<xsl:text>Some examples of English greetings are:
   </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Hi!</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Howdy!</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Goodby</langData>
<xsl:text> and </xsl:text>
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
   <p contentType="ctPracticalIntro">
<xsl:text>Greetings typically consist of a particular word or phrase, either standing alone or followed by a name or nominal phrase describing the person or animal being greeted.</xsl:text>
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
			<example num="xExcl.ExclGreet.12">
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
<xsl:with-param name="sExNumber">xExcl.ExclGreet.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xExcl.ExclGreet.12.1</xsl:text>
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
<section2 id="sExclIntj">
	<secTitle>Interjections</secTitle>
<p contentType="ctComparativeIntro">
<xsl:text>Interjections typically consist of a particular word or phrase that is used alone, usually with an exclamation point following it.  Though many of the words in interjections are not used in any other situation, regular adjectives are also used in this way.  Some examples of interjections in English are:
</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Ouch!</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Gross!</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Cool!</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Jimminy Cricket!</langData>
</p>
   <p contentType="ctPracticalIntro">
<xsl:text>Interjections typically consist of a particular word or phrase that is used alone, usually with an exclamation point following it.  Though many of the words in interjections are not used in any other situation, regular adjectives are also used in this way.</xsl:text>
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
			<example num="xExcl.ExclIntj.10">
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
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘Yes’</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘No’</langData>
<xsl:text> answers to questions are similar to interjections.  </xsl:text>
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
<example num="xExcl.ExclIntj.14">
<table border="1">
					<tr>
						<th>Morphemes</th>
						<th>Gloss</th>
					   <th>Significance</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//excl/yesExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
<td align="left" rowspan="1">
						   <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>yes</xsl:text>
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
<td align="left" rowspan="1">
						   <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>yes</xsl:text>
</gloss>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//excl/noExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.0" select="string-length(normalize-space($sExampleValue1.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.0 != 0 and $sExampleValue1.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTER GLOSS</xsl:text>
</gloss>
</td>
<td align="left" rowspan="1">
						   <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>no</xsl:text>
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
<td align="left" rowspan="1">
						   <gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>no</xsl:text>
</gloss>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</table>
</example>
</section2>
<section2 id="sExclExcl">
	<secTitle>Exclamations</secTitle>
<p contentType="ctComparativeIntro">
<xsl:text>Exclamations typically consist of a particular word, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>how</langData>
<xsl:text> in English, followed by an adjective phrase and usually punctuated with an exclamation point.  English examples include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>How awful for you!</langData>
<xsl:text> and </xsl:text>
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
   <p contentType="ctPracticalIntro">
<xsl:text>Exclamations typically consist of a particular word followed by an adjective phrase and usually punctuated with an exclamation point.</xsl:text>
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
<xsl:if test="normalize-space(//excl/exclMBefore/@checked)='yes' and normalize-space(//excl/exclMAfter/@checked)='no' and normalize-space(//excl/exclMBoth/@checked)='no'">
<xsl:text>before</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//excl/exclMBefore/@checked)='no' and normalize-space(//excl/exclMAfter/@checked)='yes' and normalize-space(//excl/exclMBoth/@checked)='no'">
<xsl:text>after</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//excl/exclMBefore/@checked)='no' and normalize-space(//excl/exclMAfter/@checked)='no' and normalize-space(//excl/exclMBoth/@checked)='yes'">
<xsl:text>on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//excl/exclMBefore/@checked)='yes' and normalize-space(//excl/exclMAfter/@checked)='yes' and normalize-space(//excl/exclMBoth/@checked)='no'">
<xsl:text>on either side of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//excl/exclMBefore/@checked)='yes' and normalize-space(//excl/exclMAfter/@checked)='no' and normalize-space(//excl/exclMBoth/@checked)='yes'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//excl/exclMBefore/@checked)='no' and normalize-space(//excl/exclMAfter/@checked)='yes' and normalize-space(//excl/exclMBoth/@checked)='yes'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//excl/exclMBefore/@checked)='yes' and normalize-space(//excl/exclMAfter/@checked)='yes' and normalize-space(//excl/exclMBoth/@checked)='yes'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//excl/exclMOther/@checked)='no'">
<xsl:text> the adjective phrase.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//excl/exclMBefore/@checked)='no' and normalize-space(//excl/exclMAfter/@checked)='no' and normalize-space(//excl/exclMBoth/@checked)='no' and normalize-space(//qp/NPDegreePosOther/@checked)='yes'">
<xsl:text>___</xsl:text>
<xsl:value-of select="//excl/exclMOther" />
<xsl:text>.    </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//excl/exclMBefore/@checked)='yes' and normalize-space(//excl/exclMOther/@checked)='yes' or normalize-space(//excl/exclMAfter/@checked)='yes' and normalize-space(//excl/exclMOther/@checked)='yes' or normalize-space(//excl/exclMBoth/@checked)='yes' and normalize-space(//excl/exclMOther/@checked)='yes'">
<xsl:text> the adjective phrase and it may also occur ___</xsl:text>
<xsl:value-of select="//excl/exclMOther" />
<xsl:text>.  </xsl:text>
</xsl:if>
<xsl:text>These exclamation marker words are:</xsl:text>
</p>
</xsl:if>
<xsl:if test="normalize-space(//excl/@exclM)='yes'">
<example num="xExcl.ExclExcl.12">
<table border="1">
<tr>
	<th>Exclamation Markers</th>
	<th>Gloss</th>
</tr>
	<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//excl/exclMExample),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.0" select="string-length(normalize-space($sExampleValue0.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.0 != 0 and $sExampleValue0.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.0" />
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
   <example num="xExcl.ExclExcl.16">
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
<xsl:with-param name="sExNumber">xExcl.ExclExcl.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xExcl.ExclExcl.16.1</xsl:text>
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
