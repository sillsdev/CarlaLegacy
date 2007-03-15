<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="np">
	<section1 id="sNP">
		<secTitle>Nominal Phrases</secTitle>
		<p>
<xsl:text>Nominal phrases can be very complex.  This section concentrates on those with common nouns as the lexical head.  Modification by articles, demonstratives, possessors, quantifiers and degree words, adjective phrases, pre/post-positional phrases and noun compounds is considered.  Participles are also covered, but nominal phrases headed by proper names are handled in section </xsl:text>
<sectionRef sec="sProp" />
<xsl:text> and those headed by pronouns, demonstratives, and quantifiers are handled in section </xsl:text>
<sectionRef sec="sPron" />
<xsl:text>.  Relative clauses are covered in section </xsl:text>
<sectionRef sec="sRelCl" />
<xsl:text>.</xsl:text>
</p>
		<p>
<xsl:text>The basic order of elements allowed in nominal phrases in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> is:</xsl:text>
</p>
		<xsl:if test="//np/@artAndDem='both' and //np/@artBothCooccur!='no' and //np/@possCooccur='yes' or //np/@artAndDem='article' and //np/@possCooccur='yes' or //np/@artAndDem='demonstrative' and //np/@possCooccur='yes' or //np/@artAndDem='no'">
<example num="xNP.8">
<table>
				<tr>
					<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreePos!='after' or //qp/@npDegree='yesPos' and //qp/@npDegreePos!='after' or //qp/@npDegree='yesNeg' and //qp/@npDegreePos!='after'">
<td>
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@artAndDem='demonstrative' and //np/@demPos!='after' or //np/@artAndDem='both' and //np/@demAndArtDemPos!='after'">
<td>
						<xsl:text>(Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@artAndDem='article' and //np/@artPos!='after' or //np/@artAndDem='both' and //np/@demAndArtArtPos!='after'">
<td>
						<xsl:text>(Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@possNounPos!='after' and //np/@possNounPos!='unknown'">
<td>
						<xsl:text>(Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@qpPos!='after' and //np/@qpPos!='unknown'">
<td>
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@adjpPos!='after' and //np/@adjpPos!='unknown'">
<td>
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@ppPos!='after' and //np/@ppPos!='unknown'">
<td>
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@compHead='right' and //np/@comp='yes'">
<td>
						<xsl:text>((N) N)</xsl:text>
					</td>
</xsl:if>
					<td>
						<xsl:text>N</xsl:text>
					</td>
					<xsl:if test="//np/@compHead='left' and //np/@comp='yes'">
<td>
						<xsl:text>(N (N))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@ppPos!='before' and //np/@ppPos!='unknown'">
<td>
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@adjpPos!='before' and //np/@adjpPos!='unknown'">
<td>
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@qpPos!='before' and //np/@qpPos!='unknown'">
<td>
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@possNounPos!='before' and //np/@possNounPos!='unknown'">
<td>
						<xsl:text>(Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@artAndDem='article' and //np/@artPos!='before' or //np/@artAndDem='both' and //np/@demAndArtArtPos!='before'">
<td>
						<xsl:text>(Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@artAndDem='demonstrative' and //np/@demPos!='before' or //np/@artAndDem='both' and //np/@demAndArtDemPos!='before'">
<td>
						<xsl:text>(Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreePos!='before' or //qp/@npDegree='yesPos' and //qp/@npDegreePos!='before' or //qp/@npDegree='yesNeg' and //qp/@npDegreePos!='before'">
<td>
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
				</tr>
			</table>
</example>
</xsl:if>
		<xsl:if test="//np/@artAndDem='both' and //np/@artBothCooccur='no' and //np/@possCooccur='yes'">
<example num="xNP.10">
<table>
				<tr>
					<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreePos!='after' or //qp/@npDegree='yesPos' and //qp/@npDegreePos!='after' or //qp/@npDegree='yesNeg' and //qp/@npDegreePos!='after'">
<td>
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@artAndDem='both' and //np/@artBothCooccur='no' and //np/@possCooccur='yes' and //np/@demOrArtPos!='after'">
<td>
						<xsl:text>(Dem/Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@possNounPos!='after' and //np/@possNounPos!='unknown'">
<td>
						<xsl:text>(Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@qpPos!='after' and //np/@qpPos!='unknown'">
<td>
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@adjpPos!='after' and //np/@adjpPos!='unknown'">
<td>
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@ppPos!='after' and //np/@ppPos!='unknown'">
<td>
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@compHead='right' and //np/@comp='yes'">
<td>
						<xsl:text>((N) N)</xsl:text>
					</td>
</xsl:if>
					<td>
						<xsl:text>N</xsl:text>
					</td>
					<xsl:if test="//np/@compHead='left' and //np/@comp='yes'">
<td>
						<xsl:text>(N (N))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@ppPos!='before' and //np/@ppPos!='unknown'">
<td>
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@adjpPos!='before' and //np/@adjpPos!='unknown'">
<td>
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@qpPos!='before' and //np/@qpPos!='unknown'">
<td>
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@possNounPos!='before' and //np/@possNounPos!='unknown'">
<td>
						<xsl:text>(Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@artAndDem='both' and //np/@artBothCooccur='no' and //np/@possCooccur='yes' and //np/@demOrArtPos!='before'">
<td>
						<xsl:text>(Art/Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreePos!='before' or //qp/@npDegree='yesPos' and //qp/@npDegreePos!='before' or //qp/@npDegree='yesNeg' and //qp/@npDegreePos!='before'">
<td>
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
				</tr>
			</table>
</example>
</xsl:if>
		<xsl:if test="//np/@artAndDem='both' and //np/@possCooccur='no'">
<example num="xNP.12">
<table>
				<tr>
					<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreePos!='after' or //qp/@npDegree='yesPos' and //qp/@npDegreePos!='after' or //qp/@npDegree='yesNeg' and //qp/@npDegreePos!='after'">
<td>
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@artAndDem='both' and //np/@possCooccur='no' and //np/@demAndArtArtPos!='after' and //np/@demAndArtDemPos!='after' and //np/@possNounPos!='after' or //np/@artAndDem='both' and //np/@possCooccur='no' and //np/@demOrArtPos!='after' and //np/@possNounPos!='after'">
<td>
						<xsl:text>(Dem/Art/Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@qpPos!='after' and //np/@qpPos!='unknown'">
<td>
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@adjpPos!='after' and //np/@adjpPos!='unknown'">
<td>
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@ppPos!='after' and //np/@ppPos!='unknown'">
<td>
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@compHead='right' and //np/@comp='yes'">
<td>
						<xsl:text>((N) N)</xsl:text>
					</td>
</xsl:if>
					<td>
						<xsl:text>N</xsl:text>
					</td>
					<xsl:if test="//np/@compHead='left' and //np/@comp='yes'">
<td>
						<xsl:text>(N (N))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@ppPos!='before' and //np/@ppPos!='unknown'">
<td>
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@adjpPos!='before' and //np/@adjpPos!='unknown'">
<td>
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@qpPos!='before' and //np/@qpPos!='unknown'">
<td>
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@artAndDem='both' and //np/@possCooccur='no' and //np/@demAndArtArtPos!='before' and //np/@demAndArtDemPos!='before' and //np/@possNounPos!='before' or //np/@artAndDem='both' and //np/@possCooccur='no' and //np/@demOrArtPos!='before' and //np/@possNounPos!='before'">
<td>
						<xsl:text>(Poss/Art/Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreePos!='before' or //qp/@npDegree='yesPos' and //qp/@npDegreePos!='before' or //qp/@npDegree='yesNeg' and //qp/@npDegreePos!='before'">
<td>
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
				</tr>
			</table>
</example>
</xsl:if>
		<xsl:if test="//np/@artAndDem='demonstrative' and //np/@possCooccur='no'">
<example num="xNP.14">
<table>
				<tr>
					<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreePos!='after' or //qp/@npDegree='yesPos' and //qp/@npDegreePos!='after' or //qp/@npDegree='yesNeg' and //qp/@npDegreePos!='after'">
<td>
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@artAndDem='demonstrative' and //np/@possCooccur='no' and //np/@demPos!='after' and //np/@possNounPos!='after'">
<td>
						<xsl:text>(Dem/Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@qpPos!='after' and //np/@qpPos!='unknown'">
<td>
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@adjpPos!='after' and //np/@adjpPos!='unknown'">
<td>
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@ppPos!='after' and //np/@ppPos!='unknown'">
<td>
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@compHead='right' and //np/@comp='yes'">
<td>
						<xsl:text>((N) N)</xsl:text>
					</td>
</xsl:if>
					<td>
						<xsl:text>N</xsl:text>
					</td>
					<xsl:if test="//np/@compHead='left' and //np/@comp='yes'">
<td>
						<xsl:text>(N (N))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@ppPos!='before' and //np/@ppPos!='unknown'">
<td>
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@adjpPos!='before' and //np/@adjpPos!='unknown'">
<td>
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@qpPos!='before' and //np/@qpPos!='unknown'">
<td>
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@artAndDem='demonstrative' and //np/@possCooccur='no' and //np/@demPos!='before' and //np/@possNounPos!='before'">
<td>
						<xsl:text>(Poss/Dem)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreePos!='before' or //qp/@npDegree='yesPos' and //qp/@npDegreePos!='before' or //qp/@npDegree='yesNeg' and //qp/@npDegreePos!='before'">
<td>
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
				</tr>
			</table>
</example>
</xsl:if>
		<xsl:if test="//np/@artAndDem='article' and //np/@possCooccur='no'">
<example num="xNP.16">
<table>
				<tr>
					<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreePos!='after' or //qp/@npDegree='yesPos' and //qp/@npDegreePos!='after' or //qp/@npDegree='yesNeg' and //qp/@npDegreePos!='after'">
<td>
						<xsl:text>(Deg)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@artAndDem='article' and //np/@possCooccur='no' and //np/@artPos!='after' and //np/@possNounPos!='after'">
<td>
						<xsl:text>(Art/Poss)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@qpPos!='after' and //np/@qpPos!='unknown'">
<td>
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@adjpPos!='after' and //np/@adjpPos!='unknown'">
<td>
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@ppPos!='after' and //np/@ppPos!='unknown'">
<td>
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@compHead='right' and //np/@comp='yes'">
<td>
						<xsl:text>((N) N)</xsl:text>
					</td>
</xsl:if>
					<td>
						<xsl:text>N</xsl:text>
					</td>
					<xsl:if test="//np/@compHead='left' and //np/@comp='yes'">
<td>
						<xsl:text>(N (N))</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@ppPos!='before' and //np/@ppPos!='unknown'">
<td>
						<xsl:text>(PP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@adjpPos!='before' and //np/@adjpPos!='unknown'">
<td>
						<xsl:text>(AdjP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@qpPos!='before' and //np/@qpPos!='unknown'">
<td>
						<xsl:text>(QP)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//np/@artAndDem='article' and //np/@possCooccur='no' and //np/@artPos!='before' and //np/@possNounPos!='before'">
<td>
						<xsl:text>(Poss/Art)</xsl:text>
					</td>
</xsl:if>
					<xsl:if test="//qp/@npDegree='yes' and //qp/@npDegreePos!='before' or //qp/@npDegree='yesPos' and //qp/@npDegreePos!='before' or //qp/@npDegree='yesNeg' and //qp/@npDegreePos!='before'">
<td>
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
<xsl:value-of select="//language/langName" />
<xsl:text>, </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeNumber='no'">
<xsl:text> there is no number agreement.  Instead, number marking comes from the number or quantifier.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@agreeNumber='yes'">
<xsl:text> the various nominal modifiers may/must agree in number with the head noun.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text>  Further, </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeOther='no'">
<xsl:text>there is no agreement in animacy, class number, nor gender between the modifiers and the head noun.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@agreeOther='yesAnimacy'">
<xsl:text>the modifiers and the head noun may/must agree in animacy.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@agreeOther='yesClass'">
<xsl:text>the modifiers and the head noun may/must agree in class number.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@agreeOther='yesGender'">
<xsl:text>the modifiers and the head noun may/must agree in gender.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
		</section2>
		<section2 id="sNPCase">
			<secTitle>Case</secTitle>
			<p>
<xsl:text>Nouns and their modifiers may also be marked for case.  The most common case system is nominative-accusative.  This is the system English has, though only pronouns are marked for case in English.  In a nominative-accusative system, subjects of both transitive and intransitive verbs are in nominative case, while direct objects are accusative case.  Possessors are genitive case.  The nominative pronouns in English are: </xsl:text>
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
<xsl:text>
In an ergative-absolutive case system, subjects of transitive verbs are marked with the ergative case, while objects of transitive verbs and subjects of intransitive verbs are marked with the absolutive case.  The case of possessors is not set cross-linguistically.  Some languages with an ergative-absolutive system simply have different sets of verbal agreement markers, but no marking on nouns.  This type of agreement marking will be handled in section </xsl:text>
<sectionRef sec="sIPAgr" />
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>
Some languages are even more complex in that they normally have a nominative-accusative system but under some conditions the case system switches to ergative-absolutive.  This is called "split ergativity".</xsl:text>
</p>
			<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//np/@case='none'">
<xsl:text> does not have any case system.   The exact same set of pronouns may be used in any position in the sentence and there is no marking on nouns or on any noun modifiers based on their position in the sentence.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@case='nominative'">
<xsl:text> has a nominative-accusative case system.   Subjects of both transitive and intransitive verbs are marked in the same way and use the same set of pronouns, but objects of transitive verbs are marked differently.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@case='ergative'">
<xsl:text> has an ergative-absolutive case system.   Subjects of intransitive verbs and objects of transitive verbs are marked in the same way and use the same set of pronouns, but subjects of transitive verbs are marked differently.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@case='split'">
<xsl:text> has a split case system.    The language normally follows the nominative-accusative case system, but the ergative-absolutive system is used under certain conditions.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="//np/@case='nominative' and //np/@caseDefault='nominative' or //np/@case='split' and //np/@caseDefault='nominative'">
					<xsl:text>  Nominative case is the default (unmarked) case.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<p>
<xsl:text>The pronoun sets will be given in section </xsl:text>
<sectionRef sec="sPron" />
<xsl:text>.</xsl:text>
</p>
		</section2>
		<section2 id="sNPDegree">
			<secTitle>Special Degree Words including "All" and "Not"</secTitle>
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
<xsl:text>.  To review the facts for </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>,  </xsl:text>
<xsl:if test="//qp/@npDegree='no'">
					<xsl:text>these are not expressed as separate words which modify the whole nominal phrase, so they will not have a position in the phrase structure.  Instead, they all attach to another word in the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//qp/@npDegree='yes'">
					<xsl:text>these are expressed as separate words which occur </xsl:text>
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
					<xsl:text> the rest of the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//qp/@npDegree='yesPos'">
					<xsl:text>the positive special degree elements are expressed as separate words which occur </xsl:text>
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
					<xsl:text> the rest of the nominal phrase.  The negative special degree elements, however, are not expressed as separate words which modify the whole nominal phrase, so they will not have a place in the phrase structure.  Instead, they attach to another word in the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//qp/@npDegree='yesNeg'">
					<xsl:text>the negative special degree elements are expressed as separate words which occur </xsl:text>
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
					<xsl:text> the rest of the nominal phrase.  The positive special degree elements, however, are not expressed as separate words which modify the whole nominal phrase, so they will not have a place in the phrase structure.  Instead, they attach to another word in the nominal phrase.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="//qp/@npDegree='yes' or //qp/@npDegree='yesPos'">
<p>
<xsl:text>Examples of the positive special degree words in nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@npDegree='yes' or //qp/@npDegree='yesPos'">
<example num="xNP.NPDegree.8">
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
			<xsl:if test="//qp/@npDegree='yes' or //qp/@npDegree='yesNeg'">
<p>
<xsl:text>Examples of the negative special degree elements in nominal phrases include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//qp/@npDegree='yes' or //qp/@npDegree='yesNeg'">
<example num="xNP.NPDegree.12">
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
		<section2 id="sNPArtDem">
			<secTitle>Articles and Demonstratives</secTitle>
			<p>
<xsl:text>In English, the articles are </xsl:text>
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
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artAndDem='no'">
<xsl:text> does not have either articles or demonstratives that are realized as separate words.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@artAndDem='article'">
<xsl:text> has only articles that are realized as separate words, no demonstratives.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@artAndDem='demonstrative'">
<xsl:text> has only demonstratives that are realized as separate words, no articles.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@artAndDem='both'">
<xsl:text> has both articles and demonstratives that are realized as separate words.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="//np/@artAndDem!='no'">
					<xsl:text> The </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artAndDem='article'">
<xsl:text>articles</xsl:text>
</xsl:when>
						<xsl:when test="//np/@artAndDem='demonstrative'">
<xsl:text>demonstratives</xsl:text>
</xsl:when>
						<xsl:when test="//np/@artAndDem='both'">
<xsl:text>articles and demonstratives</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text> are </xsl:text>
					<xsl:if test="//np/@artAndDem!='no' and //np/@artCase='no'">
						<xsl:text>not </xsl:text>
					</xsl:if>
					<xsl:text>marked for case.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<xsl:if test="//np/@artAndDem='article'">
<p>
<xsl:text>The article occurs </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//np/@artPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//np/@artPos='either'">
<xsl:text>on either side of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@artPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="//np/@artAndDem='article' and //np/@artPos='either' and //np/@artEither='unrestricted'">
					<xsl:text>All of the articles may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@artAndDem='article' and //np/@artPos='either' and //np/@artEither='restricted'">
					<xsl:text>There are restrictions as to which of the articles may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text>  The presence of an article is </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artRequired='no'">
<xsl:text>always optional.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@artRequired='mass'">
<xsl:text>optional with plural or mass nouns, but is required with singular nouns.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@artRequired='yes'">
<xsl:text>always required.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="//np/@artAndDem='article' and //np/@artPos='either' and //np/@artRequired='mass'">
					<xsl:text>In the singular forms, an article is required </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artBothRequiredPos='before'">
<xsl:text>before the noun and one may also optionally appear after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='after'">
<xsl:text>after the noun and one may also optionally appear before the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='both'">
<xsl:text>to appear both before and after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@artAndDem='article' and //np/@artPos='either' and //np/@artRequired='yes'">
					<xsl:text>An article is required to appear </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@artBothRequiredPos='before'">
<xsl:text>before the noun and one may also optionally appear after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='after'">
<xsl:text>after the noun and one may also optionally appear before the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='both'">
<xsl:text>both before and after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@artBothRequiredPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="//np/@artAndDem='demonstrative'">
<p>
<xsl:text>The demonstrative occurs </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demPos='either'">
<xsl:text>on either side of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="//np/@artAndDem='demonstrative' and //np/@demPos='either' and //np/@demEither='unrestricted'">
					<xsl:text>All of the demonstratives may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@artAndDem='demonstrative' and //np/@demPos='either' and //np/@demEither='restricted'">
					<xsl:text>There are restrictions as to which of the demonstratives may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text>  The presence of a demonstrative is </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demRequired='no'">
<xsl:text>always optional.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demRequired='mass'">
<xsl:text>optional with plural or mass nouns, but is required with singular nouns.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demRequired='yes'">
<xsl:text>always required.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="//np/@artAndDem='demonstrative' and //np/@demPos='either' and //np/@demRequired='mass'">
					<xsl:text>In the singular forms, a demonstrative is required </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demBothRequiredPos='before'">
<xsl:text>before the noun and one may also optionally appear after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='after'">
<xsl:text>after the noun and one may also optionally appear before the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='both'">
<xsl:text>to appear both before and after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@artAndDem='demonstrative' and //np/@demPos='either' and //np/@demRequired='yes'">
					<xsl:text>A demonstrative is required to appear </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demBothRequiredPos='before'">
<xsl:text>before the noun and one may also optionally appear after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='after'">
<xsl:text>after the noun and one may also optionally appear before the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='both'">
<xsl:text>both before and after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demBothRequiredPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="//np/@artAndDem='both' and //np/@artBothCooccur='no'">
<p>
<xsl:text>The articles and demonstratives both appear in the same position, so they do not co-occur in the same nominal phrase.  Articles or demonstratives appear </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demOrArtPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demOrArtPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demOrArtPos='either'">
<xsl:text>on either side of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demOrArtPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="//np/@artBothCooccur='no' and //np/@demOrArtPos='either' and //np/@demOrArtEither='unrestricted'">
					<xsl:text>All of the articles and demonstratives may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@artBothCooccur='no' and //np/@demOrArtPos='either' and //np/@demOrArtEither='restricted'">
					<xsl:text>There are restrictions as to which of the articles and demonstratives may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text>  The presence of an article or demonstrative is </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demOrArtRequired='no'">
<xsl:text>always optional.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demOrArtRequired='mass'">
<xsl:text>optional with plural or mass nouns, but is required with singular nouns.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demOrArtRequired='yes'">
<xsl:text>always required.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="//np/@artBothCooccur='no' and //np/@demOrArtPos='either' and //np/@demOrArtRequired='mass'">
					<xsl:text>In the singular forms, an article or a demonstrative is required </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demOrArtBothRequiredPos='before'">
<xsl:text>before the noun and one may also optionally appear after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='after'">
<xsl:text>after the noun and one may also optionally appear before the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='both'">
<xsl:text>to appear both before and after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@artBothCooccur='no' and //np/@demOrArtPos='either' and //np/@demOrArtRequired='yes'">
					<xsl:text>An article or a demonstrative is required to appear </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demOrArtBothRequiredPos='before'">
<xsl:text>before the noun and one may also optionally appear after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='after'">
<xsl:text>after the noun and one may also optionally appear before the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='both'">
<xsl:text>both before and after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demOrArtBothRequiredPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="//np/@artAndDem='both' and //np/@artBothCooccur!='no'">
<p>
<xsl:text>The articles and demonstratives do not appear in the same position with respect to the noun, </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@artBothCooccur='different'">
<xsl:text>but both may not </xsl:text>
</xsl:when>
					<xsl:when test="//np/@artBothCooccur='yes'">
<xsl:text>and both may </xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text>co-occur in the same nominal phrase.  The demonstrative occurs </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtDemPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demAndArtDemPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demAndArtDemPos='either'">
<xsl:text>on either side of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demAndArtDemPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="//np/@artBothCooccur!='no' and //np/@demAndArtDemPos='either' and //np/@demAndArtDemEither='unrestricted'">
					<xsl:text>All of the demonstratives may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@artBothCooccur!='no' and //np/@demAndArtDemPos='either' and //np/@demAndArtDemEither='restricted'">
					<xsl:text>There are restrictions as to which of the demonstratives may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text>  The presence of a demonstrative is </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtDemRequired='no'">
<xsl:text>always optional.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demAndArtDemRequired='mass'">
<xsl:text>optional with plural or mass nouns, but is required with singular nouns.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demAndArtDemRequired='yes'">
<xsl:text>always required.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="//np/@artBothCooccur!='no' and //np/@demAndArtDemPos='either' and //np/@demAndArtDemRequired='mass'">
					<xsl:text>In the singular forms, a demonstrative is required </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtDemRequiredPos='before'">
<xsl:text>before the noun and one may also optionally appear after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demAndArtDemRequiredPos='after'">
<xsl:text>after the noun and one may also optionally appear before the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demAndArtDemRequiredPos='both'">
<xsl:text>to appear both before and after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demAndArtDemRequiredPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@artBothCooccur!='no' and //np/@demAndArtDemPos='either' and //np/@demAndArtDemRequired='yes'">
					<xsl:text>A demonstrative is required to appear </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='before'">
<xsl:text>before the noun and one may also optionally appear after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='after'">
<xsl:text>after the noun and one may also optionally appear before the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='both'">
<xsl:text>both before and after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demAndArtDemBothRequiredPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text>  The article occurs </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtArtPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demAndArtArtPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demAndArtArtPos='either'">
<xsl:text>on either side of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demAndArtArtPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="//np/@artBothCooccur!='no' and //np/@demAndArtArtPos='either' and //np/@demAndArtArtEither='unrestricted'">
					<xsl:text>All of the articles may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@artBothCooccur!='no' and //np/@demAndArtArtPos='either' and //np/@demAndArtArtEither='restricted'">
					<xsl:text>There are restrictions as to which of the articles may appear on either side of the noun.</xsl:text>
				</xsl:if>
<xsl:text>  The presence of an article is </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@demAndArtArtRequired='no'">
<xsl:text>always optional.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demAndArtArtRequired='mass'">
<xsl:text>optional with plural or mass nouns, but is required with singular nouns.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@demAndArtArtRequired='yes'">
<xsl:text>always required.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="//np/@artBothCooccur!='no' and //np/@demAndArtArtPos='either' and //np/@demAndArtArtRequired='mass'">
					<xsl:text>In the singular forms, an article is required </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtArtRequiredPos='before'">
<xsl:text>before the noun and one may also optionally appear after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demAndArtArtRequiredPos='after'">
<xsl:text>after the noun and one may also optionally appear before the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demAndArtArtRequiredPos='both'">
<xsl:text>to appear both before and after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demAndArtArtRequiredPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@artBothCooccur!='no' and //np/@demAndArtArtPos='either' and //np/@demAndArtArtRequired='yes'">
					<xsl:text>An article is required to appear </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@demAndArtArtBothRequiredPos='before'">
<xsl:text>before the noun and one may also optionally appear after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demAndArtArtBothRequiredPos='after'">
<xsl:text>after the noun and one may also optionally appear before the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demAndArtArtBothRequiredPos='both'">
<xsl:text>both before and after the noun.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@demAndArtArtBothRequiredPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			<xsl:if test="//np/@artAndDem!='no'">
<p>
<xsl:text>Examples of nominal phrases including articles and/or demonstratives as allowed in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//np/@artAndDem!='no'">
<example num="xNP.NPArtDem.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/example" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//np/example)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/example" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/example)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPArtDem.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPArtDem.20.1</xsl:text>
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
		<section2 id="sNPPoss">
			<secTitle>Possessors</secTitle>
			<p>
<xsl:text>Possession can normally be expressed by a possessive pronoun (to be addressed in section </xsl:text>
<sectionRef sec="sPron" />
<xsl:text>) or by a full nominal phrase.  Many languages also add some kind of marking, such as the </xsl:text>
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
<xsl:text>.   Possessors can also be embedded in one another, as in </xsl:text>
<langData>
<xsl:attribute name="lang">
<xsl:text>lPAWSSKEnglish</xsl:text>
</xsl:attribute>the boy's sister's dog</langData>
<xsl:text>.</xsl:text>
</p>
			<p>
<xsl:text>Examples of possessed nominal phrases with simple and embedded possessors in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
			<example num="xNP.NPPoss.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/embeddedExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//np/embeddedExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/embeddedExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/embeddedExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.8</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.8.1</xsl:text>
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
<xsl:text>Examples with pre/post-positional phrases within the possessor include:</xsl:text>
</p>
			<example num="xNP.NPPoss.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/ppExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//np/ppExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/ppExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/ppExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.12</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.12.1</xsl:text>
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
<xsl:text>Examples with relative clauses within the possessor here, included in simple full sentences are:</xsl:text>
</p>
			<example num="xNP.NPPoss.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/relClExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//np/relClExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/relClExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/relClExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPoss.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPoss.16.1</xsl:text>
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
<xsl:text>As seen in the examples above, </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
					<xsl:when test="//np/@possMarked='no'">
<xsl:text> does not have any special marking to distinguish possessors from any other nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@possMarked='yesAffix'">
<xsl:text> marks the head noun within the possessor with an affix to distinguish possessors from any other nominal phrase.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@possMarked='yesClitic'">
<xsl:text> marks the whole possessive phrase with a phrasal clitic to distinguish possessors from any other nominal phrase.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
<xsl:if test="//np/@possCliticWord='no' and //np/@possMarked='yesClitic' and //np/@possCliticAffix='suffix'">
					<xsl:text> This phrasal clitic is an enclitic which attaches to the final word in the possessor.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@possCliticWord='no' and //np/@possMarked='yesClitic' and //np/@possCliticAffix='prefix'">
					<xsl:text> This phrasal clitic is an proclitic which attaches to the first word in the possessor.</xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@possCliticWord='yes' and //np/@possMarked='yesClitic'">
					<xsl:text> This phrasal clitic is written as a separate word which occurs </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@possCliticPossPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
						<xsl:when test="//np/@possCliticPossPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
						<xsl:when test="//np/@possCliticPossPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text> the possessor.  The possessive clitic is </xsl:text>
					<xsl:choose>
						<xsl:when test="//np/@possCliticRequired='no'">
<xsl:text>optional in some cases.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@possCliticRequired='no'">
<xsl:text>always required.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@possCliticRequired='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
					</xsl:choose>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
</p>
			<p>
<xsl:text>The possessor occurs </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@possNounPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//np/@possNounPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//np/@possNounPos='either'">
<xsl:text>on either side of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@possNounPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the noun being possessed.</xsl:text>
</p>
			<xsl:if test="//np/@artAndDem!='no'">
<section3 id="sNPPossCooccur">
				<secTitle>Possessors and Articles Or Demonstratives Occuring Together</secTitle>
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
<xsl:text> to express the same thought.  Some other languages allow both possessors and articles or demonstratives to occur in the same phrase, so the first example above would be grammatical.</xsl:text>
</p>
				<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, nominal possessors </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCooccur='yes'">
<xsl:text>may</xsl:text>
</xsl:when>
						<xsl:when test="//np/@possCooccur='no'">
<xsl:text>may not</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text> occur in the same phrase as articles or demonstratives.</xsl:text>
</p>
			</section3>
</xsl:if>
			<xsl:if test="//np/@case!='none'">
<section3 id="sNPPossCase">
				<secTitle>Possessor Case</secTitle>
				<xsl:if test="//np/@case='nominative'">
<p>
<xsl:text>With the normal nominative-accusative case system followed by </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, possessors are marked with the genitive case.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="//np/@case='split'">
<p>
<xsl:text>Possessors in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> are marked with the genitive case, following the normal nominative-accusative part of the split case system.  In the parts which display split ergativity, possessors are marked with the </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">
<xsl:text>ergative case, the same marking as the subjects of transitive verbs.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">
<xsl:text>absolutive case, the same marking as the subjects of intransitive verbs and the objects of transitive verbs.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">
<xsl:text>genitive case also.</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<xsl:if test="//np/@case='ergative'">
<p>
<xsl:text>Within the ergative-absolutive case system followed by </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, possessors are marked with the </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possCaseErg='ergative'">
<xsl:text>ergative case, the same marking as the subjects of transitive verbs.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@possCaseErg='absolutive'">
<xsl:text>absolutive case, the same marking as the subjects of intransitive verbs and the objects of transitive verbs.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@possCaseErg='genitive'">
<xsl:text>genitive case, a distinct marking for possessors.</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
				<p>
<xsl:text>In some languages, in a possessed noun phrase the head noun and any modifiers matches the case of the possessor.  In other languages, the possessor is marked with its own case, say genitive, while the head noun is marked with case depending on its position relative to the verb: nominative or accusative, ergative or absolutive depending on the case system.</xsl:text>
</p>
				<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possNounCaseChange='no'">
<xsl:text>the grammatical function of the head noun relative to the verb determines its case, not the presence of a possessor.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@possNounCaseChange='yes'">
<xsl:text>the case of the head noun matches the case of the possessor, when a possessor is present.</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
			</section3>
</xsl:if>
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
<xsl:value-of select="//language/langName" />
<xsl:text></xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possAlienable='no'">
<xsl:text> does not distinguish</xsl:text>
</xsl:when>
						<xsl:when test="//np/@possAlienable='yes'">
<xsl:text> does make a distinction</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text> between alienably and inalienably possessed nouns.  </xsl:text>
<xsl:if test="//np/@possAlienable='yes'">
						<xsl:text>The affix which marks alienably possessed nouns when they have a possessor is:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="//np/@possAlienable='yes'">
<example num="xNP.NPPoss.NPPossAgreement.10">
<table>
						<tr>
							<td>
<table>
<xsl:variable name="sExampleValue">
<xsl:value-of select="translate(string(//np/possAlienableAffixExample),'.','')" />
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
				<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, nouns </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@possAgr='no'">
<xsl:text>are not</xsl:text>
</xsl:when>
						<xsl:when test="//np/@possAgr='yes'">
<xsl:text>are</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text> marked with an affix which either agrees with the possessor or expresses the possessor by itself.  </xsl:text>
<xsl:if test="//np/@possAgr='yes'">
						<xsl:text>These affixes mark the following features of the possessor:</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
				<xsl:if test="//np/@possAgr='yes'">
<example num="xNP.NPPoss.NPPossAgreement.14">
<table border="1">
						<tr>
							<th>Type of feature</th>
							<th>Feature</th>
						</tr>
						<xsl:if test="//np/npPossAgrPossFirst/@checked='yes'">
<tr>
							<td>
								<xsl:text>person</xsl:text>
							</td>
							<td>
								<xsl:text>first</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossExclusive/@checked='yes'">
<tr>
							<td>
								<xsl:text>person</xsl:text>
							</td>
							<td>
								<xsl:text>first exclusive</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossInclusive/@checked='yes'">
<tr>
							<td>
								<xsl:text>person</xsl:text>
							</td>
							<td>
								<xsl:text>first inclusive</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossSecond/@checked='yes'">
<tr>
							<td>
								<xsl:text>person</xsl:text>
							</td>
							<td>
								<xsl:text>second</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossThird/@checked='yes'">
<tr>
							<td>
								<xsl:text>person</xsl:text>
							</td>
							<td>
								<xsl:text>third</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossSingular/@checked='yes'">
<tr>
							<td>
								<xsl:text>number</xsl:text>
							</td>
							<td>
								<xsl:text>singular</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossDual/@checked='yes'">
<tr>
							<td>
								<xsl:text>number</xsl:text>
							</td>
							<td>
								<xsl:text>dual</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossPlural/@checked='yes'">
<tr>
							<td>
								<xsl:text>number</xsl:text>
							</td>
							<td>
								<xsl:text>plural</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossMasculine/@checked='yes'">
<tr>
							<td>
								<xsl:text>gender</xsl:text>
							</td>
							<td>
								<xsl:text>masculine</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossFeminine/@checked='yes'">
<tr>
							<td>
								<xsl:text>gender</xsl:text>
							</td>
							<td>
								<xsl:text>feminine</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossNeuter/@checked='yes'">
<tr>
							<td>
								<xsl:text>gender</xsl:text>
							</td>
							<td>
								<xsl:text>neuter</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossAnimate/@checked='yes'">
<tr>
							<td>
								<xsl:text>animacy</xsl:text>
							</td>
							<td>
								<xsl:text>animate</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossInanimate/@checked='yes'">
<tr>
							<td>
								<xsl:text>animacy</xsl:text>
							</td>
							<td>
								<xsl:text>inanimate</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossHuman/@checked='yes'">
<tr>
							<td>
								<xsl:text>animacy</xsl:text>
							</td>
							<td>
								<xsl:text>human</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossNonHuman/@checked='yes'">
<tr>
							<td>
								<xsl:text>animacy</xsl:text>
							</td>
							<td>
								<xsl:text>nonhuman</xsl:text>
							</td>
						</tr>
</xsl:if>
						<xsl:if test="//np/npPossAgrPossClassClassNumber/@checked='yes'">
<tr>
							<td>
								<xsl:text>class</xsl:text>
							</td>
							<td>
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
<xsl:value-of select="//language/langName" />
<xsl:text>, quantifier phrases occur </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@qpPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//np/@qpPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//np/@qpPos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@qpPos='eitherOrBoth'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@qpPos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@qpPos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@qpPos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@qpPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="//np/@qpEither='unrestricted' and //np/@qpPos!='before' and //np/@qpPos!='after' and //np/@qpPos!='unknown'">
					<xsl:text>All of quantifier phrases can occur on either side of the noun. </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@qpEither='restricted' and //np/@qpPos!='before' and //np/@qpPos!='after'">
					<xsl:text>There are restrictions as to which of the quantifier phrases can occur on each side of the noun.  </xsl:text>
					<xsl:if test="//np/@qpEitherRestrictedNumPos='before' and //np/@qpEither='unrestricted' and //np/@qpPos!='before' and //np/@qpPos!='after'">
						<xsl:text>All of the numbers occur before the noun. </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
					<xsl:if test="//np/@qpEitherRestrictedNumPos='after' and //np/@qpEither='unrestricted' and //np/@qpPos!='before' and //np/@qpPos!='after'">
						<xsl:text>All of the numbers occur after the noun. </xsl:text>
					</xsl:if>
					<xsl:text></xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> examples of quantified nominal phrases include:</xsl:text>
</p>
			<example num="xNP.NPQP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/qpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//np/qpExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/qpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/qpExample)" />
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
			<xsl:if test="//np/@qpAgree='yes'">
<p>
<xsl:text>Like other modifiers within the nominal phrase, quantifier phrases in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> show agreement with the head noun in </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeOther='yesAnimacy'">
<xsl:text>animacy.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@agreeOther='yesClass'">
<xsl:text>class number.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@agreeOther='yesGender'">
<xsl:text>gender.</xsl:text>
</xsl:when>
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
<xsl:value-of select="//language/langName" />
<xsl:text>, adjective phrases occur </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@adjpPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//np/@adjpPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//np/@adjpPos='either'">
<xsl:text>on either side (but not both sides) of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@adjpPos='eitherOrBoth'">
<xsl:text>on either side or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@adjpPos='beforeOrBoth'">
<xsl:text>before or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@adjpPos='afterOrBoth'">
<xsl:text>after or on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@adjpPos='both'">
<xsl:text>on both sides of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@adjpPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the noun.  </xsl:text>
<xsl:if test="//np/@adjpEither='unrestricted' and //np/@adjpPos!='before' and //np/@adjpPos!='after' and //np/@adjpPos!='unknown'">
					<xsl:text>All of the adjective phrases can occur on either side of the noun. </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:if test="//np/@adjpEither='restricted' and //np/@adjpPos!='before' and //np/@adjpPos!='after'">
					<xsl:text>There are restrictions as to which of the adjective phrases can occur on each side of the noun. </xsl:text>
				</xsl:if>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> examples of nominal phrases which are modified by qualitative adjectives include:</xsl:text>
</p>
			<example num="xNP.NPAdjP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/adjpExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//np/adjpExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/adjpExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/adjpExample)" />
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
			<xsl:if test="//np/@adjpAgree='yes'">
<p>
<xsl:text>Like other modifiers within the nominal phrase, adjective phrases in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> show agreement with the head noun in </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@agreeOther='yesAnimacy'">
<xsl:text>animacy.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@agreeOther='yesClass'">
<xsl:text>class number.</xsl:text>
</xsl:when>
					<xsl:when test="//np/@agreeOther='yesGender'">
<xsl:text>gender.</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text></xsl:text>
</p>
</xsl:if>
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
<xsl:value-of select="//language/langName" />
<xsl:text> include:</xsl:text>
</p>
			<example num="xNP.NPAdjP.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//np/partExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/partExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPAdjP.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPAdjP.16.1</xsl:text>
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
			<xsl:if test="//np/@case!='none' and //np/@possNounCaseChange='yes'">
<section3 id="sNPAdjPCaseChange">
				<secTitle>Case Change with Adjective Phrase Modifiers</secTitle>
				<p>
<xsl:text>Languages like </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> which change the case of the head noun when a possessor is present normally also change the case of intervening adjectives to match.  Some languages of this type also change the case of the head noun when only an adjectival modifier is present, even when there is no possessor.</xsl:text>
</p>
				<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, the case of the head noun </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@adjpCaseChange='no'">
<xsl:text>only changes when a possessor is present, though in that situation an intervening adjective may/must also carry that case.</xsl:text>
</xsl:when>
						<xsl:when test="//np/@adjpCaseChange='yes'">
<xsl:text>changes to match the normal case of a possessor even if just an adjectival modifier is present.</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text></xsl:text>
</p>
				<xsl:if test="//np/@adjpCaseChange='yes'">
<p>
<xsl:text>Further, some languages of this latter type have an overt affix which marks the genitive case (or the normal case of possessors) on the head noun to indicate that there must be either an adjective or a possessor in that nominal phrase.  In this situation, the adjective and/or possessor will also be in genitive case (or the normal case of possessors), though the case marking will not be overt on the highest modifier in the nominal phrase.</xsl:text>
</p>
</xsl:if>
				<xsl:if test="//np/@adjpCaseChange='yes'">
<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, the case marking </xsl:text>
<xsl:choose>
						<xsl:when test="//np/@adjpCaseAffix='no'">
<xsl:text>is not</xsl:text>
</xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">
<xsl:text>is</xsl:text>
</xsl:when>
						<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">
<xsl:text>is</xsl:text>
</xsl:when>
					</xsl:choose>
<xsl:text> handled in this distinctive way.  </xsl:text>
<xsl:if test="//np/@adjpCaseAffix!='no' and //np/@adjpCaseChange='yes'">
						<xsl:text>When the overt </xsl:text>
						<xsl:if test="//np/@case!='none' and //np/@possCaseErg='genitive' or //np/@case='nominative'">
							<xsl:text>genitive </xsl:text>
						</xsl:if>
						<xsl:if test="//np/@case='split' and //np/@possCaseErg!='genitive'">
							<xsl:text>or </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="//np/@possCaseErg='ergative' and //np/@case='ergative' or //np/@possCaseErg='ergative' and //np/@case='split'">
							<xsl:text>ergative </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="//np/@possCaseErg='absolutive' and //np/@case='ergative' or //np/@possCaseErg='absolutive' and //np/@case='split'">
							<xsl:text>absolutive </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:choose>
							<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">
<xsl:text>suffix</xsl:text>
</xsl:when>
							<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">
<xsl:text>prefix</xsl:text>
</xsl:when>
						</xsl:choose>
						<xsl:text> is present on the head noun, it indicates that an adjectival modifier and/or a possessor must be present in the phrase.  If the adjective is marked with this </xsl:text>
						<xsl:if test="//np/@case!='none' and //np/@possCaseErg='genitive' or //np/@case='nominative'">
							<xsl:text>genitive </xsl:text>
						</xsl:if>
						<xsl:if test="//np/@case='split' and //np/@possCaseErg!='genitive'">
							<xsl:text>or </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="//np/@possCaseErg='ergative' and //np/@case='ergative' or //np/@possCaseErg='ergative' and //np/@case='split'">
							<xsl:text>ergative </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:if test="//np/@possCaseErg='absolutive' and //np/@case='ergative' or //np/@possCaseErg='absolutive' and //np/@case='split'">
							<xsl:text>absolutive </xsl:text>
						</xsl:if>
						<xsl:text></xsl:text>
						<xsl:choose>
							<xsl:when test="//np/@adjpCaseAffix='yesSuffix'">
<xsl:text>suffix,</xsl:text>
</xsl:when>
							<xsl:when test="//np/@adjpCaseAffix='yesPrefix'">
<xsl:text>prefix,</xsl:text>
</xsl:when>
						</xsl:choose>
						<xsl:text> then another adjective and/or a possessor must also be present.</xsl:text>
					</xsl:if>
<xsl:text></xsl:text>
</p>
</xsl:if>
			</section3>
</xsl:if>
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
			<xsl:if test="//np/@comp='no'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> does not  have any compound nouns or noun modifiers that are written as separate words.  They are all written as a single word with the head noun.  Examples include:</xsl:text>
</p>
</xsl:if>
			<xsl:if test="//np/@comp='yes'">
<p>
<xsl:text></xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> has compound nouns or noun modifiers that are written as separate words.  The </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@compHead='left'">
<xsl:text>left-most</xsl:text>
</xsl:when>
					<xsl:when test="//np/@compHead='right'">
<xsl:text>right-most</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> noun is the head in these constructions.   Examples include:</xsl:text>
</p>
</xsl:if>
			<example num="xNP.NPCompounds.12">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/compExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//np/compExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/compExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/compExample)" />
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
</xsl:attribute>the tablecloth [of my mother's]</langData>
<xsl:text>.    In English, the PP always comes after the noun.</xsl:text>
</p>
			<p>
<xsl:text>In </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>, the PP occurs </xsl:text>
<xsl:choose>
					<xsl:when test="//np/@ppPos='before'">
<xsl:text>before</xsl:text>
</xsl:when>
					<xsl:when test="//np/@ppPos='after'">
<xsl:text>after</xsl:text>
</xsl:when>
					<xsl:when test="//np/@ppPos='either'">
<xsl:text>on either side of</xsl:text>
</xsl:when>
					<xsl:when test="//np/@ppPos='unknown'">
<xsl:text>_______</xsl:text>
</xsl:when>
				</xsl:choose>
<xsl:text> the head noun.  </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> examples with PP modifiers or complements include:</xsl:text>
</p>
			<example num="xNP.NPPP.8">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/compPPExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//np/compPPExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/compPPExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/compPPExample)" />
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
<xsl:text>See section </xsl:text>
<sectionRef sec="sPP" />
<xsl:text> for more details on PPs in </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text>.</xsl:text>
</p>
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
<xsl:text> Therefore, our grammar rules will allow participle phrases to occupy the head position in the nominal phrase.</xsl:text>
</p>
			<p>
<xsl:text>Examples from </xsl:text>
<xsl:value-of select="//language/langName" />
<xsl:text> of participles or participle phrases that can take the place of a noun in a nominal phrase include:</xsl:text>
</p>
			<example num="xNP.NPPP.16">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partHeadExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//np/partHeadExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partHeadExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/partHeadExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPP.16</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPP.16.1</xsl:text>
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
<xsl:text>These participle phrases can be used in full sentences as shown here:</xsl:text>
</p>
			<example num="xNP.NPPP.20">
<xsl:variable name="sExampleValue">
<xsl:value-of select="//np/partHeadSentExample" />
</xsl:variable>
<xsl:variable name="iExampleLength" select="string-length(//np/partHeadSentExample)" />
<xsl:choose>
<xsl:when test="$iExampleLength != 0 and $sExampleValue != ' '">
<xsl:call-template name="OutputInterlinearExamples">
<xsl:with-param name="sExamples">
<xsl:value-of select="//np/partHeadSentExample" />
</xsl:with-param>
<xsl:with-param name="iLength">
<xsl:value-of select="string-length(//np/partHeadSentExample)" />
</xsl:with-param>
<xsl:with-param name="sExNumber">xNP.NPPP.20</xsl:with-param>
<xsl:with-param name="sLetterList">
<xsl:value-of select="$sMasterLetterList" />
</xsl:with-param>
</xsl:call-template>
</xsl:when>
<xsl:otherwise>
<listInterlinear>
<xsl:attribute name="letter">
<xsl:text>xNP.NPPP.20.1</xsl:text>
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
	</section1>

































































































































































































































































































































































































































































































































































































































































</xsl:template>
</xsl:stylesheet>
