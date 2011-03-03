<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="vpintcop">

	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//typology/@wordOrder)='OSV' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@proDrop)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@proDrop)='noImp'">
<xsl:text>
rule {VP option conj - conjoined VPs}
VP = (InitConj) VP_1 Conj VP_2
	&lt;VP head&gt; = &lt;VP_1 head&gt;
	&lt;VP_1 head type participle&gt; = &lt;VP_2 head type participle&gt;
	&lt;VP_1 head type verbheaded&gt; = +
	&lt;VP_2 head type verbheaded&gt; = +
	&lt;VP_1 head fronted&gt; = none
	&lt;VP_2 head fronted&gt; = none
	&lt;Conj head type conjoins_IP&gt; = +
	&lt;VP conjoined&gt; = +
	&lt;VP_1 conjoined&gt; = -	|limit recursion
	&lt;VP option&gt; = conj
	</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//ip/@auxMany)='yes' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//ip/@auxMany)='yes' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//ip/@auxMany)='yes' and normalize-space(//typology/@wordOrder)='VSO'">
<xsl:text>
rule {VP option 0a - Aux initial, VP complement}
VP = Aux VP_1
	&lt;VP head&gt; = &lt;VP_1 head&gt;
	&lt;VP head type auxiliary&gt; = +	     | must have higher aux
	&lt;Aux head type negative&gt; = -	     | positive aux only
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
	}
	&lt;Aux head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;Aux head type prefix&gt;
	&lt;VP option&gt; = 0a
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//ip/@auxMany)='yes' and normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//ip/@auxMany)='yes' and normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//ip/@auxMany)='yes' and normalize-space(//typology/@wordOrder)='OSV'">
<xsl:text>
rule {VP option 0b - Aux final, VP complement}
VP = VP_1 Aux
	&lt;VP head&gt; = &lt;VP_1 head&gt;
	&lt;VP head type auxiliary&gt; = +	     | must have higher aux
	&lt;Aux head type negative&gt; = -	     | positive aux only
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
	}
	&lt;VP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;Aux head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;Aux head type suffix&gt;
	&lt;VP option&gt; = 0b
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//ip/@aux)='yes' and normalize-space(//q/@contFront)='before'">
<xsl:text>
rule {VP option 0c - Aux only for non-root copular questions}
VP = Aux
	&lt;VP head&gt; = &lt;Aux head&gt;
	&lt;Aux head type negative&gt; = -	      | positive aux only
	&lt;VP head type copular&gt; = +
	&lt;VP head type question&gt; = +
	&lt;VP head type root&gt; = -
	&lt;VP option&gt; = 0c
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//advp/@mannerType)='word'">
<xsl:text>
rule {VP option 1a - manner AdvP initial, adjoined to VP}
VP = AdvP VP_1
	&lt;VP head&gt; = &lt;VP_1 head&gt;
	&lt;AdvP head type manner&gt; = +
	&lt;AdvP head type negative&gt; = -	      | positive adv only
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	&lt;VP option&gt; = 1a
</xsl:text>
</xsl:if>



	<xsl:text>
rule {VP option 1b - AdvP final, adjoined to VP}
VP = VP_1 AdvP
	&lt;VP head&gt; = &lt;VP_1 head&gt;
	&lt;AdvP head type negative&gt; = -             | positive adv only
	&lt;VP_1 head type case-marked&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	&lt;VP head adverbial&gt; &lt;= &lt;AdvP&gt;
	&lt;VP head&gt; == [type:[motion:+]] -&gt; ~[adverbial:[head:[type:[locative:+]]]] |Locative needs to be inside VP
	&lt;VP option&gt; = 1b
</xsl:text>
	<xsl:text>
rule {VP option 1c - PP final, adjoined to VP}
VP = VP_1 PP
	&lt;VP head&gt; = &lt;VP_1 head&gt;
	&lt;VP_1 head type case-marked&gt; = -
	&lt;VP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP option&gt; = 1c
</xsl:text>
	<xsl:if test="normalize-space(//focus/@focus)='no' or normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusPos)!='after'">
<xsl:text>
rule {VP option 1d - heavy DP final, adjoined to VP}
VP = VP_1 DP
	&lt;VP head&gt; = &lt;VP_1 head&gt;
	&lt;DP head type no_N&gt; = -
	&lt;VP_1 head type verbheaded&gt; = +
	&lt;VP_1 head type case-marked&gt; = -
	&lt;VP_1 head type heavy_DP&gt; = -               | to restrict recursion
	&lt;VP head type heavy_DP&gt; &lt;= +
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;IP head type suffix&gt;
	&lt;VP head adjoined&gt; = &lt;DP&gt;
	&lt;VP head&gt; == [type:[motion:+]] -&gt; ~[adjoined:[head:[type:[locative:+]]]]
	&lt;VP head&gt; == [type:[motion:+]] -&gt; ~[adjoined:[head:[case:dative]]]
	&lt;VP option&gt; = 1d
	</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV'">
<xsl:text>
rule {VP option 2a - V initial/final, intransitive}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP option&gt; = 2a
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 2b - VSO order, intransitive}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type passive&gt; = -
	&lt;DP head type locative&gt; = -  	|can't be locative for motion verb
	&lt;DP head type possessive&gt; = -  	|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -	|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;DP head&gt; == ~[case:accusative]
	&lt;DP head&gt; == ~[case:ergative]
	&lt;DP head&gt; == ~[case:dative]
	&lt;VP option&gt; = 2b
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 2bNeg - VSO order, intransitive, neg subj requires neg verb}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type passive&gt; = -
	&lt;DP head type locative&gt; = -  	|can't be locative for motion verb
	&lt;DP head type possessive&gt; = -  	|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -	|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;DP head&gt; == ~[case:accusative]
	&lt;DP head&gt; == ~[case:ergative]
	&lt;DP head&gt; == ~[case:dative]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, verb must be
                     [type:[negative:+]]
		&lt;VP option&gt; = 2bNeg
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)!='no'">
<xsl:text>
rule {VP option 2bi - VSO/OSV order, intransitive, imperative}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 2bi
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)='yesClitic' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 2bp - VSO/OSV order, intransitive, pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;VP head type pro-drop&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 2bp
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 2c - OSV order, intransitive}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type passive&gt; = -
	&lt;DP head type locative&gt; = -	| can't be locative for motion V
	&lt;DP head type possessive&gt; = -  	|subject not possessive
	&lt;DP head type reflexive&gt; = -	|subject not reflexive
	&lt;DP head type reciprocal&gt; = -	|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -        | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;DP head&gt; == ~[case:accusative]
	&lt;DP head&gt; == ~[case:ergative]
	&lt;DP head&gt; == ~[case:dative]
	&lt;VP option&gt; = 2c
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 2cNeg - OSV order, intransitive, neg subject requires neg verb}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type passive&gt; = -
	&lt;DP head type locative&gt; = -	| can't be locative for motion V
	&lt;DP head type possessive&gt; = -  	|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -	|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;DP head&gt; == ~[case:accusative]
	&lt;DP head&gt; == ~[case:ergative]
	&lt;DP head&gt; == ~[case:dative]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, verb must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 2cNeg
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before'">
<xsl:text>
rule {VP option 2d - VSO/OSV, intransitive, subject questioned}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V  head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;VP option&gt; = 2d
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 2dfoc - VSO/OSV, intransitive, subject focused}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V  head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;VP option&gt; = 2dfoc
</xsl:text>
</xsl:if>












	<xsl:if test="normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//typology/@wordOrder)='SVO'">
<xsl:text>
rule {VP option 3a - V initial, motion intransitive}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 3a
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='SVO'">
<xsl:text>
rule {VP option 3aNeg - V initial, motion intransitive, neg adv requires neg verb}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 3aNeg
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//typology/@wordOrder)='SOV'">
<xsl:text>
rule {VP option 3b - V final, motion intransitive}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 3b
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='SOV'">
<xsl:text>
rule {VP option 3bNeg - V final, motion intransitive, neg adv requires neg verb}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 3bNeg
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//q/@contFront)='after'">
<xsl:text>
rule {VP option 3bQSubj - V final, motion intransitive, subject questioned}
VP = {PP / AdvP} DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type wh&gt; = +
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
		&lt;VP option&gt; = 3bQSubj
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 3bNegSubj - V final, motion intransitive, subject negative}
VP = {PP / AdvP} DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type negative&gt; = +
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
		&lt;VP option&gt; = 3bNegSubj
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 3bNegSubjVerbRequired - V final, motion intransitive, subject and verb negative}
VP = {PP / AdvP} DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type negative&gt; = +
	&lt;V head type negative&gt; = +        | neg subject requires neg verb
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 3bNegSubjVerbRequired
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//q/@contFront)='after'">
<xsl:text>
rule {VP option 3bQAdvP - V final, motion intransitive, adverb questioned}
VP = {PP / AdvP} AdvP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP_1 head type wh&gt; = +
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;AdvP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
		&lt;VP option&gt; = 3bQAdvP
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no'">
<xsl:text>
rule {VP option 3bNegAdvP - V final, motion intransitive, negative adverb}
VP = {PP / AdvP} AdvP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;AdvP_1 head type negative&gt; = +
	&lt;AdvP_1 head type wh&gt; = -
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;AdvP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 3bNegAdvP
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes'">
<xsl:text>
rule {VP option 3bNegAdvPVerbRequired - V final, motion intransitive, negative adverb and verb}
VP = {PP / AdvP} AdvP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;V head type negative&gt; = +
	&lt;AdvP_1 head type negative&gt; = +
	&lt;AdvP_1 head type wh&gt; = -
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;AdvP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 3bNegAdvPVerbRequired
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@advVerbRequired)='no'">
<xsl:text>
rule {VP option 3c - VSO order, motion intransitive}
VP = V DP {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type passive&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;DP head&gt; == ~[case:accusative]
	 &lt;DP head&gt; == ~[case:ergative]
	 &lt;DP head&gt; == ~[case:dative]
	 &lt;VP option&gt; = 3c
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@advVerbRequired)='no'">
<xsl:text>
rule {VP option 3cNegSubjVerbRequired - VSO order, motion intransitive, neg subject requires neg verb}
VP = V DP {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type passive&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, verb must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;DP head&gt; == ~[case:accusative]
	 &lt;DP head&gt; == ~[case:ergative]
	 &lt;DP head&gt; == ~[case:dative]
	 &lt;VP option&gt; = 3cNegSubjVerbRequired
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@advVerbRequired)='yes'">
<xsl:text>
rule {VP option 3cNegSubjOrAdvVerbRequired - VSO order, motion intransitive, neg subject or adv requires neg verb}
VP = V DP {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type passive&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, verb must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;DP head&gt; == ~[case:accusative]
	 &lt;DP head&gt; == ~[case:ergative]
	 &lt;DP head&gt; == ~[case:dative]
	 &lt;VP option&gt; = 3cNegSubjOrAdvVerbRequired
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@advVerbRequired)='yes'">
<xsl:text>
rule {VP option 3cNegAdvVerbRequired - VSO order, motion intransitive, neg adv requires neg verb}
VP = V DP {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type passive&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;DP head&gt; == ~[case:accusative]
	 &lt;DP head&gt; == ~[case:ergative]
	 &lt;DP head&gt; == ~[case:dative]
	 &lt;VP option&gt; = 3cNegAdvVerbRequired
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@advVerbRequired)='no'">
<xsl:text>
rule {VP option 3ci - VSO order, motion intransitive, imperative}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type motion&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
		&lt;VP option&gt; = 3ci
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@advVerbRequired)='yes'">
<xsl:text>
rule {VP option 3ciNegAdvVerbRequired - VSO order, motion intransitive, imperative, neg adv requires neg verb}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type motion&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 3ciNegAdvVerbRequired
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 3cp - VSO order, motion intransitive, pro-drop}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type motion&gt; = +
	&lt;VP head type pro-drop&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 3cp
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 3cpNegAdvVerbRequired - VSO order, motion intransitive, pro-drop, neg adv requires neg verb}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type motion&gt; = +
	&lt;VP head type pro-drop&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 3cpNegAdvVerbRequired
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//typology/@wordOrder)='OSV'">
<xsl:text>
rule {VP option 3d - OSV order, motion intransitive}
VP = {PP / AdvP} DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type passive&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;DP head&gt; == ~[case:accusative]
	 &lt;DP head&gt; == ~[case:ergative]
	 &lt;DP head&gt; == ~[case:dative]
	 &lt;VP option&gt; = 3d
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='OSV'">
<xsl:text>
rule {VP option 3dNegAdvVerbRequired - OSV order, motion intransitive}
VP = {PP / AdvP} DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type passive&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;DP head&gt; == ~[case:accusative]
	 &lt;DP head&gt; == ~[case:ergative]
	 &lt;DP head&gt; == ~[case:dative]
	 &lt;VP option&gt; = 3dNegAdvVerbRequired
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)!='no'">
<xsl:text>
rule {VP option 3di - OSV order, motion intransitive, imperative}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type motion&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 3di
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)!='no'">
<xsl:text>
rule {VP option 3diNegAdvVerbRequired - OSV order, motion intransitive, imperative}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type motion&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;VP head type question&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 3diNegAdvVerbRequired
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes'">
<xsl:text>
rule {VP option 3dp - OSV order, motion intransitive, pro-drop}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;VP head type pro-drop&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 3dp
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes'">
<xsl:text>
rule {VP option 3dpNegAdvVerbRequired - OSV order, motion intransitive, pro-drop}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;VP head type pro-drop&gt; = +
	&lt;V head type passive&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 3dpNegAdvVerbRequired
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@advVerbRequired)='no'">
<xsl:text>
rule {VP option 3e - VSO order, motion intransitive, subject questioned}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
		&lt;VP option&gt; = 3e
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 3efoc - VSO order, motion intransitive, subject focused}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
		&lt;VP option&gt; = 3efoc
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@advVerbRequired)='yes'">
<xsl:text>
rule {VP option 3eNegAdvVerbRequired - VSO order, motion intransitive, subject questioned}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 3eNegAdvVerbRequired
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 3eNegAdvVerbRequiredFoc - VSO order, motion intransitive, subject focused}
VP = V {PP / AdvP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FpcusP
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 3eNegAdvVerbRequiredFoc
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@advVerbRequired)='no'">
<xsl:text>
rule {VP option 3f - OSV order, motion intransitive, subject questioned}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	&lt;VP option&gt; = 3f
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 3fFoc - OSV order, motion intransitive, subject focused}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	&lt;VP option&gt; = 3fFoc
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@advVerbRequired)='yes'">
<xsl:text>
rule {VP option 3fNegAdvVerbRequired - OSV order, motion intransitive, subject questioned}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 3fNegAdvVerbRequired
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@advVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 3fNegAdvVerbRequiredFoc - OSV order, motion intransitive, subject focused}
VP = {PP / AdvP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head locative&gt; = &lt;PP&gt;
	&lt;VP head locative&gt; = &lt;AdvP&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	&lt;VP head&gt; == [locative:[head:[type:[negative:+]]]] -&gt;  | if locative negative, verb must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 3fNegAdvVerbRequiredFoc
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4a - V initial, copular, not passive}
VP = V {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4a
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4aNegVerbRequired - V initial, copular, not passive}
VP = V {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4aNegVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4b - V final, copular, not passive}
VP = {PP / AdjP / DP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4b
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4bNegVerbRequired - V final, copular, not passive}
VP = {PP / AdjP / DP} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4bNegVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//q/@ContFront)='after' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4bQSubj - V final, copular, not passive, subject questioned}
VP = {PP / AdjP / DP} DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head subject&gt; = &lt;DP_1&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 4bQSubj
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//q/@ContFront)='after' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4bQSubjNegObjVerbRequired - V final, copular, not passive, subject questioned}
VP = {PP / AdjP / DP} DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head subject&gt; = &lt;DP_1&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 4bQSubjNegObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes'">
<xsl:text>
rule {VP option 4bNegSubj - V final, copular, not passive, subject negative}
VP = {PP / AdjP / DP} DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head subject&gt; = &lt;DP_1&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = -
	&lt;DP_1 head type negative&gt; = +
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4bNegSubj
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 4bNegSubjVerbRequired - V final, copular, not passive, subject negative}
VP = {PP / AdjP / DP} DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head subject&gt; = &lt;DP_1&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = -
	&lt;DP_1 head type negative&gt; = +
	&lt;VP head type negative&gt; = +
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4bNegSubjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes'">
<xsl:text>
rule {VP option 4bNegSubjObjVerbRequired - V final, copular, not passive, subject negative}
VP = {PP / AdjP / DP} DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head subject&gt; = &lt;DP_1&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = -
	&lt;DP_1 head type negative&gt; = +
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, verb must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4bNegSubjObjVerbRequired
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//q/@ContFront)='after' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4bQAdvP - V final, copular, not passive, AdvP questioned}
VP = {PP / AdjP / DP} AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4bQAdvP
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//q/@ContFront)='after' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4bQAdvPObjVerbRequired - V final, copular, not passive, AdvP questioned}
VP = {PP / AdjP / DP} AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 4bQAdvPObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@objVerbRequired)!='yes'">
<xsl:text>
rule {VP option 4bNegAdvP - V final, copular, not passive, negative AdvP}
VP = {PP / AdjP / DP} AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;AdvP head type wh&gt; = -
	&lt;AdvP head type negative&gt; = +
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4bNegAdvP
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@objVerbRequired)='yes'">
<xsl:text>
rule {VP option 4bNegAdvPObjVerbRequired - V final, copular, not passive, negative AdvP}
VP = {PP / AdjP / DP} AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP&gt;
	&lt;AdvP head type wh&gt; = -
	&lt;AdvP head type negative&gt; = +
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head t pe prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, verb must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4bNegAdvPObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='no'">
<xsl:text>
rule {VP option 4c - copular sentence, no verb, not passive, no aux required}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;PP head type sentential&gt; = -
	&lt;VP head type copular&gt; = +
	&lt;VP head type verbheaded&gt; = -             | to restrict recursion
	&lt;VP head type transitive&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4c
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='yes'">
<xsl:text>
rule {VP option 4caff - copular sentence, no verb, not passive, no aux required, copular affix}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
        {&lt;AdjP head type prefix copular&gt; = +
        /&lt;AdjP head type suffix copular&gt; = +
        }
        {&lt;DP head type prefix copular&gt; = +
        /&lt;DP head type suffix copular&gt; = +
        }
	&lt;PP head type sentential&gt; = -
	&lt;VP head type copular&gt; = +
	&lt;V' head type verbheaded&gt; = -             | to restrict recursion
	&lt;VP head type transitive&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4cpre
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@copular)='yesAux'">
<xsl:text>
rule {VP option 4d - copular sentence, no verb, not passive, aux required}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;PP head type sentential&gt; = -
	&lt;VP head type copular&gt; = +
	&lt;V' head type verbheaded&gt; = -             | to restrict recursion
	&lt;VP head type transitive&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4d
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4e - VSO order, copular}
VP = V DP {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;DP head&gt; == ~[case:accusative]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 4e
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4eNegSubjVerbRequired - VSO order, copular}
VP = V DP {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;DP head&gt; == ~[case:accusative]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 4eNegSubjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4eNegSubjOrObjVerbRequired - VSO order, copular}
VP = V DP {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;DP head&gt; == ~[case:accusative]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4eNegSubjOrObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4eNegObjVerbRequired - VSO order, copular}
VP = V DP {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;DP head&gt; == ~[case:accusative]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 4eNegObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4ei - VSO order, copular, imperative}
VP = V {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;  | sentential PP
	&lt;DP head&gt; == ~[case:accusative]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4ei
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4eiNegObjVerbRequired - VSO order, copular, imperative}
VP = V {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;  | sentential PP
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;DP head&gt; == ~[case:accusative]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4eiNegObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4ep - VSO order, copular, pro-drop}
VP = V {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type copular&gt; = +
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;  | sentential PP
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4ep
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4epNegObjVerbRequired - VSO order, copular, pro-drop}
VP = V {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type copular&gt; = +
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;  | sentential PP
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
        &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4epNegObjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='no'">
<xsl:text>
rule {VP option 4f - VSO order, copular sentence, no verb, no Aux required}
VP = DP {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type verbheaded&gt; = -             | to restrict recursion
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
|	&lt;DP_1 head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP_1 head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;  | sentential PP
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;DP head&gt; == ~[case:accusative]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4f
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='yes'">
<xsl:text>
rule {VP option 4faff - VSO order, copular sentence, no verb, no Aux required, copular affix}
VP = DP {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	{&lt;AdjP head type prefix copular&gt; = +
        /&lt;AdjP head type suffix copular&gt; = +
	}
        {&lt;DP_1 head type prefix copular&gt; = +
        /&lt;DP_1 head type suffix copular&gt; = +
	}
	&lt;VP head type transitive&gt; = -
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP_1 head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP_1 head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;DP head&gt; == ~[case:accusative]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4faff
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesAux'">
<xsl:text>
rule {VP option 4faux - VSO order, copular sentence, no verb, Aux required}
VP = DP {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type transitive&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP_1 head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP_1 head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;  | sentential PP
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;DP head&gt; == ~[case:accusative]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4faux
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noAux' and normalize-space(//ip/@proDrop)!='no'">
<xsl:text>
rule {VP option 4fi - VSO order, copular sentence, no verb, imperative, no Aux required}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;VP head type transitive&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;DP head&gt; == ~[case:accusative]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4fi
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@copularAffix)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@copularAffix)='yes'">
<xsl:text>
rule {VP option 4fiaff - VSO order, copular sentence, no verb, imperative, no Aux required, copular affix}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
        {&lt;AdjP head type prefix copular&gt; = +
        /&lt;AdjP head type suffix copular&gt; = +
	}
	{&lt;DP head type prefix copular&gt; = +
	/&lt;DP head type suffix copular&gt; = +
	}
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;VP head type transitive&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4fiaff
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noAux' and normalize-space(//ip/@proDrop)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesAux' and normalize-space(//ip/@proDrop)!='no'">
<xsl:text>
rule {VP option 4fai - VSO order, copular sentence, no verb, imperative, Aux required}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;VP head type transitive&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4fai
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='no' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='no' and normalize-space(//ip/@proDrop)='yesClitic' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='no' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='no' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 4fp - VSO order, copular sentence, no verb, pro-drop, no Aux required}
VP = {PP /  DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;VP head type transitive&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type relative&gt; = -		| avoid DP only IP
|	&lt;DP head type pronoun&gt; = -             | to restrict pronouns
	&lt;DP head type quantifier&gt; = -          | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head type pro-drop&gt; &lt;= +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4fp
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='no' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='no' and normalize-space(//ip/@proDrop)='yesClitic' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='no' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='no' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 4fpAdj - VSO order, copular sentence, no verb Adj predicate, pro-drop, no Aux required}
VP = AdjP
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head type transitive&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head type pro-drop&gt; &lt;= +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4fpAdj
	</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='yes' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='yes' and normalize-space(//ip/@proDrop)='yesClitic' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='yes' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='yes' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 4fpaff - VSO order, copular sentence, no verb, pro-drop, no Aux required, copular affix}
VP =  {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
        {&lt;AdjP head type prefix copular&gt; = +
        /&lt;AdjP head type suffix copular&gt; = +
	}
        {&lt;DP_1 head type prefix copular&gt; = +
        /&lt;DP_1 head type suffix copular&gt; = +
	}
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head infl mood imperative&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4fpaff
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noAux' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='noAux' and normalize-space(//ip/@proDrop)='yesClitic' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesAux' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@copular)='yesAux' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 4fap - VSO order, copular sentence, no verb, pro-drop, Aux required}
VP =  {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;VP head type transitive&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head infl mood imperative&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4fap
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4g - OSV order, copular}
VP = {PP / AdjP / DP_1} DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;DP head&gt; == ~[case:accusative]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 4g
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4gNegSubjVerbRequired - OSV order, copular}
VP = {PP / AdjP / DP_1} DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;DP head&gt; == ~[case:accusative]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 4gNegSubjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4gNegSubjOrObjVerbRequired - OSV order, copular}
VP = {PP / AdjP / DP_1} DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;DP head&gt; == ~[case:accusative]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4gNegSubjOrObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4gNegObjVerbRequired - OSV order, copular}
VP = {PP / AdjP / DP_1} DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;DP head&gt; == ~[case:accusative]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4gNegObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4gi - OSV order, copular, imperative}
VP = {PP / AdjP / DP_1} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4gi
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4giNegObjVerbRequired - OSV order, copular, imperative}
VP = {PP / AdjP / DP_1} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4giNegObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4gp - OSV order, copular, pro-drop}
VP = {PP / AdjP / DP_1} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head infl mood imperative&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 4gp
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4gpNegObjVerbRequired - OSV order, copular, pro-drop}
VP = {PP / AdjP / DP_1} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head infl mood imperative&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4gpNegObjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copluarAffix)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copluarAffix)='no'">
<xsl:text>
rule {VP option 4h - OSV order, copular sentence, no verb, no Aux required}
VP = {PP / AdjP / DP_1} DP
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type transitive&gt; = -
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP_1 head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP_1 head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head type copular&gt; &lt;= +
	&lt;DP head&gt; == ~[case:accusative]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:]
	&lt;VP option&gt; = 4h
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copluarAffix)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copluarAffix)='yes'">
<xsl:text>
rule {VP option 4haff - OSV order, copular sentence, no verb, no Aux required, copular affix}
VP = {PP / AdjP / DP_1} DP
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
        {&lt;AdjP head type prefix copular&gt; = +
        /&lt;AdjP head type suffix copular&gt; = +
	}
        {&lt;DP_1 head type prefix copular&gt; = +
        /&lt;DP_1 head type suffix copular&gt; = +
	}
	&lt;VP head type transitive&gt; = -
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP_1 head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP_1 head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head type copular&gt; &lt;= +
	&lt;DP head&gt; == ~[case:accusative]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4haff
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@copular)='yesAux'">
<xsl:text>
rule {VP option 4ha - OSV order, copular sentence, no verb, Aux required}
VP = {PP / AdjP / DP_1} DP
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP_1 head&gt;
	&lt;VP head type transitive&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP_1 head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP_1 head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head type copular&gt; &lt;= +
	&lt;DP head&gt; == ~[case:accusative]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4ha
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copluarAffix)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copluarAffix)='no'">
<xsl:text>
rule {VP option 4hi - OSV order, copular sentence, no verb, imperative, no Aux required}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type transitive&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4hi
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copluarAffix)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copluarAffix)='yes'">
<xsl:text>
rule {VP option 4hiaff - OSV order, copular sentence, no verb, imperative, no Aux required, copular affix}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;AdjP head type prefix copular&gt; = +
	&lt;DP_1 head type prefix copular&gt; = +
	&lt;VP head infl mood imperative&gt; = +
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type transitive&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4hiaff
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@copular)='yesAux' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@copular)='yesAux'">
<xsl:text>
rule {VP option 4hai - OSV order, copular sentence, no verb, imperative, Aux required}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4hai
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='no'">
<xsl:text>
rule {VP option 4hp - OSV order, copular sentence, no verb, pro-drop, no Aux required}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head infl mood imperative&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 4hp
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='yes'">
<xsl:text>
rule {VP option 4hpaff - OSV order, copular sentence, no verb, pro-drop, no Aux required, copular affix}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
        {&lt;AdjP head type prefix copular&gt; = +
        /&lt;AdjP head type suffix copular&gt; = +
        }
	{&lt;DP head type prefix copular&gt; = +
	/&lt;DP head type suffix copular&gt; = +
	}
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head infl mood imperative&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4hpaff
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@copular)='yesAux' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@copular)='yesAux'">
<xsl:text>
rule {VP option 4hap - OSV order, copular sentence, no verb, pro-drop, Aux required}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;VP head type transitive&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type pro-drop&gt; = +
	&lt;VP head infl mood imperative&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 4hap
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4i - VSO order, copular, subject questioned}
VP = V {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 4i
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 4iFoc - VSO order, copular, subject focused}
VP = V {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 4iFoc
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4iNegObjVerbRequired - VSO order, copular, subject questioned}
VP = V {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 4iNegObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)!='yes'">
<xsl:text>
rule {VP option 4iNegObjVerbRequiredFoc - VSO order, copular, subject focused}
VP = V {PP / AdjP / DP_1}
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 4iNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='no'">
<xsl:text>
rule {VP option 4j - VSO/OSV order, copular sentence, no verb, subj/AdvP questioned}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;VP head type transitive&gt; = -
	&lt;VP head type question&gt; = +
	{&lt;VP head fronted cat&gt; = AdvP
	&lt;VP head type pro-drop&gt; = +
	/&lt;VP head fronted cat&gt; = DP
	&lt;VP head type pro-drop&gt; = - }
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
|	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP option&gt; = 4j
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 4jFoc - VSO/OSV order, copular sentence, no verb, subject focused}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP option&gt; = 4jFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='yes'">
<xsl:text>
rule {VP option 4jaff - VSO/OSV order, copular sentence, no verb, subj/AdvP questioned, copular afffix}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
		{&lt;AdjP head type prefix copular&gt; = +
		/&lt;AdjP head type suffix copular&gt; = +
		}
	{&lt;DP head type prefix copular&gt; = +
	/&lt;DP head type suffix copular&gt; = +
	}
	&lt;VP head type transitive&gt; = -
	&lt;VP head type question&gt; = +
	{&lt;VP head fronted cat&gt; = AdvP
	&lt;VP head type pro-drop&gt; = +
	/&lt;VP head fronted cat&gt; = DP
	&lt;VP head type pro-drop&gt; = - }
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP option&gt; = 4jaff
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='noNeither' and normalize-space(//ip/@copularAffix)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='yesOptional' and normalize-space(//ip/@copularAffix)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 4jaffFoc - VSO/OSV order, copular sentence, no verb, subject focused, copular afffix}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
		{&lt;AdjP head type prefix copular&gt; = +
		/&lt;AdjP head type suffix copular&gt; = +
		}
	{&lt;DP head type prefix copular&gt; = +
	/&lt;DP head type suffix copular&gt; = +
	}
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP option&gt; = 4jaffFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='yesAux' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='yesAux'">
<xsl:text>
rule {VP option 4ja - VSO/OSV order, copular sentence, no verb, subj/AdvP questioned, Aux required}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type question&gt; = +
	{&lt;VP head fronted cat&gt; = AdvP
	&lt;VP head type pro-drop&gt; = +
	/&lt;VP head fronted cat&gt; = DP
	&lt;VP head type pro-drop&gt; = - }
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP option&gt; = 4ja
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='noAux' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='noAux' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='yesAux' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)='yesAux' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 4jaFoc - VSO/OSV order, copular sentence, no verb, subject focused, Aux required}
VP = {PP / AdjP / DP}
	&lt;VP head&gt; = &lt;PP head&gt;
	&lt;VP head&gt; = &lt;AdjP head&gt;
	&lt;VP head&gt; = &lt;DP head&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;VP head type verbheaded&gt; &lt;= -
	&lt;VP head type copular&gt; &lt;= +
	&lt;VP option&gt; = 4jaFoc
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 4k - OSV order, copular, subject questioned}
VP = {PP / AdjP / DP_1} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 4k
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 4kFoc - OSV order, copular, subject focused}
VP = {PP / AdjP / DP_1} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 4kFoc
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 4kNegObjVerbRequired - OSV order, copular, subject questioned}
VP = {PP / AdjP / DP_1} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 4kNegObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@copular)!='noAux' and normalize-space(//ip/@copular)!='noNeither' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 4kNegObjVerbRequiredFoc - OSV order, copular, subject focused}
VP = {PP / AdjP / DP_1} V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head object&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type question&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted&gt; = &lt;V head subject&gt;
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 4kNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>













</xsl:template>
</xsl:stylesheet>
