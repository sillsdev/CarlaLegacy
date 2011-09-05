<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="np">
	<section1 id="sNP">
		<secTitle>Nominal Phrases</secTitle>
		<p>
<xsl:text>Nominal phrases can be very complex.  This section concentrates on those with common nouns as the lexical head.  Modification by articles, demonstratives, possessors, quantifiers and degree words, adjective phrases, and </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
				<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
				<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
			</xsl:choose>
<xsl:text> phrases is considered.  Participles are covered at the end of this section, but see section </xsl:text>
<sectionRef sec="sNPCompounds" />
<xsl:text> for noun compounds whether or not they are written as a single word.  Nominal phrases headed by proper names are discussed in section </xsl:text>
<sectionRef sec="sProp" />
<xsl:text> and those headed by pronouns, demonstratives, and quantifiers are handled in section </xsl:text>
<sectionRef sec="sPronNP" />
<xsl:text>.  Relative clauses, which normally come at the end of a nominal phrase, are covered in section </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
		<p>
<xsl:text>The basic order of elements allowed in nominal phrases in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> is:</xsl:text>
</p>
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@possCooccur)='yes' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@possCooccur)='yes' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@possCooccur)='yes' or normalize-space(//np/@artAndDem)='no'">
<example num="xNP.8">
<table>
				<tr>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='after' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='after' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='after'">
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
						<xsl:text>(Quant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
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
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Quant)</xsl:text>
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
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='before'">
<td align="left">
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
				</tr>
			</table>
</example>
</xsl:if>
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@possCooccur)='yes'">
<example num="xNP.10">
<table>
				<tr>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='after' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='after' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='after'">
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
						<xsl:text>(Quant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
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
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Quant)</xsl:text>
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
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='before'">
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
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='after' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='after' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='after'">
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
						<xsl:text>(Quant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
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
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Quant)</xsl:text>
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
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='before'">
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
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='after' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='after' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='after'">
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
						<xsl:text>(Quant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
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
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Quant)</xsl:text>
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
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='before'">
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
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='after' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='after' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='after'">
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
						<xsl:text>(Quant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
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
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Quant)</xsl:text>
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
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='before'">
<td align="left">
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
				</tr>
			</table>
</example>
</xsl:if>
		<p>
<xsl:text>Each of these phrases will be discussed and exemplified in the following sections.</xsl:text>
</p>
		<section2 id="sNPDegree">
			<secTitle>Special Degree Words including "All" and "Not"</secTitle>
			<p>
<xsl:text>
Working from the outside in toward the noun, the outer level of the nominal phrase is occupied by those degree words that modify the whole phrase, such as </xsl:text>
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
<xsl:text>.  To review the facts for </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>,  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='no'">
					<xsl:text>these are not expressed as separate words.  Instead, they all attach to another word in the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes'">
					<xsl:text>these are expressed as separate words which occur </xsl:text>
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
					<xsl:text> the rest of the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yesPos'">
					<xsl:text>the positive special degree elements are expressed as separate words which occur </xsl:text>
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
					<xsl:text> the rest of the nominal phrase.  The negative special degree elements, however, are not expressed as separate words.  Instead, they attach to another word in the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yesNeg'">
					<xsl:text>the negative special degree elements are expressed as separate words which occur </xsl:text>
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
					<xsl:text> the rest of the nominal phrase.  The positive special degree elements, however, are not expressed as separate words.  Instead, they attach to another word in the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesPos'">
<p>
<xsl:text>Examples of the positive special degree words in nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesPos'">
<example num="xNP.NPDegree.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//qp/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(normalize-space(//qp/example))" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and normalize-space($sExampleValue) != ''">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//qp/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(normalize-space(//qp/example))" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPDegree.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.8.1</xsl:text>
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
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg'">
<p>
<xsl:text>Examples of the negative special degree elements in nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesNeg'">
<example num="xNP.NPDegree.12">
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
<xsl:with-param name="sExNumber">xNP.NPDegree.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPDegree.12.1</xsl:text>
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
		</section2>
		<section2 id="sNPArtDem">
			<secTitle>Articles and Demonstratives</secTitle>
			<p>
<xsl:text>Articles and/or demonstratives normally comprise the next level moving inward towards the noun.  In English, articles and demonstratives do not co-occur in the same nominal phrase, but they both occur before the noun.  Some languages allow both to co-occur in the same phrase, and they may occur in different positions with respect to the noun.  Therefore, they need distinct syntactic categories.  Some languages only have one set, either articles or demonstratives.  A few languages may not have either type expressed as separate words.</xsl:text>
</p>
			<p>
<xsl:text>As seen in section </xsl:text>
<sectionRef sec="sAdjArtDem" />
<xsl:text>, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
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
				</xsl:if>
<xsl:text></xsl:text>
</p>
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
					<xsl:text>In the singular forms, an article is required </xsl:text>
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
					<xsl:text>An article is required to appear </xsl:text>
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
					<xsl:text>In the singular forms, a demonstrative is required </xsl:text>
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
					<xsl:text>A demonstrative is required to appear </xsl:text>
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
					<xsl:text>In the singular forms, an article or a demonstrative is required </xsl:text>
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
					<xsl:text>An article or a demonstrative is required to appear </xsl:text>
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
<xsl:text>co-occur in the same nominal phrase.  The demonstrative occurs </xsl:text>
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
					<xsl:text>In the singular forms, a demonstrative is required </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtDemRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtDemRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtDemRequiredPos='both'">to appear both before and after the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtDemRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes'">
					<xsl:text>A demonstrative is required to appear </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='both'">both before and after the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
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
					<xsl:text>In the singular forms, an article is required </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtArtRequiredPos='before'">before the noun and one may also optionally appear after the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtArtRequiredPos='after'">after the noun and one may also optionally appear before the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtArtRequiredPos='both'">to appear both before and after the noun.</xsl:when>
						<xsl:when test="//np/@demAndArtArtRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='yes'">
					<xsl:text>An article is required to appear </xsl:text>
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
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<example num="xNP.NPArtDem.18">
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
<xsl:with-param name="sExNumber">xNP.NPArtDem.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPArtDem.18.1</xsl:text>
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
		</section2>
		<section2 id="sNPPoss">
			<secTitle>Possessors</secTitle>
			<p>
<xsl:text>Possession can normally be expressed by a possessive pronoun (as seen in section </xsl:text>
<sectionRef sec="sPronPoss" />
<xsl:text>), by a simple noun, or by a full nominal phrase.
					However, Spanish only allows possessive pronouns in the possessor position before the noun, with all noun and full nominal phrase possessors expressed in a prepositional phrase with </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>de</langData>
<xsl:text> after the noun.</xsl:text>
</p>
			<p>
<xsl:text>Within the languages which express possessors by nouns or full nominal phrases as well as by possessive pronouns, many also add some kind of marking, such as the </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>'s</langData>
<xsl:text> in English, as an indication of possession.  These markings are either affixes (or clitics) on the head noun or phrase-level clitics which attach to one end of the whole phrase.  The English marking is this second type, because alongside phrases where the </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>'s</langData>
<xsl:text> appears to attach to the head noun, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy's mother</langData>
<xsl:text>, there are phrases which clearly show that the clitic attaches to the end of the whole nominal phrase, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy that I just talked to's mother</langData>
<xsl:text> or </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the girl in green's wonderful speech</langData>
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
</xsl:attribute>the boy's sister's dog</langData>
<xsl:text>.  This is allowed in Spanish within the prepositional phrase after the noun.</xsl:text>
</p>
			<p>
<xsl:text>Examples of possessed nominal phrases with simple and embedded possessors in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<p>
<xsl:text>Examples with </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrases within the possessor include:</xsl:text>
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
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
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
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<p>
<xsl:text>As seen in the examples above, </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//np/@possMarked='no'"> does not have any special marking to distinguish possessors from any other nominal phrase.</xsl:when>
					<xsl:when test="//np/@possMarked='yesAffix'"> marks the head noun within the possessor with an affix to distinguish possessors from any other nominal phrase.</xsl:when>
					<xsl:when test="//np/@possMarked='yesClitic'"> marks the whole possessive phrase with a phrasal clitic to distinguish possessors from any other nominal phrase.</xsl:when>
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
<xsl:text>The possessor (especially the possessive pronoun form, if  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
				<p>
<xsl:text>In English, possessors and articles or demonstratives do not co-occur in the same nominal phrase, unless the possessor is expressed in a prepositional phrase.  For example, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those [the boy's] books</langData>
<xsl:text> is ungrammatical; instead one would use </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those books [of his]</langData>
<xsl:text> to express the same thought.  Some languages allow both possessors and articles or demonstratives to occur in the same phrase, so the first example above would be grammatical.</xsl:text>
</p>
				<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, nominal possessors </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCooccur='yes'">may</xsl:when>
						<xsl:when test="//np/@possCooccur='no'">may not</xsl:when>
					</xsl:choose>
<xsl:text> occur in the same phrase as </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@artAndDem='article'">articles.</xsl:when>
						<xsl:when test="//np/@artAndDem='demonstrative'">demonstratives.</xsl:when>
						<xsl:when test="//np/@artAndDem='both'">articles and/or demonstratives.</xsl:when>
					</xsl:choose>
</p>
		</section2>
		<section2 id="sNPQP">
			<secTitle>Quantifier Phrase Modifiers</secTitle>
			<p>
<xsl:text>Quantifier phrases fill the next level inward toward the noun.  This position includes both numbers (section </xsl:text>
<sectionRef sec="sAdjNumbers" />
<xsl:text>) and other quantifiers and degree words (section </xsl:text>
<sectionRef sec="sQPOtherQuantifiers" />
<xsl:text>).  Such modifiers mark the number of the whole nominal phrase.  English examples of quantified nominal phrases include: </xsl:text>
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
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<xsl:if test="normalize-space(//np/@qpAgree)='yes'">
<p>
<xsl:text>Like other modifiers within the nominal phrase, quantifier phrases in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:text>Adjective phrases were discussed earlier in section </xsl:text>
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
<xsl:text>.  As the English examples show, adjectives all occur before the noun, and, unlike the other modifiers discussed so far, more than one adjective phrase is allowed.</xsl:text>
</p>
			<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
<xsl:call-template name="DoWordGloss" />
<xsl:call-template name="DoMorphemeGloss" />
</lineGroup>
<xsl:call-template name="DoFree" />
</listInterlinear>
</xsl:otherwise>
</xsl:choose>
</example>
			<xsl:if test="normalize-space(//np/@adjpAgree)='yes'">
<p>
<xsl:text>Like other modifiers within the nominal phrase, adjective phrases in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
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
		<section2 id="sNPPP">
			<secTitle>            <xsl:choose>
				<xsl:when test="//pp/@pPos='before'">Prepositional Phrase Modifiers or Complements</xsl:when>
				<xsl:when test="//pp/@pPos='after'">Postpositional Phrase Modifiers or Complements</xsl:when>
				<xsl:when test="//pp/@pPos='both'">Prepositional and Postpositional Phrase Modifiers or Complements</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">Prepositional and/or Postpositional Phrase Modifiers or Complements</xsl:when>
			</xsl:choose>
</secTitle>
			<p>
<xsl:text>Both simple and compound nouns may have </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrase modifiers or complements, such as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the large, round bottle [of syrup]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy’s letter [to that girl]</langData>
<xsl:text>.  In addition, genitive </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrases may take the place of the possessor, such as </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>those dogs [of his]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the tablecloth [of my mother's]</langData>
<xsl:text>.    In English, the prepositional phrase always comes after the noun.</xsl:text>
</p>
			<p>
<xsl:text>In </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, the </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrase occurs </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@ppPos='before'">before</xsl:when>
					<xsl:when test="//np/@ppPos='after'">after</xsl:when>
					<xsl:when test="//np/@ppPos='either'">on either side of</xsl:when>
					<xsl:when test="//np/@ppPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> the head noun.  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> examples with </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and/or postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrase modifiers or complements include:</xsl:text>
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
<sectionRef sec="sPP" />
<xsl:text> for more details on </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">prepositional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">prepositional and postpositional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">prepositional and/or postpositional</xsl:when>
				</xsl:choose>
<xsl:text> phrases in </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
		</section2>
<section2 id="sNPParticiple">
	<secTitle>Participles</secTitle>
		<p>
<xsl:text>Another case which may look like a noun and a complement may actually be a participle phrase (also called a gerund).  This whole phrase occupies a normal argument position, such as subject, object, indirect object or the object of a preposition.  Some English examples in full sentences with the participle phrase bracketed include: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Studying participles] is challenging, He likes [reading Latin poetry]</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>The receiver showed his worth by [making the catch].</langData>
<xsl:text>  Such phrases may be possessed or be modified as well, and sometimes only the participle stands alone as the head of a nominal phrase, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the badly wounded, the dying</langData>
<xsl:text> and </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>your following.</langData>
</p>
			<p>
<xsl:text>Examples from </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> of participles or participle phrases that can take the place of a noun in a nominal phrase include:</xsl:text>
</p>
			<example num="xNP.NPParticiple.8">
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
<xsl:with-param name="sExNumber">xNP.NPParticiple.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiple.8.1</xsl:text>
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
<xsl:text>These participle phrases can be used in full sentences as shown here:</xsl:text>
</p>
			<example num="xNP.NPParticiple.12">
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
<xsl:with-param name="sExNumber">xNP.NPParticiple.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiple.12.1</xsl:text>
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
<xsl:when test="string-length(normalize-space(//language/langName)) &gt; 0">
<xsl:value-of select="normalize-space(//language/langName)" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> include:</xsl:text>
</p>
	<example num="xNP.NPParticiple.18">
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
<xsl:with-param name="sExNumber">xNP.NPParticiple.18</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPParticiple.18.1</xsl:text>
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
