<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="v">
	<section1 id="sV">
		<secTitle>Verbs</secTitle>
		<p>
<xsl:text>Verbs express actions, states, or emotions.  The types of verbal inflection and agreement features carried by verbs are detailed first, then illustrative verb paradigms are presented.  The issue of when a subject may be missing is discussed in section </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text>, and auxiliaries are covered in section </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>, followed by verb compounds.  Examples of the verbs used in basic sentences are found in section </xsl:text>
<sectionRef sec="sIP" />
<xsl:text>.  More complex constructions including verbs are covered in sections </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text> - </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
		<section2 id="sIPInfl">
			<secTitle>Inflection Features</secTitle>
			<p>
<xsl:text>Verbs and auxiliaries usually carry inflection features, such as tense, aspect, and/or mood.  In most cases, these features are added by affixes, but they may also be part of irregular verb forms.</xsl:text>
</p>
			<p>
<xsl:text>The following inflection features are marked on verbs and/or auxiliaries in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
			<example num="xV.IPInfl.8">
<table border="1">
					<tr>
						<th>Type of feature</th>
						<th>Feature</th>
						<th>Morphemes</th>
					</tr>
					<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//ip/presentTense),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>tense</xsl:text>
						</td>
<td align="left">
							<xsl:text>present</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>tense</xsl:text>
						</td>
<td align="left">
							<xsl:text>present</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//ip/pastTense),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>tense</xsl:text>
						</td>
<td align="left">
							<xsl:text>past</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>tense</xsl:text>
						</td>
<td align="left">
							<xsl:text>past</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//ip/futureTense),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>tense</xsl:text>
						</td>
<td align="left">
							<xsl:text>future</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>tense</xsl:text>
						</td>
<td align="left">
							<xsl:text>future</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//ip/nonPastTense),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>tense</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>non past</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>tense</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>non past</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//ip/nonFutureTense),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>tense</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>non future</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>tense</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>non future</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//ip/otherTense),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>tense</xsl:text>
						</td>
<td align="left">
							<xsl:text>ENTER GLOSS</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>tense</xsl:text>
						</td>
<td align="left">
							<xsl:text>ENTER GLOSS</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<xsl:variable name="sExampleValue6.2">
<xsl:value-of select="translate(string(//ip/completiveAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.2" select="string-length(normalize-space($sExampleValue6.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.2 != 0 and $sExampleValue6.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>completive</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>completive</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<xsl:variable name="sExampleValue7.2">
<xsl:value-of select="translate(string(//ip/contemplativeAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.2" select="string-length(normalize-space($sExampleValue7.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.2 != 0 and $sExampleValue7.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>contemplative</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>contemplative</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<xsl:variable name="sExampleValue8.2">
<xsl:value-of select="translate(string(//ip/contrafactualAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.2" select="string-length(normalize-space($sExampleValue8.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.2 != 0 and $sExampleValue8.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>contrafactual</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>contrafactual</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<xsl:variable name="sExampleValue9.2">
<xsl:value-of select="translate(string(//ip/continuativeAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.2" select="string-length(normalize-space($sExampleValue9.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.2 != 0 and $sExampleValue9.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>continuative</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>continuative</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<xsl:variable name="sExampleValue10.2">
<xsl:value-of select="translate(string(//ip/habitualAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.2" select="string-length(normalize-space($sExampleValue10.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.2 != 0 and $sExampleValue10.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>habitual</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>habitual</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<xsl:variable name="sExampleValue11.2">
<xsl:value-of select="translate(string(//ip/imperfectAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.2" select="string-length(normalize-space($sExampleValue11.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.2 != 0 and $sExampleValue11.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>imperfect</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>imperfect</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<xsl:variable name="sExampleValue12.2">
<xsl:value-of select="translate(string(//ip/imperfectiveAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.2" select="string-length(normalize-space($sExampleValue12.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.2 != 0 and $sExampleValue12.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>imperfective</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>imperfective</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<xsl:variable name="sExampleValue13.2">
<xsl:value-of select="translate(string(//ip/incompletiveAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13.2" select="string-length(normalize-space($sExampleValue13.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength13.2 != 0 and $sExampleValue13.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>incompletive</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>incompletive</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<xsl:variable name="sExampleValue14.2">
<xsl:value-of select="translate(string(//ip/perfectAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14.2" select="string-length(normalize-space($sExampleValue14.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength14.2 != 0 and $sExampleValue14.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>perfect</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>perfect</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<xsl:variable name="sExampleValue15.2">
<xsl:value-of select="translate(string(//ip/perfectiveAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15.2" select="string-length(normalize-space($sExampleValue15.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength15.2 != 0 and $sExampleValue15.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>perfective</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>perfective</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<xsl:variable name="sExampleValue16.2">
<xsl:value-of select="translate(string(//ip/potentialAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16.2" select="string-length(normalize-space($sExampleValue16.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength16.2 != 0 and $sExampleValue16.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>potential</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>potential</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<xsl:variable name="sExampleValue17.2">
<xsl:value-of select="translate(string(//ip/progressiveAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17.2" select="string-length(normalize-space($sExampleValue17.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength17.2 != 0 and $sExampleValue17.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>progressive</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>progressive</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<xsl:variable name="sExampleValue18.2">
<xsl:value-of select="translate(string(//ip/purposiveAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength18.2" select="string-length(normalize-space($sExampleValue18.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength18.2 != 0 and $sExampleValue18.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength18.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>purposive</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>purposive</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<xsl:variable name="sExampleValue19.2">
<xsl:value-of select="translate(string(//ip/stativeAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength19.2" select="string-length(normalize-space($sExampleValue19.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength19.2 != 0 and $sExampleValue19.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength19.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>stative</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>stative</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<xsl:variable name="sExampleValue20.2">
<xsl:value-of select="translate(string(//ip/unrealAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength20.2" select="string-length(normalize-space($sExampleValue20.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength20.2 != 0 and $sExampleValue20.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength20.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>unreal</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>aspect</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>unreal</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<xsl:variable name="sExampleValue21.2">
<xsl:value-of select="translate(string(//ip/otherAspect),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength21.2" select="string-length(normalize-space($sExampleValue21.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength21.2 != 0 and $sExampleValue21.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength21.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>ENTER GLOSS</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>aspect</xsl:text>
						</td>
<td align="left">
							<xsl:text>ENTER GLOSS</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatDeclarative/@checked)='yes'">
<xsl:variable name="sExampleValue22.2">
<xsl:value-of select="translate(string(//ip/declarativeMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength22.2" select="string-length(normalize-space($sExampleValue22.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength22.2 != 0 and $sExampleValue22.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength22.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
<td align="left">
							<xsl:text>declarative</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
<td align="left">
							<xsl:text>declarative</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatIndicative/@checked)='yes'">
<xsl:variable name="sExampleValue23.2">
<xsl:value-of select="translate(string(//ip/indicativeMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength23.2" select="string-length(normalize-space($sExampleValue23.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength23.2 != 0 and $sExampleValue23.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength23.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>mood</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>indicative</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>mood</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>indicative</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatRealis/@checked)='yes'">
<xsl:variable name="sExampleValue24.2">
<xsl:value-of select="translate(string(//ip/realisMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength24.2" select="string-length(normalize-space($sExampleValue24.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength24.2 != 0 and $sExampleValue24.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength24.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>mood</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>realis</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>mood</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>realis</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatImperative/@checked)='yes'">
<xsl:variable name="sExampleValue25.2">
<xsl:value-of select="translate(string(//ip/imperativeMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength25.2" select="string-length(normalize-space($sExampleValue25.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength25.2 != 0 and $sExampleValue25.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue25.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue25.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength25.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
<td align="left">
							<xsl:text>imperative</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
<td align="left">
							<xsl:text>imperative</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatInterrogative/@checked)='yes'">
<xsl:variable name="sExampleValue26.2">
<xsl:value-of select="translate(string(//ip/interrogativeMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength26.2" select="string-length(normalize-space($sExampleValue26.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength26.2 != 0 and $sExampleValue26.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue26.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue26.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength26.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
<td align="left">
							<xsl:text>interrogative</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
<td align="left">
							<xsl:text>interrogative</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipinflFeatConditional/@checked)='yes'">
<xsl:variable name="sExampleValue27.2">
<xsl:value-of select="translate(string(//ip/conditionalMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength27.2" select="string-length(normalize-space($sExampleValue27.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength27.2 != 0 and $sExampleValue27.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue27.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue27.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength27.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>mood</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>conditional</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>mood</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>conditional</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<xsl:variable name="sExampleValue28.2">
<xsl:value-of select="translate(string(//ip/subjunctiveMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength28.2" select="string-length(normalize-space($sExampleValue28.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength28.2 != 0 and $sExampleValue28.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue28.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue28.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength28.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>mood</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>subjunctive</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>mood</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>subjunctive</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatIrrealis/@checked)='yes'">
<xsl:variable name="sExampleValue29.2">
<xsl:value-of select="translate(string(//ip/irrealisMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength29.2" select="string-length(normalize-space($sExampleValue29.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength29.2 != 0 and $sExampleValue29.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue29.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue29.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength29.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
<td align="left">
							<xsl:text>irrealis</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
<td align="left">
							<xsl:text>irrealis</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipInflFeatOtherMood/@checked)='yes'">
<xsl:variable name="sExampleValue30.2">
<xsl:value-of select="translate(string(//ip/otherMood),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength30.2" select="string-length(normalize-space($sExampleValue30.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength30.2 != 0 and $sExampleValue30.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue30.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue30.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength30.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
<td align="left">
							<xsl:text>ENTER GLOSS</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>mood</xsl:text>
						</td>
<td align="left">
							<xsl:text>ENTER GLOSS</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:variable name="sExampleValue31.2">
<xsl:value-of select="translate(string(//ip/witnessEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength31.2" select="string-length(normalize-space($sExampleValue31.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength31.2 != 0 and $sExampleValue31.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue31.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue31.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength31.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>witness</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>witness</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue32.2">
<xsl:value-of select="translate(string(//ip/nonwitnessEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength32.2" select="string-length(normalize-space($sExampleValue32.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength32.2 != 0 and $sExampleValue32.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue32.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue32.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength32.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>nonwitness</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>nonwitness</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue33.2">
<xsl:value-of select="translate(string(//ip/firsthandEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength33.2" select="string-length(normalize-space($sExampleValue33.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength33.2 != 0 and $sExampleValue33.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue33.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue33.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength33.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>firsthand</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>firsthand</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue34.2">
<xsl:value-of select="translate(string(//ip/secondhandEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength34.2" select="string-length(normalize-space($sExampleValue34.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength34.2 != 0 and $sExampleValue34.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue34.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue34.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength34.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>secondhand</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>secondhand</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue35.2">
<xsl:value-of select="translate(string(//ip/thirdhandEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength35.2" select="string-length(normalize-space($sExampleValue35.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength35.2 != 0 and $sExampleValue35.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue35.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue35.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength35.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>thirdhand</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>thirdhand</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue36.2">
<xsl:value-of select="translate(string(//ip/visualEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength36.2" select="string-length(normalize-space($sExampleValue36.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength36.2 != 0 and $sExampleValue36.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue36.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue36.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength36.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>visual</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>visual</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue37.2">
<xsl:value-of select="translate(string(//ip/auditoryEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength37.2" select="string-length(normalize-space($sExampleValue37.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength37.2 != 0 and $sExampleValue37.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue37.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue37.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength37.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>auditory</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>auditory</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue38.2">
<xsl:value-of select="translate(string(//ip/olfactoryEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength38.2" select="string-length(normalize-space($sExampleValue38.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength38.2 != 0 and $sExampleValue38.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue38.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue38.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength38.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>olfactory</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>olfactory</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue39.2">
<xsl:value-of select="translate(string(//ip/inferentialEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength39.2" select="string-length(normalize-space($sExampleValue39.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength39.2 != 0 and $sExampleValue39.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue39.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue39.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength39.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>inferential</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>inferential</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue40.2">
<xsl:value-of select="translate(string(//ip/reportativeEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength40.2" select="string-length(normalize-space($sExampleValue40.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength40.2 != 0 and $sExampleValue40.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue40.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue40.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength40.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>reportative</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>reportative</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue41.2">
<xsl:value-of select="translate(string(//ip/hearsayEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength41.2" select="string-length(normalize-space($sExampleValue41.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength41.2 != 0 and $sExampleValue41.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue41.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue41.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength41.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>hearsay</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>hearsay</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue42.2">
<xsl:value-of select="translate(string(//ip/quotativeEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength42.2" select="string-length(normalize-space($sExampleValue42.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength42.2 != 0 and $sExampleValue42.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue42.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue42.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength42.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>quotative</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>quotative</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue43.2">
<xsl:value-of select="translate(string(//ip/assumedEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength43.2" select="string-length(normalize-space($sExampleValue43.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength43.2 != 0 and $sExampleValue43.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue43.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue43.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength43.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>assumed</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>assumed</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					<xsl:variable name="sExampleValue44.2">
<xsl:value-of select="translate(string(//ip/otherEvident),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength44.2" select="string-length(normalize-space($sExampleValue44.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength44.2 != 0 and $sExampleValue44.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue44.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue44.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength44.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>ENTER GLOSS</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>evidentiality</xsl:text>
</td>
<td align="left">
<xsl:text>ENTER GLOSS</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
					
					<xsl:if test="normalize-space(//ip/ipInflFeatFinite/@checked)='yes'">
<xsl:variable name="sExampleValue45.2">
<xsl:value-of select="translate(string(//ip/finiteOther),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength45.2" select="string-length(normalize-space($sExampleValue45.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength45.2 != 0 and $sExampleValue45.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue45.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue45.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength45.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>other</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>finite</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>other</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>finite</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatMinusFinite/@checked)='yes'">
<xsl:variable name="sExampleValue46.2">
<xsl:value-of select="translate(string(//ip/nonfiniteOther),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength46.2" select="string-length(normalize-space($sExampleValue46.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength46.2 != 0 and $sExampleValue46.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue46.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue46.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength46.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>other</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>nonfinite</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>other</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>nonfinite</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatGerund/@checked)='yes'">
<xsl:variable name="sExampleValue47.2">
<xsl:value-of select="translate(string(//ip/gerundOther),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength47.2" select="string-length(normalize-space($sExampleValue47.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength47.2 != 0 and $sExampleValue47.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue47.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue47.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength47.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>other</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>gerund</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>other</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>gerund</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatParticiple/@checked)='yes'">
<xsl:variable name="sExampleValue48.2">
<xsl:value-of select="translate(string(//ip/participleOther),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength48.2" select="string-length(normalize-space($sExampleValue48.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength48.2 != 0 and $sExampleValue48.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue48.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue48.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength48.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>other</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>participle</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>other</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>participle</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatAntipassive/@checked)='yes'">
<xsl:variable name="sExampleValue49.2">
<xsl:value-of select="translate(string(//ip/antipassiveVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength49.2" select="string-length(normalize-space($sExampleValue49.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength49.2 != 0 and $sExampleValue49.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue49.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue49.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength49.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>antipassive</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>antipassive</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   	<xsl:if test="normalize-space(//ip/ipInflFeatApplicative/@checked)='yes'">
<xsl:variable name="sExampleValue50.2">
<xsl:value-of select="translate(string(//ip/applicativeVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength50.2" select="string-length(normalize-space($sExampleValue50.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength50.2 != 0 and $sExampleValue50.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue50.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue50.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength50.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				   			<xsl:text>voice</xsl:text>
				   		</td>
<td align="left">
				   			<xsl:text>applicative</xsl:text>
				   		</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				   			<xsl:text>voice</xsl:text>
				   		</td>
<td align="left">
				   			<xsl:text>applicative</xsl:text>
				   		</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatCausative/@checked)='yes'">
<xsl:variable name="sExampleValue51.2">
<xsl:value-of select="translate(string(//ip/causativeVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength51.2" select="string-length(normalize-space($sExampleValue51.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength51.2 != 0 and $sExampleValue51.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue51.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue51.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength51.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>causative</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>causative</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>	
				   <xsl:if test="normalize-space(//ip/ipInflFeatPassive/@checked)='yes'">
<xsl:variable name="sExampleValue52.2">
<xsl:value-of select="translate(string(//ip/passiveVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength52.2" select="string-length(normalize-space($sExampleValue52.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength52.2 != 0 and $sExampleValue52.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue52.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue52.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength52.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>voice</xsl:text>
						</td>
<td align="left">
							<xsl:text>passive</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>voice</xsl:text>
						</td>
<td align="left">
							<xsl:text>passive</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatActorVoice/@checked)='yes'">
<xsl:variable name="sExampleValue53.2">
<xsl:value-of select="translate(string(//ip/actorVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength53.2" select="string-length(normalize-space($sExampleValue53.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength53.2 != 0 and $sExampleValue53.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue53.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue53.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength53.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>actor voice</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>actor voice</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatDativeVoice/@checked)='yes'">
<xsl:variable name="sExampleValue54.2">
<xsl:value-of select="translate(string(//ip/dativeVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength54.2" select="string-length(normalize-space($sExampleValue54.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength54.2 != 0 and $sExampleValue54.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue54.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue54.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength54.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>dative voice</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>dative voice</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatGoalVoice/@checked)='yes'">
<xsl:variable name="sExampleValue55.2">
<xsl:value-of select="translate(string(//ip/goalVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength55.2" select="string-length(normalize-space($sExampleValue55.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength55.2 != 0 and $sExampleValue55.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue55.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue55.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength55.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>goal voice</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>goal voice</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatInstrumentalVoice/@checked)='yes'">
<xsl:variable name="sExampleValue56.2">
<xsl:value-of select="translate(string(//ip/instrumentalVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength56.2" select="string-length(normalize-space($sExampleValue56.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength56.2 != 0 and $sExampleValue56.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue56.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue56.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength56.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>instrumental voice</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>instrumental voice</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatLocativeVoice/@checked)='yes'">
<xsl:variable name="sExampleValue57.2">
<xsl:value-of select="translate(string(//ip/locativeVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength57.2" select="string-length(normalize-space($sExampleValue57.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength57.2 != 0 and $sExampleValue57.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue57.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue57.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength57.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>locative voice</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>locative voice</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				   <xsl:if test="normalize-space(//ip/ipInflFeatObjectVoice/@checked)='yes'">
<xsl:variable name="sExampleValue58.2">
<xsl:value-of select="translate(string(//ip/objectVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength58.2" select="string-length(normalize-space($sExampleValue58.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength58.2 != 0 and $sExampleValue58.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue58.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue58.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength58.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>object voice</xsl:text>
				      </td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
				         <xsl:text>voice</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>object voice</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:variable name="sExampleValue59.2">
<xsl:value-of select="translate(string(//ip/otherVoice),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength59.2" select="string-length(normalize-space($sExampleValue59.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength59.2 != 0 and $sExampleValue59.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue59.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue59.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength59.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
<xsl:text>voice</xsl:text>
</td>
<td align="left">
<xsl:text>ENTER GLOSS</xsl:text>
</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
<xsl:text>voice</xsl:text>
</td>
<td align="left">
<xsl:text>ENTER GLOSS</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
		</section2>
		<section2 id="sIPAgr">
			<secTitle>Agreement Features</secTitle>
			<p>
<xsl:text>Verbs and auxiliaries may also carry agreement features that agree with the subject or the direct object.  Most of these features are added by affixes or pronominal clitics which may attach to the verb.  </xsl:text>
<xsl:if test="normalize-space(//typology/@classifier)!='no'">
<xsl:text>Class agreement was handled in section </xsl:text>
<sectionRef sec="sClassifiers" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
			<p>
<xsl:text>The following agreement features are marked on verbs and/or auxiliaries in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
			<example num="xV.IPAgr.8">
<table border="1">
					<tr>
						<th>Type of feature</th>
						<th>Feature</th>
					   <th>Morphemes</th>
					</tr>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstSubject/@checked)='yes'">
<xsl:variable name="sExampleValue0.2">
<xsl:value-of select="translate(string(//ip/firstSubjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength0.2" select="string-length(normalize-space($sExampleValue0.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength0.2 != 0 and $sExampleValue0.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue0.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength0.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstObject/@checked)='yes'">
<xsl:variable name="sExampleValue1.2">
<xsl:value-of select="translate(string(//ip/firstObjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength1.2" select="string-length(normalize-space($sExampleValue1.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength1.2 != 0 and $sExampleValue1.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue1.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength1.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstErgative/@checked)='yes'">
<xsl:variable name="sExampleValue2.2">
<xsl:value-of select="translate(string(//ip/firstErgativePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength2.2" select="string-length(normalize-space($sExampleValue2.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength2.2 != 0 and $sExampleValue2.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue2.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength2.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue3.2">
<xsl:value-of select="translate(string(//ip/firstAbsolutivePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength3.2" select="string-length(normalize-space($sExampleValue3.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength3.2 != 0 and $sExampleValue3.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue3.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength3.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveSubject/@checked)='yes'">
<xsl:variable name="sExampleValue4.2">
<xsl:value-of select="translate(string(//ip/firstExclusiveSubjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4.2" select="string-length(normalize-space($sExampleValue4.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength4.2 != 0 and $sExampleValue4.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person exclusive subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person exclusive subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveObject/@checked)='yes'">
<xsl:variable name="sExampleValue5.2">
<xsl:value-of select="translate(string(//ip/firstExclusiveObjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5.2" select="string-length(normalize-space($sExampleValue5.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength5.2 != 0 and $sExampleValue5.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person exclusive object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person exclusive object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveErgative/@checked)='yes'">
<xsl:variable name="sExampleValue6.2">
<xsl:value-of select="translate(string(//ip/firstExclusiveErgativePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6.2" select="string-length(normalize-space($sExampleValue6.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength6.2 != 0 and $sExampleValue6.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person exclusive ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person exclusive ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstExclusiveAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue7.2">
<xsl:value-of select="translate(string(//ip/firstExclusiveAbsolutivePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7.2" select="string-length(normalize-space($sExampleValue7.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength7.2 != 0 and $sExampleValue7.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person exclusive absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person exclusive absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveSubject/@checked)='yes'">
<xsl:variable name="sExampleValue8.2">
<xsl:value-of select="translate(string(//ip/firstInclusiveSubjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8.2" select="string-length(normalize-space($sExampleValue8.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength8.2 != 0 and $sExampleValue8.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person inclusive subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person inclusive subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveObject/@checked)='yes'">
<xsl:variable name="sExampleValue9.2">
<xsl:value-of select="translate(string(//ip/firstInclusiveObjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9.2" select="string-length(normalize-space($sExampleValue9.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength9.2 != 0 and $sExampleValue9.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person inclusive object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person inclusive object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveErgative/@checked)='yes'">
<xsl:variable name="sExampleValue10.2">
<xsl:value-of select="translate(string(//ip/firstInclusiveErgativePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10.2" select="string-length(normalize-space($sExampleValue10.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength10.2 != 0 and $sExampleValue10.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person inclusive ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person inclusive ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFirstInclusiveAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue11.2">
<xsl:value-of select="translate(string(//ip/firstInclusiveAbsolutivePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11.2" select="string-length(normalize-space($sExampleValue11.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength11.2 != 0 and $sExampleValue11.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person inclusive absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>first person inclusive absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondSubject/@checked)='yes'">
<xsl:variable name="sExampleValue12.2">
<xsl:value-of select="translate(string(//ip/secondSubjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12.2" select="string-length(normalize-space($sExampleValue12.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength12.2 != 0 and $sExampleValue12.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>second person subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>second person subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondObject/@checked)='yes'">
<xsl:variable name="sExampleValue13.2">
<xsl:value-of select="translate(string(//ip/secondObjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13.2" select="string-length(normalize-space($sExampleValue13.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength13.2 != 0 and $sExampleValue13.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>second person object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>second person object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondErgative/@checked)='yes'">
<xsl:variable name="sExampleValue14.2">
<xsl:value-of select="translate(string(//ip/secondErgativePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14.2" select="string-length(normalize-space($sExampleValue14.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength14.2 != 0 and $sExampleValue14.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>second person ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>second person ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSecondAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue15.2">
<xsl:value-of select="translate(string(//ip/secondAbsolutivePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength15.2" select="string-length(normalize-space($sExampleValue15.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength15.2 != 0 and $sExampleValue15.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue15.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength15.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>second person absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>second person absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdSubject/@checked)='yes'">
<xsl:variable name="sExampleValue16.2">
<xsl:value-of select="translate(string(//ip/thirdSubjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength16.2" select="string-length(normalize-space($sExampleValue16.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength16.2 != 0 and $sExampleValue16.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue16.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength16.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>third person subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>third person subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdObject/@checked)='yes'">
<xsl:variable name="sExampleValue17.2">
<xsl:value-of select="translate(string(//ip/thirdObjectPerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength17.2" select="string-length(normalize-space($sExampleValue17.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength17.2 != 0 and $sExampleValue17.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue17.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength17.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>third person object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>third person object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdErgative/@checked)='yes'">
<xsl:variable name="sExampleValue18.2">
<xsl:value-of select="translate(string(//ip/thirdErgativePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength18.2" select="string-length(normalize-space($sExampleValue18.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength18.2 != 0 and $sExampleValue18.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue18.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength18.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>third person ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>third person ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatThirdAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue19.2">
<xsl:value-of select="translate(string(//ip/thirdAbsolutivePerson),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength19.2" select="string-length(normalize-space($sExampleValue19.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength19.2 != 0 and $sExampleValue19.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue19.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength19.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>third person absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>person</xsl:text>
						</td>
<td align="left">
							<xsl:text>third person absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularSubject/@checked)='yes'">
<xsl:variable name="sExampleValue20.2">
<xsl:value-of select="translate(string(//ip/singularSubjectNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength20.2" select="string-length(normalize-space($sExampleValue20.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength20.2 != 0 and $sExampleValue20.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue20.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength20.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>singular subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>singular subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularObject/@checked)='yes'">
<xsl:variable name="sExampleValue21.2">
<xsl:value-of select="translate(string(//ip/singularObjectNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength21.2" select="string-length(normalize-space($sExampleValue21.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength21.2 != 0 and $sExampleValue21.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue21.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength21.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>singular object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>singular object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularErgative/@checked)='yes'">
<xsl:variable name="sExampleValue22.2">
<xsl:value-of select="translate(string(//ip/singularErgativeNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength22.2" select="string-length(normalize-space($sExampleValue22.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength22.2 != 0 and $sExampleValue22.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue22.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength22.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>singular ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>singular ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatSingularAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue23.2">
<xsl:value-of select="translate(string(//ip/singularAbsolutiveNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength23.2" select="string-length(normalize-space($sExampleValue23.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength23.2 != 0 and $sExampleValue23.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue23.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength23.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>singular absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>singular absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualSubject/@checked)='yes'">
<xsl:variable name="sExampleValue24.2">
<xsl:value-of select="translate(string(//ip/dualSubjectNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength24.2" select="string-length(normalize-space($sExampleValue24.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength24.2 != 0 and $sExampleValue24.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue24.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength24.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>dual subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>dual subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualObject/@checked)='yes'">
<xsl:variable name="sExampleValue25.2">
<xsl:value-of select="translate(string(//ip/dualObjectNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength25.2" select="string-length(normalize-space($sExampleValue25.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength25.2 != 0 and $sExampleValue25.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue25.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue25.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength25.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>dual object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>dual object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualErgative/@checked)='yes'">
<xsl:variable name="sExampleValue26.2">
<xsl:value-of select="translate(string(//ip/dualErgativeNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength26.2" select="string-length(normalize-space($sExampleValue26.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength26.2 != 0 and $sExampleValue26.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue26.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue26.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength26.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>dual ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>dual ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatDualAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue27.2">
<xsl:value-of select="translate(string(//ip/dualAbsolutiveNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength27.2" select="string-length(normalize-space($sExampleValue27.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength27.2 != 0 and $sExampleValue27.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue27.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue27.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength27.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>dual absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>dual absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralSubject/@checked)='yes'">
<xsl:variable name="sExampleValue28.2">
<xsl:value-of select="translate(string(//ip/pluralSubjectNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength28.2" select="string-length(normalize-space($sExampleValue28.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength28.2 != 0 and $sExampleValue28.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue28.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue28.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength28.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>plural subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>plural subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralObject/@checked)='yes'">
<xsl:variable name="sExampleValue29.2">
<xsl:value-of select="translate(string(//ip/pluralObjectNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength29.2" select="string-length(normalize-space($sExampleValue29.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength29.2 != 0 and $sExampleValue29.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue29.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue29.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength29.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>plural object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>plural object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralErgative/@checked)='yes'">
<xsl:variable name="sExampleValue30.2">
<xsl:value-of select="translate(string(//ip/pluralErgativeNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength30.2" select="string-length(normalize-space($sExampleValue30.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength30.2 != 0 and $sExampleValue30.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue30.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue30.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength30.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>plural ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>plural ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatPluralAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue31.2">
<xsl:value-of select="translate(string(//ip/pluralAbsolutiveNumber),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength31.2" select="string-length(normalize-space($sExampleValue31.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength31.2 != 0 and $sExampleValue31.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue31.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue31.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength31.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>plural absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>number</xsl:text>
						</td>
<td align="left">
							<xsl:text>plural absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineSubject/@checked)='yes'">
<xsl:variable name="sExampleValue32.2">
<xsl:value-of select="translate(string(//ip/masculineSubjectGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength32.2" select="string-length(normalize-space($sExampleValue32.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength32.2 != 0 and $sExampleValue32.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue32.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue32.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength32.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>masculine subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>masculine subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineObject/@checked)='yes'">
<xsl:variable name="sExampleValue33.2">
<xsl:value-of select="translate(string(//ip/masculineObjectGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength33.2" select="string-length(normalize-space($sExampleValue33.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength33.2 != 0 and $sExampleValue33.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue33.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue33.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength33.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>masculine object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>masculine object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineErgative/@checked)='yes'">
<xsl:variable name="sExampleValue34.2">
<xsl:value-of select="translate(string(//ip/masculineErgativeGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength34.2" select="string-length(normalize-space($sExampleValue34.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength34.2 != 0 and $sExampleValue34.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue34.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue34.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength34.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>masculine ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>masculine ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMasculineAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue35.2">
<xsl:value-of select="translate(string(//ip/masculineErgativeGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength35.2" select="string-length(normalize-space($sExampleValue35.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength35.2 != 0 and $sExampleValue35.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue35.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue35.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength35.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>masculine absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>masculine absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineSubject/@checked)='yes'">
<xsl:variable name="sExampleValue36.2">
<xsl:value-of select="translate(string(//ip/feminineSubjectGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength36.2" select="string-length(normalize-space($sExampleValue36.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength36.2 != 0 and $sExampleValue36.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue36.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue36.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength36.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>feminine subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>feminine subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineObject/@checked)='yes'">
<xsl:variable name="sExampleValue37.2">
<xsl:value-of select="translate(string(//ip/feminineObjectGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength37.2" select="string-length(normalize-space($sExampleValue37.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength37.2 != 0 and $sExampleValue37.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue37.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue37.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength37.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>feminine object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>feminine object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineErgative/@checked)='yes'">
<xsl:variable name="sExampleValue38.2">
<xsl:value-of select="translate(string(//ip/feminineErgativeGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength38.2" select="string-length(normalize-space($sExampleValue38.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength38.2 != 0 and $sExampleValue38.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue38.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue38.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength38.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>feminine ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>feminine ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatFeminineAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue39.2">
<xsl:value-of select="translate(string(//ip/feminineAbsolutiveGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength39.2" select="string-length(normalize-space($sExampleValue39.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength39.2 != 0 and $sExampleValue39.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue39.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue39.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength39.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>feminine absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>feminine absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterSubject/@checked)='yes'">
<xsl:variable name="sExampleValue40.2">
<xsl:value-of select="translate(string(//ip/neuterSubjectGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength40.2" select="string-length(normalize-space($sExampleValue40.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength40.2 != 0 and $sExampleValue40.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue40.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue40.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength40.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>neuter subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>neuter subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterObject/@checked)='yes'">
<xsl:variable name="sExampleValue41.2">
<xsl:value-of select="translate(string(//ip/neuterObjectGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength41.2" select="string-length(normalize-space($sExampleValue41.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength41.2 != 0 and $sExampleValue41.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue41.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue41.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength41.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>neuter object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>neuter object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterErgative/@checked)='yes'">
<xsl:variable name="sExampleValue42.2">
<xsl:value-of select="translate(string(//ip/neuterErgativeGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength42.2" select="string-length(normalize-space($sExampleValue42.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength42.2 != 0 and $sExampleValue42.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue42.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue42.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength42.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>neuter ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>neuter ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatNeuterAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue43.2">
<xsl:value-of select="translate(string(//ip/neuterAbsolutiveGender),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength43.2" select="string-length(normalize-space($sExampleValue43.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength43.2 != 0 and $sExampleValue43.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue43.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue43.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength43.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>neuter absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>gender</xsl:text>
						</td>
<td align="left">
							<xsl:text>neuter absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateSubject/@checked)='yes'">
<xsl:variable name="sExampleValue44.2">
<xsl:value-of select="translate(string(//ip/animateSubjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength44.2" select="string-length(normalize-space($sExampleValue44.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength44.2 != 0 and $sExampleValue44.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue44.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue44.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength44.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>animate subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>animate subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateObject/@checked)='yes'">
<xsl:variable name="sExampleValue45.2">
<xsl:value-of select="translate(string(//ip/animateObjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength45.2" select="string-length(normalize-space($sExampleValue45.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength45.2 != 0 and $sExampleValue45.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue45.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue45.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength45.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>animate object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>animate object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateErgative/@checked)='yes'">
<xsl:variable name="sExampleValue46.2">
<xsl:value-of select="translate(string(//ip/animateErgativeAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength46.2" select="string-length(normalize-space($sExampleValue46.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength46.2 != 0 and $sExampleValue46.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue46.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue46.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength46.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>animate ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>animate ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatAnimateAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue47.2">
<xsl:value-of select="translate(string(//ip/animateAbsolutiveAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength47.2" select="string-length(normalize-space($sExampleValue47.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength47.2 != 0 and $sExampleValue47.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue47.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue47.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength47.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>animate absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>animate absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateSubject/@checked)='yes'">
<xsl:variable name="sExampleValue48.2">
<xsl:value-of select="translate(string(//ip/inanimateSubjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength48.2" select="string-length(normalize-space($sExampleValue48.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength48.2 != 0 and $sExampleValue48.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue48.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue48.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength48.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>inanimate subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>inanimate subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateObject/@checked)='yes'">
<xsl:variable name="sExampleValue49.2">
<xsl:value-of select="translate(string(//ip/inanimateObjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength49.2" select="string-length(normalize-space($sExampleValue49.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength49.2 != 0 and $sExampleValue49.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue49.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue49.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength49.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>inanimate object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>inanimate object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateErgative/@checked)='yes'">
<xsl:variable name="sExampleValue50.2">
<xsl:value-of select="translate(string(//ip/inanimateErgativeAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength50.2" select="string-length(normalize-space($sExampleValue50.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength50.2 != 0 and $sExampleValue50.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue50.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue50.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength50.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>inanimate ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>inanimate ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusAnimateAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue51.2">
<xsl:value-of select="translate(string(//ip/inanimateAbsolutiveAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength51.2" select="string-length(normalize-space($sExampleValue51.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength51.2 != 0 and $sExampleValue51.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue51.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue51.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength51.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>inanimate absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>inanimate absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanSubject/@checked)='yes'">
<xsl:variable name="sExampleValue52.2">
<xsl:value-of select="translate(string(//ip/humanSubjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength52.2" select="string-length(normalize-space($sExampleValue52.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength52.2 != 0 and $sExampleValue52.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue52.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue52.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength52.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>human subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>human subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanObject/@checked)='yes'">
<xsl:variable name="sExampleValue53.2">
<xsl:value-of select="translate(string(//ip/humanObjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength53.2" select="string-length(normalize-space($sExampleValue53.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength53.2 != 0 and $sExampleValue53.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue53.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue53.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength53.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>human object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>human object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanErgative/@checked)='yes'">
<xsl:variable name="sExampleValue54.2">
<xsl:value-of select="translate(string(//ip/humanErgativeAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength54.2" select="string-length(normalize-space($sExampleValue54.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength54.2 != 0 and $sExampleValue54.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue54.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue54.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength54.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>human ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>human ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatHumanAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue55.2">
<xsl:value-of select="translate(string(//ip/humanAbsolutiveAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength55.2" select="string-length(normalize-space($sExampleValue55.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength55.2 != 0 and $sExampleValue55.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue55.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue55.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength55.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>human absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>human absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanSubject/@checked)='yes'">
<xsl:variable name="sExampleValue56.2">
<xsl:value-of select="translate(string(//ip/nonhumanSubjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength56.2" select="string-length(normalize-space($sExampleValue56.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength56.2 != 0 and $sExampleValue56.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue56.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue56.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength56.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>nonhuman subject</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>nonhuman subject</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanObject/@checked)='yes'">
<xsl:variable name="sExampleValue57.2">
<xsl:value-of select="translate(string(//ip/nonhumanObjectAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength57.2" select="string-length(normalize-space($sExampleValue57.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength57.2 != 0 and $sExampleValue57.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue57.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue57.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength57.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>nonhuman object</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>nonhuman object</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanErgative/@checked)='yes'">
<xsl:variable name="sExampleValue58.2">
<xsl:value-of select="translate(string(//ip/nonhumanErgativeAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength58.2" select="string-length(normalize-space($sExampleValue58.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength58.2 != 0 and $sExampleValue58.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue58.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue58.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength58.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>nonhuman ergative argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>nonhuman ergative argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
					<xsl:if test="normalize-space(//ip/ipAgrFeatMinusHumanAbsolutive/@checked)='yes'">
<xsl:variable name="sExampleValue59.2">
<xsl:value-of select="translate(string(//ip/nonhumanAbsolutiveAnimacy),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength59.2" select="string-length(normalize-space($sExampleValue59.2))" />
<xsl:choose>
<xsl:when test="$iExampleLength59.2 != 0 and $sExampleValue59.2 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue59.2" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue59.2" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength59.2" />
</xsl:with-param>
<xsl:with-param name="columnsBefore">
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>nonhuman absolutive argument</xsl:text>
						</td>
</xsl:with-param>
<xsl:with-param name="columnsAfter" />
<xsl:with-param name="bHandleRowSpans" select="'Y'" />
<xsl:with-param name="iRowsToSpan" select="string-length($sCalculatedRows)" />
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<tr>
<td align="left">
							<xsl:text>animacy</xsl:text>
						</td>
<td align="left">
							<xsl:text>nonhuman absolutive argument</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTER AN EXAMPLE HERE</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				</table>
</example>
		</section2>
	   <section2 id="sVerbParadigms">
	      <secTitle>Verb Paradigms</secTitle>
	  <p>
<xsl:text>Paradigms display in table form some of the changes that occur when the inflection and agreement morphemes are added to particular verbs.  Some verbs are verb regular, while others are irregular.</xsl:text>
</p>
	  <section3 id="sVerbParadigmsRegular">
	     <secTitle>Paradigms for some regular verbs</secTitle>
	  	<p>
<xsl:text>Paradigms for four regular verbs are shown here:  </xsl:text>
<object type="tComment">You will need to add the forms in each cell.  You can change verbs if these are not regular in your language.  
	  		<xsl:choose>
	  			<xsl:when test="//pron/@dependentPron='yes'"> You can delete some columns if the table is too wide in the pdf output.</xsl:when>
	  			<xsl:when test="//pron/@dependentPron='no'"> Since your language does not make changes in the verb for different subjects, the paradigms are quite simple.  You may want to add some columns for changes that are marked in the verbs, such as mood and/or plural subjects.</xsl:when>
	  		</xsl:choose>
</object>
</p>

	  		     <xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.6">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to speak’</langData>
</caption>
	           <tr>
	              <th>Tense / Aspect</th>
	              <th>Verb form</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.8">
<table border="1">
	  			<caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to speak’</langData>
</caption>
	  			<tr>
	  				<th>Subject</th>
	  				<th>First</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusive</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusive</th>
</xsl:if>
	  				<th>Second</th>
	  				<th>Third</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.10">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to speak’</langData>
</caption>
	           <tr>
	              <th>Subject</th>
	              <th>First Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>First Pl</th>
</xsl:if>
	              <th>Second Sg</th>
	              <th>Second Pl</th>
	              <th>Third Sg</th>
	              <th>Third Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	  		     <xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.12">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to eat’</langData>
</caption>
	           <tr>
	              <th>Tense / Aspect</th>
	              <th>Verb form</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.14">
<table border="1">
	  			<caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to eat’</langData>
</caption>
	  			<tr>
	  				<th>Subject</th>
	  				<th>First</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusive</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusive</th>
</xsl:if>
	  				<th>Second</th>
	  				<th>Third</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.16">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to eat’</langData>
</caption>
	           <tr>
	              <th>Subject</th>
	              <th>First Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>First Pl</th>
</xsl:if>
	              <th>Second Sg</th>
	              <th>Second Pl</th>
	              <th>Third Sg</th>
	              <th>Third Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	  		     <xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.18">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to live’</langData>
</caption>
	           <tr>
	              <th>Tense / Aspect</th>
	              <th>Verb form</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.20">
<table border="1">
	  			<caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to live’</langData>
</caption>
	  			<tr>
	  				<th>Subject</th>
	  				<th>First</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusive</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusive</th>
</xsl:if>
	  				<th>Second</th>
	  				<th>Third</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.22">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to live’</langData>
</caption>
	           <tr>
	              <th>Subject</th>
	              <th>First Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>First Pl</th>
</xsl:if>
	              <th>Second Sg</th>
	              <th>Second Pl</th>
	              <th>Third Sg</th>
	              <th>Third Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	     <xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.24">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to see’</langData>
</caption>
	           <tr>
	              <th>Tense / Aspect</th>
	              <th>Verb form</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.26">
<table border="1">
	  			<caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to see’</langData>
</caption>
	  			<tr>
	  				<th>Subject</th>
	  				<th>First</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusive</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusive</th>
</xsl:if>
	  				<th>Second</th>
	  				<th>Third</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.28">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to see’</langData>
</caption>
	           <tr>
	              <th>Subject</th>
	              <th>First Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>First Pl</th>
</xsl:if>
	              <th>Second Sg</th>
	              <th>Second Pl</th>
	              <th>Third Sg</th>
	              <th>Third Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	  </section3>
	      
	      <section3 id="sVerbParadigmsIrregular">
	         <secTitle>Paradigms for some irregular verbs</secTitle>
	      	<p>
<xsl:text>Paradigms for three irregular verbs are shown here:  </xsl:text>
<object type="tComment">You will need to add the forms in each cell.  You can change verbs if these are not expressed or not irregular in your language.  Note that ‘to come’ may be ‘to go toward base’ and ‘to go’ may be ‘to go to non-base’ or ‘to go away from base’ in your language.  
	      		<xsl:choose>
	      			<xsl:when test="//pron/@dependentPron='yes'"> You can delete some columns if the table is too wide in the pdf output.</xsl:when>
	      			<xsl:when test="//pron/@dependentPron='no'"> Since your language does not make changes in the verb for different subjects, the paradigms are quite simple.  You may want to add some columns for changes that are marked in the verbs, such as mood and/or plural subjects.</xsl:when>
	      		</xsl:choose>
</object>
</p>

	      	<xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.6">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to be’</langData>
</caption>
	           <tr>
	              <th>Tense / Aspect</th>
	              <th>Verb form</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.8">
<table border="1">
	  			<caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to be’</langData>
</caption>
	  			<tr>
	  				<th>Subject</th>
	  				<th>First</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusive</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusive</th>
</xsl:if>
	  				<th>Second</th>
	  				<th>Third</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.10">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to be’</langData>
</caption>
	           <tr>
	              <th>Subject</th>
	              <th>First Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>First Pl</th>
</xsl:if>
	              <th>Second Sg</th>
	              <th>Second Pl</th>
	              <th>Third Sg</th>
	              <th>Third Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	     <xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.12">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to come’</langData>
</caption>
	           <tr>
	              <th>Tense / Aspect</th>
	              <th>Verb form</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.14">
<table border="1">
	  			<caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to come’</langData>
</caption>
	  			<tr>
	  				<th>Subject</th>
	  				<th>First</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusive</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusive</th>
</xsl:if>
	  				<th>Second</th>
	  				<th>Third</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.16">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to come’</langData>
</caption>
	           <tr>
	              <th>Subject</th>
	              <th>First Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>First Pl</th>
</xsl:if>
	              <th>Second Sg</th>
	              <th>Second Pl</th>
	              <th>Third Sg</th>
	              <th>Third Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	     <xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.18">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to go’</langData>
</caption>
	           <tr>
	              <th>Tense / Aspect</th>
	              <th>Verb form</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	  	<xsl:if test="normalize-space(//pron/@pronounNumber)='no' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.20">
<table border="1">
	  			<caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to go’</langData>
</caption>
	  			<tr>
	  				<th>Subject</th>
	  				<th>First</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusive</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusive</th>
</xsl:if>
	  				<th>Second</th>
	  				<th>Third</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	  			</tr>
</xsl:if>
	  		</table>
</tablenumbered>
</xsl:if>
	  	
	     <xsl:if test="normalize-space(//pron/@pronounNumber)='yes' and normalize-space(//pron/@dependentPron)='yes'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.22">
<table border="1">
	           <caption>
<xsl:text>Paradigm for the verb meaning </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>‘to go’</langData>
</caption>
	           <tr>
	              <th>Subject</th>
	              <th>First Sg</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>First Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>First Pl</th>
</xsl:if>
	              <th>Second Sg</th>
	              <th>Second Pl</th>
	              <th>Third Sg</th>
	              <th>Third Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Present</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Past</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Future</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Tense</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Completive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habitual</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfect</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfective</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potential</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposive</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Stative</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Unreal</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Other Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjunctive</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORM</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
      
	      </section3>
	   </section2>
	   
	   <section2 id="sIPProDrop">
			<secTitle>Missing Subjects</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Some languages are called pro-drop languages because they allow a subject and/or object to be missing or unexpressed in their normal syntactic position.  For example, in Spanish the normal way to say “I buy a book” is </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Compro un libro</langData>
<xsl:text> rather than with the overt subject pronoun included: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Yo compro un libro</langData>
<xsl:text>.  This is not allowed in English, except for imperatives.  (The missing subject of infinitives in embedded clauses will be covered in section </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>.) </xsl:text>
</p>
			<p contentType="ctComparativeIntro">
<xsl:text>
Some languages are not really pro-drop languages, but at least some of the pronouns are clitics which can attach to the verb.  When this happens, there is no pronoun or nominal phrase in subject position, so the sentence appears the same as in a true pro-drop language.</xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>
	            Pro-drop languages allow a subject and/or object to be missing or unexpressed in their normal syntactic position.  There are also languages where at least some of the pronouns are clitics which attach to the verb.  When this happens, there is no pronoun or nominal phrase in subject position, so the sentence appears the same as in a true pro-drop language.</xsl:text>
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
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no'">
<xsl:text>a missing subject (pro-drop) is allowed in any type of sentence. </xsl:text>
	            <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
	            <xsl:text>  Pro-drop of the object is </xsl:text>
	            <xsl:choose>
	               <xsl:when test="//ip/@proDropObject='no'">not</xsl:when>
	               <xsl:when test="//ip/@proDropObject='yes'">also</xsl:when>
	            </xsl:choose>
	            <xsl:text> allowed.  </xsl:text>
	         </xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>the subject may look like it is missing due to dependent pronouns (pronominal clitics) attaching to the verb, but it is not a true pro-drop language.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>a missing subject (pro-drop) is allowed in any type of sentence and there are also pronominal clitics which may attach to the verb.  </xsl:text>
	            <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
	            <xsl:text>  Pro-drop of the object is </xsl:text>
	            <xsl:choose>
	               <xsl:when test="//ip/@proDropObject='no'">not</xsl:when>
	               <xsl:when test="//ip/@proDropObject='yes'">also</xsl:when>
	            </xsl:choose>
	            <xsl:text> allowed.  </xsl:text>
	         </xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='no'">
<xsl:text>a missing subject (pro-drop) is not allowed.  The subject must be overt except in imperatives.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//ip/proDropClitic/@checked)='no'">
<xsl:text>a missing subject (pro-drop) is allowed in any type of sentence, including imperatives. </xsl:text>
	            <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
	            <xsl:text>  Pro-drop of the object is </xsl:text>
	            <xsl:choose>
	               <xsl:when test="//ip/@proDropObject='no'">not</xsl:when>
	               <xsl:when test="//ip/@proDropObject='yes'">also</xsl:when>
	            </xsl:choose>
	            <xsl:text> allowed.  </xsl:text>
	         </xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>the subject may look like it is missing due to dependent pronouns (pronominal clitics) attaching to the verb, but it is not a true pro-drop language.  A completely missing subject is allowed in imperatives.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>a missing subject (pro-drop) is allowed in any type of sentence, including imperatives, and there are also pronominal clitics which may attach to the verb.  </xsl:text>
	            <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
	            <xsl:text>  Pro-drop of the object is </xsl:text>
	            <xsl:choose>
	               <xsl:when test="//ip/@proDropObject='no'">not</xsl:when>
	               <xsl:when test="//ip/@proDropObject='yes'">also</xsl:when>
	            </xsl:choose>
	            <xsl:text> allowed.  </xsl:text>
	         </xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//ip/proDropNone/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>a missing subject (pro-drop) is not allowed.  The subject must be overt even in imperatives.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>a missing subject is only allowed ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>a missing subject is allowed ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text> and also in imperatives.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='yes' or normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropClitic/@checked)='yes'">
<xsl:text>A missing subject is also allowed ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
		   <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
<p>
<xsl:text>  Examples with pro-drop include:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
<example num="xV.IPProDrop.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/proDropExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/proDropExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/proDropExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/proDropExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPProDrop.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPProDrop.14.1</xsl:text>
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
</xsl:if>				
				<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes'">
<p>
<xsl:text>  Examples that look like pro-drop due to clitic pronouns attached to the verb include:</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes'">
<example num="xV.IPProDrop.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/cliticPnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/cliticPnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/cliticPnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/cliticPnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPProDrop.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPProDrop.18.1</xsl:text>
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
</xsl:if>	
	      <xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes'">
<p>
<xsl:text>  Examples with missing subjects as allowed in </xsl:text>
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
</xsl:if>
	      <xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes'">
<example num="xV.IPProDrop.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/proDropOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/proDropOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/proDropOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/proDropOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPProDrop.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPProDrop.22.1</xsl:text>
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
</xsl:if>	
	      
	      <p>
<xsl:text>See section </xsl:text>
<sectionRef sec="sIPImp" />
<xsl:text> for examples of imperatives.</xsl:text>
</p>

		</section2>
		<section2 id="sIPAux">
			<secTitle>Auxiliaries</secTitle>
			<p>
<xsl:text>There are several kinds of verbal auxiliary elements, including auxiliary words, as well as nonfinite, motion and other types.</xsl:text>
</p>
		   
		   <section3 id="sIPAuxPositive">
		      <secTitle>Auxuliary words</secTitle>
		   
		   <p contentType="ctPracticalIntro">
<xsl:text>
		   Auxiliary elements that are written as independent words express some types of verbal inflection.</xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>
		         Some languages have auxiliary elements that are independent words, and some can have more than one auxiliary element before the main verb.  Examples for English transitive sentences include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy will hit the ball</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might have hit the ball</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy might have been hitting the ball</langData>
<xsl:text>.  In other languages these are all expressed by verbal inflection.</xsl:text>
</p>
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
					<xsl:when test="//ip/@aux='no'"> does not have any </xsl:when>
					<xsl:when test="//ip/@aux='yes'"> has some</xsl:when>
				</xsl:choose>
<xsl:text> auxiliaries which are written as independent words.  </xsl:text>
<xsl:if test="normalize-space(//ip/@aux)='yes'">
					<xsl:text>An auxiliary is </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxRequired='no'">optional</xsl:when>
						<xsl:when test="//ip/@auxRequired='no'">required</xsl:when>
					</xsl:choose>
					<xsl:text> and  </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxMany='no'">only one is possible</xsl:when>
						<xsl:when test="//ip/@auxMany='yes'">more than one may occur</xsl:when>
					</xsl:choose>
					<xsl:text> in a single clause. </xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> After an auxiliary, the normal VSO order </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">is maintained.  The order is Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">may change so the subject appears directly after the auxiliary and before the verb.  The order in these clauses is Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Before an auxiliary, the normal OSV order </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">is maintained.  The order is O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">may change so the subject appears directly after the verb and before the auxiliary.  The order in these clauses is O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<p>
<xsl:text>Examples of auxiliaries in </xsl:text>
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
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<example num="xV.IPAux.IPAuxPositive.12">
<table border="1">
					<tr>
						<th>Auxiliary Words</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/auxiliaryExample),'.','')" />
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
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<p>
<xsl:text>Examples of sentences including these auxiliaries are:</xsl:text>
</p>
</xsl:if>
			
				<xsl:if test="normalize-space(//ip/@aux)='yes'">
<example num="xV.IPAux.IPAuxPositive.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/auxExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/auxExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPAux.IPAuxPositive.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux.IPAuxPositive.16.1</xsl:text>
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
</xsl:if>
		   </section3>
		   <section3 id="sIPAuxNonfinite">
		      <secTitle>Nonfinite Auxiliary</secTitle>	   
		   <p contentType="ctPracticalIntro">
<xsl:text>The nonfinite marker may also act as an auxiliary if it is written as an independent word. </xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>The nonfinite word </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>to</langData>
<xsl:text> used in English embedded clauses also acts as an auxiliary in that it fills the same position and can occur before other auxiliaries.  For example, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy would like to have hit the ball</langData>
<xsl:text>. </xsl:text>
</p>
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
					<xsl:when test="//ip/@auxNonfinite='none'"> does not have any marker for nonfinite clauses.</xsl:when>
				   <xsl:when test="//ip/@auxNonfinite='no'"> only marks the nonfinite feature as part of the verb. </xsl:when>
				   <xsl:when test="//ip/@auxNonfinite='yes'"> has some nonfinite auxiliary-type markers which are written as independent words. </xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
					<xsl:text>A nonfinite auxiliary word is </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxNonfiniteRequired='no'">optional</xsl:when>
						<xsl:when test="//ip/@auxNonfiniteRequired='no'">required</xsl:when>
					</xsl:choose>
					<xsl:text> in nonfinte embedded clauses. </xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> After a nonfinite auxiliary, the normal VSO order </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxNonfiniteOrder='yes'">is maintained.  The order is Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxNonfiniteOrder='no'">may change so the subject appears directly after the auxiliary and before the verb.  The order in these clauses is Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Before a nonfinite auxiliary, the normal OSV order </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">is maintained.  The order is O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">may change so the subject appears directly after the verb and before the auxiliary.  The order in these clauses is O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<p>
<xsl:text>The nonfinite auxiliary marker(s) in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is/are:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<example num="xV.IPAux.IPAuxNonfinite.12">
<table border="1">
					<tr>
						<th>Nonfinite Auxiliary Marker(s)</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/auxiliaryNonfiniteExample),'.','')" />
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
<xsl:text>nonfinite marker in subordinate clauses</xsl:text>
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
<xsl:text>nonfinite marker in subordinate clauses</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<p>
<xsl:text>Examples of nonfinite clauses including these nonfinite auxiliaries are:</xsl:text>
</p>
</xsl:if>
			
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<example num="xV.IPAux.IPAuxNonfinite.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxNonfiniteExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/auxNonfiniteExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxNonfiniteExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/auxNonfiniteExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPAux.IPAuxNonfinite.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux.IPAuxNonfinite.16.1</xsl:text>
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
</xsl:if>
		   </section3>
		   <section3 id="sIPAuxOther">
		      <secTitle>Other types of Auxiliaries</secTitle>
		  		   
		   <p contentType="ctPracticalIntro">
<xsl:text>Other words may also act like auxiliaries, such as motion auxiliaries or loan markers.</xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>Some languages have other words that act like auxiliaries, such as motion auxiliaries or loan markers, which share the same subject and complements as the main verb.</xsl:text>
</p>
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
					<xsl:when test="//ip/@auxOther='no'"> does not have any </xsl:when>
					<xsl:when test="//ip/@auxOther='yes'"> has some</xsl:when>
				</xsl:choose>
<xsl:text> auxiliaries of this type which are written as independent words.  </xsl:text>
<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> After one of these auxiliaries, the normal VSO order </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOtherOrder='yes'">is maintained.  The order is Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxOtherOrder='no'">may change so the subject appears directly after the auxiliary and before the verb.  The order in these clauses is Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Before one of these auxiliaries, the normal OSV order </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">is maintained.  The order is O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">may change so the subject appears directly after the verb and before the auxiliary.  The order in these clauses is O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<p>
<xsl:text>These other auxiliaries in </xsl:text>
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
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<example num="xV.IPAux.IPAuxOther.12">
<table border="1">
					<tr>
						<th>Other Auxiliary Words</th>
						<th>Gloss</th>
					</tr>
					<xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/auxiliaryOtherExample),'.','')" />
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
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<p>
<xsl:text>Examples of sentences including these other auxiliaries are:</xsl:text>
</p>
</xsl:if>
			
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<example num="xV.IPAux.IPAuxOther.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/auxOtherExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/auxOtherExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/auxOtherExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/auxOtherExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.IPAux.IPAuxOther.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.IPAux.IPAuxOther.16.1</xsl:text>
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
</xsl:if>
		   </section3>	
		</section2>
<section2 id="sVCompounds">
   <secTitle>Verb Compounds</secTitle>
   <p>
<xsl:text>Verbs may combine with other verbs, or with nouns or other word categories to form verb compounds. These compounds still act like verbs, though they may have changed their valence, such as from a transitive verb to an intransitive verb.  Examples of the most common types will be given here.</xsl:text>
</p>
   
   <xsl:if test="normalize-space(//ip/@heartCompound)='yes'">
<p>
<xsl:text>A special set of verb compounds all contain the noun which describes the center of emotions, such as the heart.</xsl:text>
</p>
</xsl:if>
   <xsl:if test="normalize-space(//ip/@heartCompound)='yes'">
<example num="xV.VCompounds.8">
<table border="1">
         <caption>
<xsl:text>Compounds with the Center of Emotions</xsl:text>
</caption>
         <tr>
            <th>Compound</th>
            <th>Gloss for each root</th>
            <th>Gloss for the compound</th>
         </tr>
         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/heartCompoundExample),'.','')" />
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
   <xsl:if test="normalize-space(//ip/@bodypartCompound)='yes'">
<p>
<xsl:text>A</xsl:text>
<xsl:if test="normalize-space(//ip/@heartCompound)='yes'">
<xsl:text>nother</xsl:text>
</xsl:if>
<xsl:text> special set of verb compounds all contain a body part noun</xsl:text>
<xsl:if test="normalize-space(//ip/@heartCompound)='yes'">
<xsl:text> other than the center of emotions</xsl:text>
</xsl:if>
<xsl:text>.</xsl:text>
</p>
</xsl:if>
   <xsl:if test="normalize-space(//ip/@bodypartCompound)='yes'">
<example num="xV.VCompounds.12">
<table border="1">
         <caption>
<xsl:text>Compounds with a Body Part</xsl:text>
</caption> 
         <tr>
            <th>Compound</th>
            <th>Gloss for each root</th>
            <th>Gloss for the compound</th>
         </tr>
         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/bodypartCompoundExample),'.','')" />
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
   <xsl:if test="normalize-space(//ip/@heartCompound)='yes' or normalize-space(//ip/@bodypartCompound)='yes'">
<example num="xV.VCompounds.14">
<table border="1">
         <caption>
<xsl:text>Other Verb and Noun Compounds</xsl:text>
</caption> 
         <tr>
            <th>Compound</th>
            <th>Gloss for each root</th>
            <th>Gloss for the compound</th>
         </tr>
         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/verbNCompoundExample),'.','')" />
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
   <xsl:if test="normalize-space(//ip/@heartCompound)='no' and normalize-space(//ip/@bodypartCompound)='no'">
<example num="xV.VCompounds.16">
<table border="1">
         <caption>
<xsl:text>Verb and Noun Compounds</xsl:text>
</caption> 
         <tr>
            <th>Compound</th>
            <th>Gloss for each root</th>
            <th>Gloss for the compound</th>
         </tr>
         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/verbNCompoundExample),'.','')" />
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
<xsl:text>Some examples of these compounds consisting of a verb and a noun used in sentences are:</xsl:text>
</p>
   <example num="xV.VCompounds.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/verbNCompoundSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/verbNCompoundSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/verbNCompoundSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/verbNCompoundSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.VCompounds.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.VCompounds.20.1</xsl:text>
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
<xsl:text>Some compounds consisting of a verb and another word category besides a noun are:</xsl:text>
</p>
   <example num="xV.VCompounds.24">
<table border="1">
         <caption>
<xsl:text>Verb Compounds other than with Nouns</xsl:text>
</caption>
         <tr>
            <th>Compound</th>
            <th>Gloss for each root</th>
            <th>Gloss for the compound</th>
         </tr>
         <xsl:variable name="sExampleValue0.0">
<xsl:value-of select="translate(string(//ip/verbOtherCompoundExample),'.','')" />
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
<xsl:text>Examples of these compounds consisting of a verb and a non noun used in sentences are:</xsl:text>
</p>
   <example num="xV.VCompounds.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/verbOtherCompoundSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/verbOtherCompoundSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/verbOtherCompoundSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/verbOtherCompoundSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.VCompounds.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.VCompounds.28.1</xsl:text>
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
   <p contentType="ctPracticalIntro">
<xsl:text>There are also idiomatic expressions consisting of a verb and another word that go together as a unit to express a notion that is not just the same as the combined meaning of the two independent words.  Some examples of idioms in </xsl:text>
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
   <p contentType="ctComparativeIntro">
<xsl:text>Besides compounds which are written as a single word, there are also idiomatic expressions consisting of a verb and another word that go together as a unit to express a notion that is not just the same as the combined meaning of the two independent words.  Some examples of idioms in </xsl:text>
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
   <example num="xV.VCompounds.34">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//ip/verbIdiomExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//ip/verbIdiomExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//ip/verbIdiomExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//ip/verbIdiomExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xV.VCompounds.34</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xV.VCompounds.34.1</xsl:text>
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
