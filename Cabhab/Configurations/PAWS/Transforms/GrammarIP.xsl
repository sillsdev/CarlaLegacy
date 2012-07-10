<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="ip">
	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//coord/@conjWord)!='no'">
<xsl:text>
rule {IP option conj - conjoined IPs}
IP = (InitConj) IP_1 Conj IP_2
	&lt;IP head&gt; = &lt;IP_2 head&gt;
	&lt;Conj head type conjoins_IP&gt; = +
	&lt;IP conjoined&gt; = +
	&lt;IP_1 conjoined&gt; = -	|limit recursion
	&lt;IP head type prefix&gt; &lt;= &lt;IP_1 head type prefix&gt;
	&lt;IP option&gt; = conj
	</xsl:text>
</xsl:if>







  <xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/@conjPos)='before' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/@conjPos)='either'">
<xsl:text>
	  rule {IP option conjPrefix - conjoined IPs}
	  IP = IP_1  IP_2
	  &lt;IP head&gt; = &lt;IP_2 head&gt;
	  &lt;IP conjoined&gt; = +
	  &lt;IP_1 conjoined&gt; = -	|limit recursion
	  &lt;IP_2 head type prefix conj&gt; = +
	  &lt;IP head type prefix&gt; &lt;= &lt;IP_1 head type prefix&gt;
	  &lt;IP option&gt; = conjPrefix
   </xsl:text>
</xsl:if>

















   <xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/@conjPos)='after' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/@conjPos)='either'">
<xsl:text>
	  rule {IP option conjSuffix - conjoined IPs}
	  IP = IP_1  IP_2
	  &lt;IP head&gt; = &lt;IP_2 head&gt;
	  &lt;IP conjoined&gt; = +
	  &lt;IP_1 conjoined&gt; = -	|limit recursion
	  &lt;IP_1 head type suffix conj&gt; = +
	  &lt;IP head type prefix&gt; &lt;= &lt;IP_1 head type prefix&gt;
	  &lt;IP option&gt; = conjSuffix
   </xsl:text>
</xsl:if>

















   <xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/@conjPos)='other' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//coord/@noConj)='yes'">
<xsl:text>
	  rule {IP option conjNone - conjoined IPs}
	  IP = IP_1  IP_2
	  &lt;IP head&gt; = &lt;IP_2 head&gt;
	  &lt;IP conjoined&gt; = +
	  &lt;IP_1 conjoined&gt; = -	|limit recursion
	  &lt;IP_2 head type prefix conj&gt; = -
	  &lt;IP_1 head type suffix conj&gt; = -
	  &lt;IP_1 head type comma&gt; = -
	  &lt;IP head type prefix&gt; &lt;= &lt;IP_1 head type prefix&gt;
	  &lt;IP option&gt; = conjNone
   </xsl:text>
</xsl:if>















   <xsl:if test="normalize-space(//ip/@proDrop)!='no' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV'">
<xsl:text>
rule {IP option 1a - no subject for imperatives}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;I' head infl mood&gt; =  imperative
	&lt;IP head type question&gt; = -
	&lt;IP option&gt; = 1a
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//ip/@proDrop)='yes' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' or normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV'">
<xsl:text>
rule {IP option 1b - subject pro-drop, not passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = +
	&lt;IP head infl mood&gt; =  imperative
		{&lt;I' head type transitive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = -
		/&lt;I' head type transitive&gt; = +
	&lt;I' head object head type reflexive&gt; = +
	&lt;I' head subject head agr&gt; = &lt;I' head object head agr&gt;
	}
	&lt;IP head infl valence&gt; = active
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
		  &lt;IP head fronted&gt; == ~[cat:DP]
		   &lt;IP option&gt; = 1b
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@passive)='yes' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' or normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@passive)='yes' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV'">
<xsl:text>
rule {IP option 1c - subject pro-drop, passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = +
	&lt;IP head infl mood&gt; =  imperative
	&lt;IP head infl valence&gt; = passive
	&lt;IP head fronted&gt; == ~[cat:DP]
	&lt;IP option&gt; = 1c
</xsl:text>
</xsl:if>

















   <xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//ip/@existVerb)='yesOnly'">
<xsl:text>
	  rule {IP option 1exist - subject missing for existentials without an existential Adv}
	  IP = I'
	  &lt;IP head&gt; = &lt;I' head&gt;
	  &lt;IP head type existential&gt; = +
	  &lt;IP head type verbheaded&gt; = +  | if no existential verb, then existential Adv required
	  &lt;IP head infl mood&gt; =  declarative
	  &lt;IP head infl valence&gt; = active
	  &lt;IP head fronted&gt; == ~[cat:DP]
	  &lt;IP option&gt; = 1exist
   </xsl:text>
</xsl:if>







   <xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//neg/@subjVerbRequired)!='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//neg/@subjVerbRequired)!='yes'">
<xsl:text>
rule {IP option 2a - subject initial, required, not passive or antipassive}
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
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;IP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;I' head infl polarity&gt; &lt;= &lt;DP head infl polarity&gt;
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP head infl&gt; == ~[valence:passive]
	&lt;IP head infl&gt; == ~[valence:antipassive]
	&lt;IP option&gt; = 2a
	</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='SOV'">
<xsl:text>
rule {IP option 2aNegVerb - subject initial, not passive or antipassive, neg subj requires neg verb}
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
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;IP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head type comma&gt; = -
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;I' head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, verb must be
					 [infl:[polarity:negative]]
			 &lt;IP head infl&gt; == ~[valence:passive]
			 &lt;IP head infl&gt; == ~[valence:antipassive]
			 &lt;IP option&gt; = 2aNegVerb
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//neg/@subjVerbRequired)!='yes' and normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//ip/@passive)='yes' or normalize-space(//neg/@subjVerbRequired)!='yes' and normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@passive)='yes'">
<xsl:text>
rule {IP option 2b - subject initial, required, passive}
IP = DP I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;I' head object&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = -
	&lt;IP head infl valence&gt; = passive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;IP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;I' head infl polarity&gt; &lt;= &lt;DP head infl polarity&gt;
	&lt;IP option&gt; = 2b
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//ip/@passive)='yes' or normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@passive)='yes'">
<xsl:text>
rule {IP option 2bNegVerb - subject initial, required, passive, neg subj requires neg verb}
IP = DP I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;I' head object&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = -
	&lt;IP head infl valence&gt; = passive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;IP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;I' head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, verb must be
					 [infl:[polarity:negative]]
	&lt;IP option&gt; = 2bNegVerb
</xsl:text>
</xsl:if>














   <xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//ip/@antipassive)='yesAgr' and normalize-space(//neg/@subjVerbRequired)!='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//ip/@antipassive)='yesAffix' and normalize-space(//neg/@subjVerbRequired)!='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@antipassive)='yesAgr' and normalize-space(//neg/@subjVerbRequired)!='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@antipassive)='yesAffix' and normalize-space(//neg/@subjVerbRequired)!='yes'">
<xsl:text>
	  rule {IP option 2bantiNotErg - subject initial, required, antipassive, not ergative}
	  IP = DP I'
	  &lt;IP head&gt; = &lt;I' head&gt;
	  &lt;IP head type pro-drop&gt; = -
	  &lt;I' head subject&gt; = &lt;DP&gt;
	  &lt;I' head infl valence&gt; = antipassive
	  &lt;DP head case&gt; = nominative
	  &lt;DP head type wh&gt; = -
	  &lt;DP head type possessive&gt; = -  		|subject not possessive
	  &lt;DP head type reflexive&gt; = -		|subject not reflexive
	  &lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	  &lt;DP head type suffix poss&gt; = -         | only in possessor position
	  &lt;DP head type prefix poss&gt; = -
	  &lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	  &lt;DP head type suffix copular&gt; = -
	  &lt;DP head type comma&gt; = -
	  &lt;IP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	  &lt;I' head infl polarity&gt; &lt;= &lt;DP head infl polarity&gt;
	  &lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
	  [subject:[head:[agr:[number:plural]]]]
	  &lt;IP option&gt; = 2bantiNotErg
   </xsl:text>
</xsl:if>

























   <xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//ip/@antipassive)='yesAgr' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//ip/@antipassive)='yesAffix' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@antipassive)='yesAgr' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@antipassive)='yesAffix' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
	  rule {IP option 2bantiNotErgNegV - subject initial, required, antipassive, not ergative, neg V requires neg Subj}
	  IP = DP I'
	  &lt;IP head&gt; = &lt;I' head&gt;
	  &lt;IP head type pro-drop&gt; = -
	  &lt;I' head subject&gt; = &lt;DP&gt;
	  &lt;I' head infl valence&gt; = antipassive
	  &lt;DP head case&gt; = nominative
	  &lt;DP head type wh&gt; = -
	  &lt;DP head type possessive&gt; = -  		|subject not possessive
	  &lt;DP head type reflexive&gt; = -		|subject not reflexive
	  &lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	  &lt;DP head type suffix poss&gt; = -         | only in possessor position
	  &lt;DP head type prefix poss&gt; = -
	  &lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	  &lt;DP head type suffix copular&gt; = -
	  &lt;DP head type comma&gt; = -
	  &lt;IP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	  &lt;I' head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, verb must be
	  [infl:[polarity:negative]]
	  &lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
	  [subject:[head:[agr:[number:plural]]]]
	  &lt;IP option&gt; = 2bantiNotErgNegV
   </xsl:text>
</xsl:if>


























   <xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//ip/@antipassive)='yesErg' and normalize-space(//neg/@subjVerbRequired)!='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@antipassive)='yesErg' and normalize-space(//neg/@subjVerbRequired)!='yes'">
<xsl:text>
	  rule {IP option 2bantiErg - subject initial, required, antipassive, ergative}
	  IP = DP I'
	  &lt;IP head&gt; = &lt;I' head&gt;
	  &lt;IP head type pro-drop&gt; = -
	  &lt;I' head subject&gt; = &lt;DP&gt;
	  &lt;I' head infl valence&gt; = antipassive
	  &lt;DP head case&gt; = absolutive
	  &lt;DP head type wh&gt; = -
	  &lt;DP head type possessive&gt; = -  		|subject not possessive
	  &lt;DP head type reflexive&gt; = -		|subject not reflexive
	  &lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	  &lt;DP head type suffix poss&gt; = -         | only in possessor position
	  &lt;DP head type prefix poss&gt; = -
	  &lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	  &lt;DP head type suffix copular&gt; = -
	  &lt;DP head type comma&gt; = -
	  &lt;IP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	  &lt;I' head infl polarity&gt; &lt;= &lt;DP head infl polarity&gt;
	  &lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
	  [subject:[head:[agr:[number:plural]]]]
	  &lt;IP option&gt; = 2bantiErg
   </xsl:text>
</xsl:if>













   <xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//ip/@antipassive)='yesErg' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@antipassive)='yesErg' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
	  rule {IP option 2bantiErgNegV - subject initial, required, antipassive, ergative, neg V requires neg Subj}
	  IP = DP I'
	  &lt;IP head&gt; = &lt;I' head&gt;
	  &lt;IP head type pro-drop&gt; = -
	  &lt;I' head subject&gt; = &lt;DP&gt;
	  &lt;I' head infl valence&gt; = antipassive
	  &lt;DP head case&gt; = absolutive
	  &lt;DP head type wh&gt; = -
	  &lt;DP head type possessive&gt; = -  		|subject not possessive
	  &lt;DP head type reflexive&gt; = -		|subject not reflexive
	  &lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	  &lt;DP head type suffix poss&gt; = -         | only in possessor position
	  &lt;DP head type prefix poss&gt; = -
	  &lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	  &lt;DP head type suffix copular&gt; = -
	  &lt;DP head type comma&gt; = -
	  &lt;IP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	  &lt;I' head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, verb must be
	  [infl:[polarity:negative]]
	  &lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
	  [subject:[head:[agr:[number:plural]]]]
	  &lt;IP option&gt; = 2bantiErgNegV
   </xsl:text>
</xsl:if>














   <xsl:if test="normalize-space(//neg/@subjVerbRequired)!='yes' and normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//neg/@subjVerbRequired)!='yes' and normalize-space(//typology/@wordOrder)='VOS'">
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
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;I' head type comma&gt; = -
	&lt;IP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;I' head infl polarity&gt; &lt;= &lt;DP head infl polarity&gt;
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP head infl&gt; == ~[valence:passive]
	&lt;IP option&gt; = 2c
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='VOS'">
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
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;I' head type comma&gt; = -
	&lt;IP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;IP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
					 [subject:[head:[agr:[number:plural]]]]
	&lt;I' head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, verb must be
					 [infl:[polarity:negative]]
		   &lt;IP head infl&gt; == ~[valence:passive]
		   &lt;IP option&gt; = 2cNegVerb
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//neg/@subjVerbRequired)!='yes' and normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//ip/@passive)='yes' or normalize-space(//neg/@subjVerbRequired)!='yes' and normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//ip/@passive)='yes'">
<xsl:text>
rule {IP option 2d - subject final, required, passive}
IP = I' DP
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;I' head object&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = -
	&lt;IP head infl valence&gt; = passive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;I' head type comma&gt; = -
	&lt;IP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;I' head infl polarity&gt; &lt;= &lt;DP head infl polarity&gt;
	&lt;IP option&gt; = 2d
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//ip/@passive)='yes' or normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//ip/@passive)='yes'">
<xsl:text>
rule {IP option 2dNegVerb - subject final, required, passive, neg requires neg verb}
IP = I' DP
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;I' head object&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = -
	&lt;IP head infl valence&gt; = passive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;I' head type comma&gt; = -
	&lt;IP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;I' head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, verb must be
					 [infl:[polarity:negative]]
	&lt;IP option&gt; = 2dNegVerb
</xsl:text>
</xsl:if>














   <xsl:if test="normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//ip/@antipassive)='yesAgr' and normalize-space(//neg/@subjVerbRequired)!='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//ip/@antipassive)='yesAffix' and normalize-space(//neg/@subjVerbRequired)!='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//ip/@antipassive)='yesAgr' and normalize-space(//neg/@subjVerbRequired)!='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//ip/@antipassive)='yesAffix' and normalize-space(//neg/@subjVerbRequired)!='yes'">
<xsl:text>
	  rule {IP option 2dantiNotErg - subject final, required, antipassive, not ergative}
	  IP = I' DP
	  &lt;IP head&gt; = &lt;I' head&gt;
	  &lt;IP head type pro-drop&gt; = -
	  &lt;I' head subject&gt; = &lt;DP&gt;
	  &lt;I' head infl valence&gt; = antipassive
	  &lt;DP head case&gt; = nominative
	  &lt;DP head type wh&gt; = -
	  &lt;DP head type possessive&gt; = -  		|subject not possessive
	  &lt;DP head type reflexive&gt; = -		|subject not reflexive
	  &lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	  &lt;DP head type suffix poss&gt; = -         | only in possessor position
	  &lt;DP head type prefix poss&gt; = -
	  &lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	  &lt;DP head type suffix copular&gt; = -
	  &lt;I' head type comma&gt; = -
	  &lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	  &lt;I' head infl polarity&gt; &lt;= &lt;DP head infl polarity&gt;
	  &lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
	  [subject:[head:[agr:[number:plural]]]]
	  &lt;IP option&gt; = 2dantiNotErg
   </xsl:text>
</xsl:if>

























   <xsl:if test="normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//ip/@antipassive)='yesAgr' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//ip/@antipassive)='yesAffix' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//ip/@antipassive)='yesAgr' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//ip/@antipassive)='yesAffix' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
	  rule {IP option 2dantiNotErgNegV - subject final, required, antipassive, not ergative, neg V requires neg Subj}
	  IP = I' DP
	  &lt;IP head&gt; = &lt;I' head&gt;
	  &lt;IP head type pro-drop&gt; = -
	  &lt;I' head subject&gt; = &lt;DP&gt;
	  &lt;I' head infl valence&gt; = antipassive
	  &lt;DP head case&gt; = nominative
	  &lt;DP head type wh&gt; = -
	  &lt;DP head type possessive&gt; = -  		|subject not possessive
	  &lt;DP head type reflexive&gt; = -		|subject not reflexive
	  &lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	  &lt;DP head type suffix poss&gt; = -         | only in possessor position
	  &lt;DP head type prefix poss&gt; = -
	  &lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	  &lt;DP head type suffix copular&gt; = -
	  &lt;I' head type comma&gt; = -
	  &lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	  &lt;I' head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, verb must be
	  [infl:[polarity:negative]]
	  &lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
	  [subject:[head:[agr:[number:plural]]]]
	  &lt;IP option&gt; = 2dantiNotErgNegV
   </xsl:text>
</xsl:if>


























   <xsl:if test="normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//ip/@antipassive)='yesErg' and normalize-space(//neg/@subjVerbRequired)!='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//ip/@antipassive)='yesErg' and normalize-space(//neg/@subjVerbRequired)!='yes'">
<xsl:text>
	  rule {IP option 2dantiErg - subject final, required, antipassive, ergative}
	  IP = I' DP
	  &lt;IP head&gt; = &lt;I' head&gt;
	  &lt;IP head type pro-drop&gt; = -
	  &lt;I' head subject&gt; = &lt;DP&gt;
	  &lt;I' head infl valence&gt; = antipassive
	  &lt;DP head case&gt; = absolutive
	  &lt;DP head type wh&gt; = -
	  &lt;DP head type possessive&gt; = -  		|subject not possessive
	  &lt;DP head type reflexive&gt; = -		|subject not reflexive
	  &lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	  &lt;DP head type suffix poss&gt; = -         | only in possessor position
	  &lt;DP head type prefix poss&gt; = -
	  &lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	  &lt;DP head type suffix copular&gt; = -
	  &lt;I' head type comma&gt; = -
	  &lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	  &lt;I' head infl polarity&gt; &lt;= &lt;DP head infl polarity&gt;
	  &lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
	  [subject:[head:[agr:[number:plural]]]]
	  &lt;IP option&gt; = 2dantiErg
   </xsl:text>
</xsl:if>













   <xsl:if test="normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//ip/@antipassive)='yesErg' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//ip/@antipassive)='yesErg' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
	  rule {IP option 2dantiErgNegV - subject final, required, antipassive, ergative, neg V requires neg Subj}
	  IP = I' DP
	  &lt;IP head&gt; = &lt;I' head&gt;
	  &lt;IP head type pro-drop&gt; = -
	  &lt;I' head subject&gt; = &lt;DP&gt;
	  &lt;I' head infl valence&gt; = antipassive
	  &lt;DP head case&gt; = absolutive
	  &lt;DP head type wh&gt; = -
	  &lt;DP head type possessive&gt; = -  		|subject not possessive
	  &lt;DP head type reflexive&gt; = -		|subject not reflexive
	  &lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	  &lt;DP head type suffix poss&gt; = -         | only in possessor position
	  &lt;DP head type prefix poss&gt; = -
	  &lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	  &lt;DP head type suffix copular&gt; = -
	  &lt;I' head type comma&gt; = -
	  &lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	  &lt;I' head&gt; == [subject:[head:[infl:[polarity:negative]]]] -&gt;  | if subject negative, verb must be
	  [infl:[polarity:negative]]
	  &lt;IP head&gt; == [type:[reciprocal:+]] -&gt;
	  [subject:[head:[agr:[number:plural]]]]
	  &lt;IP option&gt; = 2dantiErgNegV
   </xsl:text>
</xsl:if>














   <xsl:if test="normalize-space(//typology/@wordOrder)='OSV' or normalize-space(//typology/@wordOrder)='VSO'">
<xsl:text>
rule {IP option 3 - subject internal to VP for VSO, OSV}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP option&gt; = 3
</xsl:text>
</xsl:if>





   <xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//ip/@existVerb)!='yesOnly' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//ip/@existVerb)!='yesOnly'">
<xsl:text>
	  rule {IP option 3aexist - existential Adv initial}
	  IP = AdvP I'
	  &lt;IP head&gt; = &lt;I' head&gt;
	  &lt;IP head type existential&gt; = +
	  &lt;AdvP head type existential&gt; = +
	  &lt;IP head infl valence&gt; = active
	  &lt;AdvP head type comma&gt; = -
	  &lt;IP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	  &lt;IP option&gt; = 3aexist
   </xsl:text>
</xsl:if>









   <xsl:if test="normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//ip/@existVerb)!='yesOnly' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//ip/@existVerb)!='yesOnly'">
<xsl:text>
	  rule {IP option 3bexist - existential Adv final}
	  IP = I' AdvP
	  &lt;IP head&gt; = &lt;I' head&gt;
	  &lt;IP head type existential&gt; = +
	  &lt;AdvP head type existential&gt; = +
	  &lt;IP head infl valence&gt; = active
	  &lt;I'  head type comma&gt; = -
	  &lt;IP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	  &lt;IP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	  &lt;IP option&gt; = 3bexist
   </xsl:text>
</xsl:if>









   <xsl:if test="normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@contFront)='before'">
<xsl:text>
rule {IP option 4a - subject questioned, not passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head type pro-drop&gt; = -
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
	&lt;IP head infl&gt; == ~[valence:passive]
	&lt;IP option&gt; = 4a
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {IP option 4afoc - subject focused, not passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type pro-drop&gt; = -
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
	&lt;IP head infl&gt; == ~[valence:passive]
	&lt;IP option&gt; = 4afoc
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//q/@contFront)='after'">
<xsl:text>
rule {IP option 4aSOV - subject questioned, not passive, SOV}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head type pro-drop&gt; = -
	&lt;IP head infl&gt; == ~[valence:passive]
	&lt;IP option&gt; = 4aSOV
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes'">
<xsl:text>
rule {IP option 4b - subject questioned, passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head type pro-drop&gt; = -
	&lt;IP head infl valence&gt; = passive
	&lt;IP head fronted cat&gt; = DP
	&lt;IP head fronted head type wh&gt; = +
	&lt;IP head fronted&gt; = &lt;I' head object&gt;
	&lt;IP option&gt; = 4b
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@passive)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {IP option 4b - subject focused, passive}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type pro-drop&gt; = -
	&lt;IP head infl valence&gt; = passive
	&lt;IP head fronted cat&gt; = FocusP
	&lt;IP head fronted head type wh&gt; = -
	&lt;IP head fronted&gt; = &lt;I' head object&gt;
	&lt;IP option&gt; = 4bfoc
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@passive)='yes'">
<xsl:text>
rule {IP option 4bSOV - subject questioned, passive, SOV}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head type pro-drop&gt; = -
	&lt;IP head infl valence&gt; = passive
	&lt;IP option&gt; = 4bSOV
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//q/@contFront)='before'">
<xsl:text>
rule {IP option 5 - adverb questioned, copular verb}
IP = I'
	&lt;IP head&gt; = &lt;I' head&gt;
	&lt;IP head type question&gt; = +
	&lt;IP head fronted cat&gt; = AdvP
	&lt;IP head fronted head type wh&gt; = +
	&lt;I' head type copular&gt; = +
	&lt;I' head type transitive&gt; = -
	&lt;IP head infl&gt; == ~[valence:passive]
	&lt;IP option&gt; = 5
</xsl:text>
</xsl:if>








	<xsl:if test="normalize-space(//ip/@auxRequired)!='yes'">
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



	<xsl:if test="normalize-space(//ip/@aux)='yes' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//ip/@aux)='yes' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//ip/@aux)='yes' and normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//ip/@auxNonfinite)='yes' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//ip/@auxNonfinite)='yes' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//ip/@auxNonfinite)='yes' and normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//ip/@auxOther)='yes' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//ip/@auxOther)='yes' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//ip/@auxOther)='yes' and normalize-space(//typology/@wordOrder)='VSO'">
<xsl:text>
rule {IBar option 2 - positive Aux initial, required}
I' = Aux VP
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux head infl polarity&gt; = positive
	&lt;I' head subject head agr&gt; = &lt;Aux head subject head agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
		}
		&lt;Aux head type comma&gt; = -
		&lt;I' head type prefix&gt; &lt;= &lt;Aux head type prefix&gt;
	&lt;I' option&gt; = 2
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='VSO'">
<xsl:text>
rule {IBar option 2Neg - negative Aux initial, either word or affix, but no other aux required}
I' = Aux VP
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux head infl polarity&gt; = negative
	&lt;I' head subject head agr&gt; = &lt;Aux head subject head agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
		}
		&lt;Aux head type comma&gt; = -
		&lt;I' head type prefix&gt; &lt;= &lt;Aux head type prefix&gt;
		&lt;VP head infl polarity&gt; &lt;= &lt;Aux head infl polarity&gt; | polarity from Aux
	&lt;I' option&gt; = 2Neg
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='VSO'">
<xsl:text>
rule {IBar option 2NegAuxVerbRequired - negative Aux initial, either word or affix, but no other aux required}
I' = Aux VP
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative    | only neg verb with neg Aux
	&lt;I' head subject head agr&gt; = &lt;Aux head subject head agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
		}
		&lt;Aux head type comma&gt; = -
			&lt;I' head type prefix&gt; &lt;= &lt;Aux head type prefix&gt;
	&lt;I' option&gt; = 2NegAuxVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='VSO'">
<xsl:text>
rule {IBar option 2NegPlusAux - Aux_1 positive then negative Aux, initial}
I' = Aux_1 Aux VP
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux_1 head infl polarity&gt; = positive
	&lt;Aux head infl polarity&gt; = negative
	&lt;I' head subject head agr&gt; = &lt;Aux_1 head subject head agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux_1 head infl tense&gt; =  &lt;VP head infl tense&gt;
		}
		&lt;Aux head type comma&gt; = -
		&lt;Aux_1 head type comma&gt; = -
		&lt;I' head type prefix&gt; &lt;= &lt;Aux_1 head type prefix&gt;
		&lt;VP head infl polarity&gt; &lt;= &lt;Aux head infl polarity&gt; | polarity from Aux
	&lt;I' option&gt; = 2NegPlusAux
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='SVO' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='VOS' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='VSO' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='VSO'">
<xsl:text>
rule {IBar option 2NegPlusAuxVerbRequired - Aux_1 positive then negative Aux, initial}
I' = Aux_1 Aux VP
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux_1 head infl polarity&gt; = positive
	&lt;Aux head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative   | neg Aux requires neg verb
	&lt;I' head subject head agr&gt; = &lt;Aux_1 head subject head agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux_1 head infl tense&gt; =  &lt;VP head infl tense&gt;
		}
		&lt;Aux head type comma&gt; = -
		&lt;Aux_1 head type comma&gt; = -
		&lt;I' head type prefix&gt; &lt;= &lt;Aux_1 head type prefix&gt;
	&lt;I' option&gt; = 2NegPlusAuxVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//ip/@aux)='yes' and normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//ip/@aux)='yes' and normalize-space(//typology/@wordOrder)='OSV' or normalize-space(//ip/@aux)='yes' and normalize-space(//typology/@wordOrder)='OVS'">
<xsl:text>
rule {IBar option 3 - positive Aux final, required}
I' = VP Aux
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux head infl polarity&gt; = positive
	&lt;I' head subject head agr&gt; = &lt;Aux head subject head agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
		}
		&lt;VP head type comma&gt; = -
		&lt;I' head type comma&gt; &lt;= &lt;Aux head type comma&gt;
		&lt;IP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;I' option&gt; = 3
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='OSV' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='OSV' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='OVS'">
<xsl:text>
rule {IBar option 3Neg - negative Aux final, either word or affix, but no other aux required}
I' = VP Aux
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux head infl polarity&gt; = negative
	&lt;I' head subject head agr&gt; = &lt;Aux head subject head agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
		}
		&lt;VP head type comma&gt; = -
		&lt;I' head type comma&gt; &lt;= &lt;Aux head type comma&gt;
		&lt;I' head type suffix&gt; &lt;= &lt;Aux head type suffix&gt;
		&lt;VP head infl polarity&gt; &lt;= &lt;Aux head infl polarity&gt; | polarity from Aux
	&lt;I' option&gt; = 3Neg
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='OSV' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='OSV' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='no' and normalize-space(//typology/@wordOrder)='OVS'">
<xsl:text>
rule {IBar option 3NegAuxVerbRequired - negative Aux final, either word or affix, but no other aux required}
I' = VP Aux
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative    | neg Aux requires neg verb
	&lt;I' head subject head agr&gt; = &lt;Aux head subject head agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux head infl tense&gt; =  &lt;VP head infl tense&gt;
		}
		&lt;VP head type comma&gt; = -
		&lt;I' head type comma&gt; &lt;= &lt;Aux head type comma&gt;
		&lt;I' head type suffix&gt; &lt;= &lt;Aux head type suffix&gt;
	&lt;I' option&gt; = 3NegAuxVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='OSV' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='OSV' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//neg/@auxVerbRequired)='no' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='OVS'">
<xsl:text>
rule {IBar option 3NegPlusAux - negative Aux then Aux_1 positive, final}
I' = VP Aux Aux_1
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux_1 head infl polarity&gt; = positive
	&lt;Aux head infl polarity&gt; = negative
	&lt;I' head subject head agr&gt; = &lt;Aux_1 head subject head agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux_1 head infl tense&gt; =  &lt;VP head infl tense&gt;
		}
		&lt;VP head type comma&gt; = -
		&lt;Aux head type comma&gt; = -
		&lt;I' head type comma&gt; &lt;= &lt;Aux_1 head type comma&gt;
		&lt;I' head type suffix&gt; &lt;= &lt;Aux_1 head type suffix&gt;
		&lt;VP head infl polarity&gt; &lt;= &lt;Aux head infl polarity&gt; | polarity from Aux
	&lt;I' option&gt; = 3NegPlusAux
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='OSV' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='OSV' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAux)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//neg/@auxVerbRequired)='yes' and normalize-space(//ip/@negAuxAffix)='yes' and normalize-space(//ip/@negAuxRequiresAux)='yes' and normalize-space(//typology/@wordOrder)='OVS'">
<xsl:text>
rule {IBar option 3NegPlusAuxVerbRequired - negative Aux then Aux_1 positive, final}
I' = VP Aux Aux_1
	&lt;I' head&gt; = &lt;VP head&gt;
	&lt;I' head type auxiliary&gt; = +
	&lt;Aux_1 head infl polarity&gt; = positive
	&lt;Aux head infl polarity&gt; = negative
	&lt;VP head infl polarity&gt; = negative     | neg Aux requires neg verb
	&lt;I' head subject head agr&gt; = &lt;Aux_1 head subject head agr&gt;
	{&lt;VP head infl finite&gt; = -
	/&lt;VP head infl finite&gt; = +
	 &lt;Aux_1 head infl tense&gt; =  &lt;VP head infl tense&gt;
		}
		&lt;VP head type comma&gt; = -
		&lt;Aux head type comma&gt; = -
		&lt;I' head type comma&gt; &lt;= &lt;Aux_1 head type comma&gt;
		&lt;I' head type suffix&gt; &lt;= &lt;Aux_1 head type suffix&gt;
	&lt;I' option&gt; = 3NegPlusAuxVerbRequired
</xsl:text>
</xsl:if>

















































</xsl:template>
</xsl:stylesheet>
