<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="v">
	<section1 id="sV">
		<secTitle>Verbes</secTitle>
		<p>
<xsl:text>Les verbes expriment les actions, les états ou les émotions. D’abord, on étudie les types de flexion verbal et les caractéristiques de l’accord verbal, puis on présente des paradigmes verbaux. Dans la section </xsl:text>
<sectionRef sec="sIPProDrop" />
<xsl:text> on discute l’absence du sujet, et les auxiliaires dans la section </xsl:text>
<sectionRef sec="sIPAux" />
<xsl:text>, suivi par les composés verbaux. Les exemples des verbes utilisés dans les phrases se trouvent dans la section </xsl:text>
<sectionRef sec="sIP" />
<xsl:text>.  On présente les constructions plus complexes aux sections </xsl:text>
<sectionRef sec="sFocus" />
<xsl:text> - </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
		<section2 id="sIPInfl">
			<secTitle>Flexion</secTitle>
			<p>
<xsl:text>D’habitude les verbes et les auxiliaires portent  des caractéristiques de flexion, tels que le temps, l’aspect et/ou le mode. Dans la plupart des cas ces caractéristiques se font par le moyen d’affixes, mais ils peuvent faire partie aussi de formes verbales irrégulières.</xsl:text>
</p>
			<p>
<xsl:text>Les caractérisques de flexion suivants se marquent sur les verbes et/ou sur les auxiliaires en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
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
						<th>Type de caractéristique</th>
						<th>Caractéristique</th>
						<th>Morphèmes</th>
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
							<xsl:text>temps</xsl:text>
						</td>
<td align="left">
							<xsl:text>présent</xsl:text>
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
							<xsl:text>temps</xsl:text>
						</td>
<td align="left">
							<xsl:text>présent</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>temps</xsl:text>
						</td>
<td align="left">
							<xsl:text>passé</xsl:text>
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
							<xsl:text>temps</xsl:text>
						</td>
<td align="left">
							<xsl:text>passé</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>temps</xsl:text>
						</td>
<td align="left">
							<xsl:text>futur</xsl:text>
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
							<xsl:text>temps</xsl:text>
						</td>
<td align="left">
							<xsl:text>futur</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>temps</xsl:text>
				      </td>
<td align="left">
				      	<xsl:text>non passé</xsl:text>
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
				         <xsl:text>temps</xsl:text>
				      </td>
<td align="left">
				      	<xsl:text>non passé</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>temps</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>non futur</xsl:text>
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
				         <xsl:text>temps</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>non futur</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>temps</xsl:text>
						</td>
<td align="left">
							<xsl:text>ENTRER GLOSE</xsl:text>
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
							<xsl:text>temps</xsl:text>
						</td>
<td align="left">
							<xsl:text>ENTRER GLOSE</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				      	<xsl:text>complétif</xsl:text>
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
				      	<xsl:text>complétif</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>contemplatif</xsl:text>
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
				         <xsl:text>contemplatif</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>contrafactuel</xsl:text>
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
				         <xsl:text>contrafactuel</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>continuatif</xsl:text>
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
							<xsl:text>continuatif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>habituel</xsl:text>
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
							<xsl:text>habituel</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>imparfait</xsl:text>
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
							<xsl:text>imparfait</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>imperfectif</xsl:text>
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
				         <xsl:text>imperfectif</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>incomplétif</xsl:text>
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
							<xsl:text>incomplétif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>parfait</xsl:text>
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
				         <xsl:text>parfait</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>perfectif</xsl:text>
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
							<xsl:text>perfectif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>potentiel</xsl:text>
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
							<xsl:text>potentiel</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>progressif</xsl:text>
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
							<xsl:text>progressif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>purposif</xsl:text>
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
							<xsl:text>purposif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>statif</xsl:text>
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
							<xsl:text>statif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				      	<xsl:text>irréel</xsl:text>
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
				      	<xsl:text>irréel</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>ENTRER GLOSE</xsl:text>
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
							<xsl:text>ENTRER GLOSE</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>mode</xsl:text>
						</td>
<td align="left">
							<xsl:text>déclaratif</xsl:text>
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
							<xsl:text>mode</xsl:text>
						</td>
<td align="left">
							<xsl:text>déclaratif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>mode</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>indicatif</xsl:text>
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
				         <xsl:text>mode</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>indicatif</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>mode</xsl:text>
				      </td>
<td align="left">
				      	<xsl:text>réel</xsl:text>
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
				         <xsl:text>mode</xsl:text>
				      </td>
<td align="left">
				      	<xsl:text>réel</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>mode</xsl:text>
						</td>
<td align="left">
							<xsl:text>impératif</xsl:text>
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
							<xsl:text>mode</xsl:text>
						</td>
<td align="left">
							<xsl:text>impératif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>mode</xsl:text>
						</td>
<td align="left">
							<xsl:text>interrogatif</xsl:text>
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
							<xsl:text>mode</xsl:text>
						</td>
<td align="left">
							<xsl:text>interrogatif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>mode</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>conditionnel</xsl:text>
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
				         <xsl:text>mode</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>conditionnel</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>mode</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>subjonctif</xsl:text>
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
				         <xsl:text>mode</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>subjonctif</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>mode</xsl:text>
						</td>
<td align="left">
							<xsl:text>irréel</xsl:text>
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
							<xsl:text>mode</xsl:text>
						</td>
<td align="left">
							<xsl:text>irréel</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>mode</xsl:text>
						</td>
<td align="left">
							<xsl:text>ENTRER GLOSE</xsl:text>
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
							<xsl:text>mode</xsl:text>
						</td>
<td align="left">
							<xsl:text>ENTRER GLOSE</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>témoin</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>témoin</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>non-témoin</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>non-témoin</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>de première main</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>de première main</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>de deuxième main</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>de deuxième main</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>de troisième main</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>de troisième main</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>visuel</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>visuel</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>auditif</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>auditif</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>olfactif</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>olfactif</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>inférentiel</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>inférentiel</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>reportatif</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>reportatif</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>ouï-dire</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>ouï-dire</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>quotatif</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>quotatif</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>supposé</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>supposé</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:text>évidentialité</xsl:text>
</td>
<td align="left">
<xsl:text>ENTRER GLOSE</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>autre</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>fini</xsl:text>
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
				         <xsl:text>autre</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>fini</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>autre</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>non-fini</xsl:text>
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
				         <xsl:text>autre</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>non-fini</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>autre</xsl:text>
				      </td>
<td align="left">
				      	<xsl:text>gérondif</xsl:text>
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
				         <xsl:text>autre</xsl:text>
				      </td>
<td align="left">
				      	<xsl:text>gérondif</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>autre</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>participe</xsl:text>
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
				         <xsl:text>autre</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>participe</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>antipassif</xsl:text>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>antipassif</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				   			<xsl:text>voix</xsl:text>
				   		</td>
<td align="left">
				   			<xsl:text>applicatif</xsl:text>
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
				   			<xsl:text>voix</xsl:text>
				   		</td>
<td align="left">
				   			<xsl:text>applicatif</xsl:text>
				   		</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>causatif</xsl:text>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>causatif</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>voix</xsl:text>
						</td>
<td align="left">
							<xsl:text>passif</xsl:text>
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
							<xsl:text>voix</xsl:text>
						</td>
<td align="left">
							<xsl:text>passif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				      	<xsl:text>voix d’acteur</xsl:text>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				      	<xsl:text>voix d’acteur</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>voix datif </xsl:text>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>voix datif </xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>voix but</xsl:text>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>voix but</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>voix instrumentable</xsl:text>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>voix instrumentable</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>voix locatif</xsl:text>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				         <xsl:text>voix locatif</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				      	<xsl:text>voix d’objet</xsl:text>
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
				         <xsl:text>voix</xsl:text>
				      </td>
<td align="left">
				      	<xsl:text>voix d’objet</xsl:text>
				      </td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>voix</xsl:text>
</td>
<td align="left">
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:text>voix</xsl:text>
</td>
<td align="left">
<xsl:text>ENTRER GLOSE</xsl:text>
</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				</table>
</example>
		</section2>
		<section2 id="sIPAgr">
			<secTitle>Accord</secTitle>
			<p>
<xsl:text>Les verbes et les auxiliaires peuvent aussi porter les caractéristiques de l’accord qui correspondent au sujet ou à l’objet direct.  La plupart de ces caractéristiques se font par des affixes ou par des clitiques pronominaux qui peuvent s’attacher au verbe.  </xsl:text>
<xsl:if test="normalize-space(//typology/@classifier)!='no'">
<xsl:text>On a déjà présenté l’accord de classe à la section </xsl:text>
<sectionRef sec="sClassifiers" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> les caractéristiques de l’accord suivants se marquent sur les verbes et / ou sur les auxiliaires:</xsl:text>
</p>
			<example num="xV.IPAgr.8">
<table border="1">
					<tr>
						<th>Type de caractéristique</th>
						<th>Caractéristique</th>
					   <th>Morphèmes</th>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne sujet </xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne sujet </xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne objet </xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne objet </xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne argument ergatif</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne argument ergatif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne argument absolutif</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne argument absolutif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne exclusif sujet </xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne exclusif sujet </xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne exclusif objet </xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne exclusif objet </xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne argument ergatif exclusif</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne argument ergatif exclusif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne argument absolutif exclusif</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne argument absolutif exclusif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne inclusif sujet </xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne inclusif sujet </xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne inclusif objet </xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne inclusif objet </xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne argument ergatif inclusif</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne argument ergatif inclusif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne argument absolutif inclusif</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>première personne argument absolutif inclusif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>deuxième personne sujet</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>deuxième personne sujet</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>deuxième personne objet</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>deuxième personne objet</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>deuxième personne argument ergatif</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>deuxième personne argument ergatif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>deuxième personne argument absolutif</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>deuxième personne argument absolutif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>troisième personne sujet</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>troisième personne sujet</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>troisième personne objet</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>troisième personne objet</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>troisième personne argument ergatif</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>troisième personne argument ergatif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>troisième personne argument absolutif</xsl:text>
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
							<xsl:text>personne</xsl:text>
						</td>
<td align="left">
							<xsl:text>troisième personne argument absolutif</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet singulier</xsl:text>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet singulier</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet singulier</xsl:text>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet singulier</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif singulier</xsl:text>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif singulier</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif singulier</xsl:text>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif singulier</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet double</xsl:text>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet double</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet double</xsl:text>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet double</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif double</xsl:text>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif double</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif double</xsl:text>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif double</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet pluriel</xsl:text>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet pluriel</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet pluriel</xsl:text>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet pluriel</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif pluriel</xsl:text>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif pluriel</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif pluriel</xsl:text>
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
							<xsl:text>nombre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif pluriel</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet masculin</xsl:text>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet masculin</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet masculin</xsl:text>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet masculin</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif masculin</xsl:text>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif masculin</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif masculin</xsl:text>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif masculin</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet féminin</xsl:text>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet féminin</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet féminin</xsl:text>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet féminin</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif féminin</xsl:text>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif féminin</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif féminin</xsl:text>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif féminin</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet neutre</xsl:text>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet neutre</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet neutre</xsl:text>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet neutre</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif neutre</xsl:text>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif neutre</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif neutre</xsl:text>
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
							<xsl:text>genre</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif neutre</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet animé</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet animé</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet animé</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet animé</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif animé</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif animé</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif animé</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif animé</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet inanimé</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet inanimé</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet inanimé</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet inanimé</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif inanimé</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif inanimé</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif inanimé</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif inanimé</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet humain</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet humain</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet humain</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet humain</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif humain</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif humain</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif humain</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif humain</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet nonhumain</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>sujet nonhumain</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet nonhumain</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>objet nonhumain</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif nonhumain</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument ergatif nonhumain</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif nonhumain</xsl:text>
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
							<xsl:text>animéité</xsl:text>
						</td>
<td align="left">
							<xsl:text>argument absolutif nonhumain</xsl:text>
						</td>
<td>
<langData>
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				</table>
</example>
		</section2>
	   <section2 id="sVerbParadigms">
	   	<secTitle>Paradigmes du verbe</secTitle>
	   	<p>
<xsl:text>Les paradigmes illustrent sous forme de tableau certains changements  qui ont lieu quand les morphèmes d’inflexion et d’accord s’attachent aux verbes spécifiques; certains verbes sont réguliers, d’autres sont irréguliers.</xsl:text>
</p>
	  <section3 id="sVerbParadigmsRegular">
	  	<secTitle>Paradigmes pour certains verbes réguliers</secTitle>
	  	<p>
<xsl:text>Voici les paradigmes de quatre verbes réguliers:   </xsl:text>
<object type="tComment">Vous devrez ajouter les formes à chaque case. Vous pouvez changer de verbes s’ils ne sont pas réguliers dans votre langue.  
	  		<xsl:choose>
	  			<xsl:when test="//pron/@dependentPron='yes'"> Vous pouvez supprimer des colonnes si le tableau en pdf est trop large.</xsl:when>
	  			<xsl:when test="//pron/@dependentPron='no'"> Puisqu’en votre langue les verbes ne changent pas pour un sujet différent, les paradigmes sont assez simples. Peut-être aurez-vous besoin d’ajouter des colonnes pour les changements qui sont marqués dans les verbes, tels que changements pour le mode et/ou les sujets au pluriel.</xsl:when>
	  		</xsl:choose>
</object>
</p>

	  		     <xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsRegular.6">
<table border="1">
	        	<caption>
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« parler »</langData>
</caption>
	           <tr>
	              <th>Temps / Aspect</th>
	              <th>Forme de verbe</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« parler »</langData>
</caption>
	  			<tr>
	  				<th>Sujet</th>
	  				<th>1ère</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusif</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusif</th>
</xsl:if>
	  				<th>2ème</th>
	  				<th>3ème</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« parler »</langData>
</caption>
	           <tr>
	              <th>Sujet</th>
	              <th>1ère Sing</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>1ère Pl</th>
</xsl:if>
	              <th>2ème Sing</th>
	              <th>2ème Pl</th>
	              <th>3ème Sing</th>
	              <th>3ème Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« manger »</langData>
</caption>
	           <tr>
	              <th>Temps / Aspect</th>
	              <th>Forme de verbe</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« manger »</langData>
</caption>
	  			<tr>
	  				<th>Sujet</th>
	  				<th>1ère</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusif</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusif</th>
</xsl:if>
	  				<th>2ème</th>
	  				<th>3ème</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« manger »</langData>
</caption>
	        	<tr>
	              <th>Sujet</th>
	              <th>1ère Sing</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>1ère Pl</th>
</xsl:if>
	              <th>2ème Sing</th>
	              <th>2ème Pl</th>
	              <th>3ème Sing</th>
	              <th>3ème Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« habiter »</langData>
</caption>
	           <tr>
	              <th>Temps / Aspect</th>
	              <th>Forme de verbe</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« habiter »</langData>
</caption>
	  			<tr>
	  				<th>Sujet</th>
	  				<th>1ère</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusif</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusif</th>
</xsl:if>
	  				<th>2ème</th>
	  				<th>3ème</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« habiter »</langData>
</caption>
	        	<tr>
	              <th>Sujet</th>
	              <th>1ère Sing</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>1ère Pl</th>
</xsl:if>
	              <th>2ème Sing</th>
	              <th>2ème Pl</th>
	              <th>3ème Sing</th>
	              <th>3ème Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« voir / regarder »</langData>
</caption>
	           <tr>
	              <th>Temps / Aspect</th>
	              <th>Forme de verbe</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« voir / regarder »</langData>
</caption>
	  			<tr>
	  				<th>Sujet</th>
	  				<th>1ère</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusif</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusif</th>
</xsl:if>
	  				<th>2ème</th>
	  				<th>3ème</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« voir / regarder »</langData>
</caption>
	        	<tr>
	              <th>Sujet</th>
	              <th>1ère Sing</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>1ère Pl</th>
</xsl:if>
	              <th>2ème Sing</th>
	              <th>2ème Pl</th>
	              <th>3ème Sing</th>
	              <th>3ème Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
	  </section3>
	      
	      <section3 id="sVerbParadigmsIrregular">
	      	<secTitle>Paradigmes pour quelques verbes irréguliers</secTitle>
	      	<p>
<xsl:text>Voici les paradigmes pour trois verbes irréguliers: </xsl:text>
<object type="tComment">Vous devrez ajouter les formes dans chaque case. Vous pouvez changer les verbes s’ils n’existent pas dans votre langue, ou qu’ils ne sont pas irréguliers. Notez que « venir » peut être « aller vers la base », et « aller » peut indiquer « partir vers une non-base » ou « partir de la base » dans votre langue.  
	      		<xsl:choose>
	      			<xsl:when test="//pron/@dependentPron='yes'"> Vous pouvez supprimer quelques colonnes si le tableau est trop large en pdf.</xsl:when>
	      			<xsl:when test="//pron/@dependentPron='no'"> Puisqu’en votre langue les verbes ne changent pas pour un sujet différent, les paradigmes sont assez simples. Peut-être aurez-vous besoin d’ajouter des colonnes pour les changements qui sont marqués dans les verbes, tels que changements pour le mode et/ou les sujets au pluriel.</xsl:when>
	      		</xsl:choose>
</object>
</p>

	      	<xsl:if test="normalize-space(//pron/@dependentPron)='no'">
<tablenumbered id="ntV.VerbParadigms.VerbParadigmsIrregular.6">
<table border="1">
	        	<caption>
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« etre »</langData>
</caption>
	           <tr>
	              <th>Temps / Aspect</th>
	              <th>Forme de verbe</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« etre »</langData>
</caption>	  			<tr>
	  				<th>Sujet</th>
	  				<th>1ère</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusif</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusif</th>
</xsl:if>
	  				<th>2ème</th>
	  				<th>3ème</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« etre »</langData>
</caption>
	        	<tr>
	              <th>Sujet</th>
	              <th>1ère Sing</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>1ère Pl</th>
</xsl:if>
	              <th>2ème Sing</th>
	              <th>2ème Pl</th>
	              <th>3ème Sing</th>
	              <th>3ème Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« venir »</langData>
</caption>
	        	<tr>
	              <th>Temps / Aspect</th>
	              <th>Forme de verbe</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« venir »</langData>
</caption>
	  			<tr>
	  				<th>Sujet</th>
	  				<th>1ère</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusif</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusif</th>
</xsl:if>
	  				<th>2ème</th>
	  				<th>3ème</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« venir »</langData>
</caption>
	        	<tr>
	              <th>Sujet</th>
	              <th>1ère Sing</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>1ère Pl</th>
</xsl:if>
	              <th>2ème Sing</th>
	              <th>2ème Pl</th>
	              <th>3ème Sing</th>
	              <th>3ème Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« aller »</langData>
</caption>
	        	<tr>
	              <th>Temps / Aspect</th>
	              <th>Forme de verbe</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« aller »</langData>
</caption>
	  			<tr>
	  				<th>Sujet</th>
	  				<th>1ère</th>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Exclusif</th>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>Inclusif</th>
</xsl:if>
	  				<th>2ème</th>
	  				<th>3ème</th>
	  			</tr>	
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  			</tr>
</xsl:if>
	  			<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	  				<td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	  				<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
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
<xsl:text>Paradigme du verbe qui signifie </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>« aller »</langData>
</caption>
	        	<tr>
	              <th>Sujet</th>
	              <th>1ère Sing</th>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Excl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<th>1ère Incl</th>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<th>1ère Pl</th>
</xsl:if>
	              <th>2ème Sing</th>
	              <th>2ème Pl</th>
	              <th>3ème Sing</th>
	              <th>3ème Pl</th>
	           </tr>	
	           <xsl:if test="normalize-space(//ip/ipInflFeatPresent/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Présent</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonPast/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Passé</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatNonFuture/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Non Futur</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherTense/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Temps</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatCompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Complétif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContemplative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contemplatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContinuative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Continuatif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatContrafactual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Contrafactuel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatHabitual/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Habituel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imparfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatImperfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Imperfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatIncompletive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Incompletif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfect/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Parfait</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPerfective/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Perfectif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatPotential/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Potentiel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatProgressive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Progressif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatPurposive/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Purposif</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatStative/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Statif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	           <xsl:if test="normalize-space(//ip/ipInflFeatUnreal/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Irréel</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipInflFeatOtherAspect/@checked)='yes'">
<tr>
	        		<td align="left" rowspan="1">
<xsl:text>Autre Aspect</xsl:text>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        		<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	        	</tr>
</xsl:if>
	        	<xsl:if test="normalize-space(//ip/ipinflFeatSubjunctive/@checked)='yes'">
<tr>
	              <td align="left" rowspan="1">
<xsl:text>Subjonctif</xsl:text>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='yes'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <xsl:if test="normalize-space(//pron/@pronounExcl)='no'">
<td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
</xsl:if>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	              <td align="left">
<langData>
<xsl:attribute name="lang">
<xsl:text>lVernacular</xsl:text>
</xsl:attribute>FORME</langData>
</td>
	           </tr>
</xsl:if>
	        </table>
</tablenumbered>
</xsl:if>
	     
      
	      </section3>
	   </section2>
	   
	   <section2 id="sIPProDrop">
	   	<secTitle>Sujets absents</secTitle>
			<p contentType="ctComparativeIntro">
<xsl:text>Certaines langues s’appellent les langues « à sujet nul » (=« pro-drop »), parce qu’elles permettent qu’un sujet et/ou un objet manque, ou qu’il ne soit pas exprimé dans la position syntaxique normale. Par exemple, en espagnol l’équivalent de </xsl:text>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>« j’achète un livre »</xsl:text>
</gloss>
<xsl:text> est </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Compro un libro</langData>
<xsl:text> plutôt qu’avec la présence du pronom sujet: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Yo compro un libro</langData>
<xsl:text>.  On ne fait pas cela en anglais, ni en français, sauf pour les inpéritifs. (On traitera le phénomène de l’absence du sujet des infinitifs dans les propositions subordonnées à la section </xsl:text>
<sectionRef sec="sComp" />
<xsl:text>.) </xsl:text>
</p>
			<p contentType="ctComparativeIntro">
<xsl:text>
					Certaines langues ne sont pas vraiment des langues « à sujet nul », mais au moins certains des pronoms sont des clitiques qui peuvent s’attacher au verbe. Quand ceci se passe, il n’y a pas de pronom ni de syntagme nominal dans la position du sujet; ainsi la phrase paraît la même que celle d’une langue authentiquement « à sujet nul ». </xsl:text>
</p>
	      <p contentType="ctPracticalIntro">
<xsl:text>
	         	Les langues « à sujet nul » permettent qu’un sujet et / ou un objet manque, ou qu’il ne soit pas exprimé dans la position syntaxique normale. Il y a aussi des langues où au moins certains des pronoms sont des clitiques qui s’attachent au verbe. Quand ceci se passe, il n’y a pas de pronom ni de syntagme nominal dans la position du sujet; ainsi la phrase paraît la même que celle d’une langue authentiquement « à sujet nul ».</xsl:text>
</p>
	      <p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> </xsl:text>
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no'">
<xsl:text>la suppression du sujet est permis dans toutes sortes de phrase. </xsl:text>
	            <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
	            	<xsl:text>  La suppression de l’objet </xsl:text>
	            <xsl:choose>
	            	<xsl:when test="//ip/@proDropObject='no'">n’est pas permis</xsl:when>
	            	<xsl:when test="//ip/@proDropObject='yes'">est aussi permis</xsl:when>
	            </xsl:choose>
	            <xsl:text>.  </xsl:text>
	         </xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>on peut supposer que le sujet est absent lorsque des pronoms dépendents (des clitiques pronominaux) s’attachent au verbe; cependant, il ne s’agit pas d’une langue « à sujet nul ».  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>la suppression du sujet est permis dans toutes sortes de phrase, et il y a aussi des clitiques pronominaux qui peuvent s’attacher au verbe.  </xsl:text>
	            <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
	            	<xsl:text>  La suppression de l’objet </xsl:text>
	            	<xsl:choose>
	            		<xsl:when test="//ip/@proDropObject='no'">n’est pas permis</xsl:when>
	            		<xsl:when test="//ip/@proDropObject='yes'">est aussi permis</xsl:when>
	            	</xsl:choose>
	            <xsl:text>.  </xsl:text>
	         </xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='no'">
<xsl:text>l’absence du sujet n’est pas permis.  Le sujet doit être évident, sauf dans les impératifs.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='yes' and normalize-space(//ip/proDropClitic/@checked)='no'">
<xsl:text>l’absence du  sujet (pro-drop) est permis dans toutes sortes de phrase, y compris les impératifs. </xsl:text>
	            <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
	            	<xsl:text>  La suppression de l’objet </xsl:text>
	            	<xsl:choose>
	            		<xsl:when test="//ip/@proDropObject='no'">n’est pas permis</xsl:when>
	            		<xsl:when test="//ip/@proDropObject='yes'">est aussi permis</xsl:when>
	            	</xsl:choose>
	            <xsl:text>.  </xsl:text>
	         </xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>on peut supposer que le sujet est absent lorsque des pronoms dépendents (des clitiques pronominaux) s’attachent au verbe; cependant, il ne s’agit pas d’une langue à sujet nul.  On permet l’absence du sujet dans les impératifs.  </xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropClitic/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>on permet l’absence du sujet dans toutes sortes de phrase, y compris les impératifs, et il y a aussi des clitiques pronominaux qui peuvent s’attacher au verbe.  </xsl:text>
	            <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
	            	<xsl:text>  La suppression de l’objet </xsl:text>
	            	<xsl:choose>
	            		<xsl:when test="//ip/@proDropObject='no'">n’est pas permis</xsl:when>
	            		<xsl:when test="//ip/@proDropObject='yes'">est aussi permis</xsl:when>
	            	</xsl:choose>
	            <xsl:text>.  </xsl:text>
	         </xsl:if>
	         </xsl:if>
<xsl:if test="normalize-space(//ip/proDropNone/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>l’absence du sujet n’est pas permis.  Le sujet doit être évident même dans les impératifs.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropImp/@checked)='no'">
<xsl:text>l’absence du sujet est sulement permis  ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text>.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropYes/@checked)='no' and normalize-space(//ip/proDropClitic/@checked)='no' and normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropImp/@checked)='yes'">
<xsl:text>l’absence du sujet est permis ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text> et aussi dans les impératifs.</xsl:text>
</xsl:if>
<xsl:if test="normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropYes/@checked)='yes' or normalize-space(//ip/proDropOther/@checked)='yes' and normalize-space(//ip/proDropClitic/@checked)='yes'">
<xsl:text>  L’absence du sujet est aussi permis ___</xsl:text>
<xsl:value-of select="//ip/proDropOther" />
<xsl:text>.</xsl:text>
</xsl:if>
</p>
		   <xsl:if test="normalize-space(//ip/proDropYes/@checked)='yes'">
<p>
<xsl:text>  Voici des phrases qui montrent à sujet nul:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>  Voici des phrases qui ont l’air de montrer à sujet nul grâce aux pronoms clitiques attachés au verbe:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>  Voici des phrases en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> où le sujet est absent:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Voir la section </xsl:text>
<sectionRef sec="sIPImp" />
<xsl:text> pour des exemples d’impératifs.</xsl:text>
</p>

		</section2>
		<section2 id="sIPAux">
			<secTitle>Auxiliaires</secTitle>
			<p>
<xsl:text>Il y a plusieurs genres d’éléments auxiliaires verbaux, y compris les mots auxiliaires et les genres non-finis, les genres de mouvement et autres types.</xsl:text>
</p>
		   
		   <section3 id="sIPAuxPositive">
		   	<secTitle>Mots auxiliaires</secTitle>
		   
		   <p contentType="ctPracticalIntro">
<xsl:text>
		   	Les éléments auxiliaires qui sont écrits comme mots indépendants expriment certains genres de flexion verbal.</xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>
		      	Certaines langues ont des éléments auxiliaires qui sont des mots indépendants; quelques-unes peuvent accepter plus d’un élément auxiliaire avant le verbe principal. Voici des exemples pour des phrases transitives: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Le garçon a mangé la banane</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Le garçon va manger la banane</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Le garçon a pu manger la banane</langData>
<xsl:text> et </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Le garçon pouvait avoir mangé la banane</langData>
<xsl:text>.  Dans d’autres langues tous ces sens se communiquent par la flexion verbale.</xsl:text>
</p>
		      <p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@aux='no'"> il n’y a pas d’auxiliaires</xsl:when>
					<xsl:when test="//ip/@aux='yes'"> il y a des auxiliaires</xsl:when>
				</xsl:choose>
<xsl:text> qu’on écrit comme mots indépendants.  </xsl:text>
<xsl:if test="normalize-space(//ip/@aux)='yes'">
					<xsl:text>Un auxiliaire est </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxRequired='no'">facultatif</xsl:when>
						<xsl:when test="//ip/@auxRequired='no'">obligatoire</xsl:when>
					</xsl:choose>
					<xsl:text> et  </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxMany='no'">un seul est possible</xsl:when>
						<xsl:when test="//ip/@auxMany='yes'">plus d’un peut se trouver</xsl:when>
					</xsl:choose>
					<xsl:text> dans une seule proposition. </xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> Après un auxiliaire, l’ordre normal VSO </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">est maintenu.  L’ordre est Aux V S O.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">peut changer, pour faire paraître le sujet directement après l’auxiliaire et avant le verbe.  L’ordre dans ces propositions est Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Avant un auxiliaire l’ordre normal O S V </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">est maintenu.  L’ordre est O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">peut changer, pour faire paraître le sujet directement après le verbe et avant l’auxiliaire.  L’ordre dans ces propositions est O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<p>
<xsl:text>Voici des exemples d’auxiliaires en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@aux)='yes'">
<example num="xV.IPAux.IPAuxPositive.12">
<table border="1">
					<tr>
						<th>Mots auxiliaires</th>
						<th>Glose</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:text>Voici des phrases qui incluent ces auxiliaires:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
		   	<secTitle>Auxiliaire non-fini</secTitle>	   
		   <p contentType="ctPracticalIntro">
<xsl:text>Le marqueur non-fini peut aussi agir comme auxiliaire s’il s’écrit comme mot indépendant. </xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>Le mot non-fini </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>to</langData>
<xsl:text> utilisé en anglais dans les propositions subordonnées fonctionne comme un auxiliaire, puisqu’il prend la même position et qu’il peut se mettre avant d’autres auxiliaires. Par exemple, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The boy would like to have eaten the banana</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text> (Le garçon aurait aimé avoir mangé la banane)</xsl:text>
</gloss>
<xsl:text>. </xsl:text>
</p>
		      <p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@auxNonfinite='none'"> il n’y a pas de marqueur pour les propositions non-finies. </xsl:when>
					<xsl:when test="//ip/@auxNonfinite='no'"> on ne marque que le caractéristique non-fini comme élément du verbe. </xsl:when>
					<xsl:when test="//ip/@auxNonfinite='yes'"> possède quelques marqueurs de type auxiliaire non-fini écrits comme mots indépendants.  </xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
					<xsl:text>Un mot auxiliaire non-fini est </xsl:text>
					<xsl:choose>
						<xsl:when test="//ip/@auxNonfiniteRequired='no'">facultatif</xsl:when>
						<xsl:when test="//ip/@auxNonfiniteRequired='no'">obligatoire</xsl:when>
					</xsl:choose>
					<xsl:text> dans les propositions subordonnées non-finies. </xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> Après un auxiliaire non-fini, l’ordre normal VSO  </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxNonfiniteOrder='yes'">est maintenu.  L’ordre est Aux  V S O.</xsl:when>
							<xsl:when test="//ip/@auxNonfiniteOrder='no'">peut changer pour faire paraître le sujet directement après l’auxiliaire et avant le verbe.  L’ordre dans ces propositions est Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Avant un auxiliaire non-fini, l’ordre normal  OSV </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">est maintenu.  L’ordre est  O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">peut changer pour faire paraître le sujet directement après le verbe et avant l’auxiliaire.  L’ordre dans ces syntagmes est O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<p>
<xsl:text>Le marqueur auxiliaire non-fini en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> est:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxNonfinite)='yes'">
<example num="xV.IPAux.IPAuxNonfinite.12">
<table border="1">
					<tr>
						<th>Marqeur auxiliaire non-fini</th>
						<th>Glose</th>
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
<xsl:text>marqueur non-fini dans des propositions subordonnées</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>marqueur non-fini dans des propositions subordonnées</xsl:text>
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
<xsl:text>Voici des exemples de propositions non-finies qui comprennent ces auxiliaires non-finis:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
		   	<secTitle>Autres types d’auxiliaires</secTitle>
		  		   
		   <p contentType="ctPracticalIntro">
<xsl:text>D’autres mots peuvent aussi fonctionner comme des auxiliaires, tels que les auxiliaires de mouvement ou des marqueurs d’emprunt. </xsl:text>
</p>
		      <p contentType="ctComparativeIntro">
<xsl:text>Certaines langues ont d’autres mots qui fonctionnent comme des auxiliaires, tels que les auxiliaires de mouvement ou les marqueurs d’emprunt qui partagent le même sujet et les mêmes compléments que le verbe principal.</xsl:text>
</p>
		      <p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//ip/@auxOther='no'"> il n’y a pas d’auxiliaires</xsl:when>
					<xsl:when test="//ip/@auxOther='yes'"> il y a quelques auxiliaires</xsl:when>
				</xsl:choose>
<xsl:text> de ce type qui sont écrits comme des mots indépendants.  </xsl:text>
<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
					<xsl:if test="normalize-space(//typology/@wordOrder)='VSO'">
						<xsl:text> Après un de ces auxiliaires l’ordre habituel VSO </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOtherOrder='yes'">est maintenu.  L’ordre est Aux  V S O.</xsl:when>
							<xsl:when test="//ip/@auxOtherOrder='no'">peut changer pour faire paraître le sujet directement après l’auxiliaire et avant le verbe.  L’ordre dans ces propositions est Aux S V O.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//typology/@wordOrder)='OSV'">
						<xsl:text> Avant un de ces auxiliaires l’ordre habituel OSV   </xsl:text>
						<xsl:choose>
							<xsl:when test="//ip/@auxOrder='yes'">est maintenu.  L’ordre est  O S V Aux.</xsl:when>
							<xsl:when test="//ip/@auxOrder='no'">peut changer pour faire paraître le sujet directement après le verbe et avant l’auxiliaire.  L’ordre dans ces syntagmes est O V S Aux.</xsl:when>
						</xsl:choose>
						<xsl:text></xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<p>
<xsl:text>Voici les autres auxiliaires en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//ip/@auxOther)='yes'">
<example num="xV.IPAux.IPAuxOther.12">
<table border="1">
					<tr>
						<th>Autres mots auxiliaires</th>
						<th>Glose</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:text>Voici des exemples de phrases qui contiennent ces autres auxiliaires:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
	<secTitle>Composés verbaux</secTitle>
	<p>
<xsl:text>Les verbes peuvent se combiner avec d’autres verbes, ou bien avec des noms ou d’autres catégories de mots pour former des composés verbaux. Ces composés fonctionnent toujours comme des verbes, quoiqu’ils aient pu changer de valence, par exemple, en changeant de verbe transitif en verbe intransitif. On citera ici des exemples des types les plus fréquents.</xsl:text>
</p>
   
	<xsl:if test="normalize-space(//ip/@heartCompound)='yes'">
<p>
<xsl:text>Une série spéciale de composés verbaux contiennent tous le nom qui décrit le centre des émotions, comme par exemple le coeur.</xsl:text>
</p>
</xsl:if>
   <xsl:if test="normalize-space(//ip/@heartCompound)='yes'">
<example num="xV.VCompounds.8">
<table border="1">
      	<caption>
<xsl:text>Composés avec le centre des emotions</xsl:text>
</caption>
         <tr>
            <th>Composé</th>
            <th>Glose pour chaque racine</th>
            <th>Glose pour le composé</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:text>Une </xsl:text>
<xsl:if test="normalize-space(//ip/@heartCompound)='yes'">
<xsl:text>autre </xsl:text>
</xsl:if>
<xsl:text>série spéciale de composés verbaux contient le nom d’une partie du corps</xsl:text>
<xsl:if test="normalize-space(//ip/@heartCompound)='yes'">
<xsl:text> outre que  le centre des émotions</xsl:text>
</xsl:if>
<xsl:text>.</xsl:text>
</p>
</xsl:if>
   <xsl:if test="normalize-space(//ip/@bodypartCompound)='yes'">
<example num="xV.VCompounds.12">
<table border="1">
      	<caption>
<xsl:text>Composés avec une partie du corps</xsl:text>
</caption> 
         <tr>
            <th>Composé</th>
            <th>Glose pour chaque racine</th>
            <th>Glose pour le composé</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:text>Autres composés verbaux et nominaux</xsl:text>
</caption> 
         <tr>
            <th>Composé</th>
            <th>Glose pour chaque racine</th>
            <th>Glose pour le composé</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:text>Composés verbaux et nominaux</xsl:text>
</caption> 
         <tr>
            <th>Composé</th>
            <th>Glose pour chaque racine</th>
            <th>Glose pour le composé</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
      </table>
</example>
</xsl:if>
   
	<p>
<xsl:text>Voici des exemples de ces composés qui consistent en un verbe et un nom dans des phrases:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Voici quelques composés qui consistent d’un verbe et d’une autre catégorie à part un nom:</xsl:text>
</p>
   <example num="xV.VCompounds.24">
<table border="1">
      	<caption>
<xsl:text>Composés verbaux à part les composés avec des noms</xsl:text>
</caption>
         <tr>
            <th>Composé</th>
            <th>Glose pour chaque racine</th>
            <th>Glose pour le composé</th>
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
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
<td align="left">
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>ENTRER GLOSE</xsl:text>
</gloss>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>
      </table>
</example>
	<p>
<xsl:text>Voici des exemples de ces composés qui consistent d’un verbe et d’un non-substantif:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
<xsl:text>Certaines expressions idiomatiques consistent d’un verbe et d’un autre mot qui, pris ensemble, expriment une notion qui n’est pas pareille au sens des deux mots indépendants. Voici quelques exemples d’expressions idiomatiques en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
</p>
	<p contentType="ctComparativeIntro">
<xsl:text>À part les composés écrits en un seul mot, il existe des expressions idiomatiques qui consistent d’un verbe et d’un autre mot qui, pris ensemble, expriment une notion qui n’a pas le même sens que les deux mots pris indépendamment. Voici des exemples d’expressions idiomatiques en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='fr'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='fr'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ENTRER UN EXEMPLE ICI</langData>
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
