<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="np">
	<section1 id="sNP">
		<secTitle>Nominal Phrases</secTitle>
		<p>
<xsl:text>Nominal phrases can be very complex.  This section concentrates on those with common nouns as the lexical head.  Modification by articles, demonstratives, possessors, quantifiers and degree words, adjective phrases, pre/post-positional phrases and noun compounds is considered.  Participles and gerunds are also covered, but nominal phrases headed by proper names are handled in section </xsl:text>
<sectionRef sec="sProp" />
<xsl:text> and those headed by pronouns, demonstratives, and quantifiers are handled in section </xsl:text>
<sectionRef sec="sPron" />
<xsl:text>.  Relative clauses are covered in section </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
		<p>
<xsl:text>The basic order of elements allowed in nominal phrases in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is:</xsl:text>
</p>
	   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@possCooccur)!='no' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@possCooccur)!='no' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@possCooccur)!='no' or normalize-space(//np/@artAndDem)='no'">
<example num="xNP.8">
<table>
				<tr>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='both' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='both'">
<td align="left">
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)!='after' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demAndArtDemPos)!='after'">
<td align="left">
						<xsl:text>(Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)!='after' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demAndArtArtPos)!='after'">
<td align="left">
						<xsl:text>(Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@possNounPos)!='after' and normalize-space(//np/@possNounPos)!='unknown'">
<td align="left">
						<xsl:text>(Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='after' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='after' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@compHead)='right' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>((N) N)</xsl:text>
					</td>
</xsl:if>
					<td align="left">
						<xsl:text>N</xsl:text>
					</td>
					<xsl:if test="normalize-space(//np/@compHead)='left' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>(N (N))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='before' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@possNounPos)!='before' and normalize-space(//np/@possNounPos)!='unknown'">
<td align="left">
						<xsl:text>(Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)!='before' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demAndArtArtPos)!='before'">
<td align="left">
						<xsl:text>(Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)!='before' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demAndArtDemPos)!='before'">
<td align="left">
						<xsl:text>(Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='both' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='both'">
<td align="left">
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
				</tr>
			</table>
</example>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@possCooccur)!='no'">
<example num="xNP.10">
<table>
				<tr>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='both' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='both'">
<td align="left">
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@possCooccur)='yes' and normalize-space(//np/@demOrArtPos)!='after'">
<td align="left">
						<xsl:text>(Dem/Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@possNounPos)!='after' and normalize-space(//np/@possNounPos)!='unknown'">
<td align="left">
						<xsl:text>(Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='after' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='after' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@compHead)='right' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>((N) N)</xsl:text>
					</td>
</xsl:if>
					<td align="left">
						<xsl:text>N</xsl:text>
					</td>
					<xsl:if test="normalize-space(//np/@compHead)='left' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>(N (N))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='before' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@possNounPos)!='before' and normalize-space(//np/@possNounPos)!='unknown'">
<td align="left">
						<xsl:text>(Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@possCooccur)='yes' and normalize-space(//np/@demOrArtPos)!='before'">
<td align="left">
						<xsl:text>(Art/Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='both' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='both'">
<td align="left">
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
				</tr>
			</table>
</example>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no'">
<example num="xNP.12">
<table>
				<tr>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='both' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='both'">
<td align="left">
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demAndArtArtPos)!='after' and normalize-space(//np/@demAndArtDemPos)!='after' and normalize-space(//np/@possNounPos)!='after' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demOrArtPos)!='after' and normalize-space(//np/@possNounPos)!='after'">
<td align="left">
						<xsl:text>(Dem/Art/Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demAndArtArtPos)='after' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@possNounPos)='either'">
<td align="left">
						<xsl:text>(Dem/Pos)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtDemPos)='after' and normalize-space(//np/@possNounPos)='either'">
<td align="left">
						<xsl:text>(Art/Pos)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@possNounPos)='after'">
<td align="left">
						<xsl:text>(Dem/Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='after' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='after' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@compHead)='right' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>((N) N)</xsl:text>
					</td>
</xsl:if>
					<td align="left">
						<xsl:text>N</xsl:text>
					</td>
					<xsl:if test="normalize-space(//np/@compHead)='left' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>(N (N))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='before' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demAndArtArtPos)!='before' and normalize-space(//np/@demAndArtDemPos)!='before' and normalize-space(//np/@possNounPos)!='before' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demOrArtPos)!='before' and normalize-space(//np/@possNounPos)!='before'">
<td align="left">
						<xsl:text>(Poss/Art/Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demAndArtArtPos)='before' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@possNounPos)='either'">
<td align="left">
						<xsl:text>(Pos/Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtDemPos)='before' and normalize-space(//np/@possNounPos)='either'">
<td align="left">
						<xsl:text>(Pos/Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@possNounPos)='before'">
<td align="left">
						<xsl:text>(Art/Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='both' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='both'">
<td align="left">
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
				</tr>
			</table>
</example>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@possCooccur)='no'">
<example num="xNP.14">
<table>
				<tr>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='both' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='both'">
<td align="left">
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demPos)!='after' and normalize-space(//np/@possNounPos)!='after'">
<td align="left">
						<xsl:text>(Dem/Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@possNounPos)='after'">
<td align="left">
						<xsl:text>(Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='after' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='after' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@compHead)='right' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>((N) N)</xsl:text>
					</td>
</xsl:if>
					<td align="left">
						<xsl:text>N</xsl:text>
					</td>
					<xsl:if test="normalize-space(//np/@compHead)='left' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>(N (N))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='before' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demPos)!='before' and normalize-space(//np/@possNounPos)!='before'">
<td align="left">
						<xsl:text>(Poss/Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@possNounPos)='before'">
<td align="left">
						<xsl:text>(Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='both' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='both'">
<td align="left">
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
				</tr>
			</table>
</example>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@possCooccur)='no'">
<example num="xNP.16">
<table>
				<tr>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='both' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='both'">
<td align="left">
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@artPos)!='after' and normalize-space(//np/@possNounPos)!='after'">
<td align="left">
						<xsl:text>(Art/Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@possNounPos)='after'">
<td align="left">
						<xsl:text>(Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='after' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='after' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@compHead)='right' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>((N) N)</xsl:text>
					</td>
</xsl:if>
					<td align="left">
						<xsl:text>N</xsl:text>
					</td>
					<xsl:if test="normalize-space(//np/@compHead)='left' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>(N (N))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='before' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@artPos)!='before' and normalize-space(//np/@possNounPos)!='before'">
<td align="left">
						<xsl:text>(Poss/Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@possNounPos)='before'">
<td align="left">
						<xsl:text>(Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='both' or normalize-space(//qp/@npDegree)='some' and normalize-space(//qp/@npDegreePos)='both'">
<td align="left">
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
				</tr>
			</table>
</example>
</xsl:if>
		<p>
<xsl:text>Each of these phrases will be discussed and exemplified in sections </xsl:text>
<sectionRef sec="sNPDegree" />
<xsl:text>-</xsl:text>
<sectionRef sec="sNPCompounds" />
<xsl:text>, after first dealing with agreement and case marking.</xsl:text>
</p>
		<section2 id="sNPAgr">
			<secTitle>Agreement</secTitle>
			<p>
<xsl:text>Many languages require agreement between at least some of the modifiers and the head noun.  While English only has number agreement, in other languages this agreement may also include animacy, class, or gender.</xsl:text>
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
<xsl:choose>
					<xsl:when test="//np/@agreeNumber='no'"> there is no number agreement.  Instead, number marking comes from the number or quantifier.</xsl:when>
					<xsl:when test="//np/@agreeNumber='yes'"> the various nominal modifiers may/must agree in number with the head noun.</xsl:when>
				</xsl:choose>
<xsl:text>  Further, </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeOther='no'">there is no agreement in animacy, class number, nor gender between the modifiers and the head noun.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesAnimacy'">the modifiers and the head noun may/must agree in animacy.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesClass'">the modifiers and the head noun may/must agree in class number.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesGender'">the modifiers and the head noun may/must agree in gender.</xsl:when>
				</xsl:choose>
<xsl:if test="normalize-space(//np/@agreeOther)='yesClass' and normalize-space(//typology/@classifier)='no'">
<xsl:text>(Note that this class agreement needs to be reviewed, as no classifier system was documented in </xsl:text>
<sectionRef sec="sTypology" />
<xsl:text>.)</xsl:text>
</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<p>
<xsl:text>Examples showing number agreement in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@agreeNumber)='yes'">
<example num="xNP.NPAgr.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeNumberExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeNumberExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeNumberExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeNumberExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPAgr.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPAgr.10.1</xsl:text>
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
			<xsl:if test="normalize-space(//np/@agreeOther)='yesAnimacy'">
<p>
<xsl:text>Examples showing animacy agreement in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@agreeOther)='yesAnimacy'">
<example num="xNP.NPAgr.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeAnimacyExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeAnimacyExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeAnimacyExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeAnimacyExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPAgr.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPAgr.14.1</xsl:text>
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
			<xsl:if test="normalize-space(//np/@agreeOther)='yesClass'">
<p>
<xsl:text>Examples showing class agreement in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@agreeOther)='yesClass'">
<example num="xNP.NPAgr.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeClassExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeClassExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeClassExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeClassExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPAgr.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPAgr.18.1</xsl:text>
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
			<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<p>
<xsl:text>Examples showing gender agreement in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@agreeOther)='yesGender'">
<example num="xNP.NPAgr.22">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/agreeGenderExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/agreeGenderExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/agreeGenderExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/agreeGenderExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPAgr.22</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPAgr.22.1</xsl:text>
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
	   <section2 id="sNPCase">
		  <secTitle>Case</secTitle>
		  <p>
<xsl:text>Nouns and their modifiers may be marked for case.  The most common case system is nominative-accusative.  This is the system English has, though only pronouns are marked for case in English.  In a nominative-accusative system, subjects of both transitive and intransitive verbs are in nominative case, while direct objects are accusative case.  Possessors are genitive case.  The nominative pronouns in English are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>I, we, you, he, she, they</langData>
<xsl:text>.  The accusative pronouns are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>me, us, you, him, her, them</langData>
<xsl:text>.  The genitive pronouns include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>my, our, your, his, her, their</langData>
<xsl:text>.  Therefore, we say </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>They hit him</langData>
<xsl:text> and not </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Them hit he</langData>
<xsl:text>. </xsl:text>
</p>
		  <p>
<xsl:text> A language with a basic nominative-accusative case system may have different case marking for Experiencer subjects than for Agent subjects.  Some verbs with Experiencer subjects are </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>appear, see, fear, be found, want, like</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>laugh</langData>
<xsl:text>. </xsl:text>
</p>
		  <p>
<xsl:text>
				In an ergative-absolutive case system, subjects of transitive verbs are marked with the ergative case, while objects of transitive verbs and subjects of intransitive verbs are marked with the absolutive case.  The case of possessors is not set cross-linguistically.  Some languages with an ergative-absolutive system simply have different sets of verbal agreement markers, but no marking on nouns.  This type of agreement marking will be handled in section </xsl:text>
<sectionRef sec="sIPAgr" />
<xsl:text>.</xsl:text>
</p>
		  <p>
<xsl:text>
				Some languages are even more complex in that they normally have a nominative-accusative system but under some grammatical conditions, such as a particular tense or aspect or a particular person agreement feature, the case system switches to ergative-absolutive.  This is called “split ergativity”.</xsl:text>
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
<xsl:text></xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@case='none'"> does not have any case system.   The exact same set of pronouns may be used in any position in the sentence and there is no marking on nouns or on any noun modifiers based on their position in the sentence.</xsl:when>
				<xsl:when test="//typology/@case='nominative'"> has a nominative-accusative case system.   Subjects of both transitive and intransitive verbs are marked in the same way and use the same set of pronouns, but objects of transitive verbs are marked differently.</xsl:when>
				<xsl:when test="//typology/@case='ergative'"> has an ergative-absolutive case system.   Subjects of intransitive verbs and objects of transitive verbs are marked in the same way and use the same set of pronouns, but subjects of transitive verbs are marked differently.</xsl:when>
				<xsl:when test="//typology/@case='split'"> has a split case system.    The language normally follows the nominative-accusative case system, but the ergative-absolutive system is used under certain grammatical conditions.</xsl:when>
			 </xsl:choose>
</p>

		  <p>
<xsl:text>This is shown in the following examples of transitive sentences with Agent subjects where the subject and object are nominal phrases:</xsl:text>
</p>
		  <example num="xNP.NPCase.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPCase.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPCase.16.1</xsl:text>
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
<xsl:text>Note the forms of the pronouns used for the Agent subject and object in these transitive sentences:</xsl:text>
</p>
		  <example num="xNP.NPCase.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/pnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/pnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/pnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/pnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPCase.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPCase.20.1</xsl:text>
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
		  <xsl:if test="normalize-space(//np/@caseN)='yes' and normalize-space(//typology/@case)!='none'">
<p>
<xsl:text>In the intransitive examples with nominal phrases as the subjects, </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@case='nominative'">the case marking matches that of the subejcts in the transitive sentences above.</xsl:when>
				<xsl:when test="//typology/@case='ergative'">the case marking matches that of the objects in the transitive sentences above.</xsl:when>
				<xsl:when test="//typology/@case='split'">the case marking on most of the subjects matches that of the subjects in the transitive sentences above, but in certain situations, it matches that of the objects in trantitive sentences.</xsl:when>
			 </xsl:choose>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//np/@caseN)='yes' and normalize-space(//typology/@case)!='none'">
<example num="xNP.NPCase.24">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/intExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/intExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/intExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/intExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPCase.24</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPCase.24.1</xsl:text>
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
		  <p>
<xsl:text>The examples of intransitive sentences with independent pronouns as subjects verify that </xsl:text>
<xsl:choose>
				<xsl:when test="//typology/@case='none'">there is no case distinction, as the same pronouns can appear as subjects of both transitive and intransitive verbs and as objects of transitive verbs.</xsl:when>
				<xsl:when test="//typology/@case='nominative'">the same set of pronouns can appear as subjects of both transitive and intransitive verbs, while different pronouns are used as objects of transitive verbs.</xsl:when>
				<xsl:when test="//typology/@case='ergative'">the same set of pronouns can appear as subjects of intransitive verbs and objects of transitive verbs, while different pronouns are used as subjects of transitive verbs.</xsl:when>
				<xsl:when test="//typology/@case='split'">the same set of pronouns can normally appear as subjects of both transitive and intransitive verbs, while different pronouns are used as objects of transitive verbs.  However, in certain cases, the same set of pronouns can appear as subjects of intransitive verbs and objects of transitive verbs, while different pronouns are used as subjects of transitive verbs.</xsl:when>
			 </xsl:choose>
</p>
		  <example num="xNP.NPCase.28">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/intPnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/intPnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/intPnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/intPnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPCase.28</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPCase.28.1</xsl:text>
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

		  <xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseN)='yes' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseN)='yes'">
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
<xsl:choose>
			 <xsl:when test="//typology/@caseExperiencer='no'">the same case marking and pronoun set is used for both Agent and Experiencer subjects.</xsl:when>
			 <xsl:when test="//typology/@caseExperiencer='yesObj'">Experiencer subjects use the same case marking and pronoun set as objects of  transitive verbs with an Agent subject do.  We assume that Experiencer subjects have dative case, like indirect objects, so accusative case and dative case are marked the same in this language.</xsl:when>
			 <xsl:when test="//typology/@caseExperiencer='yesDat'">Experiencer subjects use a case marking and pronoun set which is distinct from both the subject and object of verbs with an Agent subject.  This is the dative case, also used for indirect objects.</xsl:when>
		  </xsl:choose>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseN)='no' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseN)='no'">
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
<xsl:choose>
			 <xsl:when test="//typology/@caseExperiencer='no'">the same pronoun set is used for both Agent and Experiencer subjects.</xsl:when>
			 <xsl:when test="//typology/@caseExperiencer='yesObj'">Experiencer subjects use the same pronoun set as objects of  transitive verbs with an Agent subject do.  We assume that Experiencer subjects have dative case, like indirect objects, so the accusative and dative pronouns are the same in this language.</xsl:when>
			 <xsl:when test="//typology/@caseExperiencer='yesDat'">Experiencer subjects use a pronoun set which is distinct from both the subject and object of verbs with an Agent subject.  These are the dative pronouns, also used for indirect objects.</xsl:when>
		  </xsl:choose>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@caseN)='yes'">
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
<xsl:choose>
			 <xsl:when test="//typology/@caseExperiencer='no'">the same case marking and pronoun set is used for both Agent and Experiencer subjects.</xsl:when>
			 <xsl:when test="//typology/@caseExperiencer='yesObj'">Experiencer subjects use the same case marking and pronoun set as objects of  transitive verbs with an Agent subject do.  We assume that Experiencer subjects have dative case, like indirect objects, so absolutive case and dative case are marked the same in this language.</xsl:when>
			 <xsl:when test="//typology/@caseExperiencer='yesDat'">Experiencer subjects use a case marking and pronoun set which is distinct from both the subject and object of verbs with an Agent subject.  This is the dative case, also used for indirect objects.</xsl:when>
		  </xsl:choose>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@caseN)='no'">
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
<xsl:choose>
			 <xsl:when test="//typology/@caseExperiencer='no'">the same pronoun set is used for both Agent and Experiencer subjects.</xsl:when>
			 <xsl:when test="//typology/@caseExperiencer='yesObj'">Experiencer subjects use the same pronoun set as objects of  transitive verbs with an Agent subject do.  We assume that Experiencer subjects have dative case, like indirect objects, so the absolutive and dative pronouns are the same in this language.</xsl:when>
			 <xsl:when test="//typology/@caseExperiencer='yesDat'">Experiencer subjects use a pronoun set which is distinct from both the subject and object of verbs with an Agent subject.  These are the dative pronouns, also used for indirect objects.</xsl:when>
		  </xsl:choose>
</p>
</xsl:if>
		  <p>
<xsl:text>This is shown in the following examples of transitive sentences with verbs which have Experiencer subjects, where the subject and object are nominal phrases:</xsl:text>
</p>
		  <example num="xNP.NPCase.40">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPCase.40</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPCase.40.1</xsl:text>
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
<xsl:text>Note the forms of the pronouns used for the Experiencer subjects and the objects in these transitive sentences:</xsl:text>
</p>
		  <example num="xNP.NPCase.44">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//typology/experiencerPnExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//typology/experiencerPnExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//typology/experiencerPnExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//typology/experiencerPnExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPCase.44</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPCase.44.1</xsl:text>
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
<xsl:text>There are more cases to consider beyond that of the subject and object, also.  These may include ablative case for a source or origin, genitive case for kinds or possessors, dative case for indirect objects, instrumental case for means or instruments, locative case for locations, vocative case for direct address, and oblique case is sometimes used for the minor grammatical relations.
			 These additional cases are usually marked via case markers on the nominal phrases themselves in languages which normally mark case on nouns or nominal phrases as well as pronouns.  For languages without any case marking and those which only show case in the pronouns, these additional grammatical relations are normally expressed via prepositional or postpositional phrases.
		  </xsl:text>
</p>
		  <xsl:if test="normalize-space(//typology/@case)='none'">
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
<xsl:text>, there are not any kind of case distinctions.  Therefore, the minor grammatical relations are expressed by </xsl:text>
<xsl:choose>
			 <xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
			 <xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
			 <xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
			 <xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
		  </xsl:choose>
<xsl:text> phrases, rather than by nominal phrases.</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='no'">
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
<xsl:text>, case distinctions are not marked on nouns or nominal phrases; only the pronoun sets distinguish case.  Therefore, the minor grammatical relations are expressed by </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
				<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
				<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
		  </xsl:choose>
<xsl:text> phrases, rather than by nominal phrases.   The case distinctions in the pronouns will be delineated in </xsl:text>
<sectionRef sec="sPronPersonal" />
<xsl:text>.</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes'">
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
<xsl:text>, case is marked on both pronouns and nouns or nominal phrases. </xsl:text>
<xsl:if test="normalize-space(//typology/@case)='nominative' and normalize-space(//np/@caseDefault)='nominative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@caseDefault)='nominative'">
				<xsl:text>  Nominative case is the default (unmarked) case. </xsl:text>
			 </xsl:if>
<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes' and normalize-space(//np/@caseWord)='yes'">

			 <xsl:text>The case marker is written as a separate word and occurs </xsl:text>
			 <xsl:choose>
				<xsl:when test="//np/@caseWordPos='before'">before</xsl:when>
				<xsl:when test="//np/@caseWordPos='after'">after</xsl:when>
				<xsl:when test="//np/@caseWordPos='either'">on either side of</xsl:when>
				<xsl:when test="//np/@caseWordPos='unknown'">________</xsl:when>
			 </xsl:choose>
			 <xsl:text> the rest of the nominal phrase.  </xsl:text>
			 <xsl:if test="normalize-space(//np/@caseWordEither)='unrestricted'">
				<xsl:text>All of the case markers can occur on either side of the nominal phrase. </xsl:text>
			 </xsl:if>
			 <xsl:text></xsl:text>
			 <xsl:if test="normalize-space(//np/@caseWordEither)='restricted'">
				<xsl:text>There are restrictions as to which of the case markers can occur on each side of the nominal phrase. </xsl:text>
			 </xsl:if>

			 </xsl:if>
<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes' and normalize-space(//np/@caseWord)='no'">  <xsl:text></xsl:text>
			<xsl:choose>
			   <xsl:when test="//np/@caseCliticPos='before'">The case markers attach to the beginning of the initial word in the nominal phrase.</xsl:when>
			   <xsl:when test="//np/@caseCliticPos='after'">The case markers attach to the end of the final word in the nominal phrase.</xsl:when>
			   <xsl:when test="//np/@caseCliticPos='either'">Some of the case markers attach to the beginning of the initial word and some attach to the end of the final word in the nominal phrase.</xsl:when>
			   <xsl:when test="//np/@caseCliticPos='prefixN'">The case markers are prefixes which attach to the head noun.</xsl:when>
			   <xsl:when test="//np/@caseCliticPos='suffixN'">The case markers are suffixes which attach to the head noun.</xsl:when>
			   <xsl:when test="//np/@caseCliticPos='eitherN'">Some of the case markers are prefixes and some are suffixes which attach to the head noun.</xsl:when>
			</xsl:choose>
				</xsl:if>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes'">
<p>
<xsl:text>The case markers used on nouns or nominal phrases in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown in the following chart.</xsl:text>
</p>
</xsl:if>
		  <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@caseN)='yes'">
<example num="xCase">
<table border="1">
				<caption>
				   <xsl:text>Case markers</xsl:text>
				</caption>
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
				   <th>Case</th>
				   <th>Use</th>
				</tr>
				<xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split'">
<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/nominative),'.','')" />
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
					  <xsl:text>nominative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>subjects</xsl:text>
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
					  <xsl:text>nominative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>subjects</xsl:text>
				   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split'">
<xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//np/accusative),'.','')" />
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
					  <xsl:text>accusative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>direct objects and other uses</xsl:text>
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
					  <xsl:text>accusative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>direct objects and other uses</xsl:text>
				   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)!='ergative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='ergative'">
<xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//np/ergative),'.','')" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
					  <xsl:text>ergative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>subjects of transitive verbs</xsl:text>
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
					  <xsl:text>ergative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>subjects of transitive verbs</xsl:text>
				   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//np/ergative),'.','')" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
					  <xsl:text>ergative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>subjects of transitive verbs and possessors</xsl:text>
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
					  <xsl:text>ergative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>subjects of transitive verbs and possessors</xsl:text>
				   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)!='absolutive' or normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='absolutive'">
<xsl:variable name="sExampleValue4">
<xsl:value-of select="translate(string(//np/absolutive),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength4" select="string-length(normalize-space($sExampleValue4))" />
<xsl:choose>
<xsl:when test="$iExampleLength4 != 0 and $sExampleValue4 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue4" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength4" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
					  <xsl:text>absolutive</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>subjects of intransitive verbs and objects of transitive verbs</xsl:text>
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
					  <xsl:text>absolutive</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>subjects of intransitive verbs and objects of transitive verbs</xsl:text>
				   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:variable name="sExampleValue5">
<xsl:value-of select="translate(string(//np/absolutive),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength5" select="string-length(normalize-space($sExampleValue5))" />
<xsl:choose>
<xsl:when test="$iExampleLength5 != 0 and $sExampleValue5 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue5" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength5" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
					  <xsl:text>absolutive</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>subjects of intransitive verbs and objects of transitive verbs and possessors</xsl:text>
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
					  <xsl:text>absolutive</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>subjects of intransitive verbs and objects of transitive verbs and possessors</xsl:text>
				   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='nominative' or normalize-space(//typology/@case)='split' or normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)='genitive'">
<xsl:variable name="sExampleValue6">
<xsl:value-of select="translate(string(//np/genitive),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength6" select="string-length(normalize-space($sExampleValue6))" />
<xsl:choose>
<xsl:when test="$iExampleLength6 != 0 and $sExampleValue6 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue6" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength6" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
					  <xsl:text>genitive</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>possessors</xsl:text>
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
					  <xsl:text>genitive</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>possessors</xsl:text>
				   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@caseExperiencer)='no'">
<xsl:variable name="sExampleValue7">
<xsl:value-of select="translate(string(//np/dative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength7" select="string-length(normalize-space($sExampleValue7))" />
<xsl:choose>
<xsl:when test="$iExampleLength7 != 0 and $sExampleValue7 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue7" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength7" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
					  <xsl:text>dative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>indirect objects</xsl:text>
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
					  <xsl:text>dative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>indirect objects</xsl:text>
				   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@caseExperiencer)!='no'">
<xsl:variable name="sExampleValue8">
<xsl:value-of select="translate(string(//np/dative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength8" select="string-length(normalize-space($sExampleValue8))" />
<xsl:choose>
<xsl:when test="$iExampleLength8 != 0 and $sExampleValue8 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue8" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength8" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
					  <xsl:text>dative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>indirect objects and Experiencer subjects</xsl:text>
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
					  <xsl:text>dative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>indirect objects and Experiencer subjects</xsl:text>
				   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
				<xsl:variable name="sExampleValue9">
<xsl:value-of select="translate(string(//np/ablative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength9" select="string-length(normalize-space($sExampleValue9))" />
<xsl:choose>
<xsl:when test="$iExampleLength9 != 0 and $sExampleValue9 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue9" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength9" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
					  <xsl:text>ablative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>source or origin</xsl:text>
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
					  <xsl:text>ablative</xsl:text>
				   </td>
<td align="left">
					  <xsl:text>source or origin</xsl:text>
				   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
				   <xsl:variable name="sExampleValue10">
<xsl:value-of select="translate(string(//np/instrumental),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength10" select="string-length(normalize-space($sExampleValue10))" />
<xsl:choose>
<xsl:when test="$iExampleLength10 != 0 and $sExampleValue10 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue10" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength10" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
						 <xsl:text>instrumental</xsl:text>
					  </td>
<td align="left">
						 <xsl:text>instrument, means or agency</xsl:text>
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
						 <xsl:text>instrumental</xsl:text>
					  </td>
<td align="left">
						 <xsl:text>instrument, means or agency</xsl:text>
					  </td>
</tr>
</xsl:otherwise>
</xsl:choose>
					  <xsl:variable name="sExampleValue11">
<xsl:value-of select="translate(string(//np/locative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength11" select="string-length(normalize-space($sExampleValue11))" />
<xsl:choose>
<xsl:when test="$iExampleLength11 != 0 and $sExampleValue11 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue11" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength11" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							<xsl:text>locative</xsl:text>
						 </td>
<td align="left">
							<xsl:text>location</xsl:text>
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
							<xsl:text>locative</xsl:text>
						 </td>
<td align="left">
							<xsl:text>location</xsl:text>
						 </td>
</tr>
</xsl:otherwise>
</xsl:choose>
						 <xsl:variable name="sExampleValue12">
<xsl:value-of select="translate(string(//np/vocative),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength12" select="string-length(normalize-space($sExampleValue12))" />
<xsl:choose>
<xsl:when test="$iExampleLength12 != 0 and $sExampleValue12 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue12" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength12" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
							   <xsl:text>vocative</xsl:text>
							</td>
<td align="left">
							   <xsl:text>direct address</xsl:text>
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
							   <xsl:text>vocative</xsl:text>
							</td>
<td align="left">
							   <xsl:text>direct address</xsl:text>
							</td>
</tr>
</xsl:otherwise>
</xsl:choose>
							<xsl:variable name="sExampleValue13">
<xsl:value-of select="translate(string(//np/oblique),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength13" select="string-length(normalize-space($sExampleValue13))" />
<xsl:choose>
<xsl:when test="$iExampleLength13 != 0 and $sExampleValue13 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue13" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength13" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
								  <xsl:text>oblique</xsl:text>
							   </td>
<td align="left">
								  <xsl:text>general minor grammatical relation</xsl:text>
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
								  <xsl:text>oblique</xsl:text>
							   </td>
<td align="left">
								  <xsl:text>general minor grammatical relation</xsl:text>
							   </td>
</tr>
</xsl:otherwise>
</xsl:choose>
							   <xsl:variable name="sExampleValue14">
<xsl:value-of select="translate(string(//np/other),'.','')" />
</xsl:variable>
<xsl:variable name="iExampleLength14" select="string-length(normalize-space($sExampleValue14))" />
<xsl:choose>
<xsl:when test="$iExampleLength14 != 0 and $sExampleValue14 != ' '">
<xsl:variable name="sCalculatedRows">
<xsl:call-template name="CalculateRows">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14" />
</xsl:with-param>
</xsl:call-template>
</xsl:variable>
<xsl:call-template name="OutputColExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="$sExampleValue14" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="$iExampleLength14" />
</xsl:with-param>
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
									 <xsl:text>other</xsl:text>
								  </td>
<td align="left">
									 <xsl:text>any other specific markers</xsl:text>
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
									 <xsl:text>other</xsl:text>
								  </td>
<td align="left">
									 <xsl:text>any other specific markers</xsl:text>
								  </td>
</tr>
</xsl:otherwise>
</xsl:choose>
			 </table>
</example>
</xsl:if>
	   </section2>

		<section2 id="sNPDegree">
			<secTitle>Special Degree Words including “All” and “Not”</secTitle>
			<p>
<xsl:text>
The outer or top level of the nominal phrase is occupied by those degree words that modify the whole phrase, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>almost</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only</langData>
<xsl:text>, and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>not</langData>
<xsl:text>.  These were discussed in section </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text>.</xsl:text>
</p>

				  <xsl:if test="normalize-space(//qp/@npDegree)='no'">
<p>
<xsl:text>To review the facts for </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the positive forms are not expressed as separate words which modify the whole nominal phrase.  Instead, they all attach to another word in the nominal phrase.  The positive special degree elements are </xsl:text>
<xsl:choose>
						<xsl:when test="//qp/@npDegreeType='proclitic'">phrasal proclitics which attach to the front of whatever word begins the nominal phrase.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='enclitic'">phrasal enclitics which attach to the end of whatever word ends the nominal phrase.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='clitic'">phrasal clitics which attach either to the front of whatever word begins the nominal phrase or to the end of whatever word ends the nominal phrase.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='prefix'">prefixes which attach to the head noun of the nominal phrase.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='suffix'">suffixes which attach to the head noun of the nominal phrase.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='affix'">either prefixes or suffixes which attach to the head noun of the nominal phrase.</xsl:when>
					 </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				  <xsl:if test="normalize-space(//qp/@npDegree)='some'">
<p>
<xsl:text>To review the facts for  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, some of the positive forms are separate words but some of these are not expressed as separate words which modify the whole nominal phrase.  Instead, some of the positive special degree elements are </xsl:text>
<xsl:choose>
						<xsl:when test="//qp/@npDegreeType='proclitic'">phrasal proclitics which attach to the front of whatever word begins the nominal phrase.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='enclitic'">phrasal enclitics which attach to the end of whatever word ends the nominal phrase.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='clitic'">phrasal clitics which attach either to the front of whatever word begins the nominal phrase or to the end of whatever word ends the nominal phrase.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='prefix'">prefixes which attach to the head noun of the nominal phrase.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='suffix'">suffixes which attach to the head noun of the nominal phrase.</xsl:when>
						<xsl:when test="//qp/@npDegreeType='affix'">either prefixes or suffixes which attach to the head noun of the nominal phrase.</xsl:when>
					 </xsl:choose>
<xsl:text>  The positive special degree elements which are expressed as separate words occur </xsl:text>
<xsl:choose>
						<xsl:when test="//qp/@npDegreePos='before'">before</xsl:when>
						<xsl:when test="//qp/@npDegreePos='after'">after</xsl:when>
						<xsl:when test="//qp/@npDegreePos='either'">on either side (but not both sides) of</xsl:when>
						<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">on either side or on both sides of</xsl:when>
						<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">before or on both sides of</xsl:when>
						<xsl:when test="//qp/@npDegreePos='afterOrBoth'">after or on both sides of</xsl:when>
						<xsl:when test="//qp/@npDegreePos='both'">on both sides of</xsl:when>
						<xsl:when test="//qp/@npDegreePos='unknown'">_______</xsl:when>
					 </xsl:choose>
<xsl:text> the rest of the nominal phrase.  </xsl:text>
</p>
</xsl:if>

				  <xsl:if test="normalize-space(//qp/@npDegree)='yes'">
<p>
<xsl:text>To review the facts for  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the positive special degree elements are expressed as separate words which modify the whole nominal phrase.    They  occur </xsl:text>
<xsl:choose>
						<xsl:when test="//qp/@npDegreePos='before'">before</xsl:when>
						<xsl:when test="//qp/@npDegreePos='after'">after</xsl:when>
						<xsl:when test="//qp/@npDegreePos='either'">on either side (but not both sides) of</xsl:when>
						<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">on either side or on both sides of</xsl:when>
						<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">before or on both sides of</xsl:when>
						<xsl:when test="//qp/@npDegreePos='afterOrBoth'">after or on both sides of</xsl:when>
						<xsl:when test="//qp/@npDegreePos='both'">on both sides of</xsl:when>
						<xsl:when test="//qp/@npDegreePos='unknown'">_______</xsl:when>
					 </xsl:choose>
<xsl:text> the rest of the nominal phrase.  </xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//qp/@npDegreeNeg)='none'">
<p>
<xsl:text>For the negative version in </xsl:text>
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
<xsl:text>For the negative version in </xsl:text>
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
<xsl:text>For the negative version in </xsl:text>
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
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//qp/@npDegreeNeg)='yes'">
<p>
<xsl:text>For the negative version in </xsl:text>
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
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//typology/@classifier)='yesAgr' and normalize-space(//qp/@npDegreeClassifier)='yes'">
<p>
<xsl:text>The following chart summarizes how all the special degree elements are expressed in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.  The forms shown in the chart are the roots; each one may surface with the apropriate classifier attached.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//typology/@classifier)!='yesAgr' or normalize-space(//qp/@npDegreeClassifier)!='yes'">
<p>
<xsl:text>The following chart summarizes how all the special degree elements are expressed in </xsl:text>
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
</xsl:if>
		   <example num="xNP.NPDegree.24">
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
<xsl:value-of select="translate(string(//qp/all),'.','')" />
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
					   <xsl:text>all</xsl:text>
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
					   <xsl:text>all</xsl:text>
					</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				 <xsl:variable name="sExampleValue1">
<xsl:value-of select="translate(string(//qp/almost),'.','')" />
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
					   <xsl:text>almost</xsl:text>
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
					   <xsl:text>almost</xsl:text>
					</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				 <xsl:variable name="sExampleValue2">
<xsl:value-of select="translate(string(//qp/only),'.','')" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
					   <xsl:text>only or just</xsl:text>
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
					   <xsl:text>only or just</xsl:text>
					</td>
</tr>
</xsl:otherwise>
</xsl:choose>
				 <xsl:if test="normalize-space(//qp/@npDegreeNeg)!='none'">
<xsl:variable name="sExampleValue3">
<xsl:value-of select="translate(string(//qp/not),'.','')" />
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
<xsl:with-param name="columnsBefore" />
<xsl:with-param name="columnsAfter">
<td align="left">
					   <xsl:text>not</xsl:text>
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
					   <xsl:text>not</xsl:text>
					</td>
</tr>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
			  </table>
</example>

		</section2>
		<section2 id="sNPArtDem">
			<secTitle>Articles and Demonstratives</secTitle>
			<p>
<xsl:text>Articles and/or demonstratives normally comprise the next level moving inward towards the noun.   In English, the articles are </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>a</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>an</langData>
<xsl:text>, and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the</langData>
<xsl:text>.  English demonstratives include </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>this</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>that</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>these</langData>
<xsl:text>, and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those</langData>
<xsl:text>.  Some simple examples are: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>a book, an apple, the book, the books, this apple</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those books.</langData>
<xsl:text></xsl:text>
</p>
			<p>
<xsl:text>In English, articles and demonstratives do not co-occur in the same nominal phrase, and both occur before the noun.  Some languages allow both to co-occur in the same phrase, and they may occur in different positions with respect to the noun.  Therefore, they need distinct syntactic categories.  Some languages only have one set, either articles or demonstratives.  A few languages may not have either type expressed as separate words.</xsl:text>
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
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artAndDem='no'"> does not have either articles or demonstratives that are realized as separate words.</xsl:when>
					<xsl:when test="//np/@artAndDem='article'"> has only articles that are realized as separate words, no demonstratives.</xsl:when>
					<xsl:when test="//np/@artAndDem='demonstrative'"> has only demonstratives that are realized as separate words, no articles.</xsl:when>
					<xsl:when test="//np/@artAndDem='both'"> has both articles and demonstratives that are realized as separate words.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>

		   <xsl:if test="normalize-space(//np/@artAndDem)='article'">
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
<xsl:choose>
				 <xsl:when test="//np/@artDefOnly='no'"> both the definite and indefinite articles are overt words.</xsl:when>
				 <xsl:when test="//np/@artDefOnly='yes'"> only the definite article is overt; indefinite nouns are unmarked.</xsl:when>
			  </xsl:choose>
<xsl:text>  Further, there </xsl:text>
<xsl:choose>
				 <xsl:when test="//np/@artPl='no'">is only one set of articles which are used with both singular and plural nouns.</xsl:when>
				 <xsl:when test="//np/@artPl='yes'">are separate forms of articles for singular and plural to agree with the noun.</xsl:when>
			  </xsl:choose>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='no' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>The articles in </xsl:text>
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
		   <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>The roots of the articles in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here.  Each one may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>The definite articles in </xsl:text>
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
		   <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>The roots of the definite articles in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here.  Each one may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPl)='no'">
<example num="xNP.NPArtDem.20">
<table border="1">
	  <tr>
		 <th>Articles</th>
		 <th>Gloss</th>
	  </tr>
	  <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/articleExample),'.','')" />
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
		   <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='yes' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>The articles in </xsl:text>
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
		   <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>The roots of the articles in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here.  Each one may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='yes' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>The definite articles in </xsl:text>
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
		   <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>The roots of the definite articles in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here.  Each one may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPl)='yes'">
<example num="xNP.NPArtDem.30">
<table border="1">
				 <tr>
					<th>Number</th>
					<th>Articles</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/articleSgExample),'.','')" />
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<xsl:value-of select="translate(string(//np/articlePlExample),'.','')" />
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
<td align="left">
<xsl:text>plural</xsl:text>
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
<td align="left">
<xsl:text>plural</xsl:text>
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

		   <xsl:if test="normalize-space(//np/@artAndDem)='article'">
<p>
<xsl:text>The article occurs </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artPos='before'">before</xsl:when>
					<xsl:when test="//np/@artPos='after'">after</xsl:when>
					<xsl:when test="//np/@artPos='either'">on either side of</xsl:when>
					<xsl:when test="//np/@artPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artEither)='unrestricted'">
					<xsl:text>All of the articles may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artEither)='restricted'">
					<xsl:text>There are restrictions as to which of the articles may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text>  The presence of an article is </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artRequired='no'">always optional.</xsl:when>
					<xsl:when test="//np/@artRequired='mass'">optional with plural or mass nouns, but is required with singular nouns.</xsl:when>
					<xsl:when test="//np/@artRequired='yes'">always required.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass'">
					<xsl:text> In the singular forms, an article is required </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artBothRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='both'">to appear both before and after the noun.</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes'">
					<xsl:text> An article is required to appear </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artBothRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='both'">both before and after the noun.</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative'">
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
<xsl:text>, there </xsl:text>
<xsl:choose>
				 <xsl:when test="//np/@demPl='no'">is only one set of demonstratives which are used with both singular and plural nouns.</xsl:when>
				 <xsl:when test="//np/@demPl='yes'">are separate forms of demonstratives for singular and plural to agree with the noun.</xsl:when>
			  </xsl:choose>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>The demonstratives in </xsl:text>
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
		   <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>The roots of the demonstratives in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here.  Each one may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPl)='no'">
<example num="xNP.NPArtDem.40">
<table border="1">
				 <tr>
					<th>Demonstratives</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/demonstrativeExample),'.','')" />
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

		   <xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPl)='yes'">
<example num="xNP.NPArtDem.42">
<table border="1">
				 <tr>
					<th>Number</th>
					<th>Demonstratives</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/demonstrativeSgExample),'.','')" />
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<xsl:value-of select="translate(string(//np/demonstrativePlExample),'.','')" />
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
<td align="left">
<xsl:text>plural</xsl:text>
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
<td align="left">
<xsl:text>plural</xsl:text>
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

			<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative'">
<p>
<xsl:text>The demonstrative occurs </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demPos='before'">before</xsl:when>
					<xsl:when test="//np/@demPos='after'">after</xsl:when>
					<xsl:when test="//np/@demPos='either'">on either side of</xsl:when>
					<xsl:when test="//np/@demPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demEither)='unrestricted'">
					<xsl:text>All of the demonstratives may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demEither)='restricted'">
					<xsl:text>There are restrictions as to which of the demonstratives may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text>  The presence of a demonstrative is </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demRequired='no'">always optional.</xsl:when>
					<xsl:when test="//np/@demRequired='mass'">optional with plural or mass nouns, but is required with singular nouns.</xsl:when>
					<xsl:when test="//np/@demRequired='yes'">always required.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass'">
					<xsl:text> In the singular forms, a demonstrative is required </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demBothRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='both'">to appear both before and after the noun.</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes'">
					<xsl:text> A demonstrative is required to appear </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demBothRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='both'">both before and after the noun.</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//np/@artAndDem)='both'">
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
<xsl:choose>
				 <xsl:when test="//np/@artDefOnly='no'"> both the definite and indefinite articles are overt words.</xsl:when>
				 <xsl:when test="//np/@artDefOnly='yes'"> only the definite article is overt; indefinite nouns are unmarked.</xsl:when>
			  </xsl:choose>
<xsl:text>  Further, there </xsl:text>
<xsl:choose>
				 <xsl:when test="//np/@artPl='no'">is only one set of articles which are used with both singular and plural nouns.</xsl:when>
				 <xsl:when test="//np/@artPl='yes'">are separate forms of articles for singular and plural to agree with the noun.</xsl:when>
			  </xsl:choose>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='no' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>The articles in </xsl:text>
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
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>The roots of the articles in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here.  Each one may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>The definite articles in </xsl:text>
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
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='no' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>The roots of the definite articles in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here.  Each one may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artPl)='no'">
<example num="xNP.NPArtDem.56">
<table border="1">
				 <tr>
					<th>Articles</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/articleExample),'.','')" />
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
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='yes' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>The articles in </xsl:text>
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
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='no' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>The roots of the articles in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here.  Each one may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='yes' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>The definite articles in </xsl:text>
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
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDefOnly)='yes' and normalize-space(//np/@artPl)='yes' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>The roots of the definite articles in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here.  Each one may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artPl)='yes'">
<example num="xNP.NPArtDem.66">
<table border="1">
				 <tr>
					<th>Number</th>
					<th>Articles</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/articleSgExample),'.','')" />
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<xsl:value-of select="translate(string(//np/articlePlExample),'.','')" />
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
<td align="left">
<xsl:text>plural</xsl:text>
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
<td align="left">
<xsl:text>plural</xsl:text>
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

		   <xsl:if test="normalize-space(//np/@artAndDem)='both'">
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
<xsl:text>, there </xsl:text>
<xsl:choose>
				 <xsl:when test="//np/@demPl='no'">is only one set of demonstratives which are used with both singular and plural nouns.</xsl:when>
				 <xsl:when test="//np/@demPl='yes'">are separate forms of demonstratives for singular and plural to agree with the noun.</xsl:when>
			  </xsl:choose>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDemClassifier)='no' or normalize-space(//np/@artAndDem)='both' and normalize-space(//typology/@classifier)!='yesAgr'">
<p>
<xsl:text>The demonstratives in </xsl:text>
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
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artDemClassifier)='yes' and normalize-space(//typology/@classifier)='yesAgr'">
<p>
<xsl:text>The roots of the demonstratives in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are shown here.  Each one may surface with the appropriate classifier attached.</xsl:text>
</p>
</xsl:if>
		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demPl)='no'">
<example num="xNP.NPArtDem.74">
<table border="1">
				 <tr>
					<th>Demonstratives</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/demonstrativeExample),'.','')" />
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

		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@demPl)='yes'">
<example num="xNP.NPArtDem.76">
<table border="1">
				 <tr>
					<th>Number</th>
					<th>Demonstratives</th>
					<th>Gloss</th>
				 </tr>
				 <xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/demonstrativeSgExample),'.','')" />
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<td align="left">
<xsl:text>singular</xsl:text>
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
<xsl:value-of select="translate(string(//np/demonstrativePlExample),'.','')" />
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
<td align="left">
<xsl:text>plural</xsl:text>
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
<td align="left">
<xsl:text>plural</xsl:text>
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


			<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no'">
<p>
<xsl:text>The articles and demonstratives both appear in the same position, so they do not co-occur in the same nominal phrase.  Articles or demonstratives appear </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demOrArtPos='before'">before</xsl:when>
					<xsl:when test="//np/@demOrArtPos='after'">after</xsl:when>
					<xsl:when test="//np/@demOrArtPos='either'">on either side of</xsl:when>
					<xsl:when test="//np/@demOrArtPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtEither)='unrestricted'">
					<xsl:text>All of the articles and demonstratives may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtEither)='restricted'">
					<xsl:text>There are restrictions as to which of the articles and demonstratives may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text>  The presence of an article or demonstrative is </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demOrArtRequired='no'">always optional.</xsl:when>
					<xsl:when test="//np/@demOrArtRequired='mass'">optional with plural or mass nouns, but is required with singular nouns.</xsl:when>
					<xsl:when test="//np/@demOrArtRequired='yes'">always required.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass'">
					<xsl:text> In the singular forms, an article or a demonstrative is required </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demOrArtBothRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='both'">to appear both before and after the noun.</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes'">
					<xsl:text> An article or a demonstrative is required to appear </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demOrArtBothRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='both'">both before and after the noun.</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>


			<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>The articles and demonstratives do not appear in the same position with respect to the noun, </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artBothCooccur='different'">but both may not </xsl:when>
					<xsl:when test="//np/@artBothCooccur='yes'">and both may </xsl:when>
				</xsl:choose>
<xsl:text>co-occur in the same nominal phrase.</xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>  The article occurs </xsl:text>
<xsl:choose>
			  <xsl:when test="//np/@demAndArtArtPos='before'">before</xsl:when>
			  <xsl:when test="//np/@demAndArtArtPos='after'">after</xsl:when>
			  <xsl:when test="//np/@demAndArtArtPos='either'">on either side of</xsl:when>
			  <xsl:when test="//np/@demAndArtArtPos='unknown'">_______</xsl:when>
		   </xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtEither)='unrestricted'">
			  <xsl:text>All of the articles may appear on either side of the noun.</xsl:text>
		   </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtEither)='restricted'">
			  <xsl:text>There are restrictions as to which of the articles may appear on either side of the noun.</xsl:text>
		   </xsl:if>
<xsl:text>  The presence of an article is </xsl:text>
<xsl:choose>
			  <xsl:when test="//np/@demAndArtArtRequired='no'">always optional.</xsl:when>
			  <xsl:when test="//np/@demAndArtArtRequired='mass'">optional with plural or mass nouns, but is required with singular nouns.</xsl:when>
			  <xsl:when test="//np/@demAndArtArtRequired='yes'">always required.</xsl:when>
		   </xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='mass'">
			  <xsl:text> In the singular forms, an article is required </xsl:text>
			  <xsl:choose>
				 <xsl:when test="//np/@demAndArtArtBothRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
				 <xsl:when test="//np/@demAndArtArtBothRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
				 <xsl:when test="//np/@demAndArtArtBothRequiredPos='both'">to appear both before and after the noun.</xsl:when>
				 <xsl:when test="//np/@demAndArtArtBothRequiredPos='unknown'">_______</xsl:when>
			  </xsl:choose>
			  <xsl:text></xsl:text>
		   </xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='yes'">
			  <xsl:text> An article is required to appear </xsl:text>
			  <xsl:choose>
				 <xsl:when test="//np/@demAndArtArtBothRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
				 <xsl:when test="//np/@demAndArtArtBothRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
				 <xsl:when test="//np/@demAndArtArtBothRequiredPos='both'">both before and after the noun.</xsl:when>
				 <xsl:when test="//np/@demAndArtArtBothRequiredPos='unknown'">_______</xsl:when>
			  </xsl:choose>
			  <xsl:text></xsl:text>
		   </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>

		   <xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>The demonstrative occurs </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtDemPos='before'">before</xsl:when>
					<xsl:when test="//np/@demAndArtDemPos='after'">after</xsl:when>
					<xsl:when test="//np/@demAndArtDemPos='either'">on either side of</xsl:when>
					<xsl:when test="//np/@demAndArtDemPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemEither)='unrestricted'">
					<xsl:text>All of the demonstratives may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemEither)='restricted'">
					<xsl:text>There are restrictions as to which of the demonstratives may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text>  The presence of a demonstrative is </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtDemRequired='no'">always optional.</xsl:when>
					<xsl:when test="//np/@demAndArtDemRequired='mass'">optional with plural or mass nouns, but is required with singular nouns.</xsl:when>
					<xsl:when test="//np/@demAndArtDemRequired='yes'">always required.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass'">
					<xsl:text> In the singular forms, a demonstrative is required </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='both'">to appear both before and after the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes'">
					<xsl:text> A demonstrative is required to appear </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='both'">both before and after the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
</p>
</xsl:if>


		   <xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<p>
<xsl:text> The </xsl:text>
<xsl:choose>
				 <xsl:when test="//np/@artAndDem='article'">articles</xsl:when>
				 <xsl:when test="//np/@artAndDem='demonstrative'">demonstratives</xsl:when>
				 <xsl:when test="//np/@artAndDem='both'">articles and demonstratives</xsl:when>
			  </xsl:choose>
<xsl:text> are </xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)!='no' and normalize-space(//np/@artCase)='no'">
				 <xsl:text>not </xsl:text>
			  </xsl:if>
<xsl:text>marked for case.</xsl:text>
</p>
</xsl:if>


			<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<p>
<xsl:text>Examples of nominal phrases including </xsl:text>
<xsl:choose>
				   <xsl:when test="//np/@artAndDem='article'">articles</xsl:when>
				   <xsl:when test="//np/@artAndDem='demonstrative'">demonstratives</xsl:when>
				   <xsl:when test="//np/@artAndDem='both'">articles and/or demonstratives</xsl:when>
				</xsl:choose>
<xsl:text> as allowed in </xsl:text>
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
			<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<example num="xNP.NPArtDem.90">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPArtDem.90</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPArtDem.90.1</xsl:text>
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
		<section2 id="sNPPoss">
			<secTitle>Possessors</secTitle>
			<p>
<xsl:text>In many languages, possessors comprise the next level moving inward towards the noun.   Possession can normally be expressed by a pronoun, by a simple noun, or by a full nominal phrase.
					However, Spanish only allows pronouns in the possessor position before the noun, with all noun and full nominal phrase possessors expressed in a prepositional phrase with </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>de</langData>
<xsl:text> after the noun.</xsl:text>
</p>
			<p>
<xsl:text>Within the languages which express possessors by nouns or full nominal phrases as well as by pronouns, many also add some kind of marking, such as the </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>’s</langData>
<xsl:text> in English, as an indication of possession.  These markings are either affixes (or clitics) on the head noun or phrase-level clitics which attach to one end of the whole phrase.  The English marking is this second type, because alongside phrases where the </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>’s</langData>
<xsl:text> appears to attach to the head noun, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s mother</langData>
<xsl:text>, there are phrases which clearly show that the clitic attaches to the end of the whole nominal phrase, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy that I just talked to’s mother</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the girl in green’s wonderful speech</langData>
<xsl:text>.  These examples show that possessors can include </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrases and relative clauses.  Possessors can also be embedded in one another, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s sister’s dog</langData>
<xsl:text>.  This is allowed in Spanish within the prepositional phrase after the noun.</xsl:text>
</p>
			<p>
<xsl:text>Examples of possessed nominal phrases with simple and embedded possessors in </xsl:text>
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
			<example num="xNP.NPPoss.10">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/embeddedExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/embeddedExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/embeddedExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/embeddedExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.10</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.10.1</xsl:text>
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
<xsl:text>Examples with pre/post-positional phrases within the possessor include:</xsl:text>
</p>
			<example num="xNP.NPPoss.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/ppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/ppExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/ppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/ppExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.14.1</xsl:text>
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
<xsl:text>Examples with relative clauses within the possessor, included in simple full sentences are:</xsl:text>
</p>
			<example num="xNP.NPPoss.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/relClExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/relClExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/relClExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/relClExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.18.1</xsl:text>
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
<xsl:text>As seen in the examples above, </xsl:text>
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
					<xsl:when test="//np/@possMarked='no'"> does not have any special marking to distinguish possessors from any other nominal phrase.</xsl:when>
					<xsl:when test="//np/@possMarked='yesAffix'"> marks the head noun within the possessor with an affix to distinguish possessors from any other nominal phrase.</xsl:when>
					<xsl:when test="//np/@possMarked='yesClitic'"> marks the whole phrase with a phrasal clitic to distinguish possessors from any other nominal phrase.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticAffix)='suffix'">
					<xsl:text> This phrasal clitic is an enclitic which attaches to the final word in the possessor.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticAffix)='prefix'">
					<xsl:text> This phrasal clitic is an proclitic which attaches to the first word in the possessor.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possMarked)='yesClitic'">
					<xsl:text> This phrasal clitic is written as a separate word which occurs </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@possCliticPossPos='before'">before</xsl:when>
						<xsl:when test="//np/@possCliticPossPos='after'">after</xsl:when>
						<xsl:when test="//np/@possCliticPossPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text> the possessor.  The possessive clitic is </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@possCliticRequired='no'">optional in some cases.</xsl:when>
						<xsl:when test="//np/@possCliticRequired='no'">always required.</xsl:when>
						<xsl:when test="//np/@possCliticRequired='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<p>
<xsl:text>The possessor (especially the pronoun form, if  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is like Spanish) occurs </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@possNounPos='before'">before</xsl:when>
					<xsl:when test="//np/@possNounPos='after'">after</xsl:when>
					<xsl:when test="//np/@possNounPos='either'">on either side of</xsl:when>
					<xsl:when test="//np/@possNounPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> the noun being possessed.</xsl:text>
</p>

		   <xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<section3 id="sNPPossCooccur">
				<secTitle>Possessors and Articles Or Demonstratives Occuring Together</secTitle>
				<p>
<xsl:text>In English, possessors and articles or demonstratives do not co-occur in the same nominal phrase, unless the possessor is expressed in a prepositional phrase.  For example, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those [the boy’s] books</langData>
<xsl:text> is ungrammatical; instead one would use </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those books [of his]</langData>
<xsl:text> to express the same thought.  Some other languages allow both possessors and articles or demonstratives to occur in the same phrase, so the first example above would be grammatical.</xsl:text>
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
<xsl:choose>
					 <xsl:when test="//np/@possCooccur='some'">some </xsl:when>
				  </xsl:choose>
<xsl:text>nominal possessors </xsl:text>
<xsl:choose>
					 <xsl:when test="//np/@possCooccur='yes'">may</xsl:when>
					 <xsl:when test="//np/@possCooccur='some'">may</xsl:when>
					 <xsl:when test="//np/@possCooccur='no'">may not</xsl:when>
				  </xsl:choose>
<xsl:text> occur in the same phrase as </xsl:text>
<xsl:choose>
					 <xsl:when test="//np/@artAndDem='article'">articles</xsl:when>
					 <xsl:when test="//np/@artAndDem='demonstrative'">demonstratives</xsl:when>
					 <xsl:when test="//np/@artAndDem='both'">articles and/or demonstratives</xsl:when>
				  </xsl:choose>
<xsl:text> in the normal possessor position</xsl:text>
<xsl:choose>
					 <xsl:when test="//np/@possCooccur='yes'">.</xsl:when>
					 <xsl:when test="//np/@possCooccur='some'"> but some may not.  In that case, </xsl:when>
					 <xsl:when test="//np/@possCooccur='no'">.  Instead, </xsl:when>
				  </xsl:choose>
<xsl:if test="normalize-space(//np/@possCooccur)='no' or normalize-space(//np/@possCooccur)='some'">
<xsl:text>the possessor is expressed in a </xsl:text>
					 <xsl:choose>
						<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
						<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
						<xsl:when test="//pp/@pPos='both'">prepositional or postpositional</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">prepositional or postpositional</xsl:when>
					 </xsl:choose>
					 <xsl:text> phrase.</xsl:text>
				  </xsl:if>
</p>
			</section3>
</xsl:if>
			<section3 id="sNPPossCase">
				<secTitle>Possessor Case</secTitle>
				<xsl:if test="normalize-space(//typology/@case)='none'">
<p>
<xsl:text>As discussed in section </xsl:text>
<sectionRef sec="sNPCase" />
<xsl:text>, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> does not have any case system.  Therefore, there is no separate case marking on nouns nor a distinct set of pronouns used for possessors.</xsl:text>
</p>
</xsl:if>

				<xsl:if test="normalize-space(//typology/@case)='nominative'">
<p>
<xsl:text>With the normal nominative-accusative case system followed by </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, possessors are marked with the genitive case.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='split'">
<p>
<xsl:text>Possessors in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> are marked with the genitive case, following the normal nominative-accusative part of the split case system.  In the parts which display split ergativity, possessors are marked with the </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">ergative case, the same marking as the subjects of transitive verbs.</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">absolutive case, the same marking as the subjects of intransitive verbs and the objects of transitive verbs.</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">genitive case also.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)='ergative'">
<p>
<xsl:text>Within the ergative-absolutive case system followed by </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, possessors are marked with the </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">ergative case, the same marking as the subjects of transitive verbs.</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">absolutive case, the same marking as the subjects of intransitive verbs and the objects of transitive verbs.</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">genitive case, a distinct marking for possessors.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)!='none'">
<p>
<xsl:text>In some languages, in a possessed noun phrase the head noun and any modifiers matches the case of the possessor.  In other languages, the possessor is marked with its own case, say genitive, while the head noun is marked with case depending on its position relative to the verb: nominative or accusative, ergative or absolutive depending on the case system.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="normalize-space(//typology/@case)!='none'">
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
<xsl:choose>
						<xsl:when test="//np/@possNounCaseChange='no'">the grammatical function of the head noun relative to the verb determines its case, not the presence of a possessor.</xsl:when>
						<xsl:when test="//np/@possNounCaseChange='yes'">the case of the head noun matches the case of the possessor, when a possessor is present.</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>

				  <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
<p>
<xsl:text>Languages like </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> which change the case of the head noun when a possessor is present normally also change the case of intervening adjectives to match.  Some languages of this type also change the case of the head noun when only an adjectival modifier is present, even when there is no possessor.</xsl:text>
</p>
</xsl:if>
			   <xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possNounCaseChange)='yes'">
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
<xsl:text>, the case of the head noun </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@adjpCaseChange='no'">only changes when a possessor is present, though in that situation an intervening adjective may/must also carry that case.</xsl:when>
						<xsl:when test="//np/@adjpCaseChange='yes'">changes to match the normal case of a possessor even if just an adjectival modifier is present.</xsl:when>
					 </xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				  <xsl:if test="normalize-space(//np/@adjpCaseChange)='yes'">
<p>
<xsl:text>Further, some languages of this latter type have an overt affix which marks the genitive case (or the normal case of possessors) on the head noun to indicate that there must be either an adjective or a possessor in that nominal phrase.  In this situation, the adjective and/or possessor will also be in genitive case (or the normal case of possessors), though the case marking will not be overt on the highest modifier in the nominal phrase.</xsl:text>
</p>
</xsl:if>
				  <xsl:if test="normalize-space(//np/@adjpCaseChange)='yes'">
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
<xsl:text>, the case marking </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@adjpCaseAffix='no'">is not</xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">is</xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">is</xsl:when>
					 </xsl:choose>
<xsl:text> handled in this distinctive way.  </xsl:text>
<xsl:if test="normalize-space(//np/@adjpCaseAffix)!='no' and normalize-space(//np/@adjpCaseChange)='yes'">
						<xsl:text>When the overt </xsl:text>
						<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
						   <xsl:text>genitive </xsl:text>
						</xsl:if>
						<xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
						   <xsl:text>or </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
						   <xsl:text>ergative </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
						   <xsl:text>absolutive </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:choose>
						   <xsl:when test="//np/@adjpCaseAffix='yesSuffix'">suffix</xsl:when>
						   <xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefix</xsl:when>
						</xsl:choose>
						<xsl:text> is present on the head noun, it indicates that an adjectival modifier and/or a possessor must be present in the phrase.  If the adjective is marked with this </xsl:text>
						<xsl:if test="normalize-space(//typology/@case)!='none' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//typology/@case)='nominative'">
						   <xsl:text>genitive </xsl:text>
						</xsl:if>
						<xsl:if test="normalize-space(//typology/@case)='split' and normalize-space(//np/@possCaseErg)!='genitive'">
						   <xsl:text>or </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
						   <xsl:text>ergative </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
						   <xsl:text>absolutive </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:choose>
						   <xsl:when test="//np/@adjpCaseAffix='yesSuffix'">suffix,</xsl:when>
						   <xsl:when test="//np/@adjpCaseAffix='yesPrefix'">prefix,</xsl:when>
						</xsl:choose>
						<xsl:text> then another adjective and/or a possessor must also be present.</xsl:text>
					 </xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>

			</section3>
			<section3 id="sNPPossAgreement">
				<secTitle>Possessor Agreement</secTitle>
				<p>
<xsl:text>Possessor agreement normally comes in two basic forms:</xsl:text>
</p>
				<ul>
					<li>
						<xsl:text>An affix that occurs on alienably possessed nouns to indicate that they are possessed and therefore must have a possessor in the nominal phrase.  Inalienably possessed nouns do not take any marking, but must always have a possessor.  These include, but are not limited to, kinship terms and body parts.</xsl:text>
					</li>
					<li>
						<xsl:text>An affix that agrees with the possessor (or possibly expresses the possessor by itself).</xsl:text>
					</li>
				</ul>
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
<xsl:text></xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possAlienable='no'"> does not distinguish</xsl:when>
						<xsl:when test="//np/@possAlienable='yes'"> does make a distinction</xsl:when>
					</xsl:choose>
<xsl:text> between alienably and inalienably possessed nouns.  </xsl:text>
<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
						<xsl:text>The affix which marks alienably possessed nouns when they have a possessor is:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//np/@possAlienable)='yes'">
<example num="xNP.NPPoss.NPPossAgreement.10">
<table border="1">
						<tr>
							<th>Possessive affix</th>
							<th>Gloss or Restrictions</th>
						</tr>
						<xsl:variable name="sExampleValue0">
<xsl:value-of select="translate(string(//np/possAlienableAffixExample),'.','')" />
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
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, nouns </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possAgr='no'">are not</xsl:when>
						<xsl:when test="//np/@possAgr='yes'">are</xsl:when>
					</xsl:choose>
<xsl:text> marked with an affix which either agrees with the possessor or expresses the possessor by itself.  </xsl:text>
<xsl:if test="normalize-space(//np/@possAgr)='yes'">
					   <xsl:text>See the dependent personal pronouns used for possessors, given in section </xsl:text>
<sectionRef sec="sPronPersonal" />
<xsl:text>. These affixes mark the following features of the possessor:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="normalize-space(//np/@possAgr)='yes'">
<example num="xNP.NPPoss.NPPossAgreement.14">
<table border="1">
						<tr>
							<th>Type of feature</th>
							<th>Feature</th>
						</tr>
						<xsl:if test="normalize-space(//np/npPossAgrPossFirst/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>person</xsl:text>
							</td>
							<td align="left">
								<xsl:text>first</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossExclusive/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>person</xsl:text>
							</td>
							<td align="left">
								<xsl:text>first exclusive</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossInclusive/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>person</xsl:text>
							</td>
							<td align="left">
								<xsl:text>first inclusive</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossSecond/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>person</xsl:text>
							</td>
							<td align="left">
								<xsl:text>second</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossThird/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>person</xsl:text>
							</td>
							<td align="left">
								<xsl:text>third</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossSingular/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>number</xsl:text>
							</td>
							<td align="left">
								<xsl:text>singular</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossDual/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>number</xsl:text>
							</td>
							<td align="left">
								<xsl:text>dual</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossPlural/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>number</xsl:text>
							</td>
							<td align="left">
								<xsl:text>plural</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossMasculine/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>gender</xsl:text>
							</td>
							<td align="left">
								<xsl:text>masculine</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossFeminine/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>gender</xsl:text>
							</td>
							<td align="left">
								<xsl:text>feminine</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossNeuter/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>gender</xsl:text>
							</td>
							<td align="left">
								<xsl:text>neuter</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossAnimate/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>animacy</xsl:text>
							</td>
							<td align="left">
								<xsl:text>animate</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossInanimate/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>animacy</xsl:text>
							</td>
							<td align="left">
								<xsl:text>inanimate</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossHuman/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>animacy</xsl:text>
							</td>
							<td align="left">
								<xsl:text>human</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossNonHuman/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>animacy</xsl:text>
							</td>
							<td align="left">
								<xsl:text>nonhuman</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="normalize-space(//np/npPossAgrPossClassClassNumber/@checked)='yes'">
<tr>
							<td align="left">
								<xsl:text>class</xsl:text>
							</td>
							<td align="left">
								<xsl:text>class_##</xsl:text>
							</td>
						</tr>
</xsl:if>
					</table>
</example>
</xsl:if>
			</section3>
		</section2>
		<section2 id="sNPQP">
			<secTitle>Quantifier Phrase Modifiers</secTitle>
			<p>
<xsl:text>Quantifier phrases (QP) were discussed earlier in section </xsl:text>
<sectionRef sec="sQP" />
<xsl:text>.  Such modifiers mark the number of the whole nominal phrase.  English examples of quantified nominal phrases include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those very few books</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s many dogs</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only the first one hundred boys</langData>
<xsl:text>.  All the quantifier phrases occur before the noun in English.</xsl:text>
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
<xsl:text>, quantifier phrases occur </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@qpPos='before'">before</xsl:when>
					<xsl:when test="//np/@qpPos='after'">after</xsl:when>
					<xsl:when test="//np/@qpPos='either'">on either side (but not both sides) of</xsl:when>
					<xsl:when test="//np/@qpPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
					<xsl:when test="//np/@qpPos='beforeOrBoth'">before or on both sides of</xsl:when>
					<xsl:when test="//np/@qpPos='afterOrBoth'">after or on both sides of</xsl:when>
					<xsl:when test="//np/@qpPos='both'">on both sides of</xsl:when>
					<xsl:when test="//np/@qpPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="normalize-space(//np/@qpEither)='unrestricted' and normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='after' and normalize-space(//np/@qpPos)!='unknown'">
					<xsl:text>All of quantifier phrases can occur on either side of the noun. </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@qpEither)='restricted' and normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='after'">
					<xsl:text>There are restrictions as to which of the quantifier phrases can occur on each side of the noun.  </xsl:text>
					<xsl:if test="normalize-space(//np/@qpEitherRestrictedNumPos)='before' and normalize-space(//np/@qpEither)='unrestricted' and normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='after'">
						<xsl:text>All of the numbers occur before the noun. </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//np/@qpEitherRestrictedNumPos)='after' and normalize-space(//np/@qpEither)='unrestricted' and normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='after'">
						<xsl:text>All of the numbers occur after the noun. </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples of quantified nominal phrases include:</xsl:text>
</p>
			<example num="xNP.NPQP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/qpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/qpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/qpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/qpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPQP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPQP.8.1</xsl:text>
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
		   <xsl:if test="normalize-space(//np/@qpAgree)='yes' and normalize-space(//np/@agreeOther)='yesClass' and normalize-space(//typology/@classifier)!='no' or normalize-space(//np/@qpAgree)='yes' and normalize-space(//np/@agreeOther)='yesAnimacy' or normalize-space(//np/@qpAgree)='yes' and normalize-space(//np/@agreeOther)='yesGender'">
<p>
<xsl:text>Like other modifiers within the nominal phrase, quantifier phrases in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> show agreement with the head noun in </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeOther='yesAnimacy'">animacy.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesClass'">class number.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesGender'">gender.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
		</section2>
		<section2 id="sNPAdjP">
			<secTitle>Adjective Phrase Modifiers</secTitle>
			<p>
<xsl:text>Adjective phrases (AdjP) were discussed earlier in section </xsl:text>
<sectionRef sec="sAdjP" />
<xsl:text>.  Adjective phrases occur close to the noun, yielding nominal phrases such as:</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just those very few old, dirty books</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all the boy’s many black dogs</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only the first one hundred very eager young boys</langData>
<xsl:text>.  As the English examples show, adjectives all occur before the noun, and more than one adjective phrase is allowed.  This is handled by a recursive rule.</xsl:text>
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
<xsl:text>, adjective phrases occur </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@adjpPos='before'">before</xsl:when>
					<xsl:when test="//np/@adjpPos='after'">after</xsl:when>
					<xsl:when test="//np/@adjpPos='either'">on either side (but not both sides) of</xsl:when>
					<xsl:when test="//np/@adjpPos='eitherOrBoth'">on either side or on both sides of</xsl:when>
					<xsl:when test="//np/@adjpPos='beforeOrBoth'">before or on both sides of</xsl:when>
					<xsl:when test="//np/@adjpPos='afterOrBoth'">after or on both sides of</xsl:when>
					<xsl:when test="//np/@adjpPos='both'">on both sides of</xsl:when>
					<xsl:when test="//np/@adjpPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="normalize-space(//np/@adjpEither)='unrestricted' and normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
					<xsl:text>All of the adjective phrases can occur on either side of the noun. </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@adjpEither)='restricted' and normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='after'">
					<xsl:text>There are restrictions as to which of the adjective phrases can occur on each side of the noun. </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples of nominal phrases which are modified by qualitative adjectives include:</xsl:text>
</p>
			<example num="xNP.NPAdjP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/adjpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/adjpExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/adjpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/adjpExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPAdjP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPAdjP.8.1</xsl:text>
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
			<xsl:if test="normalize-space(//np/@adjpAgree)='yes' and normalize-space(//np/@agreeOther)='yesClass' and normalize-space(//typology/@classifier)!='no' or normalize-space(//np/@adjpAgree)='yes' and normalize-space(//np/@agreeOther)='yesAnimacy' or normalize-space(//np/@adjpAgree)='yes' and normalize-space(//np/@agreeOther)='yesGender'">
<p>
<xsl:text>Like other modifiers within the nominal phrase, adjective phrases in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> show agreement with the head noun in </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeOther='yesAnimacy'">animacy.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesClass'">class number.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesGender'">gender.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
		</section2>
	   <section2 id="sNPParticiples">
		  <secTitle>Participles and Gerunds</secTitle>
	   <p>
<xsl:text>Participles or participle phrases may also act as adjectives in modifying a noun.  Some English examples with the participle or participle phrase bracketed  include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the bright, [shining] sun, my [crying] child</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the books [loved by millions].</langData>
</p>
			<p>
<xsl:text>  Examples in </xsl:text>
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
			<example num="xNP.NPParticiples.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/partExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/partExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPParticiples.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiples.8.1</xsl:text>
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
<xsl:text>Another case which may look like a noun and a complement may actually be a gerund or gerund phrase.  This whole phrase occupies a normal argument position, such as subject, object, indirect object or the object of a preposition.  Some English examples in full sentences with the gerund phrase bracketed include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Studying participles] is challenging, He likes [reading Latin poetry]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The receiver showed his worth by [making the catch].</langData>
<xsl:text>  Such phrases may be possessed or be modified as well, and sometimes only the gerund stands alone as the head of a nominal phrase, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the badly wounded, the dying</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>your following.</langData>
<xsl:text> Therefore, we will allow gerund phrases to occupy the head of the nominal phrase.</xsl:text>
</p>
		  <p>
<xsl:text>Examples from </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> of gerunds or gerund phrases that can take the place of a noun in a nominal phrase include:</xsl:text>
</p>
		  <example num="xNP.NPParticiples.14">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partHeadExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/partHeadExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partHeadExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/partHeadExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPParticiples.14</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiples.14.1</xsl:text>
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
<xsl:text>These gerund phrases can be used in full sentences as shown here:</xsl:text>
</p>
		  <example num="xNP.NPParticiples.18">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partHeadSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/partHeadSentExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partHeadSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/partHeadSentExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPParticiples.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiples.18.1</xsl:text>
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
		<section2 id="sNPCompounds">
			<secTitle>Noun Compounds</secTitle>
			<p>
<xsl:text>Many languages are like English, in that they have noun modifiers.  It may seem like all nouns can also be used as adjectives, but a closer look reveals that true adjectives come before the noun modifier, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>large, round [syrup bottle]</langData>
<xsl:text> but not </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>*round, syrup large bottle</langData>
<xsl:text>.  Therefore, noun modifiers will be treated as compound nouns which are written as separate words.</xsl:text>
</p>
			<p>
<xsl:text>In the English examples above, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>bottle</langData>
<xsl:text> is clearly the head noun rather than </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>syrup</langData>
<xsl:text>, because </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>syrup</langData>
<xsl:text> is restricting the type of </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>bottle</langData>
<xsl:text>, not the other way around.  In all compound nouns and noun modifier constructions in English, the head is the right-most noun in the series.</xsl:text>
</p>
			<xsl:if test="normalize-space(//np/@comp)='no'">
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
<xsl:text> does not  have any compound nouns or noun modifiers that are written as separate words.  They are all written as a single word with the head noun.  Examples include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@comp)='yes'">
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
<xsl:text> has compound nouns or noun modifiers that are written as separate words.  The </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@compHead='left'">left-most</xsl:when>
					<xsl:when test="//np/@compHead='right'">right-most</xsl:when>
				</xsl:choose>
<xsl:text> noun is the head in these constructions.   Examples include:</xsl:text>
</p>
</xsl:if>
			<example num="xNP.NPCompounds.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/compExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/compExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/compExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/compExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPCompounds.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPCompounds.12.1</xsl:text>
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
		<section2 id="sNPPP">
			<secTitle>PP Modifiers or Complements</secTitle>
			<p>
<xsl:text>Both simple and compound nouns may have pre/post-positional phrase (PP) modifiers or complements, such as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the large, round bottle [of syrup]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s letter [to that girl]</langData>
<xsl:text>.  In addition, genitive pre/post-positional phrases may take the place of the possessor, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those dogs [of his]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the tablecloth [of my mother’s]</langData>
<xsl:text>.    In English, the PP always comes after the noun.</xsl:text>
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
<xsl:text>, the PP occurs </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@ppPos='before'">before</xsl:when>
					<xsl:when test="//np/@ppPos='after'">after</xsl:when>
					<xsl:when test="//np/@ppPos='either'">on either side of</xsl:when>
					<xsl:when test="//np/@ppPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> the head noun.  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='en'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='en'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples with PP modifiers or complements include:</xsl:text>
</p>
			<example num="xNP.NPPP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/compPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//np/compPPExample))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/compPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//np/compPPExample))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPP.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPP.8.1</xsl:text>
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
<xsl:text>See section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> for more details on PPs in </xsl:text>
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

		</section2>
	</section1>











































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































 </xsl:template>
</xsl:stylesheet>
