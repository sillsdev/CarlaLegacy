<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ip">
	<xsl:text>
rule {IP option conj - conjoined IPs}
IP = (InitConj) IP_1 Conj IP_2
	&lt;IP head&gt; = &lt;IP_1 head&gt;
	&lt;Conj head type conjoins_IP&gt; = +
	&lt;IP conjoined&gt; = +
	&lt;IP_1 conjoined&gt; = -	|limit recursion
	&lt;IP option&gt; = conj
</xsl:text>
	<xsl:if test="//ip/@proDrop!='no' and //typology/@wordOrder!='VSO' and //typology/@wordOrder!='OSV'">
<xsl:text>
rule {IP option 1a - no subject for imperatives}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;I' head infl mood imperative&gt; = +
	&lt;IP head type question&gt; = -
	&lt;IP option&gt; = 1a
</xsl:text>
</xsl:if>







	<xsl:if test="//ip/@proDrop='yes' and //typology/@wordOrder!='VSO' and //typology/@wordOrder!='OSV' or //ip/@proDrop='yesClitic' and //typology/@wordOrder!='VSO' and //typology/@wordOrder!='OSV'">
<xsl:text>
rule {IP option 1b - subject pro-drop, not passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = +
	&lt;IP head infl mood imperative&gt; = -
		{&lt;I' head type transitive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = +
	&lt;I' head subject head agr&gt; = &lt;I' head object head agr&gt;
	}
	&lt;IP head type passive&gt; = -
	{&lt;IP head type question&gt; = -
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = AdvP
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = PP
	}
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP option&gt; = 1b
</xsl:text>
</xsl:if>













	<xsl:if test="//ip/@proDrop='yes' and //ip/@passive='yes' and //typology/@wordOrder!='VSO' and //typology/@wordOrder!='OSV' or //ip/@proDrop='yesClitic' and //ip/@passive='yes' and //typology/@wordOrder!='VSO' and //typology/@wordOrder!='OSV'">
<xsl:text>
rule {IP option 1c - subject pro-drop, passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = +
	&lt;IP head infl mood imperative&gt; = -
	&lt;IP head type passive&gt; = +
	{&lt;IP head type question&gt; = -
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = AdvP
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = PP
	}
	&lt;IP option&gt; = 1c
</xsl:text>
</xsl:if>

















	<xsl:if test="//typology/@wordOrder='SVO' and //neg/@subjVerbRequired!='yes' or //typology/@wordOrder='SOV' and //neg/@subjVerbRequired!='yes'">
<xsl:text>
rule {IP option 2a - subject initial, required, not passive}
IP = DP I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;I' head subject&gt; = &lt;DP&gt;
		{&lt;I' head type transitive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;I' head object head agr&gt;
	}
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;IP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;I' head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;DP head&gt; == ~[case:accusative]
	&lt;IP option&gt; = 2a
</xsl:text>
</xsl:if>









	<xsl:if test="//neg/@subjVerbRequired='yes' and //typology/@wordOrder='SVO' or //neg/@subjVerbRequired='yes' and //typology/@wordOrder='SOV'">
<xsl:text>
rule {IP option 2aNegVerb - subject initial, not passive, neg subj requires neg verb}
IP = DP I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;I' head subject&gt; = &lt;DP&gt;
		{&lt;I' head type transitive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;I' head object head agr&gt;
	}
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;IP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;DP head&gt; == ~[case:accusative]
	&lt;I' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, verb must be
					 [type:[negative:+]]
	&lt;IP option&gt; = 2aNegVerb
</xsl:text>
</xsl:if>









	<xsl:if test="//neg/@subjVerbRequired!='yes' and //typology/@wordOrder='SVO' and //ip/@passive='yes' or //neg/@subjVerbRequired!='yes' and //typology/@wordOrder='SOV' and //ip/@passive='yes'">
<xsl:text>
rule {IP option 2b - subject initial, required, passive}
IP = DP I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;I' head object&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	{&lt;IP head type question&gt; = -
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = AdvP
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = PP
	}
	&lt;IP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;I' head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;DP head&gt; == ~[case:accusative]
	&lt;IP option&gt; = 2b
</xsl:text>
</xsl:if>













	<xsl:if test="//neg/@subjVerbRequired='yes' and //typology/@wordOrder='SVO' and //ip/@passive='yes' or //neg/@subjVerbRequired='yes' and //typology/@wordOrder='SOV' and //ip/@passive='yes'">
<xsl:text>
rule {IP option 2bNegVerb - subject initial, required, passive, neg subj requires neg verb}
IP = DP I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;I' head object&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	{&lt;IP head type question&gt; = -
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = AdvP
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = PP
	}
	&lt;IP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:accusative]
	&lt;I' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, verb must be
					 [type:[negative:+]]
	&lt;IP option&gt; = 2bNegVerb
</xsl:text>
</xsl:if>













	<xsl:if test="//neg/@subjVerbRequired!='yes' and //typology/@wordOrder='OVS' or //neg/@subjVerbRequired!='yes' and //typology/@wordOrder='VOS'">
<xsl:text>
rule {IP option 2c - subject final, required, not passive}
IP = I' DP
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;I' head subject&gt; = &lt;DP&gt;
		{&lt;I' head type transitive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;I' head object head agr&gt;
	}
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;I' head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;DP head&gt; == ~[case:accusative]
	&lt;IP option&gt; = 2c
</xsl:text>
</xsl:if>









	<xsl:if test="//neg/@subjVerbRequired='yes' and //typology/@wordOrder='OVS' or //neg/@subjVerbRequired='yes' and //typology/@wordOrder='VOS'">
<xsl:text>
rule {IP option 2cNegVerb - subject final, required, not passive, neg requires neg verb}
IP = I' DP
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;I' head subject&gt; = &lt;DP&gt;
		{&lt;I' head type transitive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;I' head object head agr&gt;
	}
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;DP head&gt; == ~[case:accusative]
	&lt;I' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, verb must be
					 [type:[negative:+]]
	&lt;IP option&gt; = 2cNegVerb
</xsl:text>
</xsl:if>









	<xsl:if test="//neg/@subjVerbRequired!='yes' and //typology/@wordOrder='OVS' and //ip/@passive='yes' or //neg/@subjVerbRequired!='yes' and //typology/@wordOrder='VOS' and //ip/@passive='yes'">
<xsl:text>
rule {IP option 2d - subject final, required, passive}
IP = I' DP
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;I' head object&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	{&lt;IP head type question&gt; = -
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = AdvP
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = PP
	}
	&lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;I' head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;DP head&gt; == ~[case:accusative]
	&lt;IP option&gt; = 2d
</xsl:text>
</xsl:if>













	<xsl:if test="//neg/@subjVerbRequired='yes' and //typology/@wordOrder='OVS' and //ip/@passive='yes' or //neg/@subjVerbRequired='yes' and //typology/@wordOrder='VOS' and //ip/@passive='yes'">
<xsl:text>
rule {IP option 2dNegVerb - subject final, required, passive, neg requires neg verb}
IP = I' DP
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;I' head object&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = -
	&lt;IP head type passive&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	{&lt;IP head type question&gt; = -
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = AdvP
	/&lt;IP head type question&gt; = +
	 &lt;IP head fronted cat&gt; = PP
	}
	&lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:accusative]
	&lt;I' head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, verb must be
					 [type:[negative:+]]
	&lt;IP option&gt; = 2dNegVerb
</xsl:text>
</xsl:if>













	<xsl:if test="//typology/@wordOrder='OSV' or //typology/@wordOrder='VSO'">
<xsl:text>
rule {IP option 3 - subject internal to VP for VSO, OSV}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP option&gt; = 3
</xsl:text>
</xsl:if>





	<xsl:if test="//typology/@wordOrder!='OSV' and //typology/@wordOrder!='VSO' and //q/@contFront='before'">
<xsl:text>
rule {IP option 4a - subject questioned, not passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head type pro-drop&gt; = -
	&lt;IP head type passive&gt; = -
	&lt;IP head fronted cat&gt; = DP
	&lt;IP head fronted head type wh&gt; = +
	&lt;IP head fronted&gt; = &lt;I' head subject&gt;
		{&lt;I' head type transitive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = +
	&lt;IP head fronted&gt; = &lt;I' head object&gt;
	}
	&lt;IP head fronted head&gt; == ~[case:accusative]
	&lt;IP option&gt; = 4a
</xsl:text>
</xsl:if>







	<xsl:if test="//typology/@wordOrder!='OSV' and //typology/@wordOrder!='VSO' and //q/@contFront='before' and //focus/@focus='yes'">
<xsl:text>
rule {IP option 4afoc - subject focused, not passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type pro-drop&gt; = -
	&lt;IP head type passive&gt; = -
	&lt;IP head fronted cat&gt; = FocusP
	&lt;IP head fronted head type wh&gt; = -
	&lt;IP head fronted&gt; = &lt;I' head subject&gt;
		{&lt;I' head type transitive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = +
	&lt;IP head fronted&gt; = &lt;I' head object&gt;
	}
	&lt;IP head fronted head&gt; == ~[case:accusative]
	&lt;IP option&gt; = 4afoc
</xsl:text>
</xsl:if>









	<xsl:if test="//typology/@wordOrder='SOV' and //q/@contFront='after'">
<xsl:text>
rule {IP option 4aSOV - subject questioned, not passive, SOV}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head type pro-drop&gt; = -
	&lt;IP head type passive&gt; = -
	&lt;IP option&gt; = 4aSOV
</xsl:text>
</xsl:if>





	<xsl:if test="//typology/@wordOrder!='OSV' and //typology/@wordOrder!='VSO' and //q/@contFront='before' and //ip/@passive='yes'">
<xsl:text>
rule {IP option 4b - subject questioned, passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head type pro-drop&gt; = -
	&lt;IP head type passive&gt; = +
	&lt;IP head fronted cat&gt; = DP
	&lt;IP head fronted head type wh&gt; = +
	&lt;IP head fronted&gt; = &lt;I' head object&gt;
	&lt;IP head fronted head&gt; == ~[case:accusative]
	&lt;IP option&gt; = 4b
</xsl:text>
</xsl:if>









	<xsl:if test="//typology/@wordOrder!='OSV' and //typology/@wordOrder!='VSO' and //q/@contFront='before' and //ip/@passive='yes' and //focus/@focus='yes'">
<xsl:text>
rule {IP option 4b - subject focused, passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type pro-drop&gt; = -
	&lt;IP head type passive&gt; = +
	&lt;IP head fronted cat&gt; = FocusP
	&lt;IP head fronted head type wh&gt; = -
	&lt;IP head fronted&gt; = &lt;I' head object&gt;
	&lt;IP head fronted head&gt; == ~[case:accusative]
	&lt;IP option&gt; = 4bfoc
</xsl:text>
</xsl:if>











	<xsl:if test="//typology/@wordOrder='SOV' and //q/@contFront='after' and //ip/@passive='yes'">
<xsl:text>
rule {IP option 4bSOV - subject questioned, passive, SOV}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head type pro-drop&gt; = -
	&lt;IP head type passive&gt; = +
	&lt;IP option&gt; = 4bSOV
</xsl:text>
</xsl:if>







	<xsl:if test="//typology/@wordOrder!='OSV' and //typology/@wordOrder!='VSO' and //q/@contFront='before'">
<xsl:text>
rule {IP option 5 - adverb questioned, copular verb}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head fronted cat&gt; = AdvP
	&lt;IP head fronted head type wh&gt; = +
	&lt;I' head type copular&gt; = +
	&lt;I' head type transitive&gt; = -
	&lt;I' head type passive&gt; = -
	&lt;IP option&gt; = 5
</xsl:text>
</xsl:if>








	<xsl:if test="//ip/@auxRequired!='yes'">
<xsl:text>
rule {IBar option 1 - no auxiliaries}
I' = VP
	&lt;I' head&gt; = &lt;VP head&gt;
	{&lt;I' head type auxiliary&gt; = -
	 &lt;I' head type question&gt; = -
	/&lt;I' head type question&gt; = +
	}
	&lt;I' option&gt; = 1
</xsl:text>
</xsl:if>



	<xsl:if test="//ip/@aux='yes' and //typology/@wordOrder='SVO' or //ip/@aux='yes' and //typology/@wordOrder='VOS' or //ip/@aux='yes' and //typology/@wordOrder='VSO'">
<xsl:text>
rule {IBar option 2 - positive Aux initial, required}
I' = Aux VP
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux head type negative&gt; = -
	&lt;I' head subject agr&gt; = &lt;Aux head subject agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
	   }
	&lt;I' head type prefix&gt; &lt;= &lt;Aux head type prefix&gt;
	&lt;I' option&gt; = 2
</xsl:text>
</xsl:if>













	<xsl:if test="//neg/@auxVerbRequired='no' and //ip/@negAux!='noVerb' and //ip/@negAuxRequiresAux='no' and //typology/@wordOrder='SVO' or //neg/@auxVerbRequired='no' and //ip/@negAux!='noVerb' and //ip/@negAuxRequiresAux='no' and //typology/@wordOrder='VOS' or //neg/@auxVerbRequired='no' and //ip/@negAux!='noVerb' and //ip/@negAuxRequiresAux='no' and //typology/@wordOrder='VSO'">
<xsl:text>
rule {IBar option 2Neg - negative Aux initial, either word or affix, but no other aux required}
I' = Aux VP
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux head type negative&gt; = +
	&lt;I' head subject agr&gt; = &lt;Aux head subject agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
	   }
	&lt;I' head type prefix&gt; &lt;= &lt;Aux head type prefix&gt;
	&lt;VP head type negative&gt; &lt;= &lt;Aux head type negative&gt; | polarity from Aux
	&lt;I' option&gt; = 2Neg
</xsl:text>
</xsl:if>

























	<xsl:if test="//neg/@auxVerbRequired='yes' and //ip/@negAux!='noVerb' and //ip/@negAuxRequiresAux='no' and //typology/@wordOrder='SVO' or //neg/@auxVerbRequired='yes' and //ip/@negAux!='noVerb' and //ip/@negAuxRequiresAux='no' and //typology/@wordOrder='VOS' or //neg/@auxVerbRequired='yes' and //ip/@negAux!='noVerb' and //ip/@negAuxRequiresAux='no' and //typology/@wordOrder='VSO'">
<xsl:text>
rule {IBar option 2NegAuxVerbRequired - negative Aux initial, either word or affix, but no other aux required}
I' = Aux VP
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux head type negative&gt; = +
	&lt;VP head type negative&gt; = +    | only neg verb with neg Aux
	&lt;I' head subject agr&gt; = &lt;Aux head subject agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
	   }
	&lt;I' head type prefix&gt; &lt;= &lt;Aux head type prefix&gt;
	&lt;I' option&gt; = 2NegAuxVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="//neg/@auxVerbRequired='no' and //ip/@negAux='yes' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SVO' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesAffix' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SVO' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesVerb' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SVO' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesAll' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SVO' or //neg/@auxVerbRequired='no' and //ip/@negAux='yes' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VOS' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesAffix' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VOS' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesVerb' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VOS' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesAll' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VOS' or //neg/@auxVerbRequired='no' and //ip/@negAux='yes' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VSO' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesAffix' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VSO' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesVerb' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VSO' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesAll' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VSO'">
<xsl:text>
rule {IBar option 2NegPlusAux - Aux_1 positive then negative Aux, initial}
I' = Aux_1 Aux VP
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux_1 head type negative&gt; = -
	&lt;Aux head type negative&gt; = +
	&lt;I' head subject agr&gt; = &lt;Aux_1 head subject agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux_1 head infl tense&gt; =  &lt;VP head infl tense&gt;
	   }
	&lt;I' head type prefix&gt; &lt;= &lt;Aux_1 head type prefix&gt;
	&lt;VP head type negative&gt; &lt;= &lt;Aux head type negative&gt; | polarity from Aux
	&lt;I' option&gt; = 2NegPlusAux
</xsl:text>
</xsl:if>

































































































	<xsl:if test="//neg/@auxVerbRequired='yes' and //ip/@negAux='yes' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SVO' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesAffix' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SVO' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesVerb' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SVO' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesAll' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SVO' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yes' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VOS' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesAffix' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VOS' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesVerb' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VOS' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesAll' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VOS' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yes' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VSO' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesAffix' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VSO' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesVerb' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VSO' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesAll' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='VSO'">
<xsl:text>
rule {IBar option 2NegPlusAuxVerbRequired - Aux_1 positive then negative Aux, initial}
I' = Aux_1 Aux VP
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux_1 head type negative&gt; = -
	&lt;Aux head type negative&gt; = +
	&lt;VP head type negative&gt; = +   | neg Aux requires neg verb
	&lt;I' head subject agr&gt; = &lt;Aux_1 head subject agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux_1 head infl tense&gt; =  &lt;VP head infl tense&gt;
	   }
	&lt;I' head type prefix&gt; &lt;= &lt;Aux_1 head type prefix&gt;
	&lt;I' option&gt; = 2NegPlusAuxVerbRequired
</xsl:text>
</xsl:if>

































































































	<xsl:if test="//ip/@aux='yes' and //typology/@wordOrder='SOV' or //ip/@aux='yes' and //typology/@wordOrder='OSV' or //ip/@aux='yes' and //typology/@wordOrder='OVS'">
<xsl:text>
rule {IBar option 3 - positive Aux final, required}
I' = VP Aux
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux head type negative&gt; = -
	&lt;I' head subject agr&gt; = &lt;Aux head subject agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
	   }
	&lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;I' option&gt; = 3
</xsl:text>
</xsl:if>













	<xsl:if test="//neg/@auxVerbRequired='no' and //ip/@negAux!='noVerb' and //ip/@negAuxRequiresAux='no' and //typology/@wordOrder='SOV' or //neg/@auxVerbRequired='no' and //ip/@negAux!='noVerb' and //ip/@negAuxRequiresAux='no' and //typology/@wordOrder='OSV' or //neg/@auxVerbRequired='no' and //ip/@negAux!='noVerb' and //ip/@negAuxRequiresAux='no' and //typology/@wordOrder='OVS'">
<xsl:text>
rule {IBar option 3Neg - negative Aux final, either word or affix, but no other aux required}
I' = VP Aux
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux head type negative&gt; = +
	&lt;I' head subject agr&gt; = &lt;Aux head subject agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
	   }
	&lt;I' head type suffix&gt; &lt;= &lt;Aux head type suffix&gt;
	&lt;VP head type negative&gt; &lt;= &lt;Aux head type negative&gt; | polarity from Aux
	&lt;I' option&gt; = 3Neg
</xsl:text>
</xsl:if>

























	<xsl:if test="//neg/@auxVerbRequired='yes' and //ip/@negAux!='noVerb' and //ip/@negAuxRequiresAux='no' and //typology/@wordOrder='SOV' or //neg/@auxVerbRequired='yes' and //ip/@negAux!='noVerb' and //ip/@negAuxRequiresAux='no' and //typology/@wordOrder='OSV' or //neg/@auxVerbRequired='yes' and //ip/@negAux!='noVerb' and //ip/@negAuxRequiresAux='no' and //typology/@wordOrder='OVS'">
<xsl:text>
rule {IBar option 3NegAuxVerbRequired - negative Aux final, either word or affix, but no other aux required}
I' = VP Aux
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux head type negative&gt; = +
	&lt;VP head type negative&gt; = +    | neg Aux requires neg verb
	&lt;I' head subject agr&gt; = &lt;Aux head subject agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
	   }
	&lt;I' head type suffix&gt; &lt;= &lt;Aux head type suffix&gt;
	&lt;I' option&gt; = 3NegAuxVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="//neg/@auxVerbRequired='no' and //ip/@negAux='yes' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SOV' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesAffix' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SOV' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesVerb' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SOV' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesAll' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SOV' or //neg/@auxVerbRequired='no' and //ip/@negAux='yes' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OSV' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesAffix' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OSV' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesVerb' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OSV' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesAll' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OSV' or //neg/@auxVerbRequired='no' and //ip/@negAux='yes' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OVS' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesAffix' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OVS' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesVerb' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OVS' or //neg/@auxVerbRequired='no' and //ip/@negAux='yesAll' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OVS'">
<xsl:text>
rule {IBar option 3NegPlusAux - negative Aux then Aux_1 positive, final}
I' = VP Aux Aux_1
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux_1 head type negative&gt; = -
	&lt;Aux head type negative&gt; = +
	&lt;I' head subject agr&gt; = &lt;Aux_1 head subject agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux_1 head infl tense&gt; =  &lt;VP head infl tense&gt;
	   }
	&lt;I' head type suffix&gt; &lt;= &lt;Aux_1 head type suffix&gt;
	&lt;VP head type negative&gt; &lt;= &lt;Aux head type negative&gt; | polarity from Aux
	&lt;I' option&gt; = 3NegPlusAux
</xsl:text>
</xsl:if>

































































































	<xsl:if test="//neg/@auxVerbRequired='yes' and //ip/@negAux='yes' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SOV' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesAffix' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SOV' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesVerb' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SOV' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesAll' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='SOV' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yes' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OSV' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesAffix' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OSV' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesVerb' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OSV' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesAll' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OSV' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yes' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OVS' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesAffix' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OVS' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesVerb' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OVS' or //neg/@auxVerbRequired='yes' and //ip/@negAux='yesAll' and //ip/@negAuxRequiresAux='yes' and //typology/@wordOrder='OVS'">
<xsl:text>
rule {IBar option 3NegPlusAuxVerbRequired - negative Aux then Aux_1 positive, final}
I' = VP Aux Aux_1
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux_1 head type negative&gt; = -
	&lt;Aux head type negative&gt; = +
	&lt;VP head type negative&gt; = +     | neg Aux requires neg verb
	&lt;I' head subject agr&gt; = &lt;Aux_1 head subject agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux_1 head infl tense&gt; =  &lt;VP head infl tense&gt;
	   }
	&lt;I' head type suffix&gt; &lt;= &lt;Aux_1 head type suffix&gt;
	&lt;I' option&gt; = 3NegPlusAuxVerbRequired
</xsl:text>
</xsl:if>

































































































</xsl:template>
</xsl:stylesheet>
