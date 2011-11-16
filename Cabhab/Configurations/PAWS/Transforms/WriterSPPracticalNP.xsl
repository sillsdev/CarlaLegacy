<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="np">
	<section1 id="sNP">
		<secTitle>Las frases nominales</secTitle>
		<p>
<xsl:text>Las frases nominales pueden ser muy complejas.  Esta sección se enfoca en las frases que tienen sustantivos comunes como el núcleo. Se consideran la modificación producida por los artículos, los demostrativos, los poseedores, los cuantificadores y las palabras de grado, las frases del adjetivo y las frases  </xsl:text>
<xsl:choose>
				<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='both'">preposicional y/o posposicionales</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">preposicional y/o posposicionales</xsl:when>
			</xsl:choose>
<xsl:text>. El tema de los participios se trata al final de esta sección, pero véase la sección </xsl:text>
<sectionRef sec="sNPCompounds" />
<xsl:text> para considerar los sustantivos compuestos si se escriben como una sola palabra o no. Las frases nominales que tienen nombres propios como núcleo se analizan en la sección </xsl:text>
<sectionRef sec="sProp" />
<xsl:text> y las frases que tienen pronombres, demostrativos o cuantificadores como núcleo se analizan en la sección </xsl:text>
<sectionRef sec="sPronNP" />
<xsl:text>.  Las cláusulas relativas, que normalmente aparecen al final de una frase nominal, se tratan en la sección </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
		<p>
<xsl:text>El orden básico de los elementos permitidos en frases nominales en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es:</xsl:text>
</p>
		<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@possCooccur)='yes' or normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@possCooccur)='yes' or normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@possCooccur)='yes' or normalize-space(//np/@artAndDem)='no'">
<example num="xNP.8">
<table>
				<tr>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='after' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='after' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='after'">
<td align="left">
						<xsl:text>(Grado)</xsl:text>
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
						<xsl:text>(Pos)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='after' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Cuant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='after' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(FP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@compHead)='right' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>((S) S)</xsl:text>
					</td>
</xsl:if>
					<td align="left">
						<xsl:text>Sustantivo</xsl:text>
					</td>
					<xsl:if test="normalize-space(//np/@compHead)='left' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>(S (S))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='before' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(FP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Cuant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@possNounPos)!='before' and normalize-space(//np/@possNounPos)!='unknown'">
<td align="left">
						<xsl:text>(Pos)</xsl:text>
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
						<xsl:text>(Grado)</xsl:text>
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
						<xsl:text>(Grado)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@possCooccur)='yes' and normalize-space(//np/@demOrArtPos)!='after'">
<td align="left">
						<xsl:text>(Dem/Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@possNounPos)!='after' and normalize-space(//np/@possNounPos)!='unknown'">
<td align="left">
						<xsl:text>(Pos)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='after' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Cuant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='after' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(FP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@compHead)='right' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>((S) S)</xsl:text>
					</td>
</xsl:if>
					<td align="left">
						<xsl:text>Sustantivo</xsl:text>
					</td>
					<xsl:if test="normalize-space(//np/@compHead)='left' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>(S (S))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='before' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(FP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Cuant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@possNounPos)!='before' and normalize-space(//np/@possNounPos)!='unknown'">
<td align="left">
						<xsl:text>(Pos)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@possCooccur)='yes' and normalize-space(//np/@demOrArtPos)!='before'">
<td align="left">
						<xsl:text>(Art/Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='before'">
<td align="left">
						<xsl:text>(Grado)</xsl:text>
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
						<xsl:text>(Grado)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demAndArtArtPos)!='after' and normalize-space(//np/@demAndArtDemPos)!='after' and normalize-space(//np/@possNounPos)!='after' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demOrArtPos)!='after' and normalize-space(//np/@possNounPos)!='after'">
<td align="left">
						<xsl:text>(Dem/Art/Pos)</xsl:text>
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
						<xsl:text>(Cuant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='after' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(FP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@compHead)='right' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>((S) S)</xsl:text>
					</td>
</xsl:if>
					<td align="left">
						<xsl:text>Sustantivo</xsl:text>
					</td>
					<xsl:if test="normalize-space(//np/@compHead)='left' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>(S (S))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='before' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(FP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Cuant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demAndArtArtPos)!='before' and normalize-space(//np/@demAndArtDemPos)!='before' and normalize-space(//np/@possNounPos)!='before' or normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demOrArtPos)!='before' and normalize-space(//np/@possNounPos)!='before'">
<td align="left">
						<xsl:text>(Pos/Art/Dem)</xsl:text>
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
						<xsl:text>(Grado)</xsl:text>
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
						<xsl:text>(Grado)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demPos)!='after' and normalize-space(//np/@possNounPos)!='after'">
<td align="left">
						<xsl:text>(Dem/Pos)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@possNounPos)='after'">
<td align="left">
						<xsl:text>(Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='after' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Cuant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='after' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(FP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@compHead)='right' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>((S) S)</xsl:text>
					</td>
</xsl:if>
					<td align="left">
						<xsl:text>Sustantivo</xsl:text>
					</td>
					<xsl:if test="normalize-space(//np/@compHead)='left' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>(S(S))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='before' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(FP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Cuant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demPos)!='before' and normalize-space(//np/@possNounPos)!='before'">
<td align="left">
						<xsl:text>(Pos/Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@possNounPos)='before'">
<td align="left">
						<xsl:text>(Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='before'">
<td align="left">
						<xsl:text>(Grado)</xsl:text>
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
						<xsl:text>(Grado)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@artPos)!='after' and normalize-space(//np/@possNounPos)!='after'">
<td align="left">
						<xsl:text>(Art/Pos)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@possNounPos)='after'">
<td align="left">
						<xsl:text>(Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='after' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Cuant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='after' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(FP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@compHead)='right' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>((S) S)</xsl:text>
					</td>
</xsl:if>
					<td align="left">
						<xsl:text>Sustantivo</xsl:text>
					</td>
					<xsl:if test="normalize-space(//np/@compHead)='left' and normalize-space(//np/@comp)='yes'">
<td align="left">
						<xsl:text>(S (S))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@ppPos)!='before' and normalize-space(//np/@ppPos)!='unknown'">
<td align="left">
						<xsl:text>(FP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='unknown'">
<td align="left">
						<xsl:text>(Adj)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='unknown'">
<td align="left">
						<xsl:text>(Cuant)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@artPos)!='before' and normalize-space(//np/@possNounPos)!='before'">
<td align="left">
						<xsl:text>(Pos/Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@possCooccur)='no' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@possNounPos)='before'">
<td align="left">
						<xsl:text>(Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)!='before' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)!='before'">
<td align="left">
						<xsl:text>(Grado)</xsl:text>
					</td>
</xsl:if>
				</tr>
			</table>
</example>
</xsl:if>
		<p>
<xsl:text>Cada una de estas frases será analizada y ejemplificada en las secciones siguientes.</xsl:text>
</p>
		<section2 id="sNPDegree">
			<secTitle>Las palabras especiales de grado como modificadores</secTitle>
			<p>
<xsl:text>
					Empezando con el exterior de la frase nominal, esta posición se ocupa por las palabras de grado que modifican a la frase completa, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>todos</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>casi</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>apenas</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>solamente</langData>
<xsl:text>, y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>no</langData>
<xsl:text>.  Las palabras especiales de grado fueron analizadas en la sección </xsl:text>
<sectionRef sec="sQPAll" />
<xsl:text>.  Para repasar los detalles en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>,  </xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='no'">
					<xsl:text>las palabras especiales de grado no se expresan como palabras independientes. Por el contrario, todos se unen a otra palabra de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yes'">
					<xsl:text>las palabras especiales de grado se expresan como palabras independientes que se presentan </xsl:text>
					<xsl:choose>
						<xsl:when test="//qp/@npDegreePos='before'">antes</xsl:when>
						<xsl:when test="//qp/@npDegreePos='after'">después</xsl:when>
						<xsl:when test="//qp/@npDegreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
						<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
						<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">antes o en ambos lados</xsl:when>
						<xsl:when test="//qp/@npDegreePos='afterOrBoth'">después o en ambos lados</xsl:when>
						<xsl:when test="//qp/@npDegreePos='both'">en ambos lados</xsl:when>
						<xsl:when test="//qp/@npDegreePos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text> del resto de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yesPos'">
					<xsl:text>los elementos especiales positivos de grado se expresan como palabras independientes que se presentan </xsl:text>
					<xsl:choose>
						<xsl:when test="//qp/@npDegreePos='before'">antes</xsl:when>
						<xsl:when test="//qp/@npDegreePos='after'">después</xsl:when>
						<xsl:when test="//qp/@npDegreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
						<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
						<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">antes o en ambos lados</xsl:when>
						<xsl:when test="//qp/@npDegreePos='afterOrBoth'">después o en ambos lados</xsl:when>
						<xsl:when test="//qp/@npDegreePos='both'">en ambos lados</xsl:when>
						<xsl:when test="//qp/@npDegreePos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text> del resto de la frase nominal.  Sin embargo, los elementos especiales negativos de grado no se expresan como palabras independientes. Por el contrario, se unen a otra palabra de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//qp/@npDegree)='yesNeg'">
					<xsl:text>los elementos especiales negativos de grado se expresan como palabras independientes que se presentan </xsl:text>
					<xsl:choose>
						<xsl:when test="//qp/@npDegreePos='before'">antes</xsl:when>
						<xsl:when test="//qp/@npDegreePos='after'">después</xsl:when>
						<xsl:when test="//qp/@npDegreePos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
						<xsl:when test="//qp/@npDegreePos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
						<xsl:when test="//qp/@npDegreePos='beforeOrBoth'">antes o en ambos lados</xsl:when>
						<xsl:when test="//qp/@npDegreePos='afterOrBoth'">después o en ambos lados</xsl:when>
						<xsl:when test="//qp/@npDegreePos='both'">en ambos lados</xsl:when>
						<xsl:when test="//qp/@npDegreePos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text> del resto de la frase nominal.  Sin embargo, los elementos especiales positivos de grado no se expresan como palabras independientes. Por el contrario, se unen a otra palabra de la frase nominal.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//qp/@npDegree)='yes' or normalize-space(//qp/@npDegree)='yesPos'">
<p>
<xsl:text>Algunos ejemplos de las palabras especiales positivas de grado en frases nominales son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos ejemplos de los elementos especiales negativos de grado en frases nominales son: </xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
			<secTitle>Los artículos y demostrativos en la frase nominal</secTitle>
			<p>
<xsl:text>Los artículos y/o los demostrativos llenan normalmente el nivel siguiente cuando se mueve adentro hacia el sustantivo.
					En español, los artículos y los demostrativos no se presentan en la misma frase nominal, sino que ambos se presentan antes del sustantivo.
					Algunos idiomas permiten que ambos se presentan en la misma frase, y pueden presentarse en diversas posiciones con respecto al sustantivo.
					Por lo tanto, necesitan categorías sintácticas distintas. Algunos idiomas tienen solamente una categoría, los artículos o los demostrativos.
					Algunos idiomas no tienen cualquier tipo expresado como palabras independientes. </xsl:text>
</p>
			<p>
<xsl:text>Según lo visto en la sección </xsl:text>
<sectionRef sec="sAdjArtDem" />
<xsl:text>, en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artAndDem='no'"> no hay ni artículos ni demonstrativos que son palabras independientes.</xsl:when>
					<xsl:when test="//np/@artAndDem='article'"> solamente hay artículos que son palabras independientes, ningún demostrativo.</xsl:when>
					<xsl:when test="//np/@artAndDem='demonstrative'"> solamente hay demostrativos que son palabras independientes, ningún artículo.</xsl:when>
					<xsl:when test="//np/@artAndDem='both'"> hay los artículos y demostrativos que son palabras independientes.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
					<xsl:text> Los </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artAndDem='article'">artículos</xsl:when>
						<xsl:when test="//np/@artAndDem='demonstrative'">demostrativos</xsl:when>
						<xsl:when test="//np/@artAndDem='both'">artículos y demostrativos</xsl:when>
					</xsl:choose>
					<xsl:text> </xsl:text>
					<xsl:if test="normalize-space(//np/@artAndDem)!='no' and normalize-space(//np/@artCase)='no'">
						<xsl:text>no </xsl:text>
					</xsl:if>
					<xsl:text>se marcan para el caso.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="normalize-space(//np/@artAndDem)='article'">
<p>
<xsl:text>El artículo se presenta </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artPos='before'">antes</xsl:when>
					<xsl:when test="//np/@artPos='after'">después</xsl:when>
					<xsl:when test="//np/@artPos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//np/@artPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del sustantivo.  </xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artEither)='unrestricted'">
					<xsl:text>Todos los artículos pueden presentarse de cualquier lado del sustantivo.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artEither)='restricted'">
					<xsl:text>Hay estricciones en cuanto a cuáles de los artículos pueden presentarse en cualquier lado del sustantivo.</xsl:text>
				</xsl:if>
<xsl:text>  La presencia de un artículo es </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artRequired='no'">siempre opcional.</xsl:when>
					<xsl:when test="//np/@artRequired='mass'">opcional con sustantivos plurales o totales, pero se requiere con sustantivos singulares.</xsl:when>
					<xsl:when test="//np/@artRequired='yes'">siempre requirido.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass'">
					<xsl:text>En las formas singulares, un artículo se requiere presentarse </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artBothRequiredPos='before'">antes del sustantivo y uno también puede presentarse opcionalmente después del sustantivo.</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='after'">después del sustantivo y uno también puede presentarse opcionalmente antes del sustantivo.</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='both'">ambos antes y después del sustantivo.</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes'">
					<xsl:text>Un artículo se requiere presentarse </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artBothRequiredPos='before'">antes del sustantivo y uno también puede presentarse opcionalmente después del sustantivo.</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='after'">después del sustantivo y uno también puede presentarse opcionalmente antes del sustantivo.</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='both'">ambos antes y después del sustantivo.</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative'">
<p>
<xsl:text>El demostrativo se presenta </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demPos='before'">antes</xsl:when>
					<xsl:when test="//np/@demPos='after'">después</xsl:when>
					<xsl:when test="//np/@demPos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//np/@demPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del sustantivo.  </xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demEither)='unrestricted'">
					<xsl:text>Todos los demostrativos pueden presentarse de cualquier lado del sustantivo.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demEither)='restricted'">
					<xsl:text>Hay restricciones en cuanto a cuáles de los demostrativos pueden prsentarse en cualquier lado del sustantivo.</xsl:text>
				</xsl:if>
<xsl:text>  La presencia de un demostrativo es </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demRequired='no'">siempre opcional.</xsl:when>
					<xsl:when test="//np/@demRequired='mass'">opcional con sustantivos plurales o totales, pero se requiere con sustantivos singulares.</xsl:when>
					<xsl:when test="//np/@demRequired='yes'">siempre requirido.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass'">
					<xsl:text>En las formas singulares, un demostrativo se requiere presentarse </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demBothRequiredPos='before'">antes del sustantivo y uno también puede presentarse opcionalmente después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='after'">después del sustantivo y uno también puede presentarse opcionalmente antes del sustantivo.</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='both'">ambos antes y después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes'">
					<xsl:text>Un demostrativo se requiere presentarse </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demBothRequiredPos='before'">antes del sustantivo y uno también puede presentarse opcionalmente después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='after'">después del sustantivo y uno también puede presentarse opcionalmente antes del sustantivo.</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='both'">ambos antes y después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no'">
<p>
<xsl:text>Los artículos y los demonstrativos ambos presentarse en la misma posición, así que no se presenten en la misma frase nominal. Los artículos o los demostrativos se presentan </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demOrArtPos='before'">antes</xsl:when>
					<xsl:when test="//np/@demOrArtPos='after'">después</xsl:when>
					<xsl:when test="//np/@demOrArtPos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//np/@demOrArtPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del sustantivo.  </xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtEither)='unrestricted'">
					<xsl:text>Todos los artículos y demostrativos pueden presentarse de cualquier lado del sustantivo.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtEither)='restricted'">
					<xsl:text>Hay restricciones en cuanto a cuáles de los artículos y de los demostrativos pueden presentarse en cualquier lado del sustantivo.</xsl:text>
				</xsl:if>
<xsl:text>  La presencia de un artículo o un demostrativo es </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demOrArtRequired='no'">siempre opcional.</xsl:when>
					<xsl:when test="//np/@demOrArtRequired='mass'">opcional con sustantivos plurales o totales, pero se requiere con sustantivos singulares.</xsl:when>
					<xsl:when test="//np/@demOrArtRequired='yes'">siempre requirido.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass'">
					<xsl:text>En las formas singulares, un artículo o un demostrativo se requiere presentarse </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demOrArtBothRequiredPos='before'">antes del sustantivo y uno también puede presentarse opcionalmente después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='after'">después del sustantivo y uno también puede presentarse opcionalmente antes del sustantivo.</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='both'">para aparecer ambos antes y después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes'">
					<xsl:text>Un artículo o un demostrativo se requiere para aparecer </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demOrArtBothRequiredPos='before'">antes del sustantivo y uno también puede presentarse opcionalmente después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='after'">después del sustantivo y uno también puede presentarse opcionalmente antes del sustantivo.</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='both'">para aparecer ambos antes y después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)!='no'">
<p>
<xsl:text>Los artículos y los demostrativos no se presentan en la misma posición con respecto al sustantivo, </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artBothCooccur='different'">sino ambos no pueden </xsl:when>
					<xsl:when test="//np/@artBothCooccur='yes'">y que pueden ambos </xsl:when>
				</xsl:choose>
<xsl:text>presentarse en la misma frase nominal.  El demostrativo ocurre </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtDemPos='before'">antes</xsl:when>
					<xsl:when test="//np/@demAndArtDemPos='after'">después</xsl:when>
					<xsl:when test="//np/@demAndArtDemPos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//np/@demAndArtDemPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del sustantivo.  </xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemEither)='unrestricted'">
					<xsl:text>Todos los demostrativos pueden presentarse de cualquier lado del sustantivo.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemEither)='restricted'">
					<xsl:text>Hay restricciones en cuanto a cuáles de los demostrativos pueden presentarse en cualquier lado del sustantivo.</xsl:text>
				</xsl:if>
<xsl:text>  La presencia de un demostrativo es </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtDemRequired='no'">siempre opcional.</xsl:when>
					<xsl:when test="//np/@demAndArtDemRequired='mass'">opcional con sustantivos plurales o totales, pero se requiere con sustantivos singulares.</xsl:when>
					<xsl:when test="//np/@demAndArtDemRequired='yes'">siempre requirido.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass'">
					<xsl:text>En las formas singulares, un demostrativo se requiere presentarse </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtDemRequiredPos='before'">antes del sustantivo y uno también puede presentarse opcionalmente después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demAndArtDemRequiredPos='after'">después del sustantivo y uno también puede presentarse opcionalmente antes del sustantivo.</xsl:when>
						<xsl:when test="//np/@demAndArtDemRequiredPos='both'">ambos antes y después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demAndArtDemRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes'">
					<xsl:text>Un demostrativo se requiere presentarse </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='before'">antes del sustantivo y uno también puede presentarse opcionalmente después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='after'">después del sustantivo y uno también puede presentarse opcionalmente antes del sustantivo.</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='both'">ambos antes y después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text>  El artículo se presenta </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtArtPos='before'">antes</xsl:when>
					<xsl:when test="//np/@demAndArtArtPos='after'">después</xsl:when>
					<xsl:when test="//np/@demAndArtArtPos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//np/@demAndArtArtPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del sustantivo.  </xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtEither)='unrestricted'">
					<xsl:text>Todos los artículos pueden presentarse de cualquier lado del sustantivo.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtEither)='restricted'">
					<xsl:text>Hay restricciones en cuanto a cuáles de los artículos pueden presentarse en cualquier lado del sustantivo.</xsl:text>
				</xsl:if>
<xsl:text>  La presencia de un artículo es </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtArtRequired='no'">siempre opcional.</xsl:when>
					<xsl:when test="//np/@demAndArtArtRequired='mass'">opcional con sustantivos plurales o totales, pero se requiere con sustantivos singulares.</xsl:when>
					<xsl:when test="//np/@demAndArtArtRequired='yes'">siempre requirido.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='mass'">
					<xsl:text>En las formas singulares, un artículo se requiere presentarse </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtArtRequiredPos='before'">antes del sustantivo y uno también puede presentarse opcionalmente después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demAndArtArtRequiredPos='after'">después del sustantivo y uno también puede presentarse opcionalmente antes del sustantivo.</xsl:when>
						<xsl:when test="//np/@demAndArtArtRequiredPos='both'">ambos antes y después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demAndArtArtRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@artBothCooccur)!='no' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='yes'">
					<xsl:text>Un artículo se requiere presentarse </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtArtBothRequiredPos='before'">antes del sustantivo y uno también puede presentarse opcionalmente después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demAndArtArtBothRequiredPos='after'">después del sustantivo y uno también puede presentarse opcionalmente antes del sustantivo.</xsl:when>
						<xsl:when test="//np/@demAndArtArtBothRequiredPos='both'">ambos antes y después del sustantivo.</xsl:when>
						<xsl:when test="//np/@demAndArtArtBothRequiredPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="normalize-space(//np/@artAndDem)!='no'">
<p>
<xsl:text>Algunos ejemplos de las frases nominales incluyendo </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artAndDem='article'">los artículos</xsl:when>
					<xsl:when test="//np/@artAndDem='demonstrative'">los demostrativos</xsl:when>
					<xsl:when test="//np/@artAndDem='both'">los artículos y/o los demostrativos</xsl:when>
				</xsl:choose>
<xsl:text> según lo permitido en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
			<secTitle>Los poseedores</secTitle>
			<p>
<xsl:text>La posesión se puede expresar normalmente por un pronombre posesivo (según lo visto en la sección </xsl:text>
<sectionRef sec="sPronPoss" />
<xsl:text>), por un sustantivo simple, o por una frase nominal completa. El español permite solamente pronombres posesivos en la posición del poseedor antes del sustantivo,
					con todos los poseedores de sustantivos o frases nominales expresados en una frase preposicional con la preposición </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>de</langData>
<xsl:text>, después del sustantivo.</xsl:text>
</p>
			<p>
<xsl:text>Dentro de los idiomas que expresan a poseedores por sustantivos o frases nominales completas así como por pronombres posesivos, muchos también agregan un indicador, tal como el </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>'s</langData>
<xsl:text> en inglés, para indicar de la posesión.  Estos indicadores son afijos (o clíticos) del sustantivo principal o clíticos de la frase que se unen a un lado de la frase completa.
					El indicador de inglés es el segundo tipo, porque junto a frases donde el </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>'s</langData>
<xsl:text> se presenta unido al sustantivo principal, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy's mother</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'la madre del muchacho'</xsl:text>
</gloss>
<xsl:text>, hay las frases que demuestran claramente que el clítico se une al final de la frase nominal completo, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy that I just talked to's mother</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'la madre del muchacho que acabo de hablar con'</xsl:text>
</gloss>
<xsl:text> o </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the girl in green's wonderful speech</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'el discurso maravilloso de la muchacha en verde'</xsl:text>
</gloss>
<xsl:text>.  Estos ejemplos demuestran que los poseedores pueden incluir frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicionales y/o posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicionales y/o posposicionales</xsl:when>
				</xsl:choose>
<xsl:text> y cláusulas relativas. Los poseedores pueden también ser subordinados en uno otro, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy's sister's dog</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'el perro de la hermana del muchacho'</xsl:text>
</gloss>
<xsl:text>.  Esto se permite en español dentro de la frase preposicional después del sustantivo. </xsl:text>
</p>
			<p>
<xsl:text>Algunos ejemplos de frases nominales poseídas con los poseedores simples y subordinados en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos ejemplos con frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicionales y/o posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicionales y/o posposicionales</xsl:when>
				</xsl:choose>
<xsl:text> dentro del poseedor son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Algunos ejemplos con cláusulas relativas dentro del poseedor, incluido en oraciones completas son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Según lo visto anteriormente en los ejemplos,  en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//np/@possMarked='no'"> no hay un indicador especial para distinguir a poseedores de cualquier otra frase nominal.</xsl:when>
					<xsl:when test="//np/@possMarked='yesAffix'"> se indica el sustantivo principal dentro del poseedor con un afijo para distinguir a poseedores de cualquier otra frase nominal.</xsl:when>
					<xsl:when test="//np/@possMarked='yesClitic'"> se indica la frase posesiva completa con un clítico para distinguir a poseedores de cualquier otra frase nominal.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticAffix)='suffix'">
					<xsl:text> Este clítico es un enclítico que se une al final de cualquier palabra que termina el poseedor.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticAffix)='prefix'">
					<xsl:text> Este clítico es un proclítico que se une al inicio de cualquier palabra que comienza el poseedor.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possMarked)='yesClitic'">
					<xsl:text> Se escribe este clítico como una palabra independiente que se presenta </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@possCliticPossPos='before'">antes</xsl:when>
						<xsl:when test="//np/@possCliticPossPos='after'">después</xsl:when>
						<xsl:when test="//np/@possCliticPossPos='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text> del poseedor.  El clítico posesivo es </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@possCliticRequired='no'">opcional en algunos casos.</xsl:when>
						<xsl:when test="//np/@possCliticRequired='no'">siempre requirido.</xsl:when>
						<xsl:when test="//np/@possCliticRequired='unknown'">_______</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<p>
<xsl:text>El poseedor (especialmente la forma del pronombre posesivo, si  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> es como español) se presenta </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@possNounPos='before'">antes</xsl:when>
					<xsl:when test="//np/@possNounPos='after'">después</xsl:when>
					<xsl:when test="//np/@possNounPos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//np/@possNounPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del sustantivo que es poseído.</xsl:text>
</p>
				<p>
<xsl:text>En español y muchos otros idiomas, los poseedores y los artículos o los demonstrativos no se presentan en la misma frase nominal, a menos que expresen el poseedor en una frase preposicional. Por ejemplo, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>esos [sus] libros</langData>
<xsl:text> no es gramatical; por el contrario deciría </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>esos libros [de él]</langData>
<xsl:text> para expresar el mismo significado. Algunos idiomas permiten que los poseedores y los artículos o los demonstrativos se presentan en la misma frase, así que el primer ejemplo antedicho sería gramatical.</xsl:text>
</p>
				<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, los poseedores </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCooccur='yes'">puedan</xsl:when>
						<xsl:when test="//np/@possCooccur='no'">no puedan</xsl:when>
					</xsl:choose>
<xsl:text> presentarse en la misma frase que </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@artAndDem='article'">los artículos</xsl:when>
						<xsl:when test="//np/@artAndDem='demonstrative'">los demonstrativos</xsl:when>
						<xsl:when test="//np/@artAndDem='both'">los artículos y/o los demonstrativos</xsl:when>
					</xsl:choose>
<xsl:text> en la posición normal del poseedor.  </xsl:text>
<xsl:if test="normalize-space(//np/@possCooccur)='no'">
<xsl:text>Por el contrario, deben ser expresados en una frase </xsl:text>
					<xsl:choose>
						<xsl:when test="//pp/@pPos='before'">preposicional.</xsl:when>
						<xsl:when test="//pp/@pPos='after'">posposicional.</xsl:when>
						<xsl:when test="//pp/@pPos='both'">preposicional y/o posposicional.</xsl:when>
						<xsl:when test="//pp/@pPos='unknown'">preposicional y/o posposicional.</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
					</xsl:if>
</p>
		</section2>
		<section2 id="sNPQP">
			<secTitle>Las frases del cuantificador como modificadores</secTitle>
			<p>
<xsl:text>Las frases del cuantificador llenan el nivel siguiente hacia el sustantivo. Esta posición incluye ambos números (véase la sección </xsl:text>
<sectionRef sec="sAdjNumbers" />
<xsl:text>) y otros cuantificadores y palabras de grado (véase la sección </xsl:text>
<sectionRef sec="sQPOtherQuantifiers" />
<xsl:text>).  Tales modificadores indican el número de la frase del nominal completo. Algunos ejemplos de frases nominales cuantificadas en español son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>ésos muy pocos libros</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>los muchos perros del muchacho</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute> solamente los primeros cien muchachos</langData>
<xsl:text>.  Todas las frases del cuantificador se presentan antes del sustantivo en español.</xsl:text>
</p>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, las frases del cuantificador se presentan </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@qpPos='before'">antes</xsl:when>
					<xsl:when test="//np/@qpPos='after'">después</xsl:when>
					<xsl:when test="//np/@qpPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					<xsl:when test="//np/@qpPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
					<xsl:when test="//np/@qpPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
					<xsl:when test="//np/@qpPos='afterOrBoth'">después o en ambos lados</xsl:when>
					<xsl:when test="//np/@qpPos='both'">en ambos lados</xsl:when>
					<xsl:when test="//np/@qpPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del sustantivo.  </xsl:text>
<xsl:if test="normalize-space(//np/@qpEither)='unrestricted' and normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='after' and normalize-space(//np/@qpPos)!='unknown'">
					<xsl:text>Todas las frases del cuantificador pueden presentarse de cualquier lado del sustantivo. </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@qpEither)='restricted' and normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='after'">
					<xsl:text>Hay restricciones en cuanto a cuáles de las frases del cuantificador pueden presentarse en cada lado del sustantivo.  </xsl:text>
					<xsl:if test="normalize-space(//np/@qpEitherRestrictedNumPos)='before' and normalize-space(//np/@qpEither)='unrestricted' and normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='after'">
						<xsl:text>Todos los números se presentan antes del sustantivo. </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="normalize-space(//np/@qpEitherRestrictedNumPos)='after' and normalize-space(//np/@qpEither)='unrestricted' and normalize-space(//np/@qpPos)!='before' and normalize-space(//np/@qpPos)!='after'">
						<xsl:text>Todos los números se presentan después del sustantivo. </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text> Algunos ejemplos de frases nominales cuantificadas en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Como otros modificadores dentro de la frase nominal, las frases del cuantificador en  </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> concuerdan con el sustantivo principal en </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeOther='yesAnimacy'">animado.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesClass'">número de clase.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesGender'">género.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
		</section2>
		<section2 id="sNPAdjP">
			<secTitle>Las frases del adjetivo como modificadores</secTitle>
			<p>
<xsl:text>Las frases del adjetivo fueron discutidas anteriormente en la sección </xsl:text>
<sectionRef sec="sAdjP" />
<xsl:text>.  Las frases del adjetivo se presentan cerca del sustantivo.  Algunas frases nominales en inglés con adjetivos son:</xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>just those very few old, dirty books</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'apenas ésos muy pocos libros viejos, sucios'</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>all the boy’s many black dogs</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'todo los muchos perros negros del muchacho'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>only the first one hundred very eager young boys</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'solamente los primeros cientos muchachos jovenes muy impacientes'</xsl:text>
</gloss>
<xsl:text>.  Mientras que los ejemplos en inglés demuestran, todos los adjetivos se presentan antes del sustantivo, y, desemejante de los otros modificadores, se permita más de una frase del adjetivo.
					En español, los adjetivos se presentan después del sustantivo y se permite solamente una frase del adjetivo, a menos que los adjetivos son coordinados (véase la sección </xsl:text>
<sectionRef sec="sCoordAdj" />
<xsl:text>).</xsl:text>
</p>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, las frases del adjetivo se presentan </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@adjpPos='before'">antes</xsl:when>
					<xsl:when test="//np/@adjpPos='after'">después</xsl:when>
					<xsl:when test="//np/@adjpPos='either'">de cualquier lado (pero no en ambos lados)</xsl:when>
					<xsl:when test="//np/@adjpPos='eitherOrBoth'">de cualquier lado o en ambos lados</xsl:when>
					<xsl:when test="//np/@adjpPos='beforeOrBoth'">antes o en ambos lados</xsl:when>
					<xsl:when test="//np/@adjpPos='afterOrBoth'">después o en ambos lados</xsl:when>
					<xsl:when test="//np/@adjpPos='both'">en ambos lados</xsl:when>
					<xsl:when test="//np/@adjpPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del sustantivo.  </xsl:text>
<xsl:if test="normalize-space(//np/@adjpEither)='unrestricted' and normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='after' and normalize-space(//np/@adjpPos)!='unknown'">
					<xsl:text>Todas las frases del adjetivo pueden presentarse de cualquier lado del sustantivo. </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="normalize-space(//np/@adjpEither)='restricted' and normalize-space(//np/@adjpPos)!='before' and normalize-space(//np/@adjpPos)!='after'">
					<xsl:text>Hay restricciones en cuanto a cuáles de las frases del adjetivo pueden presentarse en cada lado del sustantivo. </xsl:text>
				</xsl:if>
<xsl:text> Algunos ejemplos de las frases nominales con adjetivos cualitativos como modificadores en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Como otros modificadores dentro de la frase nominal, las frases del adjetivo en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> concuerdan con el sustantivo principal en </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeOther='yesAnimacy'">animado.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesClass'">número de clase.</xsl:when>
					<xsl:when test="//np/@agreeOther='yesGender'">género.</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>

		</section2>
		<section2 id="sNPPP">
			<secTitle>            <xsl:choose>
				<xsl:when test="//pp/@pPos='before'">Las frases preposicionales como modificadores o complementos</xsl:when>
				<xsl:when test="//pp/@pPos='after'">Las frases posposicionales como modificadores o complementos</xsl:when>
				<xsl:when test="//pp/@pPos='both'">Las frases preposicionales o posposicionales como modificadores o complementos</xsl:when>
				<xsl:when test="//pp/@pPos='unknown'">Las frases preposicionales y/o posposicionales como modificadores o complementos</xsl:when>
			</xsl:choose>
</secTitle>
			<p>
<xsl:text>Los sustantivos simples y compuestos pueden tener frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicionales y/o posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicionales y/o posposicionales</xsl:when>
				</xsl:choose>
<xsl:text> como modificadores o complementos, tal como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la botella grande, redonda [de jarabe]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>la carta del muchacho [a esa muchacha]</langData>
<xsl:text>.  Además, las frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicionales y/o posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicionales y/o posposicionales</xsl:when>
				</xsl:choose>
<xsl:text> del genitivo pueden actuar como el poseedor, tal como </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>esos perros [de él]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el mantel [de mi madre]</langData>
<xsl:text>.    En español, la frase preposicional siempre se presenta después del sustantivo.</xsl:text>
</p>
			<p>
<xsl:text>En </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, la frase </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicional</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicional y/o posposicional</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicional y/o posposicional</xsl:when>
				</xsl:choose>
<xsl:text> se presenta </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@ppPos='before'">antes</xsl:when>
					<xsl:when test="//np/@ppPos='after'">después</xsl:when>
					<xsl:when test="//np/@ppPos='either'">de cualquier lado</xsl:when>
					<xsl:when test="//np/@ppPos='unknown'">_______</xsl:when>
				</xsl:choose>
<xsl:text> del sustantivo principal.  </xsl:text>
<xsl:text> Algunos ejemplos con las frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicionales y/o posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicionales y/o posposicionales</xsl:when>
				</xsl:choose>
<xsl:text> como modificadores o complementos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Véase el la sección </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> para el análisis de las frases </xsl:text>
<xsl:choose>
					<xsl:when test="//pp/@pPos='before'">preposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='after'">posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='both'">preposicionales y/o posposicionales</xsl:when>
					<xsl:when test="//pp/@pPos='unknown'">preposicionales y/o posposicionales</xsl:when>
				</xsl:choose>
<xsl:text> en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text>.</xsl:text>
</p>
		</section2>
<section2 id="sNPParticiple">
	<secTitle>Los participios</secTitle>
		<p>
<xsl:text>Otro caso que se puede parecer como un sustantivo y un complemento puede ser realmente una frase del participio (también llamada un gerundio). Esta frase completa se presenta en una posición normal de una frase nominal, tal como sujeto, objeto, objeto indirecto o el objeto de una preposición o posposición. Algunos ejemplos de español en oraciones completas con la frase del participio acorchetada son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>[Estudiando participios] es dificil</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>Él tiene gusto [leyendo la poesía latina]</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>El receptor demostró su valor cerca [haciendo el retén]</langData>
<xsl:text>  Tales frases se pueden poseer o modificar también, y a veces se presenta solamente el participio como el elemento principal de una frase nominal, como en </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el gravemente herido</langData>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>el agonizante</langData>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>su siguiente.</langData>
</p>
			<p>
<xsl:text> Algunos ejemplos de los participios o las frases del participio que pueden substituir por un sustantivo en una frase nominal en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Estas frases del participio pueden presentarse en oraciones completas como se muestra aquí: </xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
<xsl:text>Los participios o las frases del participio pueden también actuar como adjetivos en la modificación de un sustantivo en muchas idiomas, aunque no en español. Algunos ejemplos en inglés con el participio o la frase del participio acorchetada son: </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the bright, [shining] sun</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'el brillante, [brillando] sol'</xsl:text>
</gloss>
<xsl:text>, </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>my [crying] child</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'mi niño, [gritando]'</xsl:text>
</gloss>
<xsl:text> y </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the books [loved by millions]</langData>
<gloss>
<xsl:attribute name="lang">lGloss</xsl:attribute>
<xsl:text>'los libros [amados por millones]'</xsl:text>
</gloss>
<xsl:text>.</xsl:text>
</p>
	<p>
<xsl:text>  Algunos ejemplos en </xsl:text>
<xsl:choose>
<xsl:when test="string-length(normalize-space(//language/langNames/langName[@lang='es'])) &gt; 0">
<xsl:value-of select="normalize-space(//language/langNames/langName[@lang='es'])" />
</xsl:when>
<xsl:otherwise>
<xsl:text>Vernacular</xsl:text>
</xsl:otherwise>
</xsl:choose>
<xsl:text> son:</xsl:text>
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
<xsl:attribute name="lang">lVernacular</xsl:attribute>ESCRIBA UN EJEMPLO AQUÍ</langData>
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
