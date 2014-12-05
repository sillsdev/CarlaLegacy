<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="cp">
    
<xsl:if test="normalize-space(//coord/@conjWord)!='no'">
<xsl:text>
rule {CP option conj - conjoined CPs}
CP = (InitConj) CP_1 Conj CP_2
	&lt;CP head&gt; = &lt;CP_2 head&gt;
	&lt;Conj head type conjoins_IP&gt; = +
	&lt;CP conjoined&gt; = +
	&lt;CP_1 conjoined&gt; = -	|limit recursion
	&lt;CP head type prefix&gt; &lt;= &lt;CP_1 head type prefix&gt;
	&lt;CP option&gt; = conj
</xsl:text>
</xsl:if>
   
      
   
   <xsl:if test="normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/proclitic/@checked)='yes'">
<xsl:text>
      rule {CP option conjPrefix - conjoined CPs}
      CP = CP_1  CP_2
      &lt;CP head&gt; = &lt;CP_2 head&gt;
      &lt;CP conjoined&gt; = +
      &lt;CP_1 conjoined&gt; = -	|limit recursion
      &lt;CP_2 head type prefix conj&gt; = +
      &lt;CP head type prefix&gt; &lt;= &lt;CP_1 head type prefix&gt;
      &lt;CP option&gt; = conjPrefix
   </xsl:text>
</xsl:if>
   
      
      
      
   
   <xsl:if test="normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/enclitic/@checked)='yes'">
<xsl:text>
      rule {CP option conjSuffix - conjoined CPs}
      CP = CP_1  CP_2
      &lt;CP head&gt; = &lt;CP_2 head&gt;
      &lt;CP conjoined&gt; = +
      &lt;CP_1 conjoined&gt; = -	|limit recursion
      &lt;CP_1 head type suffix conj&gt; = +
      &lt;CP head type prefix&gt; &lt;= &lt;CP_1 head type prefix&gt;
      &lt;CP option&gt; = conjSuffix
   </xsl:text>
</xsl:if>
   
      
      
      
   
   <xsl:if test="normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/attachesOther/@checked)='yes' or normalize-space(//coord/@noConj)='yes'">
<xsl:text>
      rule {CP option conjNone - conjoined CPs}
      CP = CP_1  CP_2
      &lt;CP head&gt; = &lt;CP_2 head&gt;
      &lt;CP conjoined&gt; = +
      &lt;CP_1 conjoined&gt; = -	|limit recursion
      &lt;CP_2 head type prefix conj&gt; = -
      &lt;CP_1 head type suffix conj&gt; = -
      &lt;CP_1 head type comma&gt; = -
      &lt;CP head type prefix&gt; &lt;= &lt;CP_1 head type prefix&gt;
      &lt;CP option&gt; = conjNone
   </xsl:text>
</xsl:if>
   
      
       
       
       
       
   
   
    <xsl:if test="normalize-space(//q/@mainYN)!='no' and normalize-space(//q/@mainYNWord)!='no' or normalize-space(//q/@mainCont)!='no' and normalize-space(//q/@mainContWord)!='no'">
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
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/mainContVSOBeforeWh/@checked)='no'">
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
	&lt;DP head type comma&gt; = -
	&lt;CP option&gt; = 2a
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/mainContVSOBeforeWh/@checked)='no'">
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
	&lt;PP head type comma&gt; = -
	&lt;CP option&gt; = 2b
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/mainContVSOBeforeWh/@checked)='no'">
<xsl:text>
rule {CP option 2c - AdvP specifier initial, wh, root}
CP = AdvP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;AdvP&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;AdvP head type comma&gt; = -
	&lt;CP option&gt; = 2c
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/mainContVSOBeforeWh/@checked)='yes'">
<xsl:text>
rule {CP option 2d - C, DP specifier initial, wh, root}
CP = C DP IP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = + 
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;C head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;CP option&gt; = 2d
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/mainContVSOBeforeWh/@checked)='yes'">
<xsl:text>
rule {CP option 2e - C, PP specifier initial, wh, root}
CP = C PP IP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = + 
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;PP&gt;
	&lt;PP head type wh&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;C head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;CP option&gt; = 2e
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/mainContVSOBeforeWh/@checked)='yes'">
<xsl:text>
rule {CP option 2f - C, AdvP specifier initial, wh, root}
CP = C AdvP IP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type root&gt; = +
	&lt;IP head type question&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = + 
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;AdvP&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;C head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;CP option&gt; = 2f
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//q/@embYN)!='no' and normalize-space(//q/@embYNWord)!='no' or normalize-space(//q/@embCont)!='no' and normalize-space(//q/@embContWord)!='no' or normalize-space(//comp/@comp)='yes' or normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' or normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' or normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@whAndComp)!='no' and normalize-space(//relcl/@relWord)!='no'">
<xsl:text>
rule {CP option 3 - no fronting, non-root}
CP = C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root &gt; = -
	&lt;C' head type vacuous&gt; = -		| to avoid empty CP
	&lt;C' head fronted cat&gt; = none
	&lt;CP option&gt; = 3
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/embContVSOBeforeWh/@checked)='no'">
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
	&lt;DP head type comma&gt; = -
	&lt;CP option&gt; = 4a
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//relcl/relTypeCPWh/@checked)='yes'">
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
	&lt;DP head type comma&gt; = -
	&lt;CP option&gt; = 4arel
</xsl:text>
</xsl:if>
    
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/embContVSOBeforeWh/@checked)='no'">
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
	&lt;PP head type comma&gt; = -
	&lt;CP option&gt; = 4b
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/embContVSOBeforeWh/@checked)='no'">
<xsl:text>
rule {CP option 4c - AdvP specifier initial, wh, non-root}
CP = AdvP C'
	&lt;CP head&gt; = &lt;C' head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;AdvP&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;AdvP head type comma&gt; = -
	&lt;CP option&gt; = 4c
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/embContVSOBeforeWh/@checked)='yes'">
<xsl:text>
rule {CP option 4d - C, DP specifier initial, wh, non-root}
CP = C DP IP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = + 
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;DP&gt;
	&lt;DP head type wh&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;C head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;CP option&gt; = 4d
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/embContVSOBeforeWh/@checked)='yes'">
<xsl:text>
rule {CP option 4e - C, PP specifier initial, wh, non-root}
CP = C PP IP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = + 
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;PP&gt;
	&lt;PP head type wh&gt; = +
	&lt;PP head type suffix poss&gt; = -         | only in possessor position
	&lt;PP head type prefix poss&gt; = -
	&lt;C head type comma&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;CP option&gt; = 4e
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/embContVSOBeforeWh/@checked)='yes'">
<xsl:text>
rule {CP option 4f - C, AdvP specifier initial, wh, non-root}
CP = C AdvP IP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = +
	&lt;C head type question&gt; = +
	&lt;C head type wh&gt; = +
	&lt;C head type CP-specifier-initial&gt; = + 
	&lt;IP head type relative&gt; = -
	&lt;C' head fronted&gt; = &lt;AdvP&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;C head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;CP option&gt; = 4f
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//neg/@negFront)='yes' or normalize-space(//neg/@negFront)='optional'">
<xsl:text>
rule {CP option Neg - DP or AdvP specifier initial, negative, fronted}
CP = {DP / AdvP} IP 
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;DP&gt;
	&lt;IP head fronted&gt; = &lt;AdvP&gt;
	&lt;DP head infl polarity&gt; =  negative
	&lt;AdvP head infl polarity&gt; =  negative
	&lt;IP head infl polarity&gt; &lt;= &lt;DP head infl polarity&gt;
	&lt;IP head infl polarity&gt; &lt;= &lt;AdvP head infl polarity&gt;
	&lt;AdvP head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;CP option&gt; = Neg
</xsl:text>
</xsl:if>
    
        
        
        
    

    <xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusPos)='before'">
<xsl:text>
rule {CP option FocusInit - FocusP initial}
CP = FocusP IP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;FocusP&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;FocusP head type comma&gt; = -
	&lt;FocusP head&gt; == [type:[focusmarked:-]] -&gt; ~[case:nominative]  | subject in place, not focused, unless focusmarked
	&lt;CP option&gt; = FocusInit
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusPos)='before' and normalize-space(//ip/proDrop/@checked)='yes' or normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusPos)='before' and normalize-space(//ip/proDropClitic/@checked)='yes'">
<xsl:text>
rule {CP option FocusInitPro - FocusP initial, with pro-drop}
CP = FocusP IP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;FocusP&gt;
	&lt;IP head type pro-drop&gt; = +
	&lt;FocusP head type comma&gt; = -
	&lt;FocusP head&gt; == ~[case:nominative]  | subject pro-dropped, not focused
	&lt;CP head&gt; == [fronted:[head:[agr:[person:first]]]] -&gt; ~[subject:[head:[agr:[person:first]]]]
	&lt;CP head&gt; == [fronted:[head:[agr:[person:second]]]] -&gt; ~[subject:[head:[agr:[person:second]]]]
	&lt;CP option&gt; = FocusInitPro
</xsl:text>
</xsl:if>
    
        
        
        
	
	
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusPos)='after'">
<xsl:text>
rule {CP option FocusFin - FocusP final}
CP = IP FocusP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;FocusP&gt;
	&lt;IP head type pro-drop&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;CP head type comma&gt; &lt;= &lt;FocusP head type comma&gt;
	&lt;FocusP head&gt; == [type:[focusmarked:-]] -&gt; ~[case:nominative]  | subject in place, not focused, unless focusmarked
	&lt;CP option&gt; = FocusFin
</xsl:text>
</xsl:if>
    
        
        
        
    
    <xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusPos)='after' and normalize-space(//ip/proDrop/@checked)='yes' or normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusPos)='after' and normalize-space(//ip/proDropClitic/@checked)='yes'">
<xsl:text>
rule {CP option FocusFinPro - FocusP final, with pro-drop}
CP =  IP FocusP
	&lt;CP head&gt; = &lt;IP head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head fronted&gt; = &lt;FocusP&gt;
	&lt;IP head type pro-drop&gt; = +
	&lt;IP head type comma&gt; = -
	&lt;CP head type comma&gt; &lt;= &lt;FocusP head type comma&gt;
	&lt;CP head&gt; == [fronted:[head:[agr:[person:first]]]] -&gt; ~[subject:[head:[agr:[person:first]]]]
	&lt;CP head&gt; == [fronted:[head:[agr:[person:second]]]] -&gt; ~[subject:[head:[agr:[person:second]]]]
	&lt;CP option&gt; = FocusFinPro
</xsl:text>
</xsl:if>
    
        
        
        
        
        
    
        
        
        
        
        
    

    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/@mainCont)='no' or normalize-space(//q/@contFront)='before' and normalize-space(//q/@mainCont)!='no' and normalize-space(//q/@mainContRequired)='no'">
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
    
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/@mainCont)='noAux' and normalize-space(//q/@mainContAuxRequired)='no'">
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
    
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@mainCont)='yes' and normalize-space(//q/@mainContWord)!='no' and normalize-space(//q/mainContWordBefore/@checked)='yes' and normalize-space(//typology/@wordOrder)!='VSO' or normalize-space(//q/@mainCont)='yes' and normalize-space(//q/@mainContWord)!='no' and normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/mainContVSOAfterWh/@checked)='yes' or normalize-space(//q/@mainYN)='yes' and normalize-space(//q/@mainYNWord)!='no' and normalize-space(//q/mainYNWordBefore/@checked)='yes'">
<xsl:text>
rule {CBar option 1c - head-initial, question, root}
C' = C IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C head type root&gt; = +
	&lt;C head type relative&gt; = -
	&lt;C head type question&gt; = +
	&lt;C' head type root&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C head type CP-initial&gt; = +
	&lt;C head type comma&gt; = -
	&lt;C' option&gt; = 1c
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@mainCont)='noAux' and normalize-space(//q/@mainContAuxPos)='before' or normalize-space(//q/@mainYN)='noAux' and normalize-space(//q/@mainYNAuxPos)='before'">
<xsl:text>
rule {CBar option 1d - Aux initial, question, root}
C' = Aux IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;Aux head type comma&gt; = -
	&lt;C' option&gt; = 1d
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@mainCont)='yes' and normalize-space(//q/@mainContWord)!='no' and normalize-space(//q/mainContWordAfter/@checked)='yes' and normalize-space(//typology/@wordOrder)!='VSO' or normalize-space(//q/@mainCont)='yes' and normalize-space(//q/@mainContWord)!='no' and normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/mainContVSOEnd/@checked)='yes' or normalize-space(//q/@mainYN)='yes' and normalize-space(//q/@mainYNWord)!='no' and normalize-space(//q/mainYNWordAfter/@checked)='yes'">
<xsl:text>
rule {CBar option 1e - head-final, question, root}
C' = IP C
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C head type root&gt; = +
	&lt;C head type relative&gt; = -
	&lt;C head type question&gt; = +
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-final&gt; = +
	&lt;IP head type comma&gt; = -
	&lt;C' head type comma&gt; &lt;= &lt;C head type comma&gt;
	&lt;C' option&gt; = 1e
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@mainYN)='noAux' and normalize-space(//q/@mainYNAuxPos)='after' or normalize-space(//q/@mainCont)='noAux' and normalize-space(//q/@mainContAuxPos)='after'">
<xsl:text>
rule {CBar option 1f - Aux final, question, root}
C' = IP Aux
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;C' head type comma&gt; &lt;= &lt;Aux head type comma&gt;
	&lt;C' option&gt; = 1f
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@mainCont)='yes' and normalize-space(//q/@mainContWord)!='no' and normalize-space(//q/mainContWordBoth/@checked)='yes' and normalize-space(//typology/@wordOrder)!='VSO' or normalize-space(//q/@mainYN)='yes' and normalize-space(//q/@mainYNWord)!='no' and normalize-space(//q/mainYNwordBoth/@checked)='yes'">
<xsl:text>
rule {CBar option 1g - head both sides, question, root}
C' = C IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C head type root&gt; = +
	&lt;C head type relative&gt; = -
	&lt;C head type question&gt; = +
	&lt;C_1 head type root&gt; = +
	&lt;C_1 head type relative&gt; = -
	&lt;C_1 head type question&gt; = +
	&lt;C' head type root&gt; = +
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
	&lt;C head type comma&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;C' head type comma&gt; &lt;= &lt;C_1 head type comma&gt;
	&lt;C' option&gt; = 1g
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/@embCont)='no' or normalize-space(//q/@contFront)='before' and normalize-space(//q/@embCont)!='no' and normalize-space(//q/@embContRequired)='no' or normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@whAndComp)!='yes'">
<xsl:text>
rule {CBar option 2a - head vacuous, non-root, no aux fronting}
C' = IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type vacuous&gt; = +		| to avoid empty CP
	&lt;C' option&gt; = 2a
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@contFront)='before' and normalize-space(//q/@embCont)='noAux' and normalize-space(//q/@embContAuxRequired)='no'">
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
    
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@embCont)='yes' and normalize-space(//q/@embContWord)!='no' and normalize-space(//q/embContWordBefore/@checked)='yes' and normalize-space(//typology/@wordOrder)!='VSO' or normalize-space(//q/@embCont)='yes' and normalize-space(//q/@embContWord)!='no' and normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/embContVSOAfterWh/@checked)='yes' or normalize-space(//q/@embYN)='yes' and normalize-space(//q/@embYNWord)!='no' and normalize-space(//q/embYNWordBefore/@checked)='yes'">
<xsl:text>
rule {CBar option 2c - head-initial, question, non-root}
C' = C IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C head type root&gt; = -
	&lt;C head type relative&gt; = -
	&lt;C head type question&gt; = +
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C head type comma&gt; = -
	&lt;C' option&gt; = 2c
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@embCont)='noAux' and normalize-space(//q/@embContAuxPos)='before' or normalize-space(//q/@embYN)='noAux' and normalize-space(//q/@embYNAuxPos)='before'">
<xsl:text>
rule {CBar option 2d - Aux initial, question, non-root}
C' = Aux IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;Aux head type comma&gt; = -
	&lt;C' option&gt; = 2d
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@embCont)='yes' and normalize-space(//q/@embContWord)!='no' and normalize-space(//q/embContWordAfter/@checked)='yes' and normalize-space(//typology/@wordOrder)!='VSO' or normalize-space(//q/@embCont)='yes' and normalize-space(//q/@embContWord)!='no' and normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//q/embContVSONoEnd/@checked)='yes' or normalize-space(//q/@embYN)='yes' and normalize-space(//q/@embYNWord)!='no' and normalize-space(//q/embYNAfter/@checked)='yes'">
<xsl:text>
rule {CBar option 2e - head-final, question, non-root}
C' = IP C
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C head type root&gt; = -
	&lt;C head type relative&gt; = -
	&lt;C head type question&gt; = +
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-final&gt; = +
	&lt;IP head type comma&gt; = -
	&lt;C' head type comma&gt; &lt;= &lt;C head type comma&gt;
	&lt;C' option&gt; = 2e
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@embCont)='noAux' and normalize-space(//q/@embContAuxPos)='after' or normalize-space(//q/@embYN)='noAux' and normalize-space(//q/@embYNAuxPos)='after'">
<xsl:text>
rule {CBar option 2f - Aux final, question, non-root}
C' = IP Aux
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;C' head type comma&gt; &lt;= &lt;Aux head type comma&gt;
	&lt;C' option&gt; = 2f
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@embCont)='yes' and normalize-space(//q/@embContWord)!='no' and normalize-space(//q/embContWordBoth/@checked)='yes' and normalize-space(//typology/@wordOrder)!='VSO' or normalize-space(//q/@embYN)='yes' and normalize-space(//q/@embYNWord)!='no' and normalize-space(//q/embYNWordBoth/@checked)='yes'">
<xsl:text>
rule {CBar option 2g - head both sides, question, non-root}
C' = C IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C head type root&gt; = -
	&lt;C head type relative&gt; = -
	&lt;C head type question&gt; = +
	&lt;C_1 head type root&gt; = -
	&lt;C_1 head type relative&gt; = -
	&lt;C_1 head type question&gt; = +
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = +
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
	&lt;C head type comma&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;C' head type comma&gt; &lt;= &lt;C_1 head type comma&gt;
	&lt;C' option&gt; = 2g
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compWord)!='no' and normalize-space(//comp/compBefore/@checked)='yes'">
<xsl:text>
rule {CBar option 2j - head-initial, non-question, non-root}
C' = C IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C head type root&gt; = -
	&lt;C head type relative&gt; = -
	&lt;C head type question&gt; = -
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C head type comma&gt; = -
	&lt;C' option&gt; = 2j
</xsl:text>
</xsl:if>
    
        
        
        
        
        
    
    <xsl:if test="normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compWord)!='no' and normalize-space(//comp/compWordAfter/@checked)='yes'">
<xsl:text>
rule {CBar option 2k - head-final, non-question, non-root}
C' = IP C
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C head type root&gt; = -
	&lt;C head type relative&gt; = -
	&lt;C head type question&gt; = -
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-final&gt; = +
	&lt;IP head type comma&gt; = -
	&lt;C' head type comma&gt; &lt;= &lt;C head type comma&gt;
	&lt;C' option&gt; = 2k
</xsl:text>
</xsl:if>
    
        
        
        
        
        
    
    <xsl:if test="normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compWord)!='no' and normalize-space(//comp/compWordBoth/@checked)='yes'">
<xsl:text>
rule {CBar option 2l - head both sides, non-question, non-root}
C' = C IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C head type root&gt; = -
	&lt;C head type relative&gt; = -
	&lt;C head type question&gt; = -
	&lt;C_1 head type root&gt; = -
	&lt;C_1 head type relative&gt; = -
	&lt;C_1 head type question&gt; = -
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = -
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
	&lt;C head type comma&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;C' head type comma&gt; &lt;= &lt;C_1 head type comma&gt;
	&lt;C' option&gt; = 2l
</xsl:text>
</xsl:if>
    
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@mainYNWord)!='yes' and normalize-space(//q/mainYNProclitic/@checked)='yes' or normalize-space(//q/@mainYNWord)!='yes' and normalize-space(//q/mainYNPrefix/@checked)='yes'">
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
	&lt;C' option&gt; = 3a
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@mainYNWord)!='yes' and normalize-space(//q/mainYNEnclitic/@checked)='yes' or normalize-space(//q/@mainYNWord)!='yes' and normalize-space(//q/mainYNSuffix/@checked)='yes'">
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
	&lt;C' option&gt; = 3b
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@embYNWord)!='yes' and normalize-space(//q/embYNProclitic/@checked)='yes' or normalize-space(//q/@embYNWord)!='yes' and normalize-space(//q/embYNPrefix/@checked)='yes'">
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
	&lt;C' option&gt; = 3c
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@embYNWord)!='yes' and normalize-space(//q/embYNEnclitic/@checked)='yes' or normalize-space(//q/@embYNWord)!='yes' and normalize-space(//q/embYNSuffix/@checked)='yes'">
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
	&lt;C' option&gt; = 3d
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@mainContWord)!='yes' and normalize-space(//q/mainContProclitic/@checked)='yes' or normalize-space(//q/@mainContWord)!='yes' and normalize-space(//q/mainContPrefix/@checked)='yes'">
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
	&lt;C' option&gt; = 4a
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@mainContWord)!='yes' and normalize-space(//q/mainContEnclitic/@checked)='yes' or normalize-space(//q/@mainContWord)!='yes' and normalize-space(//q/mainContSuffix/@checked)='yes'">
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
	&lt;C' option&gt; = 4b
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@embContWord)!='yes' and normalize-space(//q/embContProclitic/@checked)='yes' or normalize-space(//q/@embContWord)!='yes' and normalize-space(//q/embContPrefix/@checked)='yes'">
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
	&lt;C' option&gt; = 4c
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//q/@embContWord)!='yes' and normalize-space(//q/embContEnclitic/@checked)='yes' or normalize-space(//q/@embContWord)!='yes' and normalize-space(//q/embContSuffix/@checked)='yes'">
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
	&lt;C' option&gt; = 4d
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compWord)!='yes' and normalize-space(//comp/compProclitic/@cchecked)='yes' or normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compWord)!='yes' and normalize-space(//comp/compPrefix/@checked)='yes'">
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
	&lt;C' option&gt; = 4e
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compWord)!='yes' and normalize-space(//comp/compEnclitic/@checked)='yes' or normalize-space(//comp/@comp)='yes' and normalize-space(//comp/@compWord)!='yes' and normalize-space(//comp/compSuffix/@checked)='yes'">
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
	&lt;C' option&gt; = 4f
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
    
    
    <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' and normalize-space(//relcl/relWordBefore/@checked)='yes' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' and normalize-space(//relcl/relWordBefore/@checked)='yes' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' and normalize-space(//relcl/relWordBefore/@checked)='yes' and normalize-space(//relcl/@whAndComp)!='no'">
<xsl:text>
rule {CBar option 5a - head-initial, relative clause}
C' = C IP
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = +
	&lt;C head type root&gt; = -
	&lt;C head type question&gt; = -
	&lt;C head type relative&gt; = +
	&lt;C head type CP-initial&gt; = +
	&lt;C head type comma&gt; = -
	&lt;C' option&gt; = 5a
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' and normalize-space(//relcl/relWordAfter/@checked)='yes' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' and normalize-space(//relcl/relWordAfter/@checked)='yes' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' and normalize-space(//relcl/relWordAfter/@checked)='yes' and normalize-space(//relcl/@whAndComp)!='no'">
<xsl:text>
rule {CBar option 5b - head-final, relative clause}
C' = IP C
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = +
	&lt;C head type root&gt; = -
	&lt;C head type question&gt; = -
	&lt;C head type relative&gt; = +
	&lt;C head type CP-final&gt; = +
	&lt;IP head type comma&gt; = -
	&lt;C' head type comma&gt; &lt;= &lt;C head type comma&gt;
	&lt;C' option&gt; = 5b
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' and normalize-space(//relcl/relWordBoth/@checked)='yes' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' and normalize-space(//relcl/relWordBoth/@checked)='yes' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@relWord)!='no' and normalize-space(//relcl/relWordBoth/@checked)='yes' and normalize-space(//relcl/@whAndComp)!='no'">
<xsl:text>
rule {CBar option 5c - head both sides, relative clause}
C' = C IP C_1
	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;C' head type root&gt; = -
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = +
	&lt;C head type root&gt; = -
	&lt;C head type question&gt; = -
	&lt;C head type relative&gt; = +
	&lt;C_1 head type root&gt; = -
	&lt;C_1 head type question&gt; = -
	&lt;C_1 head type relative&gt; = +
	&lt;C head type CP-initial&gt; = +
	&lt;C_1 head type CP-final&gt; = +
	&lt;C head type comma&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;C' head type comma&gt; &lt;= &lt;C_1 head type comma&gt;
	&lt;C' option&gt; = 5c
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' and normalize-space(//relcl/@relCliticPos)='before' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' and normalize-space(//relcl/@relCliticPos)='before' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' and normalize-space(//relcl/@relCliticPos)='before' and normalize-space(//relcl/@whAndComp)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' and normalize-space(//relcl/@relCliticPos)='before'">
<xsl:text>
rule {CBar option 5d - relative_prefix, IP complement}
C' = IP
     	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;IP head type prefix relative&gt; = +
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = +
	&lt;C' head type root&gt; = -
	&lt;C' option&gt; = 5d
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' and normalize-space(//relcl/@relCliticPos)='after' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' and normalize-space(//relcl/@relCliticPos)='after' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' and normalize-space(//relcl/@relCliticPos)='after' and normalize-space(//relcl/@whAndComp)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' and normalize-space(//relcl/@relCliticPos)='after'">
<xsl:text>
rule {CBar option 5e - relative_suffix, IP complement}
C' = IP
     	&lt;C' head&gt; = &lt;IP head&gt;
	&lt;IP head type suffix relative&gt; = +
	&lt;C' head type question&gt; = -
	&lt;C' head type relative&gt; = +
	&lt;C' head type root&gt; = +
	&lt;C' option&gt; = 5e
</xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPComp/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' and normalize-space(//relcl/@relCliticPos)='both' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' and normalize-space(//relcl/@relCliticPos)='both' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeCPWh/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' and normalize-space(//relcl/@relCliticPos)='both' and normalize-space(//relcl/@whAndComp)!='no' or normalize-space(//relcl/@exist)='yes' and normalize-space(//relcl/relTypeIPRel/@checked)='yes' and normalize-space(//relcl/@relWord)!='yes' and normalize-space(//relcl/@relCliticPos)='both'">
<xsl:text>
        rule {CBar option 5f - relative_prefix and relative_suffix, IP complement}
        C' = IP
        &lt;C' head&gt; = &lt;IP head&gt;
        &lt;IP head type prefix relative&gt; = +
        &lt;IP head type suffix relative&gt; = +
        &lt;C' head type question&gt; = -
        &lt;C' head type relative&gt; = +
        &lt;C' head type root&gt; = +
        &lt;C' option&gt; = 5f
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='yes' and normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='before' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='before'">
<xsl:text>
        rule {CP option 6a - Conditional word before, Conseq word before}
        CP = Cond IP_1 Conseq IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;Cond head infl mood&gt; = conditional
        &lt;Cond head type comma&gt; = -
        &lt;Conseq head type comma&gt; = -
        &lt;IP_1 head type comma&gt; = +
        &lt;CP option&gt; = 6a
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='yes' and normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='after' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='after'">
<xsl:text>
        rule {CP option 6aF - Conditional word before, Conseq word after}
        CP = Cond IP_1 IP_2 Conseq
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;Cond head infl mood&gt; = conditional
        &lt;Cond head type comma&gt; = -
        &lt;IP_2 head type comma&gt; = -
        &lt;IP_1 head type comma&gt; = +
        &lt;CP option&gt; = 6aF
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='yes' and normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/@consequence)!='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionWordBefore/@checked)='yes' and normalize-space(//ip/@consequence)!='yes'">
<xsl:text>
        rule {CP option 6aNoConseq - Conditional word before, no Conseq word}
        CP = Cond IP_1 IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;Cond head infl mood&gt; = conditional
        &lt;Cond head type comma&gt; = -
        &lt;IP_1 head type comma&gt; = +
        &lt;CP option&gt; = 6aNoConseq
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
    
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='before' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='before'">
<xsl:text>
        rule {CP option 6b - Conditional word after, Conseq word before}
        CP = IP_1 Cond Conseq IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;Cond head infl mood&gt; = conditional
        &lt;Cond head type comma&gt; = +
        &lt;Conseq head type comma&gt; = -
        &lt;IP_1 head type comma&gt; = -
        &lt;CP option&gt; = 6b
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='after' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='after'">
<xsl:text>
        rule {CP option 6bF - Conditional word after, Conseq word after}
        CP = IP_1 Cond IP_2 Conseq
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;Cond head infl mood&gt; = conditional
        &lt;Cond head type comma&gt; = +
        &lt;IP_2 head type comma&gt; = -
        &lt;IP_1 head type comma&gt; = -
        &lt;CP option&gt; = 6bF
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/@consequence)!='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionWordAfter/@checked)='yes' and normalize-space(//ip/@consequence)!='yes'">
<xsl:text>
        rule {CP option 6bNoConseq - Conditional word after, no Conseq word}
        CP = IP_1 Cond IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;Cond head infl mood&gt; = conditional
        &lt;Cond head type comma&gt; = +
        &lt;IP_1 head type comma&gt; = -
        &lt;CP option&gt; = 6bNoConseq
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
    
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='before' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionWordBoth/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='before'">
<xsl:text>
        rule {CP option 6c - Conditional word both sides, Conseq word before}
        CP = Cond_1 IP_1 Cond_2 Conseq IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;Cond_1 head infl mood&gt; = conditional
        &lt;Cond_2 head infl mood&gt; = conditional
        &lt;Cond_1 head type comma&gt; = -
        &lt;Cond_2 head type comma&gt; = +
        &lt;Conseq head type comma&gt; = -
        &lt;IP_1 head type comma&gt; = -
        &lt;CP option&gt; = 6c
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='after' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionWordBoth/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='after'">
<xsl:text>
        rule {CP option 6cF - Conditional word both sides, Conseq word after}
        CP = Cond_1 IP_1 Cond_2  IP_2 Conseq
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;Cond_1 head infl mood&gt; = conditional
        &lt;Cond_2 head infl mood&gt; = conditional
        &lt;Cond_1 head type comma&gt; = -
        &lt;Cond_2 head type comma&gt; = +
        &lt;IP_2 head type comma&gt; = -
        &lt;IP_1 head type comma&gt; = -
        &lt;CP option&gt; = 6cF
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='yes' and normalize-space(//ip/@consequence)!='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionWordBoth/@checked)='yes' and normalize-space(//ip/@consequence)!='yes'">
<xsl:text>
        rule {CP option 6cNoConseq - Conditional word both sides, no Conseq word}
        CP = Cond_1 IP_1 Cond_2 IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;Cond_1 head infl mood&gt; = conditional
        &lt;Cond_2 head infl mood&gt; = conditional
        &lt;Cond_1 head type comma&gt; = -
        &lt;Cond_2 head type comma&gt; = +
        &lt;IP_1 head type comma&gt; = -
        &lt;CP option&gt; = 6cNoConseq
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
    
 
    <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='before' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='before'">
<xsl:text>
        rule {CP option 6d - Conditional proclitic, Conseq word before}
        CP = IP_1 Conseq IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;IP_1 head infl mood&gt; = conditional
        &lt;IP_1 head type prefix conditional&gt; = +
        &lt;Conseq head type comma&gt; = -
        &lt;IP_1 head type comma&gt; = +
        &lt;CP option&gt; = 6d
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='after' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='after'">
<xsl:text>
        rule {CP option 6dF - Conditional proclitic, Conseq word after}
        CP = IP_1 IP_2 Conseq
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;IP_1 head infl mood&gt; = conditional
        &lt;IP_1 head type prefix conditional&gt; = +
        &lt;IP_2 head type comma&gt; = -
        &lt;IP_1 head type comma&gt; = +
        &lt;CP option&gt; = 6dF
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/@consequence)!='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionProclitic/@checked)='yes' and normalize-space(//ip/@consequence)!='yes'">
<xsl:text>
        rule {CP option 6dNoConseq - Conditional proclitic, no Conseq word}
        CP = IP_1 IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;IP_1 head infl mood&gt; = conditional
        &lt;IP_1 head type prefix conditional&gt; = +
        &lt;IP_1 head type comma&gt; = +
        &lt;CP option&gt; = 6dNoConseq
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='before' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='before'">
<xsl:text>
        rule {CP option 6e - Conditional enclitic, Conseq word before}
        CP = IP_1 Conseq IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;IP_1 head infl mood&gt; = conditional
        &lt;IP_1 head type suffix conditional&gt; = +
        &lt;Conseq head type comma&gt; = -
        &lt;IP_1 head type comma&gt; = +
        &lt;CP option&gt; = 6e
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='after' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/@consequence)!='no' and normalize-space(//ip/@consequencePos)='after'">
<xsl:text>
        rule {CP option 6eF - Conditional enclitic, Conseq word after}
        CP = IP_1 IP_2 Conseq
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;IP_1 head infl mood&gt; = conditional
        &lt;IP_1 head type suffix conditional&gt; = +
        &lt;IP_2 head type comma&gt; = -
        &lt;IP_1 head type comma&gt; = +
        &lt;CP option&gt; = 6eF
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/@consequence)!='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionEnclitic/@checked)='yes' and normalize-space(//ip/@consequence)!='yes'">
<xsl:text>
        rule {CP option 6eNoConseq - Conditional enclitic, no Conseq word}
        CP = IP_1 IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;IP_1 head infl mood&gt; = conditional
        &lt;IP_1 head type suffix conditional&gt; = +
        &lt;IP_1 head type comma&gt; = +
        &lt;CP option&gt; = 6eNoConseq
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
        
        
        
    
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='yes' and normalize-space(//ip/conditionWordBefore/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionWordBefore/@checked)='yes'">
<xsl:text>
        rule {CP option 6f - Consequnece first, Conditional word before}
        CP = IP_1 Cond IP_2
        &lt;CP head&gt; = &lt;IP_2 head&gt;
        &lt;Cond head infl mood&gt; = conditional
        &lt;Cond head type comma&gt; = -
        &lt;CP option&gt; = 6f
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='yes' and normalize-space(//ip/conditionWordAfter/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionWordAfter/@checked)='yes'">
<xsl:text>
        rule {CP option 6g - Consequence first, Conditional word after}
        CP = IP_1 IP_2 Cond
        &lt;CP head&gt; = &lt;IP_2 head&gt;
        &lt;Cond head infl mood&gt; = conditional
        &lt;IP_2 head type comma&gt; = -
        &lt;CP option&gt; = 6g
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='yes' and normalize-space(//ip/conditionWordBoth/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionWordBoth/@checked)='yes'">
<xsl:text>
        rule {CP option 6h - Consequence first, Conditional word both sides}
        CP = IP_1 Cond_1 IP_2 Cond_2 
        &lt;CP head&gt; = &lt;IP_2 head&gt;
        &lt;Cond_1 head infl mood&gt; = conditional
        &lt;Cond_2 head infl mood&gt; = conditional
        &lt;Cond_1 head type comma&gt; = -
        &lt;IP_2 head type comma&gt; = 1
        &lt;CP option&gt; = 6h
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    

    <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionProclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionProclitic/@checked)='yes'">
<xsl:text>
        rule {CP option 6i - Consequence first, Conditional proclitic}
        CP = IP_1 IP_2
        &lt;CP head&gt; = &lt;IP_2 head&gt;
        &lt;IP_2 head infl mood&gt; = conditional
        &lt;IP_2 head type prefix conditional&gt; = +
        &lt;CP option&gt; = 6i
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@conditionWord)='no' and normalize-space(//ip/conditionEnclitic/@checked)='yes' or normalize-space(//ip/@conditionWord)='some' and normalize-space(//ip/conditionEnclitic/@checked)='yes'">
<xsl:text>
        rule {CP option 6j - Consequence first, Conditional enclitic}
        CP = IP_1 IP_2
        &lt;CP head&gt; = &lt;IP_2 head&gt;
        &lt;IP_2 head infl mood&gt; = conditional
        &lt;IP_2 head type suffix conditional&gt; = +
        &lt;CP option&gt; = 6j
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
 
    
    <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='yes' and normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes'">
<xsl:text>
        rule {CP option 7a - subjunctive conditional word before}
        CP = Cond IP_1 IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;Cond head type subjunctive_conditional&gt; = +
        &lt;Cond head type comma&gt; = -
        &lt;IP_1 head type comma&gt; = +
        &lt;CP option&gt; = 7a
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes'">
<xsl:text>
        rule {CP option 7b - Subjunctive conditional word after}
        CP = IP_1 Cond IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;Cond head type subjunctive_conditional&gt; = +
        &lt;Cond head type comma&gt; = +
        &lt;IP_1 head type comma&gt; = -
        &lt;CP option&gt; = 7b
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    
    <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>
        rule {CP option 7c - subjunctive conditional word both sides}
        CP = Cond_1 IP_1 Cond_2 IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;Cond_1 head type subjunctive_conditional&gt; = +
        &lt;Cond_2 head type subjunctive_conditional&gt; = +
        &lt;Cond_1 head type comma&gt; = -
        &lt;Cond_2 head type comma&gt; = +
        &lt;IP_1 head type comma&gt; = -
        &lt;CP option&gt; = 7c
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
 
    <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes'">
<xsl:text>
        rule {CP option 7d - subjunctive conditional proclitic}
        CP = IP_1 IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;IP_1 head infl mood&gt; = subjunctive
        &lt;IP_1 head type prefix subjunctive_conditional&gt; = +
        &lt;IP_1 head type comma&gt; = +
        &lt;CP option&gt; = 7d
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes'">
<xsl:text>
        rule {CP option 7e - subjunctive conditional enclitic}
        CP = IP_1 IP_2
        &lt;CP head&gt; = &lt;IP_1 head&gt;
        &lt;IP_1 head infl mood&gt; = subjunctive
        &lt;IP_1 head type suffix subjunctive_conditional&gt; = +
        &lt;IP_1 head type comma&gt; = +
        &lt;CP option&gt; = 7e
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    
    <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='yes' and normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondWordBefore/@checked)='yes'">
<xsl:text>
        rule {CP option 7f - Consequnece first, subjunctive conditional word before}
        CP = IP_1 Cond IP_2
        &lt;CP head&gt; = &lt;IP_2 head&gt;
        &lt;Cond head type subjunctive_conditional&gt; = +
        &lt;Cond head type comma&gt; = -
        &lt;CP option&gt; = 7f
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    
    <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='yes' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondWordAfter/@checked)='yes'">
<xsl:text>
        rule {CP option 7g - Consequence first, subjunctive conditional word after}
        CP = IP_1 IP_2 Cond
        &lt;CP head&gt; = &lt;IP_2 head&gt;
        &lt;Cond head type subjunctive_conditional&gt; = +
        &lt;IP_2 head type comma&gt; = -
        &lt;CP option&gt; = 7g
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    
    <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='yes' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondWordBoth/@checked)='yes'">
<xsl:text>
        rule {CP option 7h - Consequence first, subjunctive conditional word both sides}
        CP = IP_1 Cond_1 IP_2 Cond_2 
        &lt;CP head&gt; = &lt;IP_2 head&gt;
        &lt;Cond_1 head type subjunctive_conditional&gt; = +
        &lt;Cond_2 head type subjunctive_conditional&gt; = +
        &lt;Cond_1 head type comma&gt; = -
        &lt;IP_2 head type comma&gt; = 1
        &lt;CP option&gt; = 7h
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    

    <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondProclitic/@checked)='yes'">
<xsl:text>
        rule {CP option 7i - Consequence first, subjunctive conditional proclitic}
        CP = IP_1 IP_2
        &lt;CP head&gt; = &lt;IP_2 head&gt;
        &lt;IP_2 head infl mood&gt; = subjunctive
        &lt;IP_2 head type prefix subjunctive_conditional&gt; = +
        &lt;CP option&gt; = 7i
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
    <xsl:if test="normalize-space(//ip/@subjunctiveCondWord)='no' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes' or normalize-space(//ip/@subjunctiveCondWord)='some' and normalize-space(//ip/subjunctiveCondEnclitic/@checked)='yes'">
<xsl:text>
        rule {CP option 7j - Consequence first, subjunctive conditional enclitic}
        CP = IP_1 IP_2
        &lt;CP head&gt; = &lt;IP_2 head&gt;
        &lt;IP_2 head infl mood&gt; = subjunctive
        &lt;IP_2 head type suffix subjunctive_conditional&gt; = +
        &lt;CP option&gt; = 7j
    </xsl:text>
</xsl:if>
    
        
        
        
        
        
        
        
    
 
    
<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)!='yesWord' or normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord' and normalize-space(//focus/@topicMarkerRequired)='no'">
<xsl:text>
rule {TopicP option nomarker}
TopicP = DP
     	&lt;TopicP head&gt; = &lt;DP head&gt;
	&lt;DP head type topic&gt; = +
	&lt;DP head type focus&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;TopicP head type topic-marked&gt; = -
	&lt;TopicP option&gt; = nomarker
</xsl:text>
</xsl:if>

    



    





<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord' and normalize-space(//focus/topicMarkerBefore/@checked)='yes'">
<xsl:text>
rule {TopicP option markerinit}
TopicP = TopicM DP
     	&lt;TopicP head&gt; = &lt;DP head&gt;
	&lt;TopicM head type topic-initial&gt; = +
	&lt;DP head type focus&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;TopicP head type topic-marked&gt; = +
	&lt;TopicM head type comma&gt; = -
	&lt;TopicP option&gt; = markerinit
</xsl:text>
</xsl:if>

    





<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord' and normalize-space(//focus/topicMarkerAfter/@checked)='yes'">
<xsl:text>
rule {TopicP option markerfin}
TopicP = DP TopicM
     	&lt;TopicP head&gt; = &lt;DP head&gt;
	&lt;TopicM head type topic-final&gt; = +
	&lt;DP head type focus&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;TopicP head type topic-marked&gt; = +
	&lt;DP head type comma&gt; = -
	&lt;TopicP head type comma&gt; &lt;= &lt;TopicM head type comma&gt;
	&lt;TopicP option&gt; = markerfin
</xsl:text>
</xsl:if>

    





<xsl:if test="normalize-space(//focus/@topic)='yes' and normalize-space(//focus/@topicMarker)='yesWord' and normalize-space(//focus/topicMarkerBoth/@checked)='yes'">
<xsl:text>
rule {TopicP option markerboth}
TopicP = TopicM_1 DP TopicM_2
     	&lt;TopicP head&gt; = &lt;DP head&gt;
	&lt;TopicM_1 head type topic-initial&gt; = +
	&lt;TopicM_2 head type topic-final&gt; = +
	&lt;DP head type focus&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;TopicP head type topic-marked&gt; = +
	&lt;TopicM_1 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;TopicP head type comma&gt; &lt;= &lt;TopicM_2 head type comma&gt;
	&lt;TopicP option&gt; = markerboth
</xsl:text>
</xsl:if>

    






<xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)!='yesWord' or normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord' and normalize-space(//focus/@focusMarkerRequired)='no'">
<xsl:text>
rule {FocusP option nomarker}
FocusP = DP
     	&lt;FocusP head&gt; = &lt;DP head&gt;
	&lt;DP head type focus&gt; = +
	&lt;DP head type topic&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;FocusP head type focusmarked&gt; &lt;= -
	&lt;FocusP option&gt; = nomarker
</xsl:text>
</xsl:if>

    



    





<xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord' and normalize-space(//focus/focusMarkerBefore/@checked)='yes'">
<xsl:text>
rule {FocusP option markerinit}
FocusP = FocusM DP
     	&lt;FocusP head&gt; = &lt;DP head&gt;
	&lt;FocusM head type focus-initial&gt; = +
	&lt;DP head type focus&gt; = +
	&lt;DP head type topic&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;FocusP head type focusmarked&gt; &lt;= +
	&lt;FocusM head type comma&gt; = -
	&lt;FocusP head case&gt; &lt;= &lt;FocusM head case&gt;
	&lt;FocusP option&gt; = markerinit
</xsl:text>
</xsl:if>

    





<xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord' and normalize-space(//focus/focusMarkerAfter/@checked)='yes'">
<xsl:text>
rule {FocusP option markerfin}
FocusP = DP FocusM
     	&lt;FocusP head&gt; = &lt;DP head&gt;
	&lt;FocusM head type focus-final&gt; = +
	&lt;DP head type focus&gt; = +
	&lt;DP head type topic&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;FocusP head type comma&gt; &lt;= &lt;FocusM head type comma&gt;
	&lt;FocusP head type focusmarked&gt; &lt;= +
	&lt;FocusP option&gt; = markerfin
</xsl:text>
</xsl:if>

    





<xsl:if test="normalize-space(//focus/@focus)='yes' and normalize-space(//focus/@focusMarker)='yesWord' and normalize-space(//focus/focusMarkerBoth/@checked)='yes'">
<xsl:text>
rule {FocusP option markerboth}
FocusP = FocusM_1 DP FocusM_2
     	&lt;FocusP head&gt; = &lt;DP head&gt;
	&lt;FocusM_1 head type focus-initial&gt; = +
	&lt;FocusM_2 head type focus-final&gt; = +
	&lt;DP head type focus&gt; = +
	&lt;DP head type topic&gt; = -
	&lt;DP head type wh&gt; = -
	&lt;DP head type temporal&gt; = -
	&lt;FocusM_1 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;FocusP head type comma&gt; &lt;= &lt;FocusM_2 head type comma&gt;
	&lt;FocusP head type focusmarked&gt; &lt;= +
	&lt;FocusP option&gt; = markerboth
</xsl:text>
</xsl:if>

    






</xsl:template>
</xsl:stylesheet>
