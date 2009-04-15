<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="dp">
	<xsl:text>
rule {DP option conj - conjoined DPs}
DP = (InitConj) DP_1 Conj DP_2
	&lt;DP head&gt; = &lt;DP_1 head&gt;
	&lt;DP conjoined&gt; = +
	&lt;DP_1 conjoined&gt; = -	|limit recursion
	&lt;DP head type negative&gt; &lt;= &lt;Conj head type negative&gt;
	&lt;DP head agr number&gt; &lt;= &lt;Conj head agr number&gt;
	&lt;DP option&gt; = conj
</xsl:text>
	<xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@headless)='yes'">
<xsl:text>
rule {DP option RelCP - headless relative CP}
DP = CP
	&lt;DP head&gt; = &lt;CP head&gt;
	&lt;CP head type relative&gt; = +
	&lt;CP head type verbheaded&gt; = +          | to restrict recursion
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP option&gt; = RelCP
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/@type)='IP' and normalize-space(//relcl/@headless)='yes'">
<xsl:text>
rule {DP option RelIP - headless relative IP}
DP = IP
	&lt;DP head&gt; = &lt;IP head&gt;
	&lt;IP head type relative&gt; = +
	&lt;IP head type verbheaded&gt; = +          | to restrict recursion
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP option&gt; = RelIP
</xsl:text>
</xsl:if>








	<xsl:if test="normalize-space(//pron/@poss)!='no' or normalize-space(//pron/@refl)!='no' or normalize-space(//pron/@recip)!='no'">
<xsl:text>
rule {DP option Pron - possessives, reflexives and reciprocals}
DP = Pron
	&lt;DP head&gt; = &lt;Pron head&gt;
	{&lt;Pron head type possessive&gt; = +
		/&lt;Pron head type reflexive&gt; = +
		/&lt;Pron head type reciprocal&gt; = +
		}
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP option&gt; = Pron
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//pron/@pronounCat)='DP' and normalize-space(//pron/@partitive)='after'">
<xsl:text>
rule {DP option noNF - pronoun,dem,quantifiers w/ optional partitive PP after}
DP = {Pron / Dem / Q / Num / Deg} (PP)
	&lt;DP head&gt; = &lt;Pron head&gt;
	&lt;Pron head type possessive&gt; = -
	&lt;Pron head type reflexive&gt; = -
	&lt;Pron head type reciprocal&gt; = -
	&lt;DP head&gt; = &lt;Dem head&gt;
	&lt;DP head&gt; = &lt;Q head&gt;
	&lt;DP head&gt; = &lt;Num head&gt;
	&lt;DP head&gt; = &lt;Deg head&gt;
	&lt;Deg head type quantifier&gt; = +
	&lt;Dem head type wh &gt; = -
	&lt;PP head type stranded&gt; = -
	&lt;PP head type sentential&gt; = -

	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -
	&lt;DP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;Pron head&gt; == ~[case:genitive]
	&lt;DP option&gt; = noNF
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//pron/@pronounCat)='DP' and normalize-space(//pron/@partitive)='before'">
<xsl:text>
rule {DP option noNI - pronoun,dem,quantifiers, w/ optional partitive PP before}
DP = (PP) {Pron / Dem / Q / Num / Deg }
	&lt;DP head&gt; = &lt;Pron head&gt;
	&lt;Pron head type possessive&gt; = -  | these use DP rule "Pron"
	&lt;Pron head type reflexive&gt; = -
	&lt;Pron head type reciprocal&gt; = -
	&lt;DP head&gt; = &lt;Dem head&gt;
	&lt;DP head&gt; = &lt;Q head&gt;
	&lt;DP head&gt; = &lt;Num head&gt;
	&lt;DP head&gt; = &lt;Deg head&gt;
	&lt;Deg head type quantifier&gt; = +
	&lt;Dem head type wh &gt; = -		| so "which" not separate
	&lt;PP head type stranded&gt; = -	| PP must have overt complement
	&lt;PP head type sentential&gt; = -	| sentential not within NP

	&lt;DP head type prefix poss&gt; = -  |can't be possessors
	&lt;DP head type suffix poss&gt; = -  |can't be possessors
	&lt;DP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;Pron head&gt; == ~[case:genitive]
	&lt;DP option&gt; = noNI
</xsl:text>
</xsl:if>






	<xsl:text>
rule {DP option 0 - no Deg modifiers}
DP = {D' / D''}
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP option&gt; = 0
</xsl:text>
	<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//qp/@npDegreePos)='before' or normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//qp/@npDegreePos)='beforeOrBoth'">
<xsl:text>
rule {DP option 1 - degree modifier initial}
DP = Deg {D' / D''}
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;Deg head type modifies_NP&gt; = +
	&lt;Deg head type DP-initial&gt; = +
	&lt;Deg head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg head case&gt; = &lt;DP head case&gt;
	&lt;DP head type negative&gt; &lt;= &lt;Deg head type negative&gt; |polarity from Deg
	&lt;DP head type prefix&gt; &lt;= &lt;Deg head type prefix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP head&gt; == ~[case:genitive] 	|Deg not w/in possessor
	&lt;DP option&gt; = 1
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='before' and normalize-space(//qp/@npDegreeNegPos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='before' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='before' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='before' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth'">
<xsl:text>
rule {DP option 1NegInitial - modifiers initial, Deg_1 is negative, Deg is positive}
DP = Deg_1 Deg {D' / D''}
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;Deg head type modifies_NP&gt; = +
	&lt;Deg head type DP-initial&gt; = +
	&lt;Deg head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg head case&gt; = &lt;DP head case&gt;
	&lt;Deg head type negative&gt; = -
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-initial&gt; = +
	&lt;Deg_1 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_1 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_1 head type negative&gt; = +
	&lt;DP head type negative&gt; &lt;= &lt;Deg_1 head type negative&gt; | polarity comes from Deg_1
	&lt;DP head type prefix&gt; &lt;= &lt;Deg_1 head type prefix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP head&gt; == ~[case:genitive] 	|Deg not w/in possessor
	&lt;DP option&gt; = 1NegInitial
</xsl:text>
</xsl:if>

































































































































	<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='before' and normalize-space(//qp/@npDegreeNegPos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='before' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='before' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='before' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth'">
<xsl:text>
rule {DP option 1NegFinal - modifiers Deg positive initial, Deg_1 negative final}
DP = Deg {D' / D''} Deg_1
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;Deg head type modifies_NP&gt; = +
	&lt;Deg head type DP-initial&gt; = +
	&lt;Deg head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg head case&gt; = &lt;DP head case&gt;
	&lt;Deg head type negative&gt; = -
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-final&gt; = +
	&lt;Deg_1 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_1 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_1 head type negative&gt; = +
	&lt;DP head type negative&gt; &lt;= &lt;Deg_1 head type negative&gt; | polarity comes from Deg_1
	&lt;DP head type prefix&gt; &lt;= &lt;Deg head type prefix&gt;
	&lt;DP head type suffix&gt; &lt;= &lt;Deg_1 head type suffix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP head&gt; == ~[case:genitive] 	|Deg not w/in possessor
	&lt;DP option&gt; = 1NegIFinal
</xsl:text>
</xsl:if>

































































































































	<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='before' and normalize-space(//qp/@npDegreeNegPos)='both' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='both' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='both' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='both' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='before' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='before' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='before' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth'">
<xsl:text>
rule {DP option 1NegBoth - Deg is positive initial, Deg_1, Deg_2 negative}
DP = Deg_1 Deg {D' / D''} Deg_2
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;Deg head type modifies_NP&gt; = +
	&lt;Deg head type DP-initial&gt; = +
	&lt;Deg head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg head case&gt; = &lt;DP head case&gt;
	&lt;Deg head type negative&gt; = -
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-initial&gt; = +
	&lt;Deg_1 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_1 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_1 head type negative&gt; = +
	&lt;Deg_2 head type modifies_NP&gt; = +
	&lt;Deg_2 head type DP-final&gt; = +
	&lt;Deg_2 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_2 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_2 head type negative&gt; = +
	&lt;DP head type negative&gt; &lt;= &lt;Deg_1 head type negative&gt; | polarity comes from Deg_1
	&lt;DP head type prefix&gt; &lt;= &lt;Deg_1 head type prefix&gt;
	&lt;DP head type suffix&gt; &lt;= &lt;Deg_2 head type suffix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP head&gt; == ~[case:genitive] 	|Deg not w/in possessor
	&lt;DP option&gt; = 1NegBoth
</xsl:text>
</xsl:if>

































































































































	<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yesNeg' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yesPos' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//qp/@npDegreePos)='after' or normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//qp/@npDegreePos)='either' or normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yesPosOnly' and normalize-space(//qp/@npDegreePos)='afterOrBoth'">
<xsl:text>
rule {DP option 2 - degree modifier final}
DP = {D' / D''} Deg
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;Deg head type modifies_NP&gt; = +
	&lt;Deg head type DP-final&gt; = +
	&lt;Deg head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg head case&gt; = &lt;DP head case&gt;
	&lt;DP head type negative&gt; &lt;= &lt;Deg head type negative&gt; |polarity from Deg
	&lt;DP head type suffix&gt; &lt;= &lt;Deg head type suffix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP head&gt; == ~[case:genitive] 	|Deg not w/in possessor
	&lt;DP option&gt; = 2
</xsl:text>
</xsl:if>

































































	<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='after' and normalize-space(//qp/@npDegreeNegPos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='after' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='after' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='after' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth'">
<xsl:text>
rule {DP option 2NegInitial - Deg_1 negative initial, Deg positive final}
DP = Deg_1 {D' / D''} Deg
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;Deg head type modifies_NP&gt; = +
	&lt;Deg head type DP-final&gt; = +
	&lt;Deg head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg head case&gt; = &lt;DP head case&gt;
	&lt;Deg head type negative&gt; = -
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-initial&gt; = +
	&lt;Deg_1 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_1 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_1 head type negative&gt; = +
	&lt;DP head type negative&gt; &lt;= &lt;Deg_1 head type negative&gt; | polarity comes from Deg_1
	&lt;DP head type prefix&gt; &lt;= &lt;Deg_1 head type prefix&gt;
	&lt;DP head type suffix&gt; &lt;= &lt;Deg_1 head type suffix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP head&gt; == ~[case:genitive] 	|Deg not w/in possessor
	&lt;DP option&gt; = 2NegInitial
</xsl:text>
</xsl:if>

































































































































	<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='after' and normalize-space(//qp/@npDegreeNegPos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='after' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='after' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='after' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth'">
<xsl:text>
rule {DP option 2NegFinal - modifiers Deg positive final, Deg_1 negative final}
DP = {D' / D''} Deg Deg_1
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;Deg head type modifies_NP&gt; = +
	&lt;Deg head type DP-final&gt; = +
	&lt;Deg head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg head case&gt; = &lt;DP head case&gt;
	&lt;Deg head type negative&gt; = -
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-final&gt; = +
	&lt;Deg_1 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_1 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_1 head type negative&gt; = +
	&lt;DP head type negative&gt; &lt;= &lt;Deg_1 head type negative&gt; | polarity comes from Deg_1
	&lt;DP head type suffix&gt; &lt;= &lt;Deg_1 head type suffix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP head&gt; == ~[case:genitive] 	|Deg not w/in possessor
	&lt;DP option&gt; = 2NegIFinal
</xsl:text>
</xsl:if>

































































































































	<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='after' and normalize-space(//qp/@npDegreeNegPos)='both' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='both' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='both' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='both' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='after' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='after' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='after' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='either' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth'">
<xsl:text>
rule {DP option 2NegBoth - Deg is positive final, Deg_1, Deg_2 negative}
DP = Deg_1 {D' / D''} Deg Deg_2
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;Deg head type modifies_NP&gt; = +
	&lt;Deg head type DP-final&gt; = +
	&lt;Deg head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg head case&gt; = &lt;DP head case&gt;
	&lt;Deg head type negative&gt; = -
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-initial&gt; = +
	&lt;Deg_1 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_1 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_1 head type negative&gt; = +
	&lt;Deg_2 head type modifies_NP&gt; = +
	&lt;Deg_2 head type DP-final&gt; = +
	&lt;Deg_2 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_2 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_2 head type negative&gt; = +
	&lt;DP head type negative&gt; &lt;= &lt;Deg_1 head type negative&gt; | polarity comes from Deg_1
	&lt;DP head type prefix&gt; &lt;= &lt;Deg_1 head type prefix&gt;
	&lt;DP head type suffix&gt; &lt;= &lt;Deg_2 head type suffix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP head&gt; == ~[case:genitive] 	|Deg not w/in possessor
	&lt;DP option&gt; = 2NegBoth
</xsl:text>
</xsl:if>

































































































































	<xsl:if test="normalize-space(//qp/@npDegree)!='no' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegreePos)='both' or normalize-space(//qp/@npDegree)!='no' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegreePos)='afterOrBoth' or normalize-space(//qp/@npDegree)!='no' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' or normalize-space(//qp/@npDegree)!='no' and normalize-space(//qp/@npDegree)!='noPosOnly' and normalize-space(//qp/@npDegreePos)='beforeOrBoth'">
<xsl:text>
rule {DP option 3 - modifiers both sides}
DP = Deg_1 {D' / D''} Deg_2
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;Deg_1 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_1 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_2 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_2 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_2 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-initial&gt;  = +
	&lt;Deg_2 head type DP-final&gt;    = +
	&lt;DP head type negative&gt; &lt;= &lt;Deg_1 head type negative&gt; | polarity comes from Deg_1
	&lt;DP head type negative&gt; &lt;= &lt;Deg_2 head type negative&gt; | or polarity  from Deg_2
	&lt;DP head type prefix&gt; &lt;= &lt;Deg_1 head type prefix&gt;
	&lt;DP head type suffix&gt; &lt;= &lt;Deg_2 head type suffix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP head&gt; == ~[case:genitive] 	|Deg not w/in possessor
	&lt;DP option&gt; = 3
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='both' and normalize-space(//qp/@npDegreeNegPos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='before' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='both' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='both' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='both' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth'">
<xsl:text>
rule {DP option 3NegInitial - modifiers both sides, Deg_1,Deg_2 positive, Deg_3 negative}
DP = Deg_3 Deg_1 {D' / D''} Deg_2
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;Deg_1 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_1 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_2 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_2 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_3 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_3 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_2 head type modifies_NP&gt; = +
	&lt;Deg_3 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-initial&gt;  = +
	&lt;Deg_2 head type DP-final&gt;    = +
	&lt;Deg_3 head type DP-initial&gt;  = +
	&lt;Deg_1 head type negative&gt; = -
	&lt;Deg_2 head type negative&gt; = -
	&lt;Deg_3 head type negative&gt; = +
	&lt;DP head type negative&gt; &lt;= &lt;Deg_3 head type negative&gt; | polarity comes from Deg_3
	&lt;DP head type prefix&gt; &lt;= &lt;Deg_3 head type prefix&gt;
	&lt;DP head type suffix&gt; &lt;= &lt;Deg_2 head type suffix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP head&gt; == ~[case:genitive] 	|Deg not w/in possessor
	&lt;DP option&gt; = 3NegInitial
</xsl:text>
</xsl:if>

































































































































	<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='both' and normalize-space(//qp/@npDegreeNegPos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='after' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='both' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='either' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='both' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='both' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth'">
<xsl:text>
rule {DP option 3NegFinal - modifiers both sides, Deg_1,Deg_2 positive, Deg_4 negative}
DP = Deg_1 {D' / D''} Deg_2 Deg_4
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;Deg_1 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_1 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_2 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_2 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_4 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_4 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_2 head type modifies_NP&gt; = +
	&lt;Deg_4 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-initial&gt;  = +
	&lt;Deg_2 head type DP-final&gt;    = +
	&lt;Deg_4 head type DP-final&gt;  = +
	&lt;Deg_1 head type negative&gt; = -
	&lt;Deg_2 head type negative&gt; = -
	&lt;Deg_4 head type negative&gt; = +
	&lt;DP head type negative&gt; &lt;= &lt;Deg_4 head type negative&gt; | polarity comes from Deg_4
	&lt;DP head type prefix&gt; &lt;= &lt;Deg_1 head type prefix&gt;
	&lt;DP head type suffix&gt; &lt;= &lt;Deg_4 head type suffix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP head&gt; == ~[case:genitive] 	|Deg not w/in possessor
	&lt;DP option&gt; = 3NegFinal
</xsl:text>
</xsl:if>

































































































































	<xsl:if test="normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='both' and normalize-space(//qp/@npDegreeNegPos)='both' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='both' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='both' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='both' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='both' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='beforeOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='both' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='afterOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='both' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='afterOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='eitherOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth' or normalize-space(//qp/@npDegree)='yes' and normalize-space(//qp/@npDegreeNegCooccur)='yes' and normalize-space(//qp/@npDegreePos)='beforeOrBoth' and normalize-space(//qp/@npDegreeNegPos)='eitherOrBoth'">
<xsl:text>
rule {DP option 3NegBoth - modifiers both sides, Deg_1,Deg_2 positive, Deg_3,Deg_4 negative}
DP = Deg_3 Deg_1 {D' / D''} Deg_2 Deg_4
	&lt;DP head&gt; = &lt;D' head&gt;
	&lt;DP head&gt; = &lt;D'' head&gt;
	&lt;Deg_1 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_1 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_2 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_2 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_3 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_3 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_4 head agr&gt; = &lt;DP head agr&gt;
	&lt;Deg_4 head case&gt; = &lt;DP head case&gt;
	&lt;Deg_1 head type modifies_NP&gt; = +
	&lt;Deg_2 head type modifies_NP&gt; = +
	&lt;Deg_3 head type modifies_NP&gt; = +
	&lt;Deg_4 head type modifies_NP&gt; = +
	&lt;Deg_1 head type DP-initial&gt;  = +
	&lt;Deg_2 head type DP-final&gt;    = +
	&lt;Deg_3 head type DP-initial&gt;  = +
	&lt;Deg_4 head type DP-final&gt;    = +
	&lt;Deg_1 head type negative&gt; = -
	&lt;Deg_2 head type negative&gt; = -
	&lt;Deg_3 head type negative&gt; = +
	&lt;Deg_4 head type negative&gt; = +
	&lt;DP head type negative&gt; &lt;= &lt;Deg_3 head type negative&gt; | polarity comes from Deg_3
	&lt;DP head type prefix&gt; &lt;= &lt;Deg_3 head type prefix&gt;
	&lt;DP head type suffix&gt; &lt;= &lt;Deg_4 head type suffix&gt;
	&lt;DP head type&gt; &lt;= &lt;DP head type prefix&gt;  |promote clitic values to phrase
	&lt;DP head type&gt; &lt;= &lt;DP head type suffix&gt;  |promote clitic values to phrase
	&lt;DP head&gt; == ~[case:genitive] 	|Deg not w/in possessor
	&lt;DP option&gt; = 3NegBoth
</xsl:text>
</xsl:if>


































































































































	<xsl:if test="normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerPos)='before' or normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerPos)='either' or normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerPos)='eitherOrBoth' or normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerPos)='beforeOrBoth' or normalize-space(//qp/@determiner)='yesNo' and normalize-space(//qp/@determinerPos)='before' or normalize-space(//qp/@determiner)='yesNo' and normalize-space(//qp/@determinerPos)='either' or normalize-space(//qp/@determiner)='yesNo' and normalize-space(//qp/@determinerPos)='eitherOrBoth' or normalize-space(//qp/@determiner)='yesNo' and normalize-space(//qp/@determinerPos)='beforeOrBoth'">
<xsl:text>
rule {DBar option QuantDetInitialNeg  - quantifier determiners initial - including neg}
D' = Det N'
	&lt;D' head&gt; = &lt;N' head&gt;
	&lt;Det head type DP-initial&gt; = +
	&lt;Det head agr&gt; = &lt;N' head agr&gt;
	&lt;D' head type negative&gt; &lt;= &lt;Det head type negative&gt; |polarity from Det
	&lt;D' head type negative-polarity&gt; &lt;= &lt;Det head type negative-polarity&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Det head type prefix&gt;
	&lt;D' head&gt; == ~[case:genitive] 	|Det not w/in possessor
	&lt;D' option&gt; = QuantDetInitialNeg
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@determinerPos)='before' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@determinerPos)='either' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@determinerPos)='eitherOrBoth' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@determinerPos)='beforeOrBoth'">
<xsl:text>
rule {DBar option QuantDetInitialPos  - quantifier determiners initial - positive only}
D' = Det N'
	&lt;D' head&gt; = &lt;N' head&gt;
	&lt;Det head type DP-initial&gt; = +
	&lt;Det head type negative&gt; = -
	&lt;Det head agr&gt; = &lt;N' head agr&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Det head type prefix&gt;
	&lt;D' head&gt; == ~[case:genitive] 	|Det not w/in possessor
	&lt;D' option&gt; = QuantDetInitialPos
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerPos)='after' or normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerPos)='either' or normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerPos)='eitherOrBoth' or normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerPos)='afterOrBoth' or normalize-space(//qp/@determiner)='yesNo' and normalize-space(//qp/@determinerPos)='after' or normalize-space(//qp/@determiner)='yesNo' and normalize-space(//qp/@determinerPos)='either' or normalize-space(//qp/@determiner)='yesNo' and normalize-space(//qp/@determinerPos)='eitherOrBoth' or normalize-space(//qp/@determiner)='yesNo' and normalize-space(//qp/@determinerPos)='afterOrBoth'">
<xsl:text>
rule {DBar option QuantDetFinalNeg  - quantifier determiners final - including neg}
D' = N' Det
	&lt;D' head&gt; = &lt;N' head&gt;
	&lt;Det head type DP-initial&gt; = +
	&lt;Det head agr&gt; = &lt;N' head agr&gt;
	&lt;D' head type negative&gt; &lt;= &lt;Det head type negative&gt; |polarity from Det
	&lt;D' head type negative-polarity&gt; &lt;= &lt;Det head type negative-polarity&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Det head type suffix&gt;
	&lt;D' head&gt; == ~[case:genitive] 	|Det not w/in possessor
	&lt;D' option&gt; = QuantDetFinalNeg
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@determinerPos)='after' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@determinerPos)='either' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@determinerPos)='eitherOrBoth' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@determinerPos)='afterOrBoth'">
<xsl:text>
rule {DBar option QuantDetFinalPos  - quantifier determiners final - positive only}
D' = N' Det
	&lt;D' head&gt; = &lt;N' head&gt;
	&lt;Det head type DP-initial&gt; = +
	&lt;Det head type negative&gt; = -
	&lt;Det head agr&gt; = &lt;N' head agr&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Det head type suffix&gt;
	&lt;D' head&gt; == ~[case:genitive] 	|Det not w/in possessor
	&lt;D' option&gt; = QuantDetFinalPos
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerPos)='both' or normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerPos)='eitherOrBoth' or normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerPos)='beforeOrBoth' or normalize-space(//qp/@determiner)='yes' and normalize-space(//qp/@determinerPos)='afterOrBoth' or normalize-space(//qp/@determiner)='yesNo' and normalize-space(//qp/@determinerPos)='both' or normalize-space(//qp/@determiner)='yesNo' and normalize-space(//qp/@determinerPos)='eitherOrBoth' or normalize-space(//qp/@determiner)='yesNo' and normalize-space(//qp/@determinerPos)='beforeOrBoth' or normalize-space(//qp/@determiner)='yesNo' and normalize-space(//qp/@determinerPos)='afterOrBoth'">
<xsl:text>
rule {DBar option QuantDetBothNeg  - quantifier determiners both sides - including neg}
D' = Det N' Det_1
	&lt;D' head&gt; = &lt;N' head&gt;
	&lt;Det head type DP-initial&gt; = +
	&lt;Det_1 head type DP-final&gt; = +
	&lt;Det head agr&gt; = &lt;N' head agr&gt;
	&lt;Det_1 head agr&gt; = &lt;N' head agr&gt;
	&lt;D' head type negative&gt; &lt;= &lt;Det head type negative&gt; |polarity from Det
	&lt;D' head type negative&gt; &lt;= &lt;Det_1 head type negative&gt;  |or polarity from Det_1
	&lt;D' head type negative-polarity&gt; &lt;= &lt;Det head type negative-polarity&gt;
	&lt;D' head type negative-polarity&gt; &lt;= &lt;Det_1 head type negative-polarity&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Det head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Det_1 head type suffix&gt;
	&lt;D' head&gt; == ~[case:genitive] 	|Det not w/in possessor
	&lt;D' option&gt; = QuantDetBothNeg
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@determinerPos)='both' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@determinerPos)='eitherOrBoth' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@determinerPos)='beforeOrBoth' or normalize-space(//qp/@determiner)='yesSome' and normalize-space(//qp/@determinerPos)='afterOrBoth'">
<xsl:text>
rule {DBar option QuantDetBothPos  - quantifier determiners both sides - positive only}
D' = Det N' Det_1
	&lt;D' head&gt; = &lt;N' head&gt;
	&lt;Det head type DP-initial&gt; = +
	&lt;Det head type negative&gt; = -
	&lt;Det_1 head type DP-final&gt; = +
	&lt;Det_1 head type negative&gt; = -
	&lt;Det head agr&gt; = &lt;N' head agr&gt;
	&lt;Det_1 head agr&gt; = &lt;N' head agr&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Det head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Det_1 head type suffix&gt;
	&lt;D' head&gt; == ~[case:genitive] 	|Det not w/in possessor
	&lt;D' option&gt; = QuantDetBothPos
</xsl:text>
</xsl:if>


















	<xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@clausePos)='after' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@clausePos)='either'">
<xsl:text>
rule {DBar option 1frel - relative clause CP final}
D' = D'_1 CP
	&lt;D' head&gt; = &lt;D'_1 head&gt;
	&lt;CP head type relative&gt; = +
	&lt;CP head type verbheaded&gt; = +          | to restrict recursion
	&lt;CP head type question&gt; = -
	&lt;D' head agr animate&gt; = &lt;CP head agr animate&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;CP head type suffix&gt;
	&lt;D' option&gt; = 1frel
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@clausePos)='before' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/@type)='CP' and normalize-space(//relcl/@clausePos)='either'">
<xsl:text>
rule {DBar option 1irel - relative clause CP initial}
D' = CP D'_1
	&lt;D' head&gt; = &lt;D'_1 head&gt;
	&lt;CP head type relative&gt; = +
	&lt;CP head type verbheaded&gt; = +          | to restrict recursion
	&lt;CP head type question&gt; = -
	&lt;D' head agr animate&gt; = &lt;CP head agr animate&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;CP head type prefix&gt;
	&lt;D' option&gt; = 1irel
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/@type)='IP' and normalize-space(//relcl/@clausePos)='after' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/@type)='IP' and normalize-space(//relcl/@clausePos)='either'">
<xsl:text>
rule {DBar option 2frel - relative clause IP final}
D' = D'_1 IP
	&lt;D' head&gt; = &lt;D'_1 head&gt;
	&lt;IP head type relative&gt; = +
	&lt;IP head type verbheaded&gt; = +          | to restrict recursion
	&lt;D' head agr animate&gt; = &lt;IP head agr animate&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;IP head type suffix&gt;
	&lt;D' option&gt; = 2frel
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/@type)='IP' and normalize-space(//relcl/@clausePos)='before' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/@type)='IP' and normalize-space(//relcl/@clausePos)='either'">
<xsl:text>
rule {DBar option 2irel - relative clause IP initial}
D' = IP D'_1
	&lt;D' head&gt; = &lt;D'_1 head&gt;
	&lt;IP head type relative&gt; = +
	&lt;IP head type verbheaded&gt; = +          | to restrict recursion
	&lt;D' head agr animate&gt; = &lt;IP head agr animate&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;IP head type prefix&gt;
	&lt;D' option&gt; = 2irel
</xsl:text>
</xsl:if>














	<xsl:if test="normalize-space(//np/@artAndDem)='no'">
<xsl:text>
rule {DBar option 1 - no determiners}
D' = NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;D' option&gt; = 1
</xsl:text>
</xsl:if>



	<xsl:if test="normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 1poss - no determiners with possessed}
D' = NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;NP head type possessed&gt; = +
	&lt;D' option&gt; = 1poss
</xsl:text>
</xsl:if>



	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='before' and normalize-space(//np/@artRequired)='no' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 2a - only articles, initial, optional}
D' = (Art) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 2a
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='before' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 2apl - only articles, initial, optional for plural}
D' = (Art) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 2apl
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='before' and normalize-space(//np/@artRequired)='no' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 2aposs - only articles, initial, optional, not possessed}
D' = (Art) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 2aposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='before' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 2aplposs - only articles, initial, optional for plural, not possessed}
D' = (Art) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 2aplposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='after' and normalize-space(//np/@artRequired)='no' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 2b - only articles, final, optional}
D' = NP (Art)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 2b
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='after' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 2bpl - only articles, final, optional for plural}
D' = NP (Art)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 2bpl
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='after' and normalize-space(//np/@artRequired)='no' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 2bposs - only articles, final, optional, not possessed}
D' = NP (Art)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 2bposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='after' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 2bplposs - only articles, final, optional for plural, not possessed}
D' = NP (Art)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 2bplposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='no' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 2cwhI - only articles, either side, optional, wh initial}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 2cwhI
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='no' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 2cwhF - only articles, either side, optional, wh final}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 2cwhF
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='no' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 2cwhagr - only articles, either side, optional, wh agree}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 2cwhagr
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 2cplwhI - only articles, either side, optional for plural, wh initial}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 2cplwhI
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 2cplwhF - only articles, either side, optional for plural, wh final}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 2cplwhF
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 2cplwhagr - only articles, either side, optional for plural, wh agree}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 2cplwhagr
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='no' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 2cposswhI - only articles, either side, optional, not possessed, wh initial}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 2cposswhI
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='no' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 2cposswhF - only articles, either side, optional, not possessed, wh final}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 2cposswhF
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='no' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 2cposswhagr - only articles, either side, optional, not possessed, wh agree}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 2cposswhagr
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 2cplposswhI - only articles, either side, optional for plural, not possessed, wh initial}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 2cplposswhI
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 2cplposswhF - only articles, either side, optional for plural, not possessed, wh final}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 2cplposswhF
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 2cplposswhagr - only articles, either side, optional for plural, not possessed, wh agree}
D' = (Art_1) NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 2cplposswhagr
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='before' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 3a - only articles, initial, required}
D' = Art NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 3a
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='before' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 3asg - only articles, initial, required for singular}
D' = Art NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 3asg
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='before' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 3aposs - only articles, initial, required, not possessed}
D' = Art NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 3aposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='before' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 3asgposs - only articles, initial, required for singular, not possessed}
D' = Art NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 3asgposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='after' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 3b - only articles, final, required}
D' = NP Art
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 3b
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='after' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 3bsg - only articles, final, required for singular}
D' = NP Art
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 3bsg
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='after' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 3bposs - only articles, final, required, not possessed}
D' = NP Art
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 3bposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='after' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 3bsgposs - only articles, final, required for singular, not possessed}
D' = NP Art
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 3bsgposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 3cwhI - only articles, either side, required, wh initial}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3cwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 3cwhF - only articles, either side, required, wh final}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3cwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 3cwhagr - only articles, either side, required, wh agree}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3cwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 3csgwhI - only articles, either side, required for singular, wh initial}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3csgwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 3csgwhF - only articles, either side, required for singular, wh final}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3csgwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 3csgwhagr - only articles, either side, required for singular, wh agree}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3csgwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 3cposswhI - only articles, either side, required, not possessed, wh initial}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3cposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 3cposswhF - only articles, either side, required, not possessed, wh final}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3cposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 3cposswhagr - only articles, either side, required, not possessed, wh agree}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3cposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 3csgposswhI - only articles, either side, required for singular, not possessed, wh initial}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3csgposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 3csgposswhF - only articles, either side, required for singular, not possessed, wh final}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3csgposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 3csgposswhagr - only articles, either side, required for singular, not possessed, wh agree}
D' = Art_1 NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3csgposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 3dwhI - only articles, initial required, final optional, wh initial}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3dwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 3dwhF - only articles, initial required, final optional, wh final}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3dwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 3dwhagr - only articles, initial required, final optional, wh agree}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3dwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 3dsgwhI - only articles, initial required for singular, final optional, wh initial}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3dsgwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 3dsgwhF - only articles, initial required for singular, final optional, wh final}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3dsgwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 3dsgwhagr - only articles, initial required for singular, final optional, wh agree}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3dsgwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 3dposswhI - only articles, initial required, final optional, not possessed, wh initial}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3dposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 3dposswhF - only articles, initial required, final optional, not possessed, wh final}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3dposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 3dposswhagr - only articles, initial required, final optional, not possessed, wh agree}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3dposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 3dsgposswhI - only articles, initial required for singular, final optional, not possessed, wh initial}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3dsgposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 3dsgposswhF - only articles, initial required for singular, final optional, not possessed, wh final}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3dsgposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 3dsgposswhagr - only articles, initial required for singular, final optional, not possessed, wh agree}
D' = Art_1 NP (Art_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3dsgposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 3ewhI - only articles, final required, initial optional, wh initial}
D' = (Art_1) NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3ewhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 3ewhF - only articles, final required, initial optional, wh final}
D' = (Art_1) NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3ewhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 3esgwhagr - only articles, final required for singular, initial optional, wh agree}
D' = (Art_1) NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3esgwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 3eposswhI - only articles, final required, initial optional, not possessed, wh initial}
D' = (Art_1) NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3eposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 3eposswhF - only articles, final required, initial optional, not possessed, wh final}
D' = (Art_1) NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3eposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='yes' and normalize-space(//np/@artBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 3eposswhagr - only articles, final required, initial optional, not possessed, wh agree}
D' = (Art_1) NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3eposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='before'">
<xsl:text>
rule {DBar option 3esgposswhI - only articles, final required for singular, initial optional, not possessed, wh initial}
D' = (Art_1) NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3esgposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='after'">
<xsl:text>
rule {DBar option 3esgposswhF - only articles, final required for singular, initial optional, not possessed, wh final}
D' = (Art_1) NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3esgposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='article' and normalize-space(//np/@artPos)='either' and normalize-space(//np/@artRequired)='mass' and normalize-space(//np/@artBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whArtPos)='agree'">
<xsl:text>
rule {DBar option 3esgposswhagr - only articles, final required for singular, initial optional, not possessed, wh agree}
D' = (Art_1) NP Art_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt; = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 3esgposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='before' and normalize-space(//np/@demRequired)='no' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 4a - only demonstratives, initial, optional}
D' = (Dem) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 4a
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='before' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 4apl - only demonstratives, initial, optional for plural}
D' = (Dem) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 4apl
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='before' and normalize-space(//np/@demRequired)='no' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 4aposs - only demonstratives, initial, optional, not possessed}
D' = (Dem) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 4aposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='before' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 4aplposs - only demonstratives, initial, optional for plural, not possessed}
D' = (Dem) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	   {&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 4aplposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='after' and normalize-space(//np/@demRequired)='no' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 4b - only demonstratives, final, optional}
D' = NP (Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 4b
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='after' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 4bpl - only demonstratives, final, optional for plural}
D' = NP (Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	   {&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 4bpl
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='after' and normalize-space(//np/@demRequired)='no' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 4bposs - only demonstratives, final, optional, not possessed}
D' = NP (Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 4bposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='after' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 4bplposs - only demonstratives, final, optional for plural, not possessed}
D' = NP (Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 4bplposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='no' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 4cwhI - only demonstratives, either side, optional, wh initial}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 4cwhI
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='no' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 4cwhF - only demonstratives, either side, optional, wh final}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 4cwhF
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='no' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 4cwhagr - only demonstratives, either side, optional, wh agree}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 4cwhagr
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 4cplwhI - only demonstratives, either side, optional for plural, wh initial}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 4cplwhI
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 4cplwhF - only demonstratives, either side, optional for plural, wh final}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 4cplwhF
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 4cplwhagr - only demonstratives, either side, optional for plural, wh agree}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 4cplwhagr
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='no' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 4cposswhI - only demonstratives, either side, optional, not possessed, wh initial}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 4cposswhI
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='no' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 4cposswhF - only demonstratives, either side, optional, not possessed, wh final}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 4cposswhF
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='no' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 4cposswhagr - only demonstratives, either side, optional, not possessed, wh agree}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 4cposswhagr
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 4cplposswhI - only demonstratives, either side, optional for plural, not possessed, wh initial}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 4cplposswhI
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 4cplposswhF - only demonstratives, either side, optional for plural, not possessed, wh final}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 4cplposswhF
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 4cplposswhagr - only demonstratives, either side, optional for plural, not possessed, wh agree}
D' = (Dem_1) NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 4cplposswhagr
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='before' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 5a - only demonstratives, initial, required}
D' = Dem NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 5a
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='before' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 5asg - only demonstratives, initial, required for singular}
D' = Dem NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 5asg
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='before' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 5aposs - only demonstratives, initial, required, not possessed}
D' = Dem NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 5aposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='before' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 5asgposs - only demonstratives, initial, required for singular, not possessed}
D' = Dem NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 5asgposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='after' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 5b - only demonstratives, final, required}
D' = NP Dem
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 5b
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='after' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 5bsg - only demonstratives, final, required for singular}
D' = NP Dem
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 5bsg
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='after' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 5bposs - only demonstratives, final, required, not possessed}
D' = NP Dem
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 5bposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='after' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 5bsgposs - only demonstratives, final, required for singular, not possessed}
D' = NP Dem
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 5bsgposs
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 5cwhI - only demonstratives, either side, required, wh initial}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5cwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 5cwhF - only demonstratives, either side, required, wh final}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5cwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 5cwhagr - only demonstratives, either side, required, wh agree}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5cwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 5csgwhI - only demonstratives, either side, required for singular, wh initial}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5csgwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 5csgwhF - only demonstratives, either side, required for singular, wh final}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5csgwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 5csgwhagr - only demonstratives, either side, required for singular, wh agree}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5csgwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 5cposswhI - only demonstratives, either side, required, not possessed, wh initial}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5cposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 5cposswhF - only demonstratives, either side, required, not possessed, wh final}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5cposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 5cposswhagr - only demonstratives, either side, required, not possessed, wh agree}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5cposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 5csgposswhI - only demonstratives, either side, required for singular, not possessed, wh initial}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5csgposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 5csgposswhF - only demonstratives, either side, required for singular, not possessed, wh final}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5csgposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 5csgposswhagr - only demonstratives, either side, required for singular, not possessed, wh agree}
D' = Dem_1 NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5csgposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 5dwhI - only demonstratives, initial required, final optional, wh initial}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5dwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 5dwhF - only demonstratives, initial required, final optional, wh final}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5dwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 5dwhagr - only demonstratives, initial required, final optional, wh agree}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5dwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 5dsgwhI - only demonstratives, initial required for singular, final optional, wh initial}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5dsgwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 5dsgwhF - only demonstratives, initial required for singular, final optional, wh final}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5dsgwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 5dsgwhagr - only demonstratives, initial required for singular, final optional, wh agree}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5dsgwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 5dposswhI - only demonstratives, initial required, final optional, not possessed, wh initial}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5dposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 5dposswhF - only demonstratives, initial required, final optional, not possessed, wh final}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5dposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 5dposswhagr - only demonstratives, initial required, final optional, not possessed, wh agree}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5dposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 5dsgposswhI - only demonstratives, initial required for singular, final optional, not possessed, wh initial}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5dsgposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 5dsgposswhF - only demonstratives, initial required for singular, final optional, not possessed, wh final}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5dsgposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 5dsgposswhagr - only demonstratives, initial required for singular, final optional, not possessed, wh agree}
D' = Dem_1 NP (Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5dsgposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 5ewhI - only demonstratives, final required, initial optional, wh initial}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5ewhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 5ewhF - only demonstratives, final required, initial optional, wh final}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5ewhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 5ewhagr - only demonstratives, final required, initial optional, wh agree}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5ewhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 5esgwhI - only demonstratives, final required for singular, initial optional, wh initial}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5esgwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 5esgwhF - only demonstratives, final required for singular, initial optional, wh final}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5esgwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 5esgwhagr - only demonstratives, final required for singular, initial optional, wh agree}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5esgwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 5eposswhI - only demonstratives, final required, initial optional, not possessed, wh initial}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5eposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 5eposswhF - only demonstratives, final required, initial optional, not possessed, wh final}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5eposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='yes' and normalize-space(//np/@demBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 5eposswhagr - only demonstratives, final required, initial optional, not possessed, wh agree}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5eposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 5esgposswhI - only demonstratives, final required for singular, initial optional, not possessed, wh initial}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5esgposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 5esgposswhF - only demonstratives, final required for singular, initial optional, not possessed, wh final}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5esgposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='demonstrative' and normalize-space(//np/@demPos)='either' and normalize-space(//np/@demRequired)='mass' and normalize-space(//np/@demBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 5esgposswhagr - only demonstratives, final required for singular, initial optional, not possessed, wh agree}
D' = (Dem_1) NP Dem_2
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Dem_1 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; = &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt; = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 5esgposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='before' and normalize-space(//np/@demOrArtRequired)='no' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 6a - article or demonstrative initial, optional}
D' = (Art / Dem) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 6a
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='before' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 6apl - article or demonstrative initial, optional for plural}
D' = (Art / Dem) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper &gt; = +
		}
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 6apl
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='before' and normalize-space(//np/@demOrArtRequired)='no' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 6aposs - article or demonstrative initial, optional, not possessed}
D' = (Art / Dem) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 6aposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='before' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 6aplposs - article or demonstrative initial, optional for plural, not possessed}
D' = (Art / Dem) NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	   {&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper &gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 6aplposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='after' and normalize-space(//np/@demOrArtRequired)='no' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 6b - article or demonstrative final, optional}
D' = NP (Art / Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 6b
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='after' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 6bpl - article or demonstrative final, optional for plural}
D' = NP (Art / Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	   {&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper &gt; = +
		}
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 6bpl
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='after' and normalize-space(//np/@demOrArtRequired)='no' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 6bposs - article or demonstrative final, optional, not possessed}
D' = NP (Art / Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 6bposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='after' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 6bplposs - article or demonstrative final, optional for plural, not possessed}
D' = NP (Art / Dem)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper &gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 6bplposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='no' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 6cwhI - article or demonstrative either side, optional, wh initial}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 6cwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='no' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 6cwhF - article or demonstrative either side, optional, wh final}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 6cwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='no' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 6cwhagr - article or demonstrative either side, optional, wh agree}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 6cwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 6cplwhI - article or demonstrative either side, optional for plural, wh initial}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper &gt; = +
		}
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 6cplwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 6cplwhF - article or demonstrative either side, optional for plural, wh final}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper &gt; = +
		}
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 6cplwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 6cplwhagr - article or demonstrative either side, optional for plural, wh agree}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper &gt; = +
		}
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 6cplwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='no' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 6cposswhI - article or demonstrative either side, optional, not possessed, wh initial}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 6cposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='no' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 6cposswhF - article or demonstrative either side, optional, not possessed, wh final}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 6cposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='no' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 6cposswhagr - article or demonstrative either side, optional, not possessed, wh agree}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 6cposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 6cplposswhI - article or demonstrative either side, optional for plural, not possessed, wh initial}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper &gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 6cplposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 6cplposswhF - article or demonstrative either side, optional for plural, not possessed, wh final}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper &gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 6cplposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 6cplposswhagr - article or demonstrative either side, optional for plural, not possessed, wh agree}
D' = (Art_1 / Dem_1) NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper &gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 6cplposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='before' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 7a - article or demonstrative initial, required}
D' = {Art / Dem} NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 7a
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='before' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 7asg - article or demonstrative initial, required for singular}
D' = {Art / Dem} NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 7asg
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='before' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 7aposs - article or demonstrative initial, required, not possessed}
D' = {Art / Dem} NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 7aposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='before' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 7asgposs - article or demonstrative initial, required for singular, not possessed}
D' = {Art / Dem} NP
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D' option&gt; = 7asgposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='after' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 7b - article or demonstrative final, required}
D' = NP {Art / Dem}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 7b
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='after' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 7bsg - article or demonstrative final, required for singular}
D' = NP {Art / Dem}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 7bsg
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='after' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 7bposs - article or demonstrative final, required, not possessed}
D' = NP {Art / Dem}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 7bposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='after' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 7bsgposs - article or demonstrative final, required for singular, not possessed}
D' = NP {Art / Dem}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D' head agr&gt;
	&lt;Art head case&gt; = &lt;D' head case&gt;
	&lt;Dem head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D' option&gt; = 7bsgposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 7cwhI - article or demonstrative either side, required, wh initial}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7cwhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 7cwhF - article or demonstrative either side, required, wh final}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7cwhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 7cwhagr - article or demonstrative either side, required, wha gree}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7cwhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 7csgwhI - article or demonstrative either side, required for singular, wh initial}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7csgwhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 7csgwhF - article or demonstrative either side, required for singular, wh final}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7csgwhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 7csgwhagr - article or demonstrative either side, required for singular, wh agree}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7csgwhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 7cposswhI - article or demonstrative either side, required, not possessed, wh initial}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7cposswhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 7cposswhF - article or demonstrative either side, required, not possessed, wh final}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7cposswhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 7cposswhagr - article or demonstrative either side, required, not possessed, wh agree}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7cposswhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 7csgposswhI - article or demonstrative either side, required for singular, not possessed, wh initial}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7csgposswhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 7csgposswhF - article or demonstrative either side, required for singular, not possessed, wh final}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7csgposswhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 7csgposswhagr - article or demonstrative either side, required for singular, not possessed, wh agree}
D' = {Art_1 / Dem_1} NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7csgposswhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 7dwhI - article or demonstrative either side, initial required, wh initial}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7dwhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 7dwhF - article or demonstrative either side, initial required, wh final}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7dwhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 7dwhagr - article or demonstrative either side, initial required, wh agree}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7dwhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 7dsgwhI - article or demonstrative either side, initial required for singular, wh initial}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7dsgwhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 7dsgwhF - article or demonstrative either side, initial required for singular, wh final}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7dsgwhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 7dsgwhagr - article or demonstrative either side, initial required for singular, wh agree}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7dsgwhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 7dposswhI - article or demonstrative either side, initial required, not possessed, wh initial}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7dposswhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 7dposswhF - article or demonstrative either side, initial required, not possessed, wh final}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7dposswhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 7dposswhagr - article or demonstrative either side, initial required, not possessed, wh agree}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7dposswhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 7dsgposswhI - article or demonstrative either side, initial required for singular, not possessed, wh initial}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7dsgposswhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 7dsgposswhF - article or demonstrative either side, initial required for singular, not possessed, wh final}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7dsgposswhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 7dsgposswhagr - article or demonstrative either side, initial required for singular, not possessed, wh agree}
D' = {Art_1 / Dem_1} NP (Art_2 / Dem_2)
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7dsgposswhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 7ewhI - article or demonstrative either side, final required, wh initial}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7ewhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 7ewhF - article or demonstrative either side, final required, wh final}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7ewhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 7ewhagr - article or demonstrative either side, final required, wh agree}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7ewhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 7esgwhI - article or demonstrative either side, final required for singular, wh initial}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7esgwhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 7esgwhF - article or demonstrative either side, final required for singular, wh final}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7esgwhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 7esgwhagr - article or demonstrative either side, final required for singular, wh agree}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7esgwhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 7eposswhI - article or demonstrative either side, final required, not possessed, wh initial}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7eposswhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 7eposswhF - article or demonstrative either side, final required, not possessed, wh final}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7eposswhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='yes' and normalize-space(//np/@demOrArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 7eposswhagr - article or demonstrative either side, final required, not possessed, wh agree}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7eposswhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 7esgposswhI - article or demonstrative either side, final required for singular, not possessed, wh initial}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7esgposswhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 7esgposswhF - article or demonstrative either side, final required for singular, not possessed, wh final}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Art_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7esgposswhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='no' and normalize-space(//np/@demOrArtPos)='either' and normalize-space(//np/@demOrArtRequired)='mass' and normalize-space(//np/@demOrArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 7esgposswhagr - article or demonstrative either side, final required for singular, not possessed, wh agree}
D' = (Art_1 / Dem_1) NP {Art_2 / Dem_2}
	&lt;D' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D' head case&gt;
	&lt;Dem_1 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_1 head case&gt; = &lt;NP head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;NP head agr&gt;
	&lt;Dem_2 head case&gt; = &lt;NP head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Art_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Art_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Art_2 head type wh&gt;
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Art_1 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D' option&gt; = 7esgposswhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='before' and normalize-space(//np/@demAndArtDemRequired)='no' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 8aD - demonstratives before, optional}
D' = (Dem) D''
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 8aD
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='before' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 8aplD - demonstratives before, optional for plural}
D' = (Dem) D''
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
		{&lt;D'' head agr number&gt; = plural
		/&lt;D'' head type mass&gt; = +
		/&lt;D'' head type proper&gt; = +
		}
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 8aplD
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='before' and normalize-space(//np/@demAndArtDemRequired)='no' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 8aDposs - demonstratives before, optional, not possessed}
D' = (Dem) D''
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 8aDposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='before' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 8aplDposs - demonstratives before, optional for plural, not possessed}
D' = (Dem) D''
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
		{&lt;D'' head agr number&gt; = plural
		/&lt;D'' head type mass&gt; = +
		/&lt;D'' head type proper&gt; = +
		}
	&lt;D'' head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 8aplDposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='after' and normalize-space(//np/@demAndArtDemRequired)='no' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 8bD - demonstratives after, optional}
D' = D'' (Dem)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 8bD
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='after' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 8bplD - demonstratives after, optional for plural}
D' = D'' (Dem)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
		{&lt;D'' head agr number&gt; = plural
		/&lt;D'' head type mass&gt; = +
		/&lt;D'' head type proper&gt; = +
		}
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 8bplD
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='after' and normalize-space(//np/@demAndArtDemRequired)='no' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 8bDposs - demonstratives after, optional, not possessed}
D' = D'' (Dem)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 8bDposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='after' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 8bplDposs - demonstratives after, optional for plural, not possessed}
D' = D'' (Dem)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
		{&lt;D'' head agr number&gt; = plural
		/&lt;D'' head type mass&gt; = +
		/&lt;D'' head type proper&gt; = +
		}
	&lt;D'' head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 8bplDposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='no' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8cDwhI - demonstratives both sides, both optional, wh initial}
D' = (Dem_1) D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8cDwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='no' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8cDwhF - demonstratives both sides, both optional, wh final}
D' = (Dem_1) D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8cDwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='no' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8cDwhagr - demonstratives both sides, both optional, wh agree}
D' = (Dem_1) D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8cDwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8cplDwhI - demonstratives both sides, both optional for plural, wh initial}
D' = (Dem_1) D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
		{&lt;D'' head agr number&gt; = plural
		/&lt;D'' head type mass&gt; = +
		/&lt;D'' head type proper&gt; = +
		}
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8cplDwhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8cplDwhF - demonstratives both sides, both optional for plural, wh final}
D' = (Dem_1) D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
		{&lt;D'' head agr number&gt; = plural
		/&lt;D'' head type mass&gt; = +
		/&lt;D'' head type proper&gt; = +
		}
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8cplDwhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8cplDwhagr - demonstratives both sides, both optional for plural, wh agree}
D' = (Dem_1) D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
		{&lt;D'' head agr number&gt; = plural
		/&lt;D'' head type mass&gt; = +
		/&lt;D'' head type proper&gt; = +
		}
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8cplDwhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='no' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8cDposswhI - demonstratives both sides, both optional, not possessed, wh initial}
D' = (Dem_1) D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8cDposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='no' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8cDposswhF - demonstratives both sides, both optional, not possessed, wh final}
D' = (Dem_1) D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8cDposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='no' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8cDposswhagr - demonstratives both sides, both optional, not possessed, wh agree}
D' = (Dem_1) D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8cDposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8cplDposswhI - demonstratives both sides, both optional for plural, not possessed, wh initial}
D' = (Dem_1) D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
		{&lt;D'' head agr number&gt; = plural
		/&lt;D'' head type mass&gt; = +
		/&lt;D'' head type proper&gt; = +
		}
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8cplDposswhI
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8cplDposswhF - demonstratives both sides, both optional for plural, not possessed, wh final}
D' = (Dem_1) D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
		{&lt;D'' head agr number&gt; = plural
		/&lt;D'' head type mass&gt; = +
		/&lt;D'' head type proper&gt; = +
		}
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8cplDposswhF
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8cplDposswhagr - demonstratives both sides, both optional for plural, not possessed, wh agree}
D' = (Dem_1) D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
		{&lt;D'' head agr number&gt; = plural
		/&lt;D'' head type mass&gt; = +
		/&lt;D'' head type proper&gt; = +
		}
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8cplDposswhagr
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='before' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 8dD - demonstratives before, required}
D' = Dem D''
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 8dD
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='before' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 8dsgD - demonstratives before, required for singular}
D' = Dem D''
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 8dsgD
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='before' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 8dDposs - demonstratives before, required, not possessed}
D' = Dem D''
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 8dDposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='before' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 8dsgDposs - demonstratives before, required for singular, not possessed}
D' = Dem D''
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D'' head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem head type prefix&gt;
	&lt;D' option&gt; = 8dsgDposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='after' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 8eD - demonstratives after, required}
D' = D'' Dem
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 8eD
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='after' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBar option 8esgD - demonstratives after, required for singular}
D' = D'' Dem
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 8esgD
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='after' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 8epossD - demonstratives after, required, not possessed}
D' = D'' Dem
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 8epossD
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='after' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBar option 8esgDposs - demonstratives after, required for singular, not possessed}
D' = D'' Dem
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D'' head type possessed&gt; = -
	&lt;D' head type wh&gt; &lt;= &lt;Dem head type wh&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem head type suffix&gt;
	&lt;D' option&gt; = 8esgDposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8fDwhI - demonstratives both sides, both required, wh initial}
D' = Dem_1 D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8fDwhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8fDwhF - demonstratives both sides, both required, wh final}
D' = Dem_1 D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8fDwhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8fDwhagr - demonstratives both sides, both required, wh agree}
D' = Dem_1 D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8fDwhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8fsgDwhI - demonstratives both sides, both required for singular, wh initial}
D' = Dem_1 D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8fsgDwhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8fsgDwhF - demonstratives both sides, both required for singular, wh final}
D' = Dem_1 D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8fsgDwhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8fsgDwhagr - demonstratives both sides, both required for singular, wh agree}
D' = Dem_1 D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8fsgDwhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8fDposswhI - demonstratives both sides, both required, not possessed, wh initial}
D' = Dem_1 D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8fDposswhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8fDposswhF - demonstratives both sides, both required, not possessed, wh final}
D' = Dem_1 D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8fDposswhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8fDposswhagr - demonstratives both sides, both required, not possessed, wh agree}
D' = Dem_1 D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8fDposswhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8fsgDposswhI - demonstratives both sides, both required for singular, not possessed, wh initial}
D' = Dem_1 D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8fsgDposswhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8fsgDposswhF - demonstratives both sides, both required for singular, not possessed, wh final}
D' = Dem_1 D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8fsgDposswhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8fsgDposswhagr - demonstratives both sides, both required for singular, not possessed, wh agree}
D' = Dem_1 D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8fsgDposswhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8gDwhI - demonstratives both sides, initial required, wh initial}
D' = Dem_1 D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8gDwhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8gDwhF - demonstratives both sides, initial required, wh final}
D' = Dem_1 D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8gDwhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8gDwhagr - demonstratives both sides, initial required, wh agree}
D' = Dem_1 D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8gDwhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8gsgDwhI - demonstratives both sides, initial required for singular, wh initial}
D' = Dem_1 D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8gsgDwhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8gsgDwhF - demonstratives both sides, initial required for singular, wh final}
D' = Dem_1 D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8gsgDwhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8gsgDwhagr - demonstratives both sides, initial required for singular, wh agree}
D' = Dem_1 D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8gsgDwhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8gDposswhI - demonstratives both sides, initial required, not possessed, wh initial}
D' = Dem_1 D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8gDposswhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8gDposswhF - demonstratives both sides, initial required, not possessed, wh final}
D' = Dem_1 D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8gDposswhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8gDposswhagr - demonstratives both sides, initial required, not possessed, wh agree}
D' = Dem_1 D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8gDposswhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8gsgDposswhI - demonstratives both sides, initial required for singular, not possessed, wh initial}
D' = Dem_1 D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8gsgDposswhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8gsgDposswhF - demonstratives both sides, initial required for singular, not possessed, wh final}
D' = Dem_1 D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8gsgDposswhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8gsgDposswhagr - demonstratives both sides, initial required for singular, not possessed, wh agree}
D' = Dem_1 D'' (Dem_2)
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8gsgDposswhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8hDwhI - demonstratives both sides, final required, wh initial}
D' = (Dem_1) D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8hDwhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8hDwhF - demonstratives both sides, final required, wh final}
D' = (Dem_1) D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8hDwhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8hDwhagr - demonstratives both sides, final required, wh agree}
D' = (Dem_1) D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8hDwhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8hsgDwhI - demonstratives both sides, final required for singular, wh initial}
D' = (Dem_1) D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8hsgDwhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8hsgDwhF - demonstratives both sides, final required for singular, wh final}
D' = (Dem_1) D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8hsgDwhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8hsgDwhagr - demonstratives both sides, final required for singular, wh agree}
D' = (Dem_1) D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8hsgDwhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8hDposswhI - demonstratives both sides, final required, not possessed, wh initial}
D' = (Dem_1) D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8hDposswhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8hDposswhF - demonstratives both sides, final required, not possessed, wh final}
D' = (Dem_1) D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8hDposswhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='yes' and normalize-space(//np/@demAndArtDemBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8hDposswhagr - demonstratives both sides, final required, not possessed, wh agree}
D' = (Dem_1) D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8hDposswhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='before'">
<xsl:text>
rule {DBar option 8hsgDposswhI - demonstratives both sides, final required for singular, not possessed, wh initial}
D' = (Dem_1) D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8hsgDposswhI
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='after'">
<xsl:text>
rule {DBar option 8hsgDposswhF - demonstratives both sides, final required for singular, not possessed, wh final}
D' = (Dem_1) D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;D' head type wh&gt; &lt;= &lt;Dem_2 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8hsgDposswhF
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtDemPos)='either' and normalize-space(//np/@demAndArtDemRequired)='mass' and normalize-space(//np/@demAndArtDemBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no' and normalize-space(//q/@whDemPos)='agree'">
<xsl:text>
rule {DBar option 8hsgDposswhagr - demonstratives both sides, final required for singular, not possessed, wh agree}
D' = (Dem_1) D'' Dem_2
	&lt;D' head&gt; = &lt;D'' head&gt;
	&lt;Dem_1 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_1 head case&gt; =  &lt;D' head case&gt;
	&lt;Dem_2 head agr&gt; =  &lt;D' head agr&gt;
	&lt;Dem_2 head case&gt; =  &lt;D' head case&gt;
	&lt;D'' head agr number&gt; = singular
	&lt;D'' head type mass&gt; = -
	&lt;D'' head type proper&gt; = -
	&lt;D'' head type possessed&gt; = -
	&lt;Dem_1 head type DP-initial&gt; = +
	&lt;Dem_2 head type DP-final&gt;   = +
	&lt;Dem_1 head type wh&gt; = &lt;Dem_2 head type wh&gt;
	&lt;D' head type wh&gt; &lt;= &lt;Dem_1 head type wh&gt;
	&lt;D' head type prefix&gt; &lt;= &lt;Dem_1 head type prefix&gt;
	&lt;D' head type suffix&gt; &lt;= &lt;Dem_2 head type suffix&gt;
	&lt;D' option&gt; = 8hsgDposswhagr
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='before' and normalize-space(//np/@demAndArtArtRequired)='no' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8aA - articles before, optional}
D'' = (Art) NP
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D'' option&gt; = 8aA
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='before' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8aplA - articles before, optional for plural}
D'' = (Art) NP
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D'' option&gt; = 8aplA
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='before' and normalize-space(//np/@demAndArtArtRequired)='no' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8aAposs - articles before, optional, not possessed}
D'' = (Art) NP
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D'' option&gt; = 8aAposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='before' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8apAposs - articles before, optional for plural, not possessed}
D'' = (Art) NP
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D'' option&gt; = 8apAposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='after' and normalize-space(//np/@demAndArtArtRequired)='no' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8bA - articles after, optional}
D'' = NP (Art)
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D'' option&gt; = 8bA
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='after' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8bplA - articles after, optional for plural}
D'' = NP (Art)
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D'' option&gt; = 8bplA
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='after' and normalize-space(//np/@demAndArtArtRequired)='no' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8bAposs - articles after, optional, not possessed}
D'' = NP (Art)
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D'' option&gt; = 8bAposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='after' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8bplAposs - articles after, optional for plural, not possessed}
D'' = NP (Art)
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D'' option&gt; = 8bplAposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='no' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8cA - articles both sides, both optional}
D'' = (Art_1) NP (Art_2)
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8cA
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8cplA - articles both sides, both optional for plural}
D'' = (Art_1) NP (Art_2)
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8cplA
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='no' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8cAposs - articles both sides, both optional, not possessed}
D'' = (Art_1) NP (Art_2)
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8cAposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8cplAposs - articles both sides, both optional for plural, not possessed}
D'' = (Art_1) NP (Art_2)
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
		{&lt;NP head agr number&gt; = plural
		/&lt;NP head type mass&gt; = +
		/&lt;NP head type proper&gt; = +
		}
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8cplAposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='before' and normalize-space(//np/@demAndArtArtRequired)='yes' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8dA - articles before, required}
D'' = Art NP
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D'' option&gt; = 8dA
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='before' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8dsgA - articles before, required for singular}
D'' = Art NP
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D'' option&gt; = 8dsgA
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='before' and normalize-space(//np/@demAndArtArtRequired)='yes' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8dAposs - articles before, required, not possessed}
D'' = Art NP
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D'' option&gt; = 8dAposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='before' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8dsgAposs - articles before, required for singular, not possessed}
D'' = Art NP
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type prefix&gt; &lt;= &lt;Art head type prefix&gt;
	&lt;D'' option&gt; = 8dsgAposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='after' and normalize-space(//np/@demAndArtArtRequired)='yes' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8eA - articles after, required}
D'' = NP Art
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D'' option&gt; = 8eA
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='after' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8esgA - articles after, required for singular}
D'' = NP Art
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D'' option&gt; = 8esgA
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='after' and normalize-space(//np/@demAndArtArtRequired)='yes' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8eAposs - articles after, required, not possessed}
D'' = NP Art
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D'' option&gt; = 8eAposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='after' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8esgAposs - articles after, required for singular, not possessed}
D'' = NP Art
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art head case&gt; = &lt;D'' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;D'' head type wh&gt; &lt;= &lt;Art head type wh&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art head type suffix&gt;
	&lt;D'' option&gt; = 8esgAposs
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='yes' and normalize-space(//np/@demAndArtArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8fA - articles both sides, both required}
D'' = Art_1 NP Art_2
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8fA
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@demAndArtArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8fsgA - articles both sides, both required for singular}
D'' = Art_1 NP Art_2
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8fsgA
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='yes' and normalize-space(//np/@demAndArtArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8fAposs - articles both sides, both required, not possessed}
D'' = Art_1 NP Art_2
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8fAposs
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@demAndArtArtBothRequiredPos)='both' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8fsgAposs - articles both sides, both required for singular, not possessed}
D'' = Art_1 NP Art_2
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8fsgAposs
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='yes' and normalize-space(//np/@demAndArtArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8gA - articles both sides, initial required}
D'' = Art_1 NP (Art_2)
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8gA
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@demAndArtArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8gsgA - articles both sides, initial required for singular}
D'' = Art_1 NP (Art_2)
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8gsgA
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='yes' and normalize-space(//np/@demAndArtArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8gAposs - articles both sides, initial required, not possessed}
D'' = Art_1 NP (Art_2)
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8gAposs
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@demAndArtArtBothRequiredPos)='before' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8gsgAposs - articles both sides, initial required for singular, not possessed}
D'' = Art_1 NP (Art_2)
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8gsgAposs
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='yes' and normalize-space(//np/@demAndArtArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8hA - articles both sides, final required}
D'' = (Art_1) NP Art_2
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8hA
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@demAndArtArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)!='no'">
<xsl:text>
rule {DBarBar option 8hsgA - articles both sides, final required for singular}
D'' = (Art_1) NP Art_2
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8hsgA
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='yes' and normalize-space(//np/@demAndArtArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8hAposs - articles both sides, final required, not possessed}
D'' = (Art_1) NP Art_2
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8hAposs
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@artAndDem)='both' and normalize-space(//np/@artBothCooccur)='yes' and normalize-space(//np/@demAndArtArtPos)='either' and normalize-space(//np/@demAndArtArtRequired)='mass' and normalize-space(//np/@demAndArtArtBothRequiredPos)='after' and normalize-space(//np/@possCooccur)='no'">
<xsl:text>
rule {DBarBar option 8hsgAposs - articles both sides, final required for singular, not possessed}
D'' = (Art_1) NP Art_2
	&lt;D'' head&gt; = &lt;NP head&gt;
	&lt;Art_1 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_1 head case&gt; = &lt;D'' head case&gt;
	&lt;Art_2 head agr&gt; = &lt;D'' head agr&gt;
	&lt;Art_2 head case&gt; = &lt;D'' head case&gt;
	&lt;NP head agr number&gt; = singular
	&lt;NP head type mass&gt; = -
	&lt;NP head type proper&gt; = -
	&lt;NP head type possessed&gt; = -
	&lt;Art_1 head type DP-initial&gt; = +
	&lt;Art_2 head type DP-final&gt;   = +
	&lt;D'' head type prefix&gt; &lt;= &lt;Art_1 head type prefix&gt;
	&lt;D'' head type suffix&gt; &lt;= &lt;Art_2 head type suffix&gt;
	&lt;D'' option&gt; = 8hsgAposs
</xsl:text>
</xsl:if>













</xsl:template>
</xsl:stylesheet>
