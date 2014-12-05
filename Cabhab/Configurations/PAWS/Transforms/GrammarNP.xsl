<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="np">
	
<xsl:if test="normalize-space(//pron/@pronMod)='det' and normalize-space(//pron/@partitivePos)='after' or normalize-space(//pron/@pronMod)='det' and normalize-space(//pron/@partitivePos)='either'">
<xsl:text>
      rule {NP option Prona - pronoun,dem,quantifiers w/o head noun (optional PP after}
      NP = {Pron / Dem / Q / Num / Deg (PP)}
      &lt;NP head&gt; = &lt;Pron head&gt;
      &lt;Pron head type possessive&gt; = -  | these use DP rule "Pron"
      &lt;Pron head type reflexive&gt; = -
      &lt;Pron head type reciprocal&gt; = - 
      &lt;NP head&gt; = &lt;Dem head&gt;
      &lt;NP head&gt; = &lt;Q head&gt;
      &lt;NP head&gt; = &lt;Num head&gt;
      &lt;NP head&gt; = &lt;Deg head&gt;
      &lt;Deg head type quantifier&gt; = +
      &lt;Dem head type wh &gt; = -		| so "which" not separate
      &lt;PP head type stranded&gt; = -	| PP must have overt complement
      &lt;PP head type sentential&gt; = -	| sentential not within NP
      |	&lt;PP head type partitive&gt; = +
      &lt;NP head type prefix poss&gt; = -  |can't be possessors
      &lt;NP head type suffix poss&gt; = -  |can't be possessors
      &lt;NP head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
      &lt;NP head type comma&gt; &lt;= &lt;PP head type comma&gt;
      &lt;NP option&gt; = Prona
   </xsl:text>
</xsl:if>
   
      
   	
   	
   	
   	
   	
   	
   
   <xsl:if test="normalize-space(//pron/@pronMod)='det' and normalize-space(//pron/@partitivePos)='before' or normalize-space(//pron/@pronMod)='det' and normalize-space(//pron/@partitivePos)='either'">
<xsl:text>
      rule {NP option Pronb - pronoun,dem,quantifiers w/o head noun (optional PP before)}
      NP = (PP) {Pron / Dem / Q / Num / Deg}
      &lt;NP head&gt; = &lt;Pron head&gt;
      &lt;Pron head type possessive&gt; = -  | these use DP rule "Pron"
      &lt;Pron head type reflexive&gt; = -
      &lt;Pron head type reciprocal&gt; = - 
      &lt;NP head&gt; = &lt;Dem head&gt;
      &lt;NP head&gt; = &lt;Q head&gt;
      &lt;NP head&gt; = &lt;Num head&gt;
      &lt;NP head&gt; = &lt;Deg head&gt;
      &lt;Deg head type quantifier&gt; = +
      &lt;Dem head type wh &gt; = -		| so "which" not separate
      &lt;PP head type stranded&gt; = -	| PP must have overt complement
      &lt;PP head type sentential&gt; = -	| sentential not within NP
      |	&lt;PP head type partitive&gt; = +
      &lt;NP head type prefix poss&gt; = -  |can't be possessors
      &lt;NP head type suffix poss&gt; = -  |can't be possessors
      &lt;PP head type comma&gt; = -
      &lt;NP option&gt; = Pronb
   </xsl:text>
</xsl:if>
   
   	
   	
   	
   	
   	
   	
   	
   
      <xsl:if test="normalize-space(//np/@possNounCaseChange)='no' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='no'">
<xsl:text>
rule {NP option 0 - not possessed}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -    
	&lt;NP head possessor head agr person&gt; = none
	&lt;NP option&gt; = 0
</xsl:text>
</xsl:if>
	
	
	
	
	
		
	
	<xsl:if test="normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 0Asuf - not possessed, absolutive_suffix}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -    
	&lt;NP head possessor head agr person&gt; = none
	&lt;NP head type suffix case&gt; = none   | if absolutive, possessor required
	&lt;NP option&gt; = 0Asuf
</xsl:text>
</xsl:if>
	
	
		
		
		
		
	
	

	
		
		
		
		
	
	
	
	<xsl:if test="normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 0Apre - not possessed, absolutive_prefix}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -    
	&lt;NP head possessor head agr person&gt; = none
	&lt;NP head type prefix case&gt; = none   | if absolutive, possessor required
	&lt;NP option&gt; = 0Apre
</xsl:text>
</xsl:if>
	
	
		
		
		
		
	
	

	
		
		
		
		
	
	
	
	<xsl:if test="normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 0Esuf - not possessed, ergative_suffix}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -    
	&lt;NP head possessor head agr person&gt; = none
	&lt;NP head type suffix ergative&gt; = -   | if +, possessor required
	&lt;NP option&gt; = 0Esuf
</xsl:text>
</xsl:if>
	
	
		
		
		
		
	
	

	
		
		
		
		
	
	
	
	<xsl:if test="normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 0Epre - not possessed, ergative_prefix}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -    
	&lt;NP head possessor head agr person&gt; = none
	&lt;NP head type prefix ergative&gt; = -   | if +, possessor required
	&lt;NP option&gt; = 0Epre
</xsl:text>
</xsl:if>
	
	
		
		
		
		
	
	

	
		
		
		
		
	
	
	
	<xsl:if test="normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='split' or normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//typology/@case)='nominative'">
<xsl:text>
rule {NP option 0Gsuf - not possessed, genitive_suffix}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -    
	&lt;NP head possessor head agr person&gt; = none
	&lt;NP head type suffix genitive&gt; = -   | if +, possessor required
	&lt;NP option&gt; = 0Gsuf
</xsl:text>
</xsl:if>
	
	
		
		
		
		
	
	

	
		
		
		
		
	
	
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='split' or normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//typology/@case)='nominative'">
<xsl:text>
rule {NP option 0Gpre - not possessed, genitive_prefix}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -    
	&lt;NP head possessor head agr person&gt; = none
	&lt;NP head type prefix genitive&gt; = -   | if +, possessor required
	&lt;NP option&gt; = 0Gpre
</xsl:text>
</xsl:if>
	
	
		
		
		
		
	
	

	
		
		
		
		
	
	
		
		
		
		
	
	
	<xsl:if test="normalize-space(//np/@possAgr)='yes'">
<xsl:text>
rule {NP option 0p - possessed with person affix, pro-drop}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; &lt;= +
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;NP head possessor head agr&gt; == ~[person:none]
	&lt;NP option&gt; = 0p
</xsl:text>
</xsl:if>
	
		
	

	<xsl:if test="normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='before' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='either' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive'">
<xsl:text>
rule {NP option 1a - no marker or case affix on head only, possessor initial}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 1a
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 1aErg - no marker or case affix on head only, possessor initial, ergative}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 1aErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
	
	
	
		
		
		
		
		
	
	

		
		
		
		
		
	
	
	
		
		
		
		
		
	
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 1aAbs - no marker or case affix on head only, possessor initial, absolutive}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 1aAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
	
		
		
		
		
		
		
		
	
		

		
		
		
		
		
	
		
		
		
		
		
		
		
	
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='after' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='either' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive'">
<xsl:text>
rule {NP option 1b - no marker or case affix on head only, possessor final}
NP = {N'' / N'} {DP / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 1b
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 1bErg - no marker or case affix on head only, possessor final, ergative}
NP = {N'' / N'} {DP / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 1bErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='no' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 1bAbs - no marker or case affix on head only, possessor final, absolutive}
NP = {N'' / N'} {DP / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 1bAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
rule {NP option 2a - optional marker before, possessor initial}
NP = {{(Poss) DP} / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Poss head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 2a
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 2aErg - optional marker before, possessor initial, ergative}
NP = {{(Poss) DP} / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Poss head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 2aErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 2aAbs - optional marker before, possessor initial, absolutive}
NP = {{(Poss) DP} / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Poss head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 2aAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
rule {NP option 2b - optional marker before, possessor final}
NP = {N'' / N'} {{(Poss) DP} / Pron} 
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 2b
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 2bErg - optional marker before, possessor final, ergative}
NP = {N'' / N'} {{(Poss) DP} / Pron} 
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 2bErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 2bAbs - optional marker before, possessor final, absolutive}
NP = {N'' / N'} {{(Poss) DP} / Pron} 
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 2bAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
rule {NP option 3a - optional marker after, possessor initial}
NP = {{DP (Poss)} / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 3a
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 3aErg - optional marker after, possessor initial, ergative}
NP = {{DP (Poss)} / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 3aErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 3aAbs - optional marker after, possessor initial, absolutive}
NP = {{DP (Poss)} / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 3aAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
rule {NP option 3b - optional marker after, possessor final}
NP = {N'' / N'} {{DP (Poss)} / Pron} 
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 3b
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 3bErg - optional marker after, possessor final, ergative}
NP = {N'' / N'} {{DP (Poss)} / Pron} 
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 3bErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 3bAbs - optional marker after, possessor final, absolutive}
NP = {N'' / N'} {{DP (Poss)} / Pron} 
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 3bAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
		rule {NP option 3c - optional marker both sides, possessor initial}
		NP = {{Poss_1 DP Poss_2} / Pron} {N'' / N'}
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP   head case&gt; = genitive
		&lt;Pron head case&gt; = genitive
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;DP head type comma&gt; = -
		&lt;Pron head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;Poss_2 head type comma&gt; = -
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 3c
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
		rule {NP option 3cOpt - optional marker both sides, possessor initial}
		NP = {DP / Pron} {N'' / N'}
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP   head case&gt; = genitive
		&lt;Pron head case&gt; = genitive
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;DP head type comma&gt; = -
		&lt;Pron head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;Poss_2 head type comma&gt; = -
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 3cOpt
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
		rule {NP option 3cErg - optional marker both sides, possessor initial, ergative}
		NP = {{Poss_1 DP Poss_2} / Pron} {N'' / N'}
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP   head case&gt; = ergative
		&lt;Pron head case&gt; = ergative
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;DP head type comma&gt; = -
		&lt;Pron head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;Poss_2 head type comma&gt; = -
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 3cErg
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
		rule {NP option 3cErgOpt - optional marker both sides, possessor initial, ergative}
		NP = {DP / Pron} {N'' / N'}
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP   head case&gt; = ergative
		&lt;Pron head case&gt; = ergative
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;DP head type comma&gt; = -
		&lt;Pron head type comma&gt; = -
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 3cErgOpt
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
		rule {NP option 3cAbs - optional marker both sides, possessor initial, absolutive}
		NP = {{Poss_1 DP Poss_2} / Pron} {N'' / N'}
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP   head case&gt; = absolutive
		&lt;Pron head case&gt; = absolutive
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;DP head type comma&gt; = -
		&lt;Pron head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;Poss_2 head type comma&gt; = -
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 3cAbs
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
		rule {NP option 3cAbsOpt - optional marker both sides, possessor initial, absolutive}
		NP = {DP / Pron} {N'' / N'}
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP   head case&gt; = absolutive
		&lt;Pron head case&gt; = absolutive
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;DP head type comma&gt; = -
		&lt;Pron head type comma&gt; = -
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 3cAbsOpt
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
		rule {NP option 3d - optional marker both sides, possessor final}
		NP = {N'' / N'} {{Poss_1 DP Poss_2} / Pron} 
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP   head case&gt; = genitive
		&lt;Pron head case&gt; = genitive
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;N'' head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;DP head type comma&gt; = -
		&lt;NP head type comma&gt; &lt;= &lt;Poss_2 head type comma&gt;
		&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 3d
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
		rule {NP option 3dOpt - optional marker both sides, possessor final}
		NP = {N'' / N'} {DP / Pron} 
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP   head case&gt; = genitive
		&lt;Pron head case&gt; = genitive
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;N'' head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
		&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 3dOpt
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
		rule {NP option 3dErg - optional marker both sides, possessor final, ergative}
		NP = {N'' / N'} {{Poss_1 DP Poss_2} / Pron} 
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP   head case&gt; = ergative
		&lt;Pron head case&gt; = ergative
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;N'' head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;DP head type comma&gt; = -
		&lt;NP head type comma&gt; &lt;= &lt;Poss_2 head type comma&gt;
		&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 3dErg
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
		rule {NP option 3dErgOpt - optional marker both sides, possessor final, ergative}
		NP = {N'' / N'} {DP / Pron} 
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP   head case&gt; = ergative
		&lt;Pron head case&gt; = ergative
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;N'' head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
		&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 3dErgOpt
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
		rule {NP option 3dAbs - optional marker both sides, possessor final, absolutive}
		NP = {N'' / N'} {{Poss_1 DP Poss_2} / Pron} 
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP   head case&gt; = absolutive
		&lt;Pron head case&gt; = absolutive
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;N'' head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;DP head type comma&gt; = -
		&lt;NP head type comma&gt; &lt;= &lt;Poss_2 head type comma&gt;
		&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 3dAbs
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='no' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
		rule {NP option 3dAbsOpt - optional marker both sides, possessor final, absolutive}
		NP = {N'' / N'} {DP / Pron} 
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP   head case&gt; = absolutive
		&lt;Pron head case&gt; = absolutive
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;N'' head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
		&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 3dAbsOpt
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
rule {NP option 4a - required marker before, possessor initial}
NP = {{Poss DP} / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 4a
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 4aErg - required marker before, possessor initial, ergative}
NP = {{Poss DP} / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 4aErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 4aAbs - required marker before, possessor initial, absolutive}
NP = {{Poss DP} / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; = &lt;DP&gt;
	&lt;NP head possessor&gt; = &lt;Pron&gt;
	&lt;NP head type possessed&gt; = +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 4aAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
rule {NP option 4b - required marker before, possessor final}
NP = {N'' / N'} {{Poss DP} / Pron} 
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 4b
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 4bErg - required marker before, possessor final, ergative}
NP = {N'' / N'} {{Poss DP} / Pron} 
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 4bErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBefore/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 4bAbs - required marker before, possessor final, absolutive}
NP = {N'' / N'} {{Poss DP} / Pron} 
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 4bAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
rule {NP option 5a - required marker after, possessor initial}
NP = {{DP Poss} / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 5a
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 5aErg - required marker after, possessor initial, ergative}
NP = {{DP Poss} / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 5aErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 5aAbs - required marker after, possessor initial, absolutive}
NP = {{DP Poss} / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;Poss head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 5aAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
rule {NP option 5b - required marker after, possessor final}
NP = {N'' / N'} {{DP Poss} / Pron} 
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type no_N&gt; = -
	&lt;DP head type quantifier&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;Poss head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 5b
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 5bErg - required marker after, possessor final, ergative}
NP = {N'' / N'} {{DP Poss} / Pron} 
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;Poss head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 5bErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordAfter/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 5bAbs - required marker after, possessor final, absolutive}
NP = {N'' / N'} {{DP Poss} / Pron} 
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;Poss head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 5bAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
		rule {NP option 5c - required marker both sides, possessor initial}
		NP = {{Poss_1 DP Poss_2} / Pron} {N'' / N'}
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;Pron head case&gt; = genitive
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head type comma&gt; = -
		&lt;Pron head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;Poss_2 head type comma&gt; = -
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 5c
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
		rule {NP option 5cErg - required marker both sides, possessor initial, ergative}
		NP = {{Poss_1 DP Poss_2} / Pron} {N'' / N'}
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;Pron head case&gt; = ergative
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head type comma&gt; = -
		&lt;Pron head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;Poss_2 head type comma&gt; = -
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 5cErg
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
		rule {NP option 5cAbs - required marker both, possessor initial, absolutive}
		NP = {{Poss_1 DP Poss_2} / Pron} {N'' / N'}
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;Pron head case&gt; = absolutive
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;DP head type comma&gt; = -
		&lt;Pron head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;Poss_2 head type comma&gt; = -
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 5cAbs
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
		rule {NP option 5d - required marker both sides, possessor final}
		NP = {N'' / N'} {{Poss_1 DP Poss_2} / Pron} 
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
		&lt;DP head type no_N&gt; = -
		&lt;DP head type quantifier&gt; = -
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;Pron head case&gt; = genitive
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;N'' head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;DP head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;NP head type comma&gt; &lt;= &lt;Poss_2 head type comma&gt;
		&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 5d
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
		rule {NP option 5dErg - required marker both sides, possessor final, ergative}
		NP = {N'' / N'} {{Poss_1 DP Poss_2} / Pron} 
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;Pron head case&gt; = ergative
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;N'' head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;DP head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;NP head type comma&gt; &lt;= &lt;Poss_2 head type comma&gt;
		&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 5dErg
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesWord' and normalize-space(//np/@possWordRequired)='yes' and normalize-space(//np/possWordBoth/@checked)='yes' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
		rule {NP option 5dAbs - required marker both sides, possessor final, absolutive}
		NP = {N'' / N'} {{Poss_1 DP Poss_2} / Pron} 
		&lt;NP head&gt; = &lt;N'' head&gt;
		&lt;NP head&gt; = &lt;N' head&gt;
		&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
		&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
		&lt;NP head type possessed&gt; &lt;= +    
		&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
		&lt;DP head type quantifier&gt; = -
		&lt;DP head type no_N&gt; = -
		&lt;DP head case&gt; = &lt;Poss head case&gt;
		&lt;Pron head case&gt; = absolutive
		&lt;Pron head type possessive&gt; = -    | not stand alone possessive
		&lt;N'' head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;DP head type comma&gt; = -
		&lt;Poss_1 head type comma&gt; = -
		&lt;NP head type comma&gt; &lt;= &lt;Poss_2 head type comma&gt;
		&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
		&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
		&lt;NP option&gt; = 5dAbs
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	

	<xsl:if test="normalize-space(//np/@possMarked)='yesProclitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesProclitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
rule {NP option 6ap - poss_prefix, possessor initial}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type prefix poss&gt; = +
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6ap
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@possMarked)='yesProclitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesProclitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 6apErg - poss_prefix, possessor initial, ergative}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type prefix poss&gt; = +
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6apErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesProclitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesProclitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 6apAbs - poss_prefix, possessor initial, absolutive}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type prefix poss&gt; = +
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6apAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesEnclitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesEnclitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
rule {NP option 6as - poss_suffix, possessor initial}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type suffix poss&gt; = +
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6as
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesEnclitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesEnclitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 6asErg - poss_suffix, possessor initial, ergative}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type suffix poss&gt; = +
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6asErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesEnclitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesEnclitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 6asAbs - poss_suffix, possessor initial, absolutive}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type no_N&gt; = -
	&lt;DP head type quantifier&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type suffix poss&gt; = +
	&lt;DP head type comma&gt; = -
	&lt;Pron head type comma&gt; = -
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6asAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesProclitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesProclitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//typology/@case)='ergative'">
<xsl:text>
rule {NP option 6bp - poss_prefix, possessor final}
NP = {N'' / N'} {DP / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type prefix poss&gt; = +
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6bp
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesProclitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesProclitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 6bpErg - poss_prefix, possessor final, ergative}
NP = {N'' / N'} {DP / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type prefix poss&gt; = +
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6bpErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesProclitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesProclitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 6bpAbs - poss_prefix, possessor final, absolutive}
NP = {N'' / N'} {DP / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type prefix poss&gt; = +
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6bpAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesEnclitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//typology/@case)!='ergative' or normalize-space(//np/@possMarked)='yesEnclitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//typology/@case)='ergative' and normalize-space(//np/@possCaseErg)='genitive'">
<xsl:text>
rule {NP option 6bs - poss_suffix, possessor final}
NP = {N'' / N'} {DP / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type suffix poss&gt; = +
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6bs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesEnclitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesEnclitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 6bsErg - poss_suffix, possessor final, ergative}
NP = {N'' / N'} {DP / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type suffix poss&gt; = +
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6bsErg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@possMarked)='yesEnclitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='ergative' or normalize-space(//np/@possMarked)='yesEnclitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//typology/@case)='split'">
<xsl:text>
rule {NP option 6bsAbs - poss_suffix, possessor final, absolutive}
NP = {N'' / N'} {DP / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +    
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head type no_N&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type suffix poss&gt; = +
	&lt;N'' head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;NP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;NP head type comma&gt; &lt;= &lt;Pron head type comma&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6bsAbs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//typology/@classifier)!='yesSpecific' or normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='yes' or normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no'">
<xsl:text>
rule {NBarBar option 1 - QPs initial}
N'' = QP N'
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP head agr&gt; = &lt;N' head agr&gt;
	&lt;QP head type DP-initial&gt; = +
	&lt;QP head type comma&gt; = -
	&lt;N'' head type prefix&gt; &lt;= &lt;QP head type prefix&gt;
	&lt;N'' head type wh&gt; &lt;= &lt;QP head type wh&gt;
	&lt;N'' option&gt; = 1
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//typology/@classifier)!='yesSpecific' or normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='yes' or normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no'">
<xsl:text>
rule {NBarBar option 2 - QPs final}
N'' = N' QP
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP head agr&gt; = &lt;N' head agr&gt;
	&lt;QP head type DP-final&gt; = +
	&lt;N' head type comma&gt; = -
	&lt;N'' head type comma&gt; &lt;= &lt;QP head type comma&gt;
	&lt;N'' head type suffix&gt; &lt;= &lt;QP head type suffix&gt;
	&lt;N'' head type wh&gt; &lt;= &lt;QP head type wh&gt;
	&lt;N'' option&gt; = 2
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 1CL - Class QP initial}
		N'' = Class QP N'
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP head agr&gt; = &lt;N' head agr&gt;
		&lt;QP head type DP-initial&gt; = +
		&lt;QP head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N'' head type prefix&gt; &lt;= &lt;Class head type prefix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP head type wh&gt;
		&lt;N'' option&gt; = 1CL
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 1CLf - QP Class initial}
		N'' = QP Class N'
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP head agr&gt; = &lt;N' head agr&gt;
		&lt;QP head type DP-initial&gt; = +
		&lt;QP head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N'' head type prefix&gt; &lt;= &lt;QP head type prefix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP head type wh&gt;
		&lt;N'' option&gt; = 1CLf
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/qpPosBefore/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 1CLo - Class final, QP initial}
		N'' = QP N' Class
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP head agr&gt; = &lt;N' head agr&gt;
		&lt;QP head type DP-initial&gt; = +
		&lt;QP head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;Class head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;Class head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP head type wh&gt;
		&lt;N'' option&gt; = 1CLo
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 2CL - Class QP final}
		N'' = N' Class QP
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP head agr&gt; = &lt;N' head agr&gt;
		&lt;QP head type DP-final&gt; = +
		&lt;N' head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP head type comma&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP head type wh&gt;
		&lt;N'' option&gt; = 2CL
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 2CLf - QP Class final}
		N'' = N' QP Class 
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP head agr&gt; = &lt;N' head agr&gt;
		&lt;QP head type DP-final&gt; = +
		&lt;N' head type comma&gt; = -
		&lt;QP head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;Class head type comma&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;Class head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP head type wh&gt;
		&lt;N'' option&gt; = 2CLf
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/qpPosAfter/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 2CLo - Class initial, QP final}
		N'' = Class N' QP
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP head agr&gt; = &lt;N' head agr&gt;
		&lt;QP head type DP-final&gt; = +
		&lt;N' head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;Class head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP head type wh&gt;
		&lt;N'' option&gt; = 2CLo
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
	
	
		
	<xsl:if test="normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)!='yesSpecific' or normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='yes' or normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no'">
<xsl:text>
rule {NBarBar option 3whI - QPs both sides, wh initial}
N'' = QP_1 N' QP_2
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_1 head type DP-initial&gt; = +
	&lt;QP_2 head type DP-final&gt;   = +
	&lt;QP_1 head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
	&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
	&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
	&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
	&lt;N'' option&gt; = 3whI
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)!='yesSpecific' or normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='yes' or normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no'">
<xsl:text>
rule {NBarBar option 3whF - QPs both sides, wh final}
N'' = QP_1 N' QP_2
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_1 head type DP-initial&gt; = +
	&lt;QP_2 head type DP-final&gt;   = +
	&lt;QP_1 head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
	&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
	&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
	&lt;N'' head type wh&gt; &lt;= &lt;QP_2 head type wh&gt;
	&lt;N'' option&gt; = 3whF
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)!='yesSpecific' or normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='yes' or normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no'">
<xsl:text>
rule {NBarBar option 3whagr - QPs both sides, wh agree}
N'' = QP_1 N' QP_2
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_1 head type DP-initial&gt; = +
	&lt;QP_2 head type DP-final&gt;   = +
	&lt;QP_1 head type wh&gt; = &lt;QP_2 head type wh&gt;
	&lt;QP_1 head type comma&gt; = -
	&lt;N' head type comma&gt; = -
	&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
	&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
	&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
	&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
	&lt;N'' option&gt; = 3whagr
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	


	<xsl:if test="normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no'">
<xsl:text>
		rule {NBarBar option 3whICLib - QPs both sides, wh initial, Class QP initial}
		N'' = Class QP_1 N' QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;Class head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' option&gt; = 3whICLib
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no'">
<xsl:text>
		rule {NBarBar option 3whICLia - QPs both sides, wh initial, QP Class initial}
		N'' = QP_1 Class N' QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' option&gt; = 3whICLia
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no'">
<xsl:text>
		rule {NBarBar option 3whICLfb - QPs both sides, wh initial, Class QP final}
		N'' = QP_1 N' Class QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' option&gt; = 3whICLfb
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no'">
<xsl:text>
		rule {NBarBar option 3whICLfa - QPs both sides, wh initial, QP Class final}
		N'' = QP_1 N' QP_2 Class 
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;QP_2 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;Class head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;Class head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' option&gt; = 3whICLfa
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 3whICLibfb - QPs both sides, wh initial, Class QP both}
		N'' = Class_1 QP_1 N' Class_2 QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class_1 head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class_2 head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;Class_2 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;Class_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' option&gt; = 3whICLibfb
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 3whICLiafb - QPs both sides, wh initial, Class internal to QP both}
		N'' = QP_1 Class_1 N' Class_2 QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class_1 head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class_2 head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' option&gt; = 3whICLiafb
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 3whICLibfa - QPs both sides, wh initial, Class external to QP both}
		N'' = Class_1 QP_1 N' QP_2 Class_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class_1 head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class_2 head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;QP_2 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;Class_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;Class_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;Class_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' option&gt; = 3whICLibfa
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 3whICLiafa - QPs both sides, wh initial, QP Class both}
		N'' = QP_1 Class_1 N' QP_2 Class_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class_1 head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class_2 head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;QP_2 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;Class_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;Class_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' option&gt; = 3whICLiafa
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no'">
<xsl:text>
		rule {NBarBar option 3whFCLib - QPs both sides, wh final, Class QP initial}
		N'' = Class QP_1 N' QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;Class head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_2 head type wh&gt;
		&lt;N'' option&gt; = 3whFCLib
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no'">
<xsl:text>
		rule {NBarBar option 3whFCLia - QPs both sides, wh final, QP Class initial}
		N'' = QP_1 Class N' QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_2 head type wh&gt;
		&lt;N'' option&gt; = 3whFCLia
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no'">
<xsl:text>
		rule {NBarBar option 3whFCLfb - QPs both sides, wh final, Class QP final}
		N'' = QP_1 N' Class QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_2 head type wh&gt;
		&lt;N'' option&gt; = 3whFCLfb
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no'">
<xsl:text>
		rule {NBarBar option 3whFCLfa - QPs both sides, wh final, QP Class final}
		N'' = QP_1 N' QP_2 Class 
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;QP_2 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;Class head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;Class head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_2 head type wh&gt;
		&lt;N'' option&gt; = 3whFCLfa
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 3whFCLibfb - QPs both sides, wh final, Class QP both}
		N'' = Class_1 QP_1 N' Class_2 QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class_1 head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class_2 head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;Class_2 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;Class_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_2 head type wh&gt;
		&lt;N'' option&gt; = 3whFCLibfb
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 3whFCLiafb - QPs both sides, wh final, Class internal to QP both}
		N'' = QP_1 Class_1 N' Class_2 QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class_1 head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class_2 head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;Class_2 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_2 head type wh&gt;
		&lt;N'' option&gt; = 3whFCLiafb
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 3whFCLibfa - QPs both sides, wh final, Class external to QP both}
		N'' = Class_1 QP_1 N' QP_2 Class_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class_1 head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class_2 head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;QP_2 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;Class_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;Class_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;Class_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_2 head type wh&gt;
		&lt;N'' option&gt; = 3whFCLibfa
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 3whFCLiafa - QPs both sides, wh final, QP Class both}
		N'' = QP_1 Class_2 N' QP_2 Class_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class_1 head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class_2 head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type comma&gt; = -
		&lt;QP_2 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;Class_2 head type comma&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;Class_2 head type suffix&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_2 head type wh&gt;
		&lt;N'' option&gt; = 3whFCLiafa
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no'">
<xsl:text>
		rule {NBarBar option 3whagrCLib - QPs both sides, wh agree, Class QP initial}
		N'' = Class QP_1 N' QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type wh&gt; = &lt;QP_2 head type wh&gt;
		&lt;QP_1 head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;Class head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' option&gt; = 3whagrCLib
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='no'">
<xsl:text>
		rule {NBarBar option 3whagrCLia - QPs both sides, wh agree, QP Class initial}
		N'' = QP_1 Class N' QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type wh&gt; = &lt;QP_2 head type wh&gt;
		&lt;QP_1 head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' option&gt; = 3whagrCLia
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no'">
<xsl:text>
		rule {NBarBar option 3whagrCLfb - QPs both sides, wh agree, Class QP final}
		N'' = QP_1 N' Class QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type wh&gt; = &lt;QP_2 head type wh&gt;
		&lt;QP_1 head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' option&gt; = 3whagrCLfb
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='no'">
<xsl:text>
		rule {NBarBar option 3whagrCLfa - QPs both sides, wh agree, QP Class final}
		N'' = QP_1 N' QP_2 Class
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type wh&gt; = &lt;QP_2 head type wh&gt;
		&lt;QP_1 head type comma&gt; = -
		&lt;QP_2 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;Class head type comma&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;Class head type suffix&gt;
		&lt;N'' option&gt; = 3whagrCLfa
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 3whagrCLibfb - QPs both sides, wh agree, Class QP both}
		N'' = Class_1 QP_1 N' Class_2 QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class_1 head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class_2 head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type wh&gt; = &lt;QP_2 head type wh&gt;
		&lt;QP_1 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;Class_2 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;Class_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' option&gt; = 3whagrCLibfb
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterNBeforeQ/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 3whagrCLiafb - QPs both sides, wh agree, Class internal to QP both}
		N'' = QP_1 Class_1 N' Class_2 QP_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class_1 head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class_2 head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type wh&gt; = &lt;QP_2 head type wh&gt;
		&lt;QP_1 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;Class_2 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;QP_2 head type comma&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
		&lt;N'' option&gt; = 3whagrCLiafb
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosBeforeBoth/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 3whagrCLibfa - QPs both sides, wh agree, Class external to QP both}
		N'' = Class_1 QP_1 N' QP_2 Class_2
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class_1 head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class_2 head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type wh&gt; = &lt;QP_2 head type wh&gt;
		&lt;QP_1 head type comma&gt; = -
		&lt;QP_2 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;Class_2 head type comma&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;Class_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;Class_2 head type suffix&gt;
		&lt;N'' option&gt; = 3whagrCLibfa
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/qpPosBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentQ)!='no' and normalize-space(//np/classifierSpecificQPosAfterQBeforeN/@checked)='yes' and normalize-space(//np/classifierSpecificQPosAfterBoth/@checked)='yes'">
<xsl:text>
		rule {NBarBar option 3whagrCLiafa - QPs both sides, wh agree, QP Class both}
		N'' = QP_1 Class_1 N' QP_2 Class_2 
		&lt;N'' head&gt; = &lt;N' head&gt;
		&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_1 head agr class&gt; = &lt;Class_1 head agr class&gt;
		&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
		&lt;QP_2 head agr class&gt; = &lt;Class_2 head agr class&gt;
		&lt;QP_1 head type DP-initial&gt; = +
		&lt;QP_2 head type DP-final&gt;   = +
		&lt;QP_1 head type wh&gt; = &lt;QP_2 head type wh&gt;
		&lt;QP_1 head type comma&gt; = -
		&lt;QP_2 head type comma&gt; = -
		&lt;Class_1 head type comma&gt; = -
		&lt;N' head type comma&gt; = -
		&lt;N'' head type comma&gt; &lt;= &lt;Class_2 head type comma&gt;
		&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
		&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
		&lt;N'' head type suffix&gt; &lt;= &lt;Class_2 head type suffix&gt;
		&lt;N'' option&gt; = 3whagrCLiafa
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	
	
	<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//typology/@classifier)!='yesSpecific' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//typology/@classifier)!='yesSpecific' or normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='yes' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='yes' or normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no'">
<xsl:text>
rule {NBar option 1a - AdjP initial, recursive}
N'_1 = AdjP N'_2
	&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
	&lt;AdjP head agr&gt; = &lt;N'_2 head agr&gt;
	&lt;AdjP head case&gt; = &lt;N'_2 head case&gt;
	&lt;AdjP head type DP-initial&gt; = +
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;AdjP head type clausal-comp&gt; = -
	&lt;AdjP head type comma&gt; = -
	&lt;N'_1 head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt; | N case marking can be overridden by AdjP, if AdjP also marked then another modifier required.
	&lt;N'_1 option&gt; = 1a
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//typology/@classifier)!='yesSpecific' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//typology/@classifier)!='yesSpecific' or normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='yes' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='yes' or normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='no'">
<xsl:text>
rule {NBar option 1b - AdjP final, recursive}
N'_1 = N'_2 AdjP
	&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
	&lt;AdjP head agr&gt; = &lt;N'_2 head agr&gt;
	&lt;AdjP head case&gt; = &lt;N'_2 head case&gt;
	&lt;AdjP head type DP-final&gt; = +
	&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;AdjP head type suffix copular&gt; = -
	&lt;AdjP head type clausal-comp&gt; = -
	&lt;N'_2 head type comma&gt; = -
	&lt;N'_1 head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
	&lt;N'_1 head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt; | N case marking can be overridden by AdjP, if AdjP also marked then another modifier required.
	&lt;N'_1 option&gt; = 1b
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes'">
<xsl:text>
		rule {NBar option 1aCL - Class AdjP initial, recursive}
		N'_1 = Class AdjP N'_2
		&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
		&lt;AdjP head agr&gt; = &lt;N'_2 head agr&gt;
		&lt;AdjP head agr class&gt; = &lt;Class head agr class&gt;
		&lt;AdjP head case&gt; = &lt;N'_2 head case&gt;
		&lt;AdjP head type DP-initial&gt; = +
		&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
		&lt;AdjP head type suffix copular&gt; = -
		&lt;AdjP head type clausal-comp&gt; = -
		&lt;AdjP head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N'_1 head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt; | N case marking can be overridden by AdjP, if AdjP also marked then another modifier required.
		&lt;N'_1 option&gt; = 1aCL
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosAfterAdjBeforeN/@checked)='yes'">
<xsl:text>
		rule {NBar option 1aCLf - AdjP Class initial, recursive}
		N'_1 = AdjP Class N'_2
		&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
		&lt;AdjP head agr&gt; = &lt;N'_2 head agr&gt;
		&lt;AdjP head agr class&gt; = &lt;Class head agr class&gt;
		&lt;AdjP head case&gt; = &lt;N'_2 head case&gt;
		&lt;AdjP head type DP-initial&gt; = +
		&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
		&lt;AdjP head type suffix copular&gt; = -
		&lt;AdjP head type clausal-comp&gt; = -
		&lt;AdjP head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N'_1 head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt; | N case marking can be overridden by AdjP, if AdjP also marked then another modifier required.
		&lt;N'_1 option&gt; = 1aCLf
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/adjBefore/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes'">
<xsl:text>
		rule {NBar option 1aCLo - Class final, AdjP initial, recursive}
		N'_1 = AdjP N'_2 Class
		&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
		&lt;AdjP head agr&gt; = &lt;N'_2 head agr&gt;
		&lt;AdjP head agr class&gt; = &lt;Class head agr class&gt;
		&lt;AdjP head case&gt; = &lt;N'_2 head case&gt;
		&lt;AdjP head type DP-initial&gt; = +
		&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
		&lt;AdjP head type suffix copular&gt; = -
		&lt;AdjP head type clausal-comp&gt; = -
		&lt;AdjP head type comma&gt; = -
		&lt;N'_2 head type comma&gt; = -
		&lt;N'_1 head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
		&lt;N'_1 head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt; | N case marking can be overridden by AdjP, if AdjP also marked then another modifier required.
		&lt;N'_1 head type suffix&gt; &lt;= &lt;Class head type suffix&gt;
		&lt;N'_1 option&gt; = 1aCLo
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosAfterNBeforeAdj/@checked)='yes'">
<xsl:text>
		rule {NBar option 1bCL - Class AdjP final, recursive}
		N'_1 = N'_2 Class AdjP
		&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
		&lt;AdjP head agr&gt; = &lt;N'_2 head agr&gt;
		&lt;AdjP head agr class&gt; = &lt;Class head agr class&gt;
		&lt;AdjP head case&gt; = &lt;N'_2 head case&gt;
		&lt;AdjP head type DP-final&gt; = +
		&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
		&lt;AdjP head type suffix copular&gt; = -
		&lt;AdjP head type clausal-comp&gt; = -
		&lt;N'_2 head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N'_1 head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
		&lt;N'_1 head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt; | N case marking can be overridden by AdjP, if AdjP also marked then another modifier required.
		&lt;N'_1 option&gt; = 1bCL
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosAfterBoth/@checked)='yes'">
<xsl:text>
		rule {NBar option 1bCLf - AdjP Class final, recursive}
		N'_1 = N'_2 AdjP Class 
		&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
		&lt;AdjP head agr&gt; = &lt;N'_2 head agr&gt;
		&lt;AdjP head agr class&gt; = &lt;Class head agr class&gt;
		&lt;AdjP head case&gt; = &lt;N'_2 head case&gt;
		&lt;AdjP head type DP-final&gt; = +
		&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
		&lt;AdjP head type suffix copular&gt; = -
		&lt;AdjP head type clausal-comp&gt; = -
		&lt;N'_2 head type comma&gt; = -
		&lt;AdjP head type comma&gt; = -
		&lt;N'_1 head type comma&gt; &lt;= &lt;Class head type comma&gt;
		&lt;N'_1 head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt; | N case marking can be overridden by AdjP, if AdjP also marked then another modifier required.
		&lt;N'_1 option&gt; = 1bCLf
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/adjAfter/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes' or normalize-space(//np/adjBoth/@checked)='yes' and normalize-space(//typology/@classifier)='yesSpecific' and normalize-space(//np/@classifierPresentAdj)!='no' and normalize-space(//np/classifierSpecificAdjPosBeforeBoth/@checked)='yes'">
<xsl:text>
		rule {NBar option 1bCLo - Class initial, AdjP final, recursive}
		N'_1 = Class N'_2 AdjP
		&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
		&lt;AdjP head agr&gt; = &lt;N'_2 head agr&gt;
		&lt;AdjP head agr class&gt; = &lt;Class head agr class&gt;
		&lt;AdjP head case&gt; = &lt;N'_2 head case&gt;
		&lt;AdjP head type DP-final&gt; = +
		&lt;AdjP head type prefix copular&gt; = -      | only in no V/Aux copulars
		&lt;AdjP head type suffix copular&gt; = -
		&lt;AdjP head type clausal-comp&gt; = -
		&lt;N'_2 head type comma&gt; = -
		&lt;Class head type comma&gt; = -
		&lt;N'_1 head type comma&gt; &lt;= &lt;AdjP head type comma&gt;
		&lt;N'_1 head type prefix&gt; &lt;= &lt;Class head type prefix&gt;
		&lt;N'_1 head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt; | N case marking can be overridden by AdjP, if AdjP also marked then another modifier required.
		&lt;N'_1 option&gt; = 1bCLo
	</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
	<xsl:if test="normalize-space(//np/@adjPPart)='yes'">
<xsl:text>
rule {NBar option 1aPart - participle initial, recursive}
N'_1 = VP N'_2
	&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
	&lt;VP head type participle&gt; = +
	&lt;VP head type comma&gt; = -
	&lt;N'_1 option&gt; = 1aPart
	</xsl:text>
</xsl:if>
	
		
	
	<xsl:if test="normalize-space(//np/@adjPPart)='yes'">
<xsl:text>
rule {NBar option 1bPart - participle final, recursive}
N'_1 = N'_2 VP 
	&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
	&lt;VP head type participle&gt; = +
	&lt;N'_2 head type comma&gt; = -
	&lt;N'_1 head type comma&gt; &lt;= &lt;VP head type comma&gt;
	&lt;N'_1 option&gt; = 1bPart
	</xsl:text>
</xsl:if>
	
		
	
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left'">
<xsl:text>
rule {NBar option 2a - left-most noun head}
N' = N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N' option&gt; = 2a
</xsl:text>
</xsl:if>
	
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@ppComp)='yes' and normalize-space(//np/@ppPos)='before' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@ppComp)='yes' and normalize-space(//np/@ppPos)='either'">
<xsl:text>
rule {NBar option 2b - left-most noun head, PP initial}
N' = PP N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;PP head&gt; == ~[case:genitive]
	&lt;N' option&gt; = 2b
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//typology/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//typology/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//typology/@case)='none' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//typology/@case)='none'">
<xsl:text>
rule {NBar option 2bgen - left-most noun head, genitive PP initial}
N' = PP N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;N' option&gt; = 2bgen
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	

	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 2berg - left-most noun head, ergative PP initial}
N' = PP N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
		&lt;N' option&gt; = 2berg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 2babs - left-most noun head, absolutive PP initial}
N' = PP N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;N' option&gt; = 2babs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compPP)='yes' and normalize-space(//np/@ppPos)='after' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compPP)='yes' and normalize-space(//np/@ppPos)='either'">
<xsl:text>
rule {NBar option 2c - left-most noun head, PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head type prefix poss&gt; = -
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N_1 head type comma&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;PP head&gt; == ~[case:genitive]
	&lt;N' option&gt; = 2c
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//typology/@case)='nominative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//typology/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//typology/@case)='none' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//typology/@case)='none'">
<xsl:text>
rule {NBar option 2cgen - left-most noun head, genitive PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type prefix poss&gt; = -
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N_1 head type comma&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 2cgen
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 2cerg - left-most noun head, ergative PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type prefix poss&gt; = -
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N_1 head type comma&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 2cerg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 2cabs - left-most noun head, absolutive PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type prefix poss&gt; = -
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N_1 head type comma&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 2cabs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	

	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left'">
<xsl:text>
rule {NBar option 3a - right-most noun head}
N' = ((N_3) N_2) N_1 
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N' option&gt; = 3a
</xsl:text>
</xsl:if>
	
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@ppComp)='yes' and normalize-space(//np/@ppPos)='before' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@ppComp)='yes' and normalize-space(//np/@ppPos)='either'">
<xsl:text>
rule {NBar option 3b - right-most noun head, PP initial}
N' = PP ((N_3) N_2) N_1 
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head type suffix poss&gt; = -
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;PP head&gt; == ~[case:genitive]
		&lt;N' option&gt; = 3b
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//typology/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//typology/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//typology/@case)='none' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//typology/@case)='none'">
<xsl:text>
rule {NBar option 3bgen - right-most noun head, genitive PP initial}
N' = PP ((N_3) N_2) N_1 
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type suffix poss&gt; = -
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;N' option&gt; = 3bgen
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 3berg - right-most noun head, ergative PP initial}
N' = PP ((N_3) N_2) N_1 
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type suffix poss&gt; = -
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;N' option&gt; = 3berg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 3babs - right-most noun head, absolutive PP initial}
N' = PP ((N_3) N_2) N_1 
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type suffix poss&gt; = -
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;PP head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;N' option&gt; = 3babs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@ppComp)='yes' and normalize-space(//np/@ppPos)='after' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@ppComp)='yes' and normalize-space(//np/@ppPos)='either'">
<xsl:text>
rule {NBar option 3c - right-most noun head, PP final} 
N' = ((N_3) N_2) N_1 PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;N_1 head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;PP head&gt; == ~[case:genitive]
	&lt;N' option&gt; = 3c
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//typology/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//typology/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//typology/@case)='none' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//typology/@case)='none'">
<xsl:text>
rule {NBar option 3cgen - right-most noun head, genitive PP final}
N' = ((N_3) N_2) N_1 PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;N_1 head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 3cgen
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 3cerg - right-most noun head, ergative PP final}
N' = ((N_3) N_2) N_1 PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;N_1 head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 3cerg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)!='left' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 3cabs - right-most noun head, absolutive PP final}
N' = ((N_3) N_2) N_1 PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;N_1 head type comma&gt; = -
	&lt;N_2 head type comma&gt; = -
	&lt;N_3 head type comma&gt; = -
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 3cabs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	

	
	<xsl:if test="normalize-space(//np/@comp)='no'">
<xsl:text>
rule {NBar option 4a - no compounds}
N' = N
	&lt;N' head&gt; = &lt;N head&gt;
		&lt;N' option&gt; = 4a
</xsl:text>
</xsl:if>
	
		
	
	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@ppComp)='yes' and normalize-space(//np/@ppPos)='before' or normalize-space(//np/@comp)='no' and normalize-space(//np/@ppComp)='yes' and normalize-space(//np/@ppPos)='either'">
<xsl:text>
rule {NBar option 4b - no compounds, PP initial}
N' = PP N
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head type comma&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;PP head&gt; == ~[case:genitive]
	&lt;N' option&gt; = 4b
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//typology/@case)='nominative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//typology/@case)='nominative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//typology/@case)='none' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//typology/@case)='none'">
<xsl:text>
rule {NBar option 4bgen - no compounds, genitive PP initial}
N' = PP N
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type comma&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
		&lt;N' option&gt; = 4bgen
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 4berg - no compounds, ergative PP initial}
N' = PP N
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type comma&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;N' option&gt; = 4berg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 4babs - no compounds, absolutive PP initial}
N' = PP N
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type comma&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;N' option&gt; = 4babs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@ppComp)='yes' and normalize-space(//np/@ppPos)='after' or normalize-space(//np/@comp)='no' and normalize-space(//np/@ppComp)='yes' and normalize-space(//np/@ppPos)='either'">
<xsl:text>
rule {NBar option 4e - no compounds, PP final}
N' = N PP
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N head type comma&gt; = -
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;PP head&gt; == ~[case:genitive]
	&lt;N' option&gt; = 4e
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//typology/@case)='nominative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//typology/@case)='nominative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//typology/@case)='none' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//typology/@case)='none'">
<xsl:text>
rule {NBar option 4egen - no compounds, genitive PP final}
N' = N PP
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N head type comma&gt; = -
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 4egen
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 4eerg - no compounds, ergative PP final}
N' = N PP
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N head type comma&gt; = -
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 4eerg
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@possNP)!='yesOnly' and normalize-space(//np/@possPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 4eabs - no compounds, absolutive PP final}
N' = N PP
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head infl valence&gt; = active	| passive by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N head type comma&gt; = -
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 4eabs
</xsl:text>
</xsl:if>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	<xsl:if test="normalize-space(//pron/@pronMod)='all' and normalize-space(//pron/@partitivePos)='after' or normalize-space(//pron/@pronMod)='all' and normalize-space(//pron/@partitivePos)='either'">
<xsl:text>
rule {NBar option 5a - pronoun,dem,quantifiers w/o head noun (optional PP after)}
N' = {Pron / Dem / Q / Num / Deg} (PP)
	&lt;N' head&gt; = &lt;Pron head&gt;
	&lt;Pron head type possessive&gt; = -  | these use DP rule "Pron"
	&lt;Pron head type reflexive&gt; = -
	&lt;Pron head type reciprocal&gt; = - 
	&lt;N' head&gt; = &lt;Dem head&gt;
	&lt;N' head&gt; = &lt;Q head&gt;
	&lt;N' head&gt; = &lt;Num head&gt;
	&lt;N' head&gt; = &lt;Deg head&gt;
	&lt;Deg head type quantifier&gt; = +
	&lt;Dem head type wh &gt; = -		| so "which" not separate
	&lt;PP head type stranded&gt; = -	| PP must have overt complement
	&lt;PP head type sentential&gt; = -	| sentential not within NP
|	&lt;PP head type partitive&gt; = +
	&lt;N' head type prefix poss&gt; = -  |can't be possessors
	&lt;N' head type suffix poss&gt; = -  |can't be possessors
	&lt;N' head type comma&gt; &lt;= &lt;PP head type comma&gt;
	&lt;N' option&gt; = 5a
</xsl:text>
</xsl:if>
	
		
		
		

		
		
		
	
	<xsl:if test="normalize-space(//pron/@pronMod)='all' and normalize-space(//pron/@partitivePos)='before' or normalize-space(//pron/@pronMod)='all' and normalize-space(//pron/@partitivePos)='either'">
<xsl:text>
rule {NBar option 5b - pronoun,dem,quantifiers w/o head noun (optional PP before)}
N' = (PP) {Pron / Dem / Q / Num / Deg}
	&lt;N' head&gt; = &lt;Pron head&gt;
	&lt;Pron head type possessive&gt; = -  | these use DP rule "Pron"
	&lt;Pron head type reflexive&gt; = -
	&lt;Pron head type reciprocal&gt; = - 
	&lt;N' head&gt; = &lt;Dem head&gt;
	&lt;N' head&gt; = &lt;Q head&gt;
	&lt;N' head&gt; = &lt;Num head&gt;
	&lt;N' head&gt; = &lt;Deg head&gt;
	&lt;Deg head type quantifier&gt; = +
	&lt;Dem head type wh &gt; = -		| so "which" not separate
	&lt;PP head type stranded&gt; = -	| PP must have overt complement
	&lt;PP head type sentential&gt; = -	| sentential not within NP
|	&lt;PP head type partitive&gt; = +
	&lt;N' head type prefix poss&gt; = -  |can't be possessors
	&lt;N' head type suffix poss&gt; = -  |can't be possessors
	&lt;PP head type comma&gt; = -
	&lt;N' option&gt; = 5b
</xsl:text>
</xsl:if>
	
		
		
		

		
		
		
	

	<xsl:if test="normalize-space(//pron/@classifierNoN)='yes'">
<xsl:text>
		rule {NBar option class - classifier used without a noun}
		N' = Class
		&lt;N' head&gt; = &lt;Class head&gt;
		&lt;N' option&gt; = class
	</xsl:text>
</xsl:if>
	
		
	
	<xsl:text>
rule {NBar option gerund - gerund (phrase) as NBar}
N' = VP
	&lt;N' head&gt; = &lt;VP head&gt;
	&lt;VP head type gerund&gt; = +
	&lt;N' option&gt; = gerund
</xsl:text>
</xsl:template>
</xsl:stylesheet>
