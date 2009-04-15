<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="np">

	<xsl:if test="normalize-space(//np/@possNounCaseChange)='no' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='no'">
<xsl:text>
rule {NP option 0 - not possessed}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -
	&lt;NP head possessor head agr&gt; = none
	&lt;NP option&gt; = 0
</xsl:text>
</xsl:if>







	<xsl:if test="normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
<xsl:text>
rule {NP option 0Asuf - not possessed, absolutive_suffix}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -
	&lt;NP head possessor head agr&gt; = none
	&lt;NP head type suffix absolutive&gt; = -   | if +, possessor required
	&lt;NP option&gt; = 0Asuf
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
<xsl:text>
rule {NP option 0Apre - not possessed, absolutive_prefix}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -
	&lt;NP head possessor head agr&gt; = none
	&lt;NP head type prefix absolutive&gt; = -   | if +, possessor required
	&lt;NP option&gt; = 0Apre
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
<xsl:text>
rule {NP option 0Esuf - not possessed, ergative_suffix}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -
	&lt;NP head possessor head agr&gt; = none
	&lt;NP head type suffix ergative&gt; = -   | if +, possessor required
	&lt;NP option&gt; = 0Esuf
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
<xsl:text>
rule {NP option 0Epre - not possessed, ergative_prefix}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -
	&lt;NP head possessor head agr&gt; = none
	&lt;NP head type prefix ergative&gt; = -   | if +, possessor required
	&lt;NP option&gt; = 0Epre
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='split' or normalize-space(//np/@adjpCaseAffix)='yesSuffix' and normalize-space(//np/@case)='nominative'">
<xsl:text>
rule {NP option 0Gsuf - not possessed, genitive_suffix}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -
	&lt;NP head possessor head agr&gt; = none
	&lt;NP head type suffix genitive&gt; = -   | if +, possessor required
	&lt;NP option&gt; = 0Gsuf
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possNounCaseChange)='yes' and normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='split' or normalize-space(//np/@adjpCaseAffix)='yesPrefix' and normalize-space(//np/@case)='nominative'">
<xsl:text>
rule {NP option 0Gpre - not possessed, genitive_prefix}
NP = {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head type possessed&gt; = -
	&lt;NP head possessor head agr&gt; = none
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
	&lt;NP head possessor&gt; == ~[agr:none]
	&lt;NP option&gt; = 0p
</xsl:text>
</xsl:if>



	<xsl:if test="normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive'">
<xsl:text>
rule {NP option 1a - no marker, possessor initial}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 1a
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
<xsl:text>
rule {NP option 1aErg - no marker, possessor initial, ergative}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 1aErg
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
<xsl:text>
rule {NP option 1aAbs - no marker, possessor initial, absolutive}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 1aAbs
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive'">
<xsl:text>
rule {NP option 1b - no marker, possessor final}
NP = {N'' / N'} {DP / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 1b
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
<xsl:text>
rule {NP option 1bErg - no marker, possessor final, ergative}
NP = {N'' / N'} {DP / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 1bErg
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)!='yesClitic' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
<xsl:text>
rule {NP option 1bAbs - no marker, possessor final, absolutive}
NP = {N'' / N'} {DP / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 1bAbs
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative'">
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
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 2a
</xsl:text>
</xsl:if>





















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 2aErg
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 2aAbs
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative'">
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
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 2b
</xsl:text>
</xsl:if>





















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
<xsl:text>
rule {NP option 2bErg - optional marker before, possessor final, ergative}
NP = {N'' / N'} {{(Poss) DP} / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt;&lt; = +
	&lt;NP head type ergative_PP&gt; = -  | to restrict possessor w/ erg PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 2bErg
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 2bAbs
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative'">
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
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 3a
</xsl:text>
</xsl:if>





















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 3aErg
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 3aAbs
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative'">
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
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 3b
</xsl:text>
</xsl:if>





















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 3bErg
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='no' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 3bAbs
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative'">
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
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 4a
</xsl:text>
</xsl:if>





















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
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
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 4aErg
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
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
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 4aAbs
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative'">
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
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 4b
</xsl:text>
</xsl:if>





















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
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
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 4bErg
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='before' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
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
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 4bAbs
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative'">
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
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 5a
</xsl:text>
</xsl:if>





















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
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
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 5aErg
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
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
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 5aAbs
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative'">
<xsl:text>
rule {NP option 5b - required marker after, possessor final}
NP = {N'' / N'} {{DP Poss} / Pron}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +
	&lt;NP head type genitive_PP&gt; = -  | to restrict possessor w/ gen PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 5b
</xsl:text>
</xsl:if>





















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
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
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 5bErg
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='yes' and normalize-space(//np/@possCliticRequired)='yes' and normalize-space(//np/@possCliticPossPos)='after' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
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
	&lt;DP head case&gt; = &lt;Poss head case&gt;
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 5bAbs
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative'">
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
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type prefix poss&gt; = +
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6ap
</xsl:text>
</xsl:if>













































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type prefix poss&gt; = +
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6apErg
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type prefix poss&gt; = +
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6apAbs
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative'">
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
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type suffix poss&gt; = +
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6as
</xsl:text>
</xsl:if>













































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type suffix poss&gt; = +
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6asErg
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
<xsl:text>
rule {NP option 6asAbs - poss_suffix, possessor initial, absolutive}
NP = {DP / Pron} {N'' / N'}
	&lt;NP head&gt; = &lt;N'' head&gt;
	&lt;NP head&gt; = &lt;N' head&gt;
	&lt;NP head possessor&gt; &lt;= &lt;DP&gt;
	&lt;NP head possessor&gt; &lt;= &lt;Pron&gt;
	&lt;NP head type possessed&gt; &lt;= +
	&lt;NP head type absolutive_PP&gt; = -  | to restrict possessor w/ abs PP
	&lt;DP head type quantifier&gt; = -
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type suffix poss&gt; = +
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6asAbs
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative'">
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
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type prefix poss&gt; = +
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6bp
</xsl:text>
</xsl:if>













































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type prefix poss&gt; = +
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6bpErg
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='prefix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type prefix poss&gt; = +
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6bpAbs
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@case)!='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@case)='ergative' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@case)='ergative'">
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
	&lt;DP   head case&gt; = genitive
	&lt;Pron head case&gt; = genitive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type suffix poss&gt; = +
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6bs
</xsl:text>
</xsl:if>













































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = ergative
	&lt;Pron head case&gt; = ergative
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type suffix poss&gt; = +
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6bsErg
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='ergative' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split' or normalize-space(//np/@possMarked)='yesClitic' and normalize-space(//np/@possCliticWord)='no' and normalize-space(//np/@possCliticAffix)='suffix' and normalize-space(//np/@possNounPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@case)='split'">
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
	&lt;DP   head case&gt; = absolutive
	&lt;Pron head case&gt; = absolutive
	&lt;Pron head type possessive&gt; = -    | not stand alone possessive
	&lt;DP head type suffix poss&gt; = +
	&lt;NP head type wh&gt; &lt;= &lt;Pron head type wh&gt;
	&lt;NP option&gt; = 6bsAbs
</xsl:text>
</xsl:if>


















































	<xsl:if test="normalize-space(//pron/@pronounCat)='NP' and normalize-space(//pron/@partitivePos)='after'">
<xsl:text>
rule {NP option 7a - pronoun,dem,quantifiers w/ optional partitive PP after}
NP = {Pron / Dem / Q / Num / Deg} (PP)
	&lt;NP head&gt; = &lt;Pron head&gt;
	&lt;Pron head type possessive&gt; = -  | these use DP rule "Pron"
	&lt;Pron head type reflexive&gt; = -
	&lt;Pron head type reciprocal&gt; = -
	&lt;NP head&gt; = &lt;Dem head&gt;
	&lt;NP head&gt; = &lt;Q head&gt;
	&lt;NP head&gt; = &lt;Num head&gt;
	&lt;NP head&gt; = &lt;Deg head&gt;
	&lt;Deg head type quantifier&gt; = +
	&lt;Q head type quantifier&gt; = +
	&lt;Num head type quantifier&gt; = +
	&lt;Dem head type wh &gt; = -		| so "which" not separate
	&lt;PP head type stranded&gt; = -	| PP must have overt complement
	&lt;PP head type sentential&gt; = -	| sentential not within NP
|	&lt;PP head type partitive&gt; = +
	&lt;NP head type prefix poss&gt; = -  |can't be possessors
	&lt;NP head type suffix poss&gt; = -  |can't be possessors
	&lt;Pron head&gt; == ~[case:genitive]
	&lt;NP option&gt; = 7a
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//pron/@pronounCat)='NP' and normalize-space(//pron/@partitivePos)='before'">
<xsl:text>
rule {NP option 7b - pronoun,dem,quantifiers w/ optional partitive PP before}
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
	&lt;Q head type quantifier&gt; = +
	&lt;Num head type quantifier&gt; = +
	&lt;Dem head type wh &gt; = -		| so "which" not separate
	&lt;PP head type stranded&gt; = -	| PP must have overt complement
	&lt;PP head type sentential&gt; = -	| sentential not within NP
|	&lt;PP head type partitive&gt; = +
	&lt;NP head type prefix poss&gt; = -  |can't be possessors
	&lt;NP head type suffix poss&gt; = -  |can't be possessors
	&lt;Pron head&gt; == ~[case:genitive]
	&lt;NP option&gt; = 7b
</xsl:text>
</xsl:if>






	<xsl:if test="normalize-space(//np/@qpPos)='before' or normalize-space(//np/@qpPos)='either' or normalize-space(//np/@qpPos)='eitherOrBoth' or normalize-space(//np/@qpPos)='beforeOrBoth'">
<xsl:text>
rule {NBarBar option 1 - QPs initial}
N'' = QP N'
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP head agr&gt; = &lt;N' head agr&gt;
	&lt;QP head type DP-initial&gt; = +
	&lt;N'' head type prefix&gt; &lt;= &lt;QP head type prefix&gt;
	&lt;N'' head type wh&gt; &lt;= &lt;QP head type wh&gt;
	&lt;N'' option&gt; = 1
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//np/@qpPos)='after' or normalize-space(//np/@qpPos)='either' or normalize-space(//np/@qpPos)='eitherOrBoth' or normalize-space(//np/@qpPos)='afterOrBoth'">
<xsl:text>
rule {NBarBar option 2 - QPs final}
N'' = N' QP
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP head agr&gt; = &lt;N' head agr&gt;
	&lt;QP head type DP-final&gt; = +
	&lt;N'' head type suffix&gt; &lt;= &lt;QP head type suffix&gt;
	&lt;N'' head type wh&gt; &lt;= &lt;QP head type wh&gt;
	&lt;N'' option&gt; = 2
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/@qpPos)='both' or normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/@qpPos)='afterOrBoth' or normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/@qpPos)='eitherOrBoth' or normalize-space(//q/@whDegQPos)='before' and normalize-space(//np/@qpPos)='beforeOrBoth'">
<xsl:text>
rule {NBarBar option 3whI - QPs both sides, wh initial}
N'' = QP_1 N' QP_2
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_1 head type DP-initial&gt; = +
	&lt;QP_2 head type DP-final&gt;   = +
	&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
	&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
	&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
	&lt;N'' option&gt; = 3whI
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/@qpPos)='both' or normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/@qpPos)='afterOrBoth' or normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/@qpPos)='eitherOrBoth' or normalize-space(//q/@whDegQPos)='after' and normalize-space(//np/@qpPos)='beforeOrBoth'">
<xsl:text>
rule {NBarBar option 3whF - QPs both sides, wh final}
N'' = QP_1 N' QP_2
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_1 head type DP-initial&gt; = +
	&lt;QP_2 head type DP-final&gt;   = +
	&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
	&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
	&lt;N'' head type wh&gt; &lt;= &lt;QP_2 head type wh&gt;
	&lt;N'' option&gt; = 3whF
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/@qpPos)='both' or normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/@qpPos)='afterOrBoth' or normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/@qpPos)='eitherOrBoth' or normalize-space(//q/@whDegQPos)='agree' and normalize-space(//np/@qpPos)='beforeOrBoth'">
<xsl:text>
rule {NBarBar option 3whagr - QPs both sides, wh agree}
N'' = QP_1 N' QP_2
	&lt;N'' head&gt; = &lt;N' head&gt;
	&lt;QP_1 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_2 head agr&gt; = &lt;N' head agr&gt;
	&lt;QP_1 head type DP-initial&gt; = +
	&lt;QP_2 head type DP-final&gt;   = +
	&lt;QP_1 head type wh&gt; = &lt;QP_2 head type wh&gt;
	&lt;N'' head type wh&gt; &lt;= &lt;QP_1 head type wh&gt;
	&lt;N'' head type prefix&gt; &lt;= &lt;QP_1 head type prefix&gt;
	&lt;N'' head type suffix&gt; &lt;= &lt;QP_2 head type suffix&gt;
	&lt;N'' option&gt; = 3whagr
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//np/@adjpPos)='before' or normalize-space(//np/@adjpPos)='either'">
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
	&lt;N'_1 head type prefix&gt; &lt;= &lt;AdjP head type prefix&gt; | N case marking can be overridden by AdjP, if AdjP also marked then another modifier required.
	&lt;N' option&gt; = 1a
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//np/@adjpPos)='after' or normalize-space(//np/@adjpPos)='either'">
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
	&lt;N'_1 head type suffix&gt; &lt;= &lt;AdjP head type suffix&gt; | N case marking can be overridden by AdjP, if AdjP also marked then another modifier required.
	&lt;N' option&gt; = 1b
</xsl:text>
</xsl:if>





	<xsl:text>
rule {NBar option 1aPart - participle initial, recursive}
N'_1 = VP N'_2
	&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
	&lt;VP head type participle&gt; = +
	&lt;N' option&gt; = 1aPart
</xsl:text>
	<xsl:text>
rule {NBar option 1bPart - participle final, recursive}
N'_1 = N'_2 VP
	&lt;N'_1 head&gt; = &lt;N'_2 head&gt;
	&lt;VP head type participle&gt; = +
	&lt;N' option&gt; = 1bPart
</xsl:text>
	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left'">
<xsl:text>
rule {NBar option 2a - left-most noun head}
N' = N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
		&lt;N' option&gt; = 2a
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='none' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none'">
<xsl:text>
rule {NBar option 2b - left-most noun head, PP initial}
N' = PP N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;PP head&gt; == ~[case:genitive]
		&lt;N' option&gt; = 2b
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='none' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none'">
<xsl:text>
rule {NBar option 2bgen - left-most noun head, genitive PP initial}
N' = PP N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
		&lt;N' option&gt; = 2bgen
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 2bnoterg - left-most noun head, PP initial}
N' = PP N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;PP head&gt; == ~[case:ergative]
		&lt;N' option&gt; = 2bnoterg
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 2berg - left-most noun head, ergative PP initial}
N' = PP N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
		&lt;N' option&gt; = 2berg
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 2bnotabs - left-most noun head, PP initial}
N' = PP N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;PP head&gt; == ~[case:absolutive]
		&lt;N' option&gt; = 2bnotabs
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 2babs - left-most noun head, absolutive PP initial}
N' = PP N_1 (N_2 (N_3))
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
		&lt;N' option&gt; = 2babs
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix'">
<xsl:text>
rule {NBar option 2c - left-most noun head, PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head type prefix poss&gt; = -
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;PP head&gt; == ~[case:genitive]
	&lt;N' option&gt; = 2c
</xsl:text>
</xsl:if>





































































































































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix'">
<xsl:text>
rule {NBar option 2cs - left-most noun head, poss_suffix, PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;PP head&gt; == ~[case:genitive]
	&lt;N' option&gt; = 2cs
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix'">
<xsl:text>
rule {NBar option 2cgen - left-most noun head, genitive PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type prefix poss&gt; = -
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N' option&gt; = 2cgen
</xsl:text>
</xsl:if>





































































































































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix'">
<xsl:text>
rule {NBar option 2cgens - left-most noun head, poss_suffix, genitive PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 2cgens
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix'">
<xsl:text>
rule {NBar option 2cnoterg - left-most noun head, PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head type prefix poss&gt; = -
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;PP head&gt; == ~[case:ergative]
	&lt;N' option&gt; = 2cnoterg
</xsl:text>
</xsl:if>













































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix'">
<xsl:text>
rule {NBar option 2cnotergs - left-most noun head, poss_suffix, PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;PP head&gt; == ~[case:ergative]
	&lt;N' option&gt; = 2cnotergs
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix'">
<xsl:text>
rule {NBar option 2cerg - left-most noun head, ergative PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type prefix poss&gt; = -
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
		&lt;N' option&gt; = 2cerg
</xsl:text>
</xsl:if>













































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix'">
<xsl:text>
rule {NBar option 2cergs - left-most noun head, poss_suffix, ergative PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 2cergs
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix'">
<xsl:text>
rule {NBar option 2cnotabs - left-most noun head, PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head type prefix poss&gt; = -
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;PP head&gt; == ~[case:absolutive]
	&lt;N' option&gt; = 2cnotabs
</xsl:text>
</xsl:if>













































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix'">
<xsl:text>
rule {NBar option 2cnotabss - left-most noun head, poss_suffix, PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;PP head&gt; == ~[case:absolutive]
	&lt;N' option&gt; = 2cnotabss
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix'">
<xsl:text>
rule {NBar option 2cabs - left-most noun head, absolutive PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type prefix poss&gt; = -
	&lt;N_2 head type prefix poss&gt; = -
	&lt;N_3 head type prefix poss&gt; = -
	&lt;N' option&gt; = 2cabs
</xsl:text>
</xsl:if>













































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='left' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix'">
<xsl:text>
rule {NBar option 2cabss - left-most noun head, poss_suffix, absolutive PP final}
N' = N_1 (N_2 (N_3)) PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 2cabss
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right'">
<xsl:text>
rule {NBar option 3a - right-most noun head}
N' = ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
		&lt;N' option&gt; = 3a
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix'">
<xsl:text>
rule {NBar option 3b - right-most noun head, PP initial}
N' = PP ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head type suffix poss&gt; = -
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;PP head&gt; == ~[case:genitive]
		&lt;N' option&gt; = 3b
</xsl:text>
</xsl:if>





































































































































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix'">
<xsl:text>
rule {NBar option 3bp - right-most noun head, poss_prefix, PP initial}
N' = PP ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;PP head&gt; == ~[case:genitive]
		&lt;N' option&gt; = 3bp
</xsl:text>
</xsl:if>









































































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix'">
<xsl:text>
rule {NBar option 3bgen - right-most noun head, genitive PP initial}
N' = PP ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type suffix poss&gt; = -
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
		&lt;N' option&gt; = 3bgen
</xsl:text>
</xsl:if>

























































































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix'">
<xsl:text>
rule {NBar option 3bgenp - right-most noun head, poss_prefix, genitive PP initial}
N' = PP ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
		&lt;N' option&gt; = 3bgenp
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix'">
<xsl:text>
rule {NBar option 3bnoterg - right-most noun head, PP initial}
N' = PP ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head type suffix poss&gt; = -
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;PP head&gt; == ~[case:ergative]
		&lt;N' option&gt; = 3bnoterg
</xsl:text>
</xsl:if>













































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix'">
<xsl:text>
rule {NBar option 3bnotergp - right-most noun head, poss_prefix, PP initial}
N' = PP ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;PP head&gt; == ~[case:ergative]
		&lt;N' option&gt; = 3bnotergp
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix'">
<xsl:text>
rule {NBar option 3berg - right-most noun head, ergative PP initial}
N' = PP ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type suffix poss&gt; = -
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
		&lt;N' option&gt; = 3berg
</xsl:text>
</xsl:if>













































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix'">
<xsl:text>
rule {NBar option 3bergp - right-most noun head, poss_prefix, ergative PP initial}
N' = PP ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
		&lt;N' option&gt; = 3bergp
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix'">
<xsl:text>
rule {NBar option 3bnotabs - right-most noun head, PP initial}
N' = PP ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head type suffix poss&gt; = -
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;PP head&gt; == ~[case:absolutive]
		&lt;N' option&gt; = 3bnotabs
</xsl:text>
</xsl:if>













































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix'">
<xsl:text>
rule {NBar option 3bnotabsp - right-most noun head, poss_prefix, PP initial}
N' = PP ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;PP head&gt; == ~[case:absolutive]
		&lt;N' option&gt; = 3bnotabsp
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)!='yesAffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='suffix'">
<xsl:text>
rule {NBar option 3babs - right-most noun head, absolutive PP initial}
N' = PP ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;PP head type suffix poss&gt; = -
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
		&lt;N' option&gt; = 3babs
</xsl:text>
</xsl:if>













































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive' and normalize-space(//np/@possMarked)='yesAffix' and normalize-space(//np/@possCliticAffix)='prefix'">
<xsl:text>
rule {NBar option 3babsp - right-most noun head, poss_prefix, absolutive PP initial}
N' = PP ((N_3) N_2) N_1
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
		&lt;N' option&gt; = 3babsp
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='none' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none'">
<xsl:text>
rule {NBar option 3c - right-most noun head, PP final}
N' = ((N_3) N_2) N_1 PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;PP head&gt; == ~[case:genitive]
	&lt;N' option&gt; = 3c
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative'">
<xsl:text>
rule {NBar option 3cgen - right-most noun head, genitive PP final}
N' = ((N_3) N_2) N_1 PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 3cgen
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 3cnoterg - right-most noun head, PP final}
N' = ((N_3) N_2) N_1 PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;PP head&gt; == ~[case:ergative]
	&lt;N' option&gt; = 3cnoterg
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 3cerg - right-most noun head, ergative PP final}
N' = ((N_3) N_2) N_1 PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 3cerg
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 3cnotabs - right-most noun head, PP final}
N' = ((N_3) N_2) N_1 PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;PP head&gt; == ~[case:absolutive]
	&lt;N' option&gt; = 3cnotabs
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='yes' and normalize-space(//np/@compHead)='right' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 3cabs - right-most noun head, absolutive PP final}
N' = ((N_3) N_2) N_1 PP
	&lt;N' head&gt; = &lt;N_1 head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N_2 head type suffix poss&gt; = -
	&lt;N_3 head type suffix poss&gt; = -
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



	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='none' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none'">
<xsl:text>
rule {NBar option 4b - no compounds, PP initial}
N' = PP N
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;PP head&gt; == ~[case:genitive]
		&lt;N' option&gt; = 4b
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative'">
<xsl:text>
rule {NBar option 4bgen - no compounds, genitive PP initial}
N' = PP N
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
		&lt;N' option&gt; = 4bgen
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 4bnoterg - no compounds, PP initial}
N' = PP N
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;PP head&gt; == ~[case:ergative]
		&lt;N' option&gt; = 4bnoterg
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 4berg - no compounds, ergative PP initial}
N' = PP N
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
		&lt;N' option&gt; = 4berg
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 4bnotabs - no compounds, PP initial}
N' = PP N
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
	&lt;PP head&gt; == ~[case:absolutive]
		&lt;N' option&gt; = 4bnotabs
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='before' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 4babs - no compounds, absolutive PP initial}
N' = PP N
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N' head type prefix&gt; &lt;= &lt;PP head type prefix&gt;
		&lt;N' option&gt; = 4babs
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='none' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='none'">
<xsl:text>
rule {NBar option 4e - no compounds, PP final}
N' = N PP
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N' head type suffix poss&gt; &lt;= &lt;PP head type suffix poss&gt;
	&lt;PP head&gt; == ~[case:genitive]
	&lt;N' option&gt; = 4e
</xsl:text>
</xsl:if>





































	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='genitive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@case)='nominative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@case)='nominative'">
<xsl:text>
rule {NBar option 4egen - no compounds, genitive PP final}
N' = N PP
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = genitive
	&lt;N' head type genitive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 4egen
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 4enoterg - no compounds, PP final}
N' = N PP
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;PP head&gt; == ~[case:ergative]
	&lt;N' option&gt; = 4enoterg
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='ergative' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='ergative'">
<xsl:text>
rule {NBar option 4eerg - no compounds, ergative PP final}
N' = N PP
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = ergative
	&lt;N' head type ergative_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 4eerg
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 4enotabs - no compounds, PP final}
N' = N PP
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;PP head&gt; == ~[case:absolutive]
	&lt;N' option&gt; = 4enotabs
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='after' and normalize-space(//np/@possCaseErg)='absolutive' or normalize-space(//np/@comp)='no' and normalize-space(//np/@compHeadPPPos)='either' and normalize-space(//np/@possCaseErg)='absolutive'">
<xsl:text>
rule {NBar option 4eabs - no compounds, absolutive PP final}
N' = N PP
	&lt;N' head&gt; = &lt;N head&gt;
	&lt;PP head type stranded&gt; = -	| P must have overt complement
	&lt;PP head type passive&gt; = -	| by-phrase not within NP
	&lt;PP head type sentential&gt; = -	| sentential not within NP
	&lt;PP head case&gt; = absolutive
	&lt;N' head type absolutive_PP&gt; = +  | to restrict cooccurrence w/ possessor
	&lt;N' head type suffix&gt; &lt;= &lt;PP head type suffix&gt;
	&lt;N' option&gt; = 4eabs
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//pron/@pronounCat)='N' and normalize-space(//pron/@partitive)='after'">
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
	&lt;Pron head&gt; == ~[case:genitive]
	&lt;N' option&gt; = 5a
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//pron/@pronounCat)='N' and normalize-space(//pron/@partitive)='before'">
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
	&lt;Pron head&gt; == ~[case:genitive]
	&lt;N' option&gt; = 5b
</xsl:text>
</xsl:if>





	<xsl:text>
rule {NBar option Part - participle (phrase) as NBar}
N' = VP
	&lt;N' head&gt; = &lt;VP head&gt;
	&lt;VP head type participle&gt; = +
</xsl:text>
</xsl:template>
</xsl:stylesheet>
