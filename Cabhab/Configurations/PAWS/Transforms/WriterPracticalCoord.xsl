<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="coord">
  <section1 id="sCoord">
	<secTitle>Coordination Constructions</secTitle>
	<p contentType="ctComparativeIntro">
<xsl:text>This section begins with basic coordination constructions where there is an overt conjunction between the conjuncts.  This includes coordination at the sentence level and at the verb phrase, nominal phrase, </xsl:text>
<xsl:choose>
		 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
		 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
		 <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
		 <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
	  </xsl:choose>
<xsl:text> phrase and adjective phrase levels. Then, at the nominal phrase level only, lists and appositive constructions will be described. </xsl:text>
</p>

	  <p contentType="ctComparativeIntro">
<xsl:text>In English, the conjunctions which can be used between two conjuncts are </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>and</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>or</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>but</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>and/or</langData>
<xsl:text>.  In addition, there are coordination constructions which require an initial conjunction, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>either...or</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>neither...nor</langData>
<xsl:text> constructions.  Some languages also use a word meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>with</langData>
<xsl:text> as a conjunction between nominal phrases.
</xsl:text>
</p>
     <p contentType="ctPracticalIntro">
<xsl:text>Coordination of sentences, verb phrases, nominal phrases, </xsl:text>
<xsl:choose>
           <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
           <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
           <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
           <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
        </xsl:choose>
<xsl:text> phrases and adjective phrases are exemplified. Then, lists and appositive constructions are described. </xsl:text>
</p>
     
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
<xsl:text> uses the following conjunctions between two conjuncts:</xsl:text>
</p>
			<example num="xCoord.10">
<table border="1">
					<tr>
						<th>Morphemes</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//coord/and),'.','')" />
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
							<xsl:text>and</xsl:text>
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
							<xsl:text>and</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//coord/andThen),'.','')" />
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
							<xsl:text>and then</xsl:text>
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
							<xsl:text>and then</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//coord/or),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.0" select="string-length(normalize-space($sExampleValue2.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.0 != 0 and $sExampleValue2.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>or</xsl:text>
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
							<xsl:text>or</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//coord/andOr),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.0" select="string-length(normalize-space($sExampleValue3.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.0 != 0 and $sExampleValue3.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>but</xsl:text>
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
							<xsl:text>but</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue4.0">
<xsl:value-of select="translate(string(//coord/but),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.0" select="string-length(normalize-space($sExampleValue4.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.0 != 0 and $sExampleValue4.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>with</xsl:text>
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
							<xsl:text>with</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue5.0">
<xsl:value-of select="translate(string(//coord/with),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.0" select="string-length(normalize-space($sExampleValue5.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.0 != 0 and $sExampleValue5.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>with</xsl:text>
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
							<xsl:text>with</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue6.0">
<xsl:value-of select="translate(string(//coord/other),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.0" select="string-length(normalize-space($sExampleValue6.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.0 != 0 and $sExampleValue6.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>any others</xsl:text>
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
							<xsl:text>any others</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
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
<xsl:text> uses the following conjunctions in an </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>either...or</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>neither...nor</langData>
<xsl:text> type construction:</xsl:text>
</p>
			<example num="xCoord.14">
<table border="1">
					<tr>
						<th>Morphemes</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//coord/either),'.','')" />
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
							<xsl:text>either</xsl:text>
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
							<xsl:text>either</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				   <xsl:variable name="sExampleValue1.0">
<xsl:value-of select="translate(string(//coord/eitherOr),'.','')" />
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
				         <xsl:text>or</xsl:text>
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
				         <xsl:text>or</xsl:text>
				      </td>
</tr>
</xsl:otherwise>
</xsl:choose>
				   <xsl:variable name="sExampleValue2.0">
<xsl:value-of select="translate(string(//coord/neither),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.0" select="string-length(normalize-space($sExampleValue2.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.0 != 0 and $sExampleValue2.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>neither</xsl:text>
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
							<xsl:text>neither</xsl:text>
						</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				   <xsl:variable name="sExampleValue3.0">
<xsl:value-of select="translate(string(//coord/nor),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.0" select="string-length(normalize-space($sExampleValue3.0))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.0 != 0 and $sExampleValue3.0 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.0" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.0" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
						 <xsl:text>nor</xsl:text>
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
						 <xsl:text>nor</xsl:text>
					  </td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>

	 <p>
<xsl:text></xsl:text>
<xsl:choose>
		<xsl:when test="//coord/@conjWord='yes'">All of the above conjunctions are written as independent words between the conjuncts.</xsl:when>
		<xsl:when test="//coord/@conjWord='some'">Some of the conjunctions above are written as independent words between the conjuncts, but others attach </xsl:when>
		<xsl:when test="//coord/@conjWord='no'">All of the conjunctions attach </xsl:when>
	 </xsl:choose>
<xsl:if test="normalize-space(//coord/@conjWord)!='yes'">
	    <xsl:if test="normalize-space(//coord/proclitic/@checked)='yes' and normalize-space(//coord/enclitic/@checked)='no'">
<xsl:text>to the beginning of the second conjunct as phrasal proclitics</xsl:text>
</xsl:if>
	    <xsl:if test="normalize-space(//coord/proclitic/@checked)='no' and normalize-space(//coord/enclitic/@checked)='yes'">
<xsl:text>to the end of the first conjunct as phrasal enclitics</xsl:text>
</xsl:if>
	    <xsl:if test="normalize-space(//coord/proclitic/@checked)='yes' and normalize-space(//coord/enclitic/@checked)='yes'">
<xsl:text>either to the end of the first conjunct or the beginning of the second conjunct as phrasal clitics</xsl:text>
</xsl:if>
	    <xsl:if test="normalize-space(//coord/attachesOther/@checked)='no'">
<xsl:text>. </xsl:text>
</xsl:if>
	    <xsl:if test="normalize-space(//coord/proclitic/@checked)='no' and normalize-space(//coord/enclitic/@checked)='no' and normalize-space(//coord/attachesOther/@checked)='yes'">
<xsl:text>to ___</xsl:text>
<xsl:value-of select="//coord/attachesOther" />
<xsl:text>. </xsl:text>
</xsl:if>
	    <xsl:if test="normalize-space(//coord/proclitic/@checked)='yes' and normalize-space(//coord/attachesOther/@checked)='yes' or normalize-space(//coord/enclitic/@checked)='yes' and normalize-space(//coord/attachesOther/@checked)='yes'">
<xsl:text> and may also attach to ___</xsl:text>
<xsl:value-of select="//coord/attachesOther" />
<xsl:text>. </xsl:text>
</xsl:if>
	 </xsl:if>
<xsl:if test="normalize-space(//coord/@noConj)='yes'">
<xsl:text> Besides using these conjunctions, two elements may also be conjoined without any conjunction between them, at least at the nominal phrase and sentence levels.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//coord/@noConj)='no'">
<xsl:text> When only two elements are being conjoined, one of the above conjunctions must appear.</xsl:text>
</xsl:if>
</p>

	 <section2 id="sCoordLevels">
		<secTitle>Levels of Coordination</secTitle>

		<p>
<xsl:text>The various levels of coordination are exemplified in the following sections.</xsl:text>
</p>
		<section3 id="sCoordSentence">
			<secTitle>Coordination of Sentences</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>In general, coordination is between like categories. For sentence-level coordination, this means that two declarative sentences may be conjoined, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John went to the office this morning and he just got back</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Either I will come to the party or I will send my sister</langData>
<xsl:text>, or two questions, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>When did the mail come and where is my package?</langData>
<xsl:text>  When the contrastive conjunction </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>but</langData>
<xsl:text> is used, one of the conjuncts must be negative, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>John went to the office this morning but he did not return</langData>
<xsl:text>.</xsl:text>
</p>
		   <p contentType="ctPracticalIntro">
<xsl:text>In general, coordination is between like categories. For sentences, this means that two declarative sentences may be conjoined, or two questions.  When the contrastive conjunction </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>but</langData>
<xsl:text> is used, one of the conjuncts must be negative.</xsl:text>
</p>
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
<xsl:text> examples of coordination of two sentences include:</xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordSentence.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/sentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/sentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/sentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/sentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordSentence.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordSentence.10.1</xsl:text>
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
<xsl:text>Some examples of sequential coordination between two sentences are:</xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordSentence.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/sentSeqExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/sentSeqExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/sentSeqExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/sentSeqExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordSentence.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordSentence.14.1</xsl:text>
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
<xsl:text>See section </xsl:text>
<sectionRef sec="sAdvCl" />
<xsl:text> for examples of introductory words and clauses, sometimes referred to as coordination, and examples of adverbial clauses, which are subordination.</xsl:text>
</p>
</section3>
		<section3 id="sCoordVP">
			<secTitle>Verb Phrase Coordination</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Verb phrase coordination involves two full verb phrases that share a single subject. English sentence examples with coordinate verb phrases  include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Bill ran the race and won the prize</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will come to the party or send my sister</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will not come to the party nor send my sister</langData>
<xsl:text>.</xsl:text>
</p>
		   <p contentType="ctPracticalIntro">
<xsl:text>Verb phrase coordination involves two full verb phrases that share a single subject.</xsl:text>
</p>
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
<xsl:text> examples with verb phrase coordination include:</xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordVP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/vpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/vpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/vpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/vpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordVP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordVP.10.1</xsl:text>
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
</section3>
		<section3 id="sCoordDP">
			<secTitle>Nominal Phrase Coordination</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Coordinate nominal phrases can normally occur as subjects, objects, indirect objects and objects of </xsl:text>
<xsl:choose>
			      <xsl:when test="//pp/@pPos='before'">a preposition</xsl:when>
			      <xsl:when test="//pp/@pPos='after'">a postposition</xsl:when>
			      <xsl:when test="//pp/@pPos='both'">an adposition</xsl:when>
			      <xsl:when test="//pp/@pPos='unknown'">an adposition</xsl:when>
			   </xsl:choose>
<xsl:text>, just like a regular nominal phrase. English sentence examples with coordinate nominal phrases include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Bill ran in the Boston Marathon and the Olympics</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My sister or I will be there</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Neither your sister nor my brother will be there</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will come to the rehearsal but not the dinner</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will come to the wedding and/or the reception</langData>
<xsl:text>.</xsl:text>
</p>
		   <p contentType="ctPracticalIntro">
<xsl:text>Coordinate nominal phrases can normally occur as subjects, objects, indirect objects and objects of </xsl:text>
<xsl:choose>
		         <xsl:when test="//pp/@pPos='before'">a prepositioin</xsl:when>
		         <xsl:when test="//pp/@pPos='after'">a postposition</xsl:when>
		         <xsl:when test="//pp/@pPos='both'">an adposition</xsl:when>
		         <xsl:when test="//pp/@pPos='unknown'">an adposition</xsl:when>
		      </xsl:choose>
<xsl:text>, just like a regular nominal phrase.</xsl:text>
</p>
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
<xsl:text> examples with nominal phrase coordination include:</xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordDP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/dpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/dpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/dpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/dpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordDP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordDP.10.1</xsl:text>
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
</section3>
	  <section3 id="sCoordPP">
		  <secTitle>
		  <xsl:choose>
				<xsl:when test="//pp/@pPos='before'">Prepositional Phrase Coordination</xsl:when>
				<xsl:when test="//pp/@pPos='after'">Postpositional Phrase Coordination</xsl:when>
				<xsl:when test="//pp/@pPos='both'">Adpositional Phrase Coordination</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">Adpositional Phrase Coordination</xsl:when>
			</xsl:choose>
</secTitle>
		  <p contentType="ctComparativeIntro">
<xsl:text>It is also normally possible to have coordinate </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
				<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
				<xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
			 </xsl:choose>
<xsl:text> phrases in all the places that a regular </xsl:text>
<xsl:choose>
		        <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
		        <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
		        <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
		        <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
		     </xsl:choose>
<xsl:text>  phrase normally occurs. English sentence examples with coordinate prepositional phrases include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Bill ran through the forest and over the bridge</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will come with you to the rehearsal but not back home</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I will come either to the wedding or to the reception</langData>
<xsl:text>.</xsl:text>
</p>
	     <p contentType="ctPracticalIntro">
<xsl:text>It is also normally possible to have coordinate </xsl:text>
<xsl:choose>
	           <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
	           <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
	           <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
	           <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
	        </xsl:choose>
<xsl:text> phrases in all the places that a regular </xsl:text>
<xsl:choose>
	           <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
	           <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
	           <xsl:when test="//pp/@pPos='both'">adpositional</xsl:when>
	           <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
	        </xsl:choose>
<xsl:text>  phrase normally occurs.</xsl:text>
</p>
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
<xsl:text> examples with coordinate </xsl:text>
<xsl:choose>
				  <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
				  <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
				  <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
				  <xsl:when test="//pp/@pPos='unknown'">adpositional</xsl:when>
</xsl:choose>
<xsl:text> phrases include:</xsl:text>
</p>
		  <example num="xCoord.CoordLevels.CoordPP.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/coordppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/coordppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/coordppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/coordppExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordPP.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordPP.10.1</xsl:text>
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
	  </section3>
	  <section3 id="sCoordAdj">
			<secTitle>Adjective Phrase Coordination</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Finally, adjectives or adjective phrases can usually be coordinated, both when they are modifying a noun, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The black and white dog belongs to my son</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>My sister wants a bright red or light blue candle</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>That looks like an awfully painful and very dangerous sore on your leg</langData>
<xsl:text>, and when they are acting as the predicate adjective in a copular sentence, as in: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The sore on your leg is awfully painful and very dangerous</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>This material feels very smooth and silky</langData>
<xsl:text>.</xsl:text>
</p>
	     <p contentType="ctPracticalIntro">
<xsl:text>Finally, adjectives or adjective phrases can usually be coordinated, both when they are modifying a noun and when they are acting as the predicate adjective in a copular sentence.</xsl:text>
</p>
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
<xsl:text> examples with adjective phrase coordination include:</xsl:text>
</p>
			<example num="xCoord.CoordLevels.CoordAdj.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/adjExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/adjExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/adjExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/adjExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordLevels.CoordAdj.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordLevels.CoordAdj.10.1</xsl:text>
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
	  </section3>
	 </section2>
	 <section2 id="sCoordList">
		<secTitle>Lists</secTitle>
		<p contentType="ctComparativeIntro">
<xsl:text>Lists consist of three or more items that are conjoined to form a single nominal phrase. The initial items are normally separated by commas and there is an overt conjunction before the final item in the list, though there are different possibilities. Some English examples of nominal phrases consisting of lists are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[John, Bill, Sue and Mary]</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[John, Bill, Sue and/or Mary]</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[John and Bill or Sue and Mary]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[a cat, two dogs and a chicken but not a monkey]</langData>
<xsl:text>.</xsl:text>
</p>
	    <p contentType="ctPracticalIntro">
<xsl:text>Lists consist of three or more items that are conjoined to form a single nominal phrase. The initial items are normally separated by commas and there is an overt conjunction before the final item in the list, though there are different possibilities. </xsl:text>
</p>
	    
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
<xsl:text> examples of lists within a nominal phrase include:</xsl:text>
</p>
		<example num="xCoord.CoordList.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/listExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/listExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/listExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/listExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordList.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordList.10.1</xsl:text>
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


	 <section2 id="sCoordAppositive">
		<secTitle>Appositives</secTitle>
		<p contentType="ctComparativeIntro">
<xsl:text>Appositives also form a single nominal phrase.  Appositives normally consist of a name followed by a comma and then a description also followed by a comma, or the order may be reversed. Some English examples include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[George Washington, the first President of the United States]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[My brother, James]</langData>
<xsl:text>.</xsl:text>
</p>
	    <p contentType="ctPracticalIntro">
<xsl:text>Appositives also form a single nominal phrase.  Appositives normally consist of a name followed by a comma and then a description also followed by a comma, or the order may be reversed. </xsl:text>
</p>
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
<xsl:text> examples of appositives within a nominal phrase include:</xsl:text>
</p>
		<example num="xCoord.CoordAppositive.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//coord/appositiveExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//coord/appositiveExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//coord/appositiveExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//coord/appositiveExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xCoord.CoordAppositive.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xCoord.CoordAppositive.10.1</xsl:text>
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
