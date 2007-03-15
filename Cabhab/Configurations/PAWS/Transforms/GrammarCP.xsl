<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="cp">

<xsl:text>
rule {CP option conj - conjoined CPs}
CP = (InitConj) CP_1 Conj CP_2
	&lt;CP head&gt; = &lt;CP_1 head&gt;
	&lt;Conj head type conjoins_IP&gt; = +
	&lt;CP conjoined&gt; = +
	&lt;CP_1 conjoined&gt; = -	|limit recursion
	&lt;CP option&gt; = conj
</xsl:text>
	<xsl:if test="//q/@mainYN!='no' or //q/@mainCont!='no'">
<xsl:text>
rule {CP option 1 - no fronting, root}
CP = C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root &gt; = +
	&lt;C' head type vacuous&gt; = -
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = none
	&lt;CP option&gt; = 1
</xsl:text>
</xsl:if>





	<xsl:if test="//q/@contFront='before' and //q/@mainContVSOBeforeWh!='yes'">
<xsl:text>
rule {CP option 2a - DP specifier initial, wh, root}
CP = DP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;CP option&gt; = 2a
</xsl:text>
</xsl:if>





	<xsl:if test="//q/@contFront='before' and //q/@mainContVSOBeforeWh!='yes'">
<xsl:text>
rule {CP option 2b - PP specifier initial, wh, root}
CP = PP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;PP&gt;
	&lt;PP head type wh&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;CP option&gt; = 2b
</xsl:text>
</xsl:if>





	<xsl:if test="//q/@contFront='before' and //q/@mainContVSOBeforeWh!='yes'">
<xsl:text>
rule {CP option 2c - AdvP specifier initial, wh, root}
CP = AdvP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;AdvP&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;CP option&gt; = 2c
</xsl:text>
</xsl:if>





	<xsl:if test="//q/@contFront='before' and //q/@mainContVSOBeforeWh='yes' or //q/@contFront='before' and //q/@mainContVSOBeforeWh='some'">
<xsl:text>
rule {CP option 2d - C, DP specifier initial, wh, root}
CP = C DP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;CP option&gt; = 2d
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@contFront='before' and //q/@mainContVSOBeforeWh='yes' or //q/@contFront='before' and //q/@mainContVSOBeforeWh='some'">
<xsl:text>
rule {CP option 2e - C, PP specifier initial, wh, root}
CP = C PP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;PP&gt;
	&lt;PP head type wh&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;CP option&gt; = 2e
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@contFront='before' and //q/@mainContVSOBeforeWh='yes' or //q/@contFront='before' and //q/@mainContVSOBeforeWh='some'">
<xsl:text>
rule {CP option 2f - C, AdvP specifier initial, wh, root}
CP = C AdvP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;AdvP&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;CP option&gt; = 2f
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@mainYN!='no' or //q/@mainCont!='no' or //comp/@comp!='no' or //relcl/@type='CP' and //relcl/@compCP!='no' or //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='yes'">
<xsl:text>
rule {CP option 3 - no fronting, non-root}
CP = C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root &gt; = -
	&lt;C' head type vacuous&gt; = -		| to avoid empty CP
	&lt;C' head fronted&gt; = none
	&lt;CP option&gt; = 3
</xsl:text>
</xsl:if>

















	<xsl:if test="//q/@contFront='before' and //q/@mainContVSOBeforeWh!='yes'">
<xsl:text>
rule {CP option 4a - DP specifier initial, wh, non-root}
CP = DP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;CP option&gt; = 4a
</xsl:text>
</xsl:if>





	<xsl:if test="//relcl/@type='CP' and //relcl/@compCP!='yes'">
<xsl:text>
rule {CP option 4arel - DP specifier initial, wh, relative clause}
CP = DP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type relative&gt; = +
	&lt;C' head type wh&gt; = +
	&lt;C' head fronted&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = +
	&lt;DP head type relative&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;CP option&gt; = 4arel
</xsl:text>
</xsl:if>





	<xsl:if test="//q/@contFront='before' and //q/@mainContVSOBeforeWh!='yes'">
<xsl:text>
rule {CP option 4b - PP specifier initial, wh, non-root}
CP = PP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head fronted&gt; = &lt;PP&gt;
	&lt;C' head type relative&gt; = -
	&lt;PP head type wh&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;CP option&gt; = 4b
</xsl:text>
</xsl:if>





	<xsl:if test="//q/@contFront='before' and //q/@mainContVSOBeforeWh!='yes'">
<xsl:text>
rule {CP option 4c - AdvP specifier initial, wh, non-root}
CP = AdvP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;AdvP&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;CP option&gt; = 4c
</xsl:text>
</xsl:if>





	<xsl:if test="//q/@contFront='before' and //q/@mainContVSOBeforeWh='yes' or //q/@contFront='before' and //q/@mainContVSOBeforeWh='some'">
<xsl:text>
rule {CP option 4d - C, DP specifier initial, wh, non-root}
CP = C DP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;CP option&gt; = 4d
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@contFront='before' and //q/@mainContVSOBeforeWh='yes' or //q/@contFront='before' and //q/@mainContVSOBeforeWh='some'">
<xsl:text>
rule {CP option 4e - C, PP specifier initial, wh, non-root}
CP = C PP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;PP&gt;
	&lt;PP head type wh&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;CP option&gt; = 4e
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@contFront='before' and //q/@mainContVSOBeforeWh='yes' or //q/@contFront='before' and //q/@mainContVSOBeforeWh='some'">
<xsl:text>
rule {CP option 4f - C, AdvP specifier initial, wh, non-root}
CP = C AdvP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;AdvP&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;CP option&gt; = 4f
</xsl:text>
</xsl:if>









	<xsl:if test="//neg/@negFront='yes' or //neg/@negFront='optional'">
<xsl:text>
rule {CP option Neg - DP or AdvP specifier initial, negative, fronted}
CP = {DP / AdvP} IP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;DP&gt;
	&lt;IP head fronted&gt; = &lt;AdvP&gt;
	&lt;DP head type negative&gt; = +
	&lt;AdvP head type negative&gt; = +
	&lt;IP head type negative&gt; &lt;= &lt;DP head type negative&gt;
	&lt;IP head type negative&gt; &lt;= &lt;AdvP head type negative&gt;
	&lt;CP option&gt; = Neg
</xsl:text>
</xsl:if>






	<xsl:if test="//focus/@focus='yes' and //focus/@focusPos='before'">
<xsl:text>
rule {CP option FocusInit - FocusP initial}
CP = FocusP IP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;FocusP&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;FocusP head&gt; == [type:[focusmarked:-]] -&gt; ~[case:nominative]  | subject in place, not focused, unless focusmarked
	&lt;CP option&gt; = FocusInit
</xsl:text>
</xsl:if>





	<xsl:if test="//focus/@focus='yes' and //focus/@focusPos='before' and //ip/@proDrop!='no'">
<xsl:text>
rule {CP option FocusInitPro - FocusP initial, with pro-drop}
CP = FocusP IP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;FocusP&gt;
	&lt;IP head type pro-drop&gt; = +
	&lt;FocusP head&gt; == ~[case:nominative]  | subject pro-dropped, not focused
	&lt;CP head&gt; == [fronted:[head:[agr:[person:first]]]] -&gt; ~[subject:[head:[agr:[person:first]]]]
	&lt;CP head&gt; == [fronted:[head:[agr:[person:second]]]] -&gt; ~[subject:[head:[agr:[person:second]]]]
	&lt;CP option&gt; = FocusInitPro
</xsl:text>
</xsl:if>







	<xsl:if test="//focus/@focus='yes' and //focus/@focusPos='after'">
<xsl:text>
rule {CP option FocusFin - FocusP final}
CP = IP FocusP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;FocusP&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;FocusP head&gt; == [type:[focusmarked:-]] -&gt; ~[case:nominative]  | subject in place, not focused, unless focusmarked
	&lt;CP option&gt; = FocusFin
</xsl:text>
</xsl:if>





	<xsl:if test="//focus/@focus='yes' and //focus/@focusPos='after' and //ip/@proDrop!='no'">
<xsl:text>
rule {CP option FocusFinPro - FocusP final, with pro-drop}
CP =  IP FocusP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;FocusP&gt;
	&lt;IP head type pro-drop&gt; = +
	&lt;FocusP head&gt; == ~[case:nominative]  | subject pro-dropped, not focused
	&lt;CP head&gt; == [fronted:[head:[agr:[person:first]]]] -&gt; ~[subject:[head:[agr:[person:first]]]]
	&lt;CP head&gt; == [fronted:[head:[agr:[person:second]]]] -&gt; ~[subject:[head:[agr:[person:second]]]]
	&lt;CP option&gt; = FocusFinPro
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@contFront='before' and //q/@mainCont='no' and //q/@mainContRequired='no'">
<xsl:text>
rule {CBar option 1a - head vacuous, root, no aux fronting}
C' = IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head type vacuous&gt; = +		| to avoid empty CP
	&lt;C' option&gt; = 1a
</xsl:text>
</xsl:if>







	<xsl:if test="//q/@contFront='before' and //q/@mainCont='noAux' and //q/@mainContAuxRequired='no'">
<xsl:text>
rule {CBar option 1b - head vacuous, root, with possible aux fronting}
C' = IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head type vacuous&gt; = +		| to avoid empty CP
	&lt;IP head type auxiliary&gt; = -		| if aux present, must front
	&lt;C' option&gt; = 1b
</xsl:text>
</xsl:if>







	<xsl:if test="//q/@mainCont='yes' and //q/@mainContWord='yes' and //q/@mainContPos='before' and //typology/@wordOrder!='VSO' or //q/@mainCont='yes' and //q/@mainContWord='yes' and //q/@mainContPos='either' and //typology/@wordOrder!='VSO' or //q/@mainCont='yes' and //q/@mainContWord='yes' and //q/@mainContPos='eitherOrBoth' and //typology/@wordOrder!='VSO' or //q/@mainCont='yes' and //q/@mainContWord='yes' and //q/@mainContPos='beforeOrBoth' and //typology/@wordOrder!='VSO' or //q/@mainCont='yes' and //q/@mainContWord='yes' and //typology/@wordOrder='VSO' and //q/@mainContVSOBeforeWh!='yes' or //q/@mainYN='yes' and //q/@mainYNWord='yes' and //q/@mainYNPos='before' or //q/@mainYN='yes' and //q/@mainYNWord='yes' and //q/@mainYNPos='either' or //q/@mainYN='yes' and //q/@mainYNWord='yes' and //q/@mainYNPos='eitherOrBoth' or //q/@mainYN='yes' and //q/@mainYNWord='yes' and //q/@mainYNPos='beforeOrBoth'">
<xsl:text>
rule {CBar option 1c - head-initial, question, root}
C' = C IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C head type CP-initial&gt; = +
	&lt;C' option&gt; = 1c
</xsl:text>
</xsl:if>

































































	<xsl:if test="//q/@mainCont='noAux' and //q/@mainContAuxPos='before' or //q/@mainYN='noAux' and //q/@mainYNAuxPos='before'">
<xsl:text>
rule {CBar option 1d - Aux initial, question, root}
C' = Aux IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' option&gt; = 1d
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@mainCont='yes' and //q/@mainContWord='yes' and //q/@mainContPos='after' and //typology/@wordOrder!='VSO' or //q/@mainCont='yes' and //q/@mainContWord='yes' and //q/@mainContPos='either' and //typology/@wordOrder!='VSO' or //q/@mainCont='yes' and //q/@mainContWord='yes' and //q/@mainContPos='eitherOrBoth' and //typology/@wordOrder!='VSO' or //q/@mainCont='yes' and //q/@mainContWord='yes' and //q/@mainContPos='afterOrBoth' and //typology/@wordOrder!='VSO' or //q/@mainCont='yes' and //q/@mainContWord='yes' and //typology/@wordOrder='VSO' and //q/@mainContVSOBeforeWh='noEnd' or //q/@mainYN='yes' and //q/@mainYNWord='yes' and //q/@mainYNPos='after' or //q/@mainYN='yes' and //q/@mainYNWord='yes' and //q/@mainYNPos='either' or //q/@mainYN='yes' and //q/@mainYNWord='yes' and //q/@mainYNPos='eitherOrBoth' or //q/@mainYN='yes' and //q/@mainYNWord='yes' and //q/@mainYNPos='afterOrBoth'">
<xsl:text>
rule {CBar option 1e - head-final, question, root}
C' = IP C
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-final&gt; = +
	&lt;C' option&gt; = 1e
</xsl:text>
</xsl:if>

































































	<xsl:if test="//q/@mainYN='noAux' and //q/@mainYNAuxPos='after' or //q/@mainCont='noAux' and //q/@mainContAuxPos='after'">
<xsl:text>
rule {CBar option 1f - Aux final, question, root}
C' = IP Aux
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' option&gt; = 1f
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@mainCont='yes' and //q/@mainContWord='yes' and //q/@mainContPos='both' and //typology/@wordOrder!='VSO' or //q/@mainCont='yes' and //q/@mainContWord='yes' and //q/@mainContPos='beforeOrBoth' and //typology/@wordOrder!='VSO' or //q/@mainCont='yes' and //q/@mainContWord='yes' and //q/@mainContPos='eitherOrBoth' and //typology/@wordOrder!='VSO' or //q/@mainCont='yes' and //q/@mainContWord='yes' and //q/@mainContPos='afterOrBoth' and //typology/@wordOrder!='VSO' or //q/@mainYN='yes' and //q/@mainYNWord='yes' and //q/@mainYNPos='both' or //q/@mainYN='yes' and //q/@mainYNWord='yes' and //q/@mainYNPos='beforeOrBoth' or //q/@mainYN='yes' and //q/@mainYNWord='yes' and //q/@mainYNPos='eitherOrBoth' or //q/@mainYN='yes' and //q/@mainYNWord='yes' and //q/@mainYNPos='afterOrBoth'">
<xsl:text>
rule {CBar option 1g - head both sides, question, root}
C' = C IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
	&lt;C' option&gt; = 1g
</xsl:text>
</xsl:if>

























































	<xsl:if test="//q/@contFront='before' and //q/@embCont='no' and //q/@embContRequired='no' or //relcl/@type='CP' and //relcl/@compCP!='yes' and //relcl/@whAndComp!='yes'">
<xsl:text>
rule {CBar option 2a - head vacuous, non-root, no aux fronting}
C' = IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type vacuous&gt; = +		| to avoid empty CP
	&lt;C' option&gt; = 2a
</xsl:text>
</xsl:if>













	<xsl:if test="//q/@contFront='before' and //q/@embCont='noAux' and //q/@embContAuxRequired='no'">
<xsl:text>
rule {CBar option 2b - head vacuous, non-root, with possible aux fronting}
C' = IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type relative&gt; = -
	&lt;C' head type vacuous&gt; = +		| to avoid empty CP
	&lt;IP head type auxiliary&gt; = -		| if aux present, must front
	&lt;C' option&gt; = 2b
</xsl:text>
</xsl:if>







	<xsl:if test="//q/@embCont='yes' and //q/@embContWord='yes' and //q/@embContPos='before' and //typology/@wordOrder!='VSO' or //q/@embCont='yes' and //q/@embContWord='yes' and //q/@embContPos='either' and //typology/@wordOrder!='VSO' or //q/@embCont='yes' and //q/@embContWord='yes' and //q/@embContPos='eitherOrBoth' and //typology/@wordOrder!='VSO' or //q/@embCont='yes' and //q/@embContWord='yes' and //q/@embContPos='beforeOrBoth' and //typology/@wordOrder!='VSO' or //q/@embCont='yes' and //q/@embContWord='yes' and //typology/@wordOrder='VSO' and //q/@embContVSOBeforeWh!='yes' or //q/@embYN='yes' and //q/@embYNWord='yes' and //q/@embYNPos='before' or //q/@embYN='yes' and //q/@embYNWord='yes' and //q/@embYNPos='either' or //q/@embYN='yes' and //q/@embYNWord='yes' and //q/@embYNPos='eitherOrBoth' or //q/@embYN='yes' and //q/@embYNWord='yes' and //q/@embYNPos='beforeOrBoth'">
<xsl:text>
rule {CBar option 2c - head-initial, question, non-root}
C' = C IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C' option&gt; = 2c
</xsl:text>
</xsl:if>

































































	<xsl:if test="//q/@embCont='noAux' and //q/@embContAuxPos='before' or //q/@embYN='noAux' and //q/@embYNAuxPos='before'">
<xsl:text>
rule {CBar option 2d - Aux initial, question, non-root}
C' = Aux IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' option&gt; = 2d
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@embCont='yes' and //q/@embContWord='yes' and //q/@embContPos='after' and //typology/@wordOrder!='VSO' or //q/@embCont='yes' and //q/@embContWord='yes' and //q/@embContPos='either' and //typology/@wordOrder!='VSO' or //q/@embCont='yes' and //q/@embContWord='yes' and //q/@embContPos='eitherOrBoth' and //typology/@wordOrder!='VSO' or //q/@embCont='yes' and //q/@embContWord='yes' and //q/@embContPos='afterOrBoth' and //typology/@wordOrder!='VSO' or //q/@embCont='yes' and //q/@embContWord='yes' and //typology/@wordOrder='VSO' and //q/@embContVSOBeforeWh='noEnd' or //q/@embYN='yes' and //q/@embYNWord='yes' and //q/@embYNPos='after' or //q/@embYN='yes' and //q/@embYNWord='yes' and //q/@embYNPos='either' or //q/@embYN='yes' and //q/@embYNWord='yes' and //q/@embYNPos='eitherOrBoth' or //q/@embYN='yes' and //q/@embYNWord='yes' and //q/@embYNPos='afterOrBoth'">
<xsl:text>
rule {CBar option 2e - head-final, question, non-root}
C' = IP C
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-final&gt; = +
	&lt;C' option&gt; = 2e
</xsl:text>
</xsl:if>

































































	<xsl:if test="//q/@embCont='noAux' and //q/@embContAuxPos='after' or //q/@embYN='noAux' and //q/@embYNAuxPos='after'">
<xsl:text>
rule {CBar option 2f - Aux final, question, non-root}
C' = IP Aux
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' option&gt; = 2f
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@embCont='yes' and //q/@embContWord='yes' and //q/@embContPos='both' and //typology/@wordOrder!='VSO' or //q/@embCont='yes' and //q/@embContWord='yes' and //q/@embContPos='beforeOrBoth' and //typology/@wordOrder!='VSO' or //q/@embCont='yes' and //q/@embContWord='yes' and //q/@embContPos='eitherOrBoth' and //typology/@wordOrder!='VSO' or //q/@embCont='yes' and //q/@embContWord='yes' and //q/@embContPos='afterOrBoth' and //typology/@wordOrder!='VSO' or //q/@embYN='yes' and //q/@embYNWord='yes' and //q/@embYNPos='both' or //q/@embYN='yes' and //q/@embYNWord='yes' and //q/@embYNPos='beforeOrBoth' or //q/@embYN='yes' and //q/@embYNWord='yes' and //q/@embYNPos='eitherOrBoth' or //q/@embYN='yes' and //q/@embYNWord='yes' and //q/@embYNPos='afterOrBoth'">
<xsl:text>
rule {CBar option 2g - head both sides, question, non-root}
C' = C IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
	&lt;C' option&gt; = 2g
</xsl:text>
</xsl:if>

























































	<xsl:if test="//comp/@comp='yes' and //comp/@compWord='yes' and //comp/@compPos='before' or //comp/@comp='yes' and //comp/@compWord='yes' and //comp/@compPos='beforeOrBoth' or //comp/@comp='yes' and //comp/@compWord='yes' and //comp/@compPos='either' or //comp/@comp='yes' and //comp/@compWord='yes' and //comp/@compPos='eitherOrBoth'">
<xsl:text>
rule {CBar option 2j - head-initial, non-question, non-root}
C' = C IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C' option&gt; = 2j
</xsl:text>
</xsl:if>

























	<xsl:if test="//comp/@comp='yes' and //comp/@compWord='yes' and //comp/@compPos='after' or //comp/@comp='yes' and //comp/@compWord='yes' and //comp/@compPos='afterOrBoth' or //comp/@comp='yes' and //comp/@compWord='yes' and //comp/@compPos='either' or //comp/@comp='yes' and //comp/@compWord='yes' and //comp/@compPos='eitherOrBoth'">
<xsl:text>
rule {CBar option 2k - head-final, non-question, non-root}
C' = IP C
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-final&gt; = +
	&lt;C' option&gt; = 2k
</xsl:text>
</xsl:if>

























	<xsl:if test="//comp/@comp='yes' and //comp/@compWord='yes' and //comp/@compPos='both' or //comp/@comp='yes' and //comp/@compWord='yes' and //comp/@compPos='beforeOrBoth' or //comp/@comp='yes' and //comp/@compWord='yes' and //comp/@compPos='afterOrBoth' or //comp/@comp='yes' and //comp/@compWord='yes' and //comp/@compPos='eitherOrBoth'">
<xsl:text>
rule {CBar option 2l - head both sides, non-question, non-root}
C' = C IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C head type relative&gt; = &lt;C_1 head type relative&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
	&lt;C' option&gt; = 2l
</xsl:text>
</xsl:if>

























	<xsl:if test="//q/@mainYNWord='no' and //q/@mainYNCliticPos='before' or //q/@mainYNWord='no' and //q/@mainYNCliticPos='both'">
<xsl:text>
rule {C' option 3a - YNQ_prefix, IP complement, root}
C' = IP
		&lt;C' head&gt; = &lt;IP head&gt;
		{&lt;IP head type prefix YNQ&gt; = +
		 /&lt;IP head type YNQ&gt; = +
	}
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head type root&gt; = +
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@mainYNWord='no' and //q/@mainYNCliticPos='after' or //q/@mainYNWord='no' and //q/@mainYNCliticPos='both'">
<xsl:text>
rule {CBar option 3b - YNQ_suffix, IP complement, root}
C' = IP
		&lt;C' head&gt; = &lt;IP head&gt;
		{&lt;IP head type suffix YNQ&gt; = +
	   /&lt;IP head type YNQ&gt; = +
	}
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head type root&gt; = +
	&lt;CBar option&gt; = 3b
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@embYNWord='no' and //q/@embYNCliticPos='before' or //q/@embYNWord='no' and //q/@embYNCliticPos='both'">
<xsl:text>
rule {CBar option 3c - YNQ_prefix, IP complement, non-root}
C' = IP
		&lt;C' head&gt; = &lt;IP head&gt;
		{&lt;IP head type prefix YNQ&gt; = +
		 /&lt;IP head type YNQ&gt; = +
	}
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head type root&gt; = -
	&lt;CBar option&gt; = 3c
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@embYNWord='no' and //q/@embYNCliticPos='after' or //q/@embYNWord='no' and //q/@embYNCliticPos='both'">
<xsl:text>
rule {CBar option 3d - YNQ_suffix, IP complement, non-root}
C' = IP
		&lt;C' head&gt; = &lt;IP head&gt;
		{&lt;IP head type suffix YNQ&gt; = +
	   /&lt;IP head type YNQ&gt; = +
	}
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head type root&gt; = +
	&lt;CBar option&gt; = 3d
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@mainContWord='no' and //q/@mainContCliticPos='before' or //q/@mainContWord='no' and //q/@mainContCliticPos='both'">
<xsl:text>
rule {CBar option 4a - whQ_prefix, IP complement, root}
C' = IP
		&lt;C' head&gt; = &lt;IP head&gt;
		{&lt;IP head type prefix whQ&gt; = +
		 /&lt;IP head type whQ&gt; = +
	}
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head type root&gt; = +
	&lt;CBar option&gt; = 4a
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@mainContWord='no' and //q/@mainContCliticPos='after' or //q/@mainContWord='no' and //q/@mainContCliticPos='both'">
<xsl:text>
rule {CBar option 4b - whQ_suffix, IP complement, root}
C' = IP
		&lt;C' head&gt; = &lt;IP head&gt;
		{&lt;IP head type suffix whQ&gt; = +
	   /&lt;IP head type whQ&gt; = +
	}
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head type root&gt; = +
	&lt;CBar option&gt; = 4b
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@embContWord='no' and //q/@embContCliticPos='before' or //q/@embContWord='no' and //q/@embContCliticPos='both'">
<xsl:text>
rule {CBar option 4c - whQ_prefix, IP complement, non-root}
C' = IP
		&lt;C' head&gt; = &lt;IP head&gt;
		{&lt;IP head type prefix whQ&gt; = +
		 /&lt;IP head type whQ&gt; = +
	}
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head type root&gt; = -
	&lt;CBar option&gt; = 4c
</xsl:text>
</xsl:if>









	<xsl:if test="//q/@embContWord='no' and //q/@embContCliticPos='after' or //q/@embContWord='no' and //q/@embContCliticPos='both'">
<xsl:text>
rule {CBar option 4d - whQ_suffix, IP complement, non-root}
C' = IP
		&lt;C' head&gt; = &lt;IP head&gt;
		{&lt;IP head type suffix whQ&gt; = +
	   /&lt;IP head type whQ&gt; = +
	}
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head type root&gt; = +
	&lt;CBar option&gt; = 4d
</xsl:text>
</xsl:if>









	<xsl:if test="//comp/@comp='yes' and //comp/@compWord='no' and //comp/@compCliticPos='before' or //comp/@comp='yes' and //comp/@compWord='no' and //comp/@compCliticPos='both'">
<xsl:text>
rule {CBar option 4e - comp_prefix, IP complement, non-root}
C' = IP
		&lt;C' head&gt; = &lt;IP head&gt;
		{&lt;IP head type prefix comp&gt; = +
		 /&lt;IP head type comp&gt; = +
	}
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = -
	&lt;C' head type root&gt; = -
	&lt;CBar option&gt; = 4e
</xsl:text>
</xsl:if>













	<xsl:if test="//comp/@comp='yes' and //comp/@compWord='no' and //comp/@compCliticPos='after' or //comp/@comp='yes' and //comp/@compWord='no' and //comp/@compCliticPos='both'">
<xsl:text>
rule {CBar option 4f - comp_suffix, IP complement, non-root}
C' = IP
		&lt;C' head&gt; = &lt;IP head&gt;
		{&lt;IP head type suffix comp&gt; = +
	   /&lt;IP head type comp&gt; = +
	}
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = -
	&lt;C' head type root&gt; = +
	&lt;CBar option&gt; = 4f
</xsl:text>
</xsl:if>














	<xsl:if test="//relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='before' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='beforeOrBoth' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='either' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='eitherOrBoth' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='before' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='beforeOrBoth' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='either' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='eitherOrBoth'">
<xsl:text>
rule {CBar option 5a - head-initial, relative clause}
C' = C IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = +
	&lt;C head type CP-initial&gt; = +
	&lt;C' option&gt; = 5a
</xsl:text>
</xsl:if>

























































































	<xsl:if test="//relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='after' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='afterOrBoth' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='either' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='eitherOrBoth' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='after' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='afterOrBoth' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='either' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='eitherOrBoth'">
<xsl:text>
rule {CBar option 5b - head-final, relative clause}
C' = IP C
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = +
	&lt;C head type CP-final&gt; = +
	&lt;C' option&gt; = 5b
</xsl:text>
</xsl:if>

























































































	<xsl:if test="//relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='both' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='afterOrBoth' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='beforeOrBoth' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='eitherOrBoth' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='both' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='afterOrBoth' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='beforeOrBoth' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='yes' and //relcl/@relCompPos='eitherOrBoth'">
<xsl:text>
rule {CBar option 5c - head both sides, relative clause}
C' = C IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type&gt; = &lt;C head type&gt;
	&lt;C head type question&gt; = &lt;C_1 head type question&gt;
	&lt;C head type relative&gt; = &lt;C_1 head type relative&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = +
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
	&lt;C' option&gt; = 5c
</xsl:text>
</xsl:if>

























































































	<xsl:if test="//relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='no' and //relcl/@relCliticPos='before' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='no' and //relcl/@relCliticPos='both' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='no' and //relcl/@relCliticPos='before' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='no' and //relcl/@relCliticPos='both'">
<xsl:text>
rule {CBar option 5d - relative_prefix, IP complement}
C' = IP
		&lt;C' head&gt; = &lt;IP head&gt;
	&lt;IP head type prefix relative&gt; = +
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = +
	&lt;C' head type root&gt; = -
	&lt;CBar option&gt; = 5d
</xsl:text>
</xsl:if>













































	<xsl:if test="//relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='no' and //relcl/@relCliticPos='after' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP!='no' and //relcl/@relWord='no' and //relcl/@relCliticPos='both' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='no' and //relcl/@relCliticPos='after' or //relcl/@exist='yes' and //relcl/@type='CP' and //relcl/@compCP='no' and //relcl/@whAndComp!='no' and //relcl/@relWord='no' and //relcl/@relCliticPos='both'">
<xsl:text>
rule {CBar option 5e - relative_suffix, IP complement}
C' = IP
		&lt;C' head&gt; = &lt;IP head&gt;
	&lt;IP head type suffix relative&gt; = +
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = +
	&lt;C' head type root&gt; = +
	&lt;CBar option&gt; = 5e
</xsl:text>
</xsl:if>














































<xsl:if test="//focus/@topic='yes' and //focus/@topicMarker!='yesWord' or //focus/@topic='yes' and //focus/@topicMarker='yesWord' and //focus/@topicMarkerRequired='no'">
<xsl:text>
rule {TopicP option nomarker}
TopicP = DP
		&lt;TopicP head&gt; = &lt;DP head&gt;
	&lt;DP head type topic&gt; = +
	&lt;DP head type focus&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type negative&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;TopicP option&gt; = nomarker
</xsl:text>
</xsl:if>











<xsl:if test="//focus/@topic='yes' and //focus/@topicMarker='yesWord' and //focus/@topicMarkerPos='before' or //focus/@topic='yes' and //focus/@topicMarker='yesWord' and //focus/@topicMarkerPos='either'">
<xsl:text>
rule {TopicP option markerinit}
TopicP = TopicM DP
		&lt;TopicP head&gt; = &lt;DP head&gt;
	&lt;TopicM head type topic-initial&gt; = +
	&lt;DP head type topic&gt; = +
	&lt;DP head type focus&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type negative&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;TopicP option&gt; = markerinit
</xsl:text>
</xsl:if>













<xsl:if test="//focus/@topic='yes' and //focus/@topicMarker='yesWord' and //focus/@topicMarkerPos='after' or //focus/@topic='yes' and //focus/@topicMarker='yesWord' and //focus/@topicMarkerPos='either'">
<xsl:text>
rule {TopicP option markerfin}
TopicP = DP TopicM
		&lt;TopicP head&gt; = &lt;DP head&gt;
	&lt;TopicM head type topic-final&gt; = +
	&lt;DP head type topic&gt; = +
	&lt;DP head type focus&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type negative&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;TopicP option&gt; = markerfin
</xsl:text>
</xsl:if>













<xsl:if test="//focus/@topic='yes' and //focus/@topicMarker='yesWord' and //focus/@topicMarkerPos='both'">
<xsl:text>
rule {TopicP option markerboth}
TopicP = TopicM_1 DP TopicM_2
		&lt;TopicP head&gt; = &lt;DP head&gt;
	&lt;TopicM_1 head type topic-initial&gt; = +
	&lt;TopicM_2 head type topic-final&gt; = +
	&lt;DP head type topic&gt; = +
	&lt;DP head type focus&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type negative&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;TopicP option&gt; = markerboth
</xsl:text>
</xsl:if>








<xsl:if test="//focus/@focus='yes' and //focus/@focusMarker!='yesWord' or //focus/@focus='yes' and //focus/@focusMarker='yesWord' and //focus/@focusMarkerRequired='no'">
<xsl:text>
rule {FocusP option nomarker}
FocusP = DP
		&lt;FocusP head&gt; = &lt;DP head&gt;
	&lt;DP head type focus&gt; = +
	&lt;DP head type topic&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type negative&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;FocusP option&gt; = nomarker
</xsl:text>
</xsl:if>











<xsl:if test="//focus/@focus='yes' and //focus/@focusMarker='yesWord' and //focus/@focusMarkerPos='before' or //focus/@focus='yes' and //focus/@focusMarker='yesWord' and //focus/@focusMarkerPos='either'">
<xsl:text>
rule {FocusP option markerinit}
FocusP = FocusM DP
		&lt;FocusP head&gt; = &lt;DP head&gt;
	&lt;FocusM head type focus-initial&gt; = +
	&lt;DP head type focus&gt; = +
	&lt;DP head type topic&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type negative&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;FocusP head type focusmarked&gt; &lt;= +
	&lt;FocusP option&gt; = markerinit
</xsl:text>
</xsl:if>













<xsl:if test="//focus/@focus='yes' and //focus/@focusMarker='yesWord' and //focus/@focusMarkerPos='after' or //focus/@focus='yes' and //focus/@focusMarker='yesWord' and //focus/@focusMarkerPos='either'">
<xsl:text>
rule {FocusP option markerfin}
FocusP = DP FocusM
		&lt;FocusP head&gt; = &lt;DP head&gt;
	&lt;FocusM head type focus-final&gt; = +
	&lt;DP head type focus&gt; = +
	&lt;DP head type topic&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type negative&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;FocusP head type focusmarked&gt; &lt;= +
	&lt;FocusP option&gt; = markerfin
</xsl:text>
</xsl:if>













<xsl:if test="//focus/@focus='yes' and //focus/@focusMarker='yesWord' and //focus/@focusMarkerPos='both'">
<xsl:text>
rule {FocusP option markerboth}
FocusP = FocusM_1 DP FocusM_2
		&lt;FocusP head&gt; = &lt;DP head&gt;
	&lt;FocusM_1 head type focus-initial&gt; = +
	&lt;FocusM_2 head type focus-final&gt; = +
	&lt;DP head type focus&gt; = +
	&lt;DP head type topic&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type negative&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;FocusP head type focusmarked&gt; &lt;= +
	&lt;FocusP option&gt; = markerboth
</xsl:text>
</xsl:if>








</xsl:template>
</xsl:stylesheet>
