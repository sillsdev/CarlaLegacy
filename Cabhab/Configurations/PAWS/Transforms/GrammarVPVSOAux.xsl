<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="vpvsoaux">

	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 11a - Aux Subject V for VSO languages, not passive}
VP = DP V'
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
		{&lt;V' head type transitive&gt; = -
		/&lt;V' head type transitive&gt; = +
	&lt;V' head object head type reflexive&gt; = -
	}
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 11a
</xsl:text>
</xsl:if>



















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 11aNegSubjVerbRequired - Aux Subject V for VSO languages, not passive}
VP = DP V'
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
		{&lt;V' head type transitive&gt; = -
		/&lt;V' head type transitive&gt; = +
	&lt;V' head object head type reflexive&gt; = -
	}
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP optiongt; = 11aNegSubjVerbRequired
</xsl:text>
</xsl:if>



















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//pron/@refl)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//pron/@refl)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//pron/@refl)='yes' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 11arefl - Aux Subject V for VSO languages, not passive, reflexive object}
VP = DP V'
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V' head type transitive&gt; = +
	&lt;V' head object head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head subject head agr&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP option&gt; = 11arefl
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//pron/@refl)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//pron/@refl)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//pron/@refl)='yes' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option11areflNegSubjVerbRequired - Aux Subject V for VSO languages, not passive, reflexive object}
VP = DP V'
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V' head type transitive&gt; = +
	&lt;V' head object head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head subject head agr&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 11areflNegSubjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 11b - Aux Subject V for VSO languages, passive}
VP = DP V'
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head object&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 11b
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 11bNegSubjVerbRequired - Aux Subject V for VSO languages, passive}
VP = DP V'
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head object&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 11bNegSubjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 11c - V Subject Aux for OSV languages, not passive}
VP = V' DP
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
		{&lt;V' head type transitive&gt; = -
		/&lt;V' head type transitive&gt; = +
	&lt;V' head object head type reflexive&gt; = -
	}
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 11c
</xsl:text>
</xsl:if>



















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 11cNegSubjVerbRequired - V Subject Aux for OSV languages, not passive}
VP = V' DP
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
		{&lt;V' head type transitive&gt; = -
		/&lt;V' head type transitive&gt; = +
	&lt;V' head object head type reflexive&gt; = -
	}
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 11cNegSubjVerbRequired
</xsl:text>
</xsl:if>


















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//pron/@refl)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//pron/@refl)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//pron/@refl)='yes' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 11crefl - V Subject Aux for OSV languages, not passive, reflexive}
VP = V' DP
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V' head type transitive&gt; = +
	&lt;V' head object head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head subject head agr&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 11crefl
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//pron/@refl)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//pron/@refl)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//pron/@refl)='yes' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 11creflNegSubjVerbRequired - V Subject Aux for OSV languages, not passive, reflexive}
VP = V' DP
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head subject&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;V' head type transitive&gt; = +
	&lt;V' head object head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head subject head agr&gt;
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 11creflNegSubjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ipn/@passive)='yes' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 11d - V Subject Aux for OSV languages, passive}
VP = V' DP
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head object&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 11d
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ipn/@passive)='yes' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 11dNegSubjVerbRequired - V Subject Aux for OSV languages, passive}
VP = V' DP
	&lt;VP head&gt; = &lt;V' head&gt;
	&lt;V' head object&gt; = &lt;DP&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head type auxiliary&gt; = +
	&lt;VP head type passive&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 11dNegSubjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no'">
<xsl:text>
rule {VBar option 1 - V initial/final, intransitive}
V' = V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 1
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no'">
<xsl:text>
rule {VBar option 2a - V initial, motion intransitive}
V' = V {PP / AdvP}
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 2a
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no'">
<xsl:text>
rule {VBar option 2b - V final, motion intransitive}
V' = {PP / AdvP} V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;PP head type locative&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;AdvP head type locative&gt; = +
	&lt;V head type transitive&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type motion&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 2b
</xsl:text>
</xsl:if>















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 3a - V initial, copular}
V' = V {PP / AdjP / DP}
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type copular&gt; = +
	&lt;V' head type transitive&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 3a
</xsl:text>
</xsl:if>




















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 3aNegObjVerbRequired - V initial, copular}
V' = V {PP / AdjP / DP}
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type copular&gt; = +
	&lt;V' head type transitive&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 3aNegObjVerbRequired
</xsl:text>
</xsl:if>



















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 3b - V final, copular}
V' = {PP / AdjP / DP} V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type copular&gt; = +
	&lt;V' head type transitive&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 3b
</xsl:text>
</xsl:if>



















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 3bNegObjVerbRequired - V final, copular}
V' = {PP / AdjP / DP} V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type copular&gt; = +
	&lt;V' head type transitive&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt;
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 3bNegObjVerbRequired
</xsl:text>
</xsl:if>



















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@copular)='noNeither' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@copular)='noNeither' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@copular)='noNeither' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@copular)='noNeither' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@copular)='noNeither' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@copular)='noAux' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@copular)='noNeither' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@copular)='noAux'">
<xsl:text>
rule {VBar option 3c - copular sentence, no verb}
V' = {PP / AdjP / DP}
	&lt;V' head&gt; = &lt;PP head&gt;
	&lt;V' head&gt; = &lt;AdjP head&gt;
	&lt;V' head&gt; = &lt;DP head&gt;
	&lt;V' head type verbheaded&gt; = -             | to restrict recursion
	&lt;V' head type transitive&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;DP head type pronoun&gt; = -		 | to restrict pronouns
	&lt;DP head type quantifier&gt; = -		 | to restrict quantifiers
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;V' head type copular&gt; &lt;= +
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 3c
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 4a - V initial, transitive (accusative case object)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 4a
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 4aNegObjVerbRequired - V initial, transitive (accusative case object)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 4aNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 4b - V initial, transitive (absolutive case object)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 4b
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 4bNegObjVerbRequired - V initial, transitive (absolutive case object)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 4bNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 4c - V final, transitive (accusative case object)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 4c
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 4cNegObjVerbRequired - V final, transitive (accusative case object)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 4cNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 4d - V final, transitive (absolutive case object)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 4d
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 4dNegObjVerbRequired - V final, transitive (absolutive case object)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 4dNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 5a - V initial, ditransitive with PP (accusative object)}
V' = V DP PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | onl  in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 5a
</xsl:text>
</xsl:if>





























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 5aNegObjVerbRequired - V initial, ditransitive with PP (accusative object)}
V' = V DP PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 5aNegObjVerbRequired
</xsl:text>
</xsl:if>





























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 5b - V initial, ditransitive with PP (absolutive object)}
V' = V DP PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 5b
</xsl:text>
</xsl:if>

























































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 5bNegObjVerbRequired - V initial, ditransitive with PP (absolutive object)}
V' = V DP PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 5bNegObjVerbRequired
</xsl:text>
</xsl:if>

























































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 5c - V final, ditransitive with PP (accusative object)}
V' = PP DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 5c
</xsl:text>
</xsl:if>





























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 5cNegObjVerbRequired - V final, ditransitive with PP (accusative object)}
V' = PP DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 5cNegObjVerbRequired
</xsl:text>
</xsl:if>





























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 5d - V final, ditransitive with PP (absolutive object)}
V' = PP DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 5d
</xsl:text>
</xsl:if>

























































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 5dNegObjVerbRequired - V final, ditransitive with PP (absolutive object)}
V' = PP DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 5dNegObjVerbRequired
</xsl:text>
</xsl:if>

























































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 6a - V initial, ditransitive with DP (accusative object)}
V' = V DP_1 DP_2
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 6a
</xsl:text>
</xsl:if>





























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 6aNegObjVerbRequired - V initial, ditransitive with DP (accusative object)}
V' = V DP_1 DP_2
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 6aNegObjVerbRequired
</xsl:text>
</xsl:if>





























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 6b - V initial, ditransitive with DP (absolutive object)}
V' = V DP_1 DP_2
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 6b
</xsl:text>
</xsl:if>

























































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 6bNegObjVerbRequired - V initial, ditransitive with DP (absolutive object)}
V' = V DP_1 DP_2
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 6bNegObjVerbRequired
</xsl:text>
</xsl:if>

























































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 6c - V final, ditransitive with DP (accusative object)}
V' = DP_1 DP_2 V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 6c
</xsl:text>
</xsl:if>





























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 6cNegObjVerbRequired - V final, ditransitive with DP (accusative object)}
V' = DP_1 DP_2 V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 6cNegObjVerbRequired
</xsl:text>
</xsl:if>





























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 6d - V final, ditransitive with DP (absolutive object)}
V' = DP_1 DP_2 V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 6d
</xsl:text>
</xsl:if>

























































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 6dNegObjVerbRequired - V final, ditransitive with DP (absolutive object)}
V' = DP_1 DP_2 V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 6dNegObjVerbRequired
</xsl:text>
</xsl:if>

























































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes'">
<xsl:text>
rule {VBar option 7a - V initial/final, passive, no ditrans, no Agent phrase}
V' = V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 7a
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='no'">
<xsl:text>
rule {VBar option 7b - V initial, passive, with PP Agent phrase, no ditrans}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 7b
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='yes'">
<xsl:text>
rule {VBar option 7bNegSubj - V initial, passive, with PP Agent phrase, no ditrans}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7bNegSubj
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negObjVerbRequired)='no' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negObjVerbRequired)='no' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negObjVerbRequired)='no' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negObjVerbRequired)='no' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negObjVerbRequired)='no' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negObjVerbRequired)='no' and normalize-space(//neg/@negSubjVerbRequired)='no'">
<xsl:text>
rule {VBar option 7bPP - V initial, passive, with PP Agent phrase, PP ditrans}
V' = V PP PP_1
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP_1 head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP_1 head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 7bPP
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negObjVerbRequired)='no' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negObjVerbRequired)='no' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negObjVerbRequired)='no' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negObjVerbRequired)='no' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negObjVerbRequired)='no' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negObjVerbRequired)='no' and normalize-space(//neg/@negSubjVerbRequired)='yes'">
<xsl:text>
rule {VBar option 7bPPNegSubj - V initial, passive, with PP Agent phrase, PP ditrans}
V' = V PP PP_1
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP_1 head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP_1 head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7bPPNegSubj
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negObjVerbRequired)!='no' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negObjVerbRequired)!='no' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negObjVerbRequired)!='no' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negObjVerbRequired)!='no' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negObjVerbRequired)!='no' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negObjVerbRequired)!='no' and normalize-space(//neg/@negSubjVerbRequired)='no'">
<xsl:text>
rule {VBar option 7bPPNegObj - V initial, passive, with PP Agent phrase, PP ditrans}
V' = V PP PP_1
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP_1 head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP_1 head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7bPPNegObj
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negObjVerbRequired)!='no' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negObjVerbRequired)!='no' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negObjVerbRequired)!='no' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negObjVerbRequired)!='no' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negObjVerbRequired)!='no' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negObjVerbRequired)!='no' and normalize-space(//neg/@negSubjVerbRequired)='yes'">
<xsl:text>
rule {VBar option 7bPPNegSubjorObj - V initial, passive, with PP Agent phrase, PP ditrans}
V' = V PP PP_1
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP_1 head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP_1 head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, V' must be
                     [type:[negative:+]]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7bPPNegSubjorObj
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no'">
<xsl:text>
rule {VBar option 7c - V initial, passive, with DP Agent phrase, no ditrans}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 7c
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes'">
<xsl:text>
rule {VBar option 7cNegSubj - V initial, passive, with DP Agent phrase, no ditrans}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7cNegSubj
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no'">
<xsl:text>
rule {VBar option 7cDP - V initial, passive, with DP Agent phrase, DP ditrans}
V' = V DP DP_1
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP
	&lt;V head indirectobject&gt; = &lt;DP_1
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 7cDP
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no'">
<xsl:text>
rule {VBar option 7cDPNegSubj - V initial, passive, with DP Agent phrase, DP ditrans}
V' = V DP DP_1
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP
	&lt;V head indirectobject&gt; = &lt;DP_1
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7cDPNegSubj
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no'">
<xsl:text>
rule {VBar option 7cDPNegObj - V initial, passive, with DP Agent phrase, DP ditrans}
V' = V DP DP_1
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP
	&lt;V head indirectobject&gt; = &lt;DP_1
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7cDPNegObj
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no'">
<xsl:text>
rule {VBar option 7cDPNegSubjorObj - V initial, passive, with DP Agent phrase, DP ditrans}
V' = V DP DP_1
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP
	&lt;V head indirectobject&gt; = &lt;DP_1
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, V' must be
                     [type:[negative:+]]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7cDPNegSubjorObj
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='no'">
<xsl:text>
rule {VBar option 7d - V final, passive, with PP Agent phrase, no ditrans}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 7d
</xsl:text>
</xsl:if>






































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='yes'">
<xsl:text>
rule {VBar option 7dNegSubj - V final, passive, with PP Agent phrase, no ditrans}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7dNegSubj
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no'">
<xsl:text>
rule {VBar option 7dPP - V final, passive, with PP Agent phrase, PP ditrans}
V' = PP_1 PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 7dPP
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no'">
<xsl:text>
rule {VBar option 7dPPNegSubj - V final, passive, with PP Agent phrase, PP ditrans}
V' = PP_1 PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7dPPNegSubj
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no'">
<xsl:text>
rule {VBar option 7dPPNegObj - V final, passive, with PP Agent phrase, PP ditrans}
V' = PP_1 PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7dPPNegObj
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='pp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='pp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no'">
<xsl:text>
rule {VBar option 7dPPNegSubjorObj - V final, passive, with PP Agent phrase, PP ditrans}
V' = PP_1 PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;PP head object&gt;
	&lt;V head indirectobject&gt; = &lt;PP_1 head object&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;PP head type passive&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;PP_1 head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP_1 head type prefix&gt;
	&lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, V' must be
                     [type:[negative:+]]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7dPPNegSubjorObj
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no'">
<xsl:text>
rule {VBar option 7e - V final, passive, with DP Agent phrase, no ditrans}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 7e
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes'">
<xsl:text>
rule {VBar option 7eNegSubj - V final, passive, with DP Agent phrase, no ditrans}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7eNegSubj
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)='no'">
<xsl:text>
rule {VBar option 7eDP - V final, passive, with DP Agent phrase, DP ditrans}
V' = DP_1 DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP
	&lt;V head indirectobject&gt; = &lt;DP_1
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 7eDP
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)='no'">
<xsl:text>
rule {VBar option 7eDPNegSubj - V final, passive, with DP Agent phrase, DP ditrans}
V' = DP_1 DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP
	&lt;V head indirectobject&gt; = &lt;DP_1
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;V' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 7eDPNegSubj
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='no' and normalize-space(//neg/@negObjVerbRequired)!='no'">
<xsl:text>
rule {VBar option 7eDPNegObj - V final, passive, with DP Agent phrase, DP ditrans}
V' = DP_1 DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP
	&lt;V head indirectobject&gt; = &lt;DP_1
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 7eDPNegObj
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//ip/@passive)='yes' and normalize-space(//ip/@passiveAgent)='yes' and normalize-space(//ip/@passiveAgentCat)='dp' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@negSubjVerbRequired)='yes' and normalize-space(//neg/@negObjVerbRequired)!='no'">
<xsl:text>
rule {VBar option 7eDPNegSubjorObj - V final, passive, with DP Agent phrase, DP ditrans}
V' = DP_1 DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head type passive&gt; = +
	&lt;V head subject&gt; = &lt;DP
	&lt;V head indirectobject&gt; = &lt;DP_1
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, V' must be
                     [type:[negative:+]]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 7eDPNegSubjorObj
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOrder)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOtherOrder)='no'">
<xsl:text>
rule {VBar option 8a - V initial, sentential complement}
V' = V {CP / IP}
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V embedded&gt; = &lt;CP&gt;
	&lt;V embedded&gt; = &lt;IP&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;CP head type root&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = none
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head object head type reflexive&gt; = -	| to eliminate ambiguity
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;CP head type comma&gt;
	&lt;V' head type comma&gt; &lt;= &lt;IP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;CP head type suffix&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;IP head type suffix&gt;
	&lt;V head type motion&gt; = -
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 8a
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 8aoacc - V initial, accusative object with sentential complement}
V' = V DP {CP / IP}
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V embedded&gt; = &lt;CP&gt;
	&lt;V embedded&gt; = &lt;IP&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head case&gt; = accusative
	&lt;CP head type root&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = none
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;CP head type comma&gt;
	&lt;V' head type comma&gt; &lt;= &lt;IP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;CP head type suffix&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;IP head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 8aoacc
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 8aoaccNegObjVerbRequired - V initial, accusative object with sentential complement}
V' = V DP {CP / IP}
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V embedded&gt; = &lt;CP&gt;
	&lt;V embedded&gt; = &lt;IP&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head case&gt; = accusative
	&lt;CP head type root&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = none
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;CP head type comma&gt;
	&lt;V' head type comma&gt; &lt;= &lt;IP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;CP head type suffix&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;IP head type suffix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 8aoaccNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {V' option 8aoabs - V initial, absolutive object with sentential complement}
V' = V DP {CP / IP}
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V embedded&gt; = &lt;CP&gt;
	&lt;V embedded&gt; = &lt;IP&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head case&gt; = absolutive
	&lt;CP head type root&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = none
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;CP head type comma&gt;
	&lt;V' head type comma&gt; &lt;= &lt;IP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;CP head type suffix&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;IP head type suffix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 8aoabs
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {V' option 8aoabsNegObjVerbRequired - V initial, absolutive object with sentential complement}
V' = V DP {CP / IP}
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V embedded&gt; = &lt;CP&gt;
	&lt;V embedded&gt; = &lt;IP&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head case&gt; = absolutive
	&lt;CP head type root&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = none
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;CP head type comma&gt;
	&lt;V' head type comma&gt; &lt;= &lt;IP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;CP head type suffix&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;IP head type suffix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 8aoabNegObjVerbRequired
</xsl:text>
</xsl:if>

















































<xsl:if test="normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOrder)='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOtherOrder)='no'">
<xsl:text>
rule {VBar option 8b - V final, sentential complement}
V' = {CP / IP} V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V embedded&gt; = &lt;CP&gt;
	&lt;V embedded&gt; = &lt;IP&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;CP head type root&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = none
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head object head type reflexive&gt; = -	| to eliminate ambiguity
	&lt;V head type motion&gt; = -
	&lt;CP head type comma&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;CP head type prefix&gt;
	&lt;V' head type prefix&gt; &lt;= &lt;IP head type prefix&gt;
	&lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 8b
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 8boacc - V final, accusative object with sentential complement}
V' = {CP / IP} DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V embedded&gt; = &lt;CP&gt;
	&lt;V embedded&gt; = &lt;IP&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head case&gt; = accusative
	&lt;CP head type root&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = none
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type motion&gt; = -
	&lt;CP head type comma&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;CP head type prefix&gt;
	&lt;V' head type prefix&gt; &lt;= &lt;IP head type prefix&gt;
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 8boacc
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 8boaccNegObjVerbRequired - V final, accusative object with sentential complement}
V' = {CP / IP} DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V embedded&gt; = &lt;CP&gt;
	&lt;V embedded&gt; = &lt;IP&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head case&gt; = accusative
	&lt;CP head type root&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = none
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type motion&gt; = -
	&lt;CP head type comma&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;CP head type prefix&gt;
	&lt;V' head type prefix&gt; &lt;= &lt;IP head type prefix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 8boaccNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 8boabs - V final, absolutive object with sentential complement}
V' = {CP / IP} DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V embedded&gt; = &lt;CP&gt;
	&lt;V embedded&gt; = &lt;IP&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head case&gt; = absolutive
	&lt;CP head type root&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = none
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type motion&gt; = -
	&lt;CP head type comma&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;CP head type prefix&gt;
	&lt;V' head type prefix&gt; &lt;= &lt;IP head type prefix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 8boabs
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 8boabsNegObjVerbRequired - V final, absolutive object with sentential complement}
V' = {CP / IP} DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V embedded&gt; = &lt;CP&gt;
	&lt;V embedded&gt; = &lt;IP&gt;
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head case&gt; = absolutive
	&lt;CP head type root&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = none
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;V head type sentential&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type motion&gt; = -
	&lt;CP head type comma&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;CP head type prefix&gt;
	&lt;V' head type prefix&gt; &lt;= &lt;IP head type prefix&gt;
	&lt;V' head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, V' must be
                     [type:[negative:+]]
	 &lt;V' head fronted&gt; == ~[cat:FocusP]
	&lt;V' option&gt; = 8boabsNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative'">
<xsl:text>
rule {VBar option 9a - V initial/final, object questioned (accusative object)}
V' = V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted head case&gt; = accusative
	&lt;V' head fronted head type wh&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head type question&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' option&gt; = 9a
	</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9aFoc - V initial/final, object focused (accusative object)}
V' = V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted head case&gt; = accusative
	&lt;V' head fronted head type wh&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head type question&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' option&gt; = 9aFoc
	</xsl:text>
</xsl:if>























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split'">
<xsl:text>
rule {VBar option 9b - V initial/final, object questioned (absolutive object)}
V' = V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted head case&gt; = absolutive
	&lt;V' head fronted head type wh&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head type question&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' option&gt; = 9b
	</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9bFoc - V initial/final, object focused (absolutive object)}
V' = V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted head case&gt; = absolutive
	&lt;V' head fronted head type wh&gt; = -
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head type question&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V' option&gt; = 9bFoc
	</xsl:text>
</xsl:if>













































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9c - V initial, ditransitive with PP, accusative object questioned}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' option&gt; = 9c
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9cFoc - V initial, ditransitive with PP, accusative object focused}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' option&gt; = 9cFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9cNegObjVerbRequired - V initial, ditransitive with PP, accusative object questioned}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9cNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9cNegObjVerbRequiredFoc - V initial, ditransitive with PP, accusative object focused}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9cNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9d - V initial, ditransitive with PP, absolutive object questioned}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' option&gt; = 9d
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9dFoc - V initial, ditransitive with PP, absolutive object focused}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' option&gt; = 9dFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9dNegObjVerbRequired - V initial, ditransitive with PP, absolutive object questioned}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9dNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9dNegObjVerbRequiredFoc - V initial, ditransitive with PP, absolutive object focused}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9dNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9e - V final, ditransitive with PP, accusative object questioned}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' option&gt; = 9e
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9eFoc - V final, ditransitive with PP, accusative object focused}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' option&gt; = 9eFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9eNegObjVerbRequired - V final, ditransitive with PP, accusative object questioned}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9eNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9eNegObjVerbRequiredFoc - V final, ditransitive with PP, accusative object focused}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = accusative
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9eNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9f - V final, ditransitive with PP, absolutive object questioned}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' option&gt; = 9f
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9fFoc - V final, ditransitive with PP, absolutive object focused}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' option&gt; = 9fFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9fNegObjVerbRequired - V final, ditransitive with PP, absolutive object questioned}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9fNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9fNegObjVerbRequiredFoc - V final, ditransitive with PP, absolutive object focused}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9fNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9g - V initial, ditransitive with DP, accusative object questioned}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' option&gt; = 9g
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9gFoc - V initial, ditransitive with DP, accusative object focused}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' option&gt; = 9gFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9gNegObjVerbRequired - V initial, ditransitive with DP, accusative object questioned}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9gNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9gNegObjVerbRequiredFoc - V initial, ditransitive with DP, accusative object focused}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9gNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9h - V initial, ditransitive with DP, absolutive object questioned}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' option&gt; = 9h
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9hFoc - V initial, ditransitive with DP, absolutive object focused}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' option&gt; = 9hFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9hNegObjVerbRequired - V initial, ditransitive with DP, absolutive object questioned}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9hNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9hNegObjVerbRequiredFoc - V initial, ditransitive with DP, absolutive object focused}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9hNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9i - V final, ditransitive with DP, accusative object questioned}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' option&gt; = 9i
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9iFoc - V final, ditransitive with DP, accusative object focused}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' option&gt; = 9iFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9iNegObjVerbRequired - V final, ditransitive with DP, accusative object questioned}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9iNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9iNegObjVerbRequiredFoc - V final, ditransitive with DP, accusative object focused}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9iNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9j - V final, ditransitive with DP, absolutive object questioned}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' option&gt; = 9j
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9jFoc - V final, ditransitive with DP, absolutive object focused}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' option&gt; = 9jFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9jNegObjVerbRequired - V final, ditransitive with DP, absolutive object questioned}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = +
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9jNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9jNegObjVerbRequiredFoc - V final, ditransitive with DP, absolutive object focused}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V' head type question&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9jNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9k - V initial, ditransitive with PP (accusative object questioned)}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted case&gt; = accusative
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' option&gt; = 9k
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9kFoc - V initial, ditransitive with PP (accusative object focused)}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted case&gt; = accusative
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' option&gt; = 9kFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9kNegObjVerbRequired - V initial, ditransitive with PP (accusative object questioned)}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted case&gt; = accusative
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9kNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9kNegObjVerbRequiredFoc - V initial, ditransitive with PP (accusative object focused)}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted case&gt; = accusative
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9kNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9l - V initial, ditransitive with PP (absolutive object questioned)}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' option&gt; = 9ld
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9lFoc - V initial, ditransitive with PP (absolutive object focused)}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' option&gt; = 9ldFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9lNegObjVerbRequired - V initial, ditransitive with PP (absolutive object questioned)}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9lNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9lNegObjVerbRequiredFoc - V initial, ditransitive with PP (absolutive object focused)}
V' = V PP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9lNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9m - V final, ditransitive with PP (accusative object questioned)}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted case&gt; = accusative
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' option&gt; = 9m
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9mFoc - V final, ditransitive with PP (accusative object focused)}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted case&gt; = accusative
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' option&gt; = 9mFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9mNegObjVerbRequired - V final, ditransitive with PP (accusative object questioned)}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted case&gt; = accusative
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9mNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9mNegObjVerbRequiredFoc - V final, ditransitive with PP (accusative object focused)}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted case&gt; = accusative
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9mNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9n - V final, ditransitive with PP (absolutive object questioned)}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' option&gt; = 9n
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9nFoc - V final, ditransitive with PP (absolutive object focused)}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' option&gt; = 9nFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9nNegObjVerbRequired - V final, ditransitive with PP (absolutive object questioned)}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = +
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9nNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9nNegObjVerbRequiredFoc - V final, ditransitive with PP (absolutive object focused)}
V' = PP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V head indirectobject&gt; = &lt;PP head object&gt;
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;V' head type question&gt; = -
	&lt;PP head type sentential&gt; = -
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9nNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9o - V initial, ditransitive with PP questioned (accusative object)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V' head fronted cat&gt; = PP
	&lt;DP head case&gt; =  accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V' head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' option&gt; = 9o
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9oNegObjVerbRequired - V initial, ditransitive with PP questioned (accusative object)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V' head fronted cat&gt; = PP
	&lt;DP head case&gt; =  accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V' head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9oNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9p - V initial, ditransitive with PP questioned (absolutive object)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V' head fronted cat&gt; = PP
	&lt;DP head case&gt; =  absolutive
	&lt;V' head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' option&gt; = 9p
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9pNegObjVerbRequired - V initial, ditransitive with PP questioned (absolutive object)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V' head fronted cat&gt; = PP
	&lt;DP head case&gt; =  absolutive
	&lt;V' head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9pNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9q - V final, ditransitive with PP questioned (accusative object)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V' head fronted cat&gt; = PP
	&lt;DP head case&gt; =  accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V' head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' option&gt; = 9q
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9qNegObjVerbRequired - V final, ditransitive with PP questioned (accusative object)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V' head fronted cat&gt; = PP
	&lt;DP head case&gt; =  accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V' head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9qNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9r - V final, ditransitive with PP questioned (absolutive object)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V' head fronted cat&gt; = PP
	&lt;DP head case&gt; =  absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V' head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' option&gt; = 9r
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='pp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9rNegObjVerbRequired - V final, ditransitive with PP questioned (absolutive object)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V' head fronted cat&gt; = PP
	&lt;DP head case&gt; =  absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V' head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9rNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9s - V initial, ditransitive with DP (accusative object questioned)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' option&gt; = 9s
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9sFoc - V initial, ditransitive with DP (accusative object focused)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' option&gt; = 9sFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9sNegObjVerbRequired - V initial, ditransitive with DP (accusative object questioned)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9sNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9sNegObjVerbRequiredFoc - V initial, ditransitive with DP (accusative object focused)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9sNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9t - V initial, ditransitive with DP (absolutive object questioned)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' option&gt; = 9t
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9tFoc - V initial, ditransitive with DP (absolutive object focused)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' option&gt; = 9tFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9tNegObjVerbRequired - V initial, ditransitive with DP (absolutive object questioned)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9tNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9tNegObjVerbRequiredFoc - V initial, ditransitive with DP (absolutive object focused)}
V' = V DP
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;V head type comma&gt; = -
	&lt;V' head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;V' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9tNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9u - V final, ditransitive with DP (accusative object questioned)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' option&gt; = 9u
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9uFoc - V final, ditransitive with DP (accusative object focused)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' option&gt; = 9uFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9uNegObjVerbRequired - V final, ditransitive with DP (accusative object questioned)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9uNegObjVerbRequired
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9uNegObjVerbRequiredFoc - V final, ditransitive with DP (accusative object focused)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9uNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VBar option 9v - V final, ditransitive with DP (absolutive object questioned)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' option&gt; = 9v
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9vFoc - V final, ditransitive with DP (absolutive object focused)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' option&gt; = 9vFoc
</xsl:text>
</xsl:if>









































































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VBar option 9vNegObjVerbRequired - V final, ditransitive with DP (absolutive object questioned)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = DP
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = +
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9vNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxNonfiniteOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//ip/@auxOtherOrder)='no' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VBar option 9vNegObjVerbRequiredFoc - V final, ditransitive with DP (absolutive object focused)}
V' = DP V
	&lt;V' head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;V' head fronted&gt;
	&lt;V' head fronted cat&gt; = FocusP
	&lt;V' head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V' head type question&gt; = -
	&lt;V' head type pro-drop&gt; = -
	&lt;V' head type auxiliary&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V' head type passive&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;V' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;V' head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, V' must be
                     [type:[negative:+]]
	&lt;V' option&gt; = 9vNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>









































































































































































</xsl:template>
</xsl:stylesheet>
