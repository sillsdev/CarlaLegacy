<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="adjp">
<xsl:if test="normalize-space(//coord/@conjWord)!='no'">
<xsl:text>
rule {AdjP option conj - conjoined AdjPs}
AdjP = (InitConj) AdjP_1 Conj AdjP_2
	&lt;AdjP head&gt; = &lt;AdjP_2 head&gt;
	&lt;AdjP conjoined&gt; = +
	&lt;AdjP_1 conjoined&gt; = -	|limit recursion
	&lt;AdjP head type clausal-comp&gt; = -
	&lt;AdjP head type prefix&gt; &lt;= &lt;AdjP_1 head type prefix&gt;
	&lt;AdjP option&gt; = conj
</xsl:text>
</xsl:if>



   <xsl:if test="normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/@conjPos)='before' or normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/@conjPos)='either'">
<xsl:text>
	  rule {AdjP option conjPrefix - conjoined AdjPs}
	  AdjP = AdjP_1  AdjP_2
	  &lt;AdjP head&gt; = &lt;AdjP_2 head&gt;
	  &lt;AdjP conjoined&gt; = +
	  &lt;AdjP_1 conjoined&gt; = -	|limit recursion
	  &lt;AdjP head type clausal-comp&gt; = -
	  &lt;AdjP_2 head type prefix conj&gt; = +
	  &lt;AdjP head type prefix&gt; &lt;= &lt;AdjP_1 head type prefix&gt;
	  &lt;AdjP option&gt; = conjPrefix
   </xsl:text>
</xsl:if>









   <xsl:if test="normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/@conjPos)='after' or normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/@conjPos)='either'">
<xsl:text>
	  rule {AdjP option conjSuffix - conjoined AdjPs}
	  AdjP = AdjP_1  AdjP_2
	  &lt;AdjP head&gt; = &lt;AdjP_2 head&gt;
	  &lt;AdjP conjoined&gt; = +
	  &lt;AdjP_1 conjoined&gt; = -	|limit recursion
	  &lt;AdjP head type clausal-comp&gt; = -
	  &lt;AdjP_1 head type suffix conj&gt; = +
	  &lt;AdjP head type prefix&gt; &lt;= &lt;AdjP_1 head type prefix&gt;
	  &lt;AdjP option&gt; = conjSuffix
   </xsl:text>
</xsl:if>









   <xsl:if test="normalize-space(//coord/@conjWord)!='yes' and normalize-space(//coord/@conjPos)='other' or normalize-space(//coord/@noConj)='yes'">
<xsl:text>
	  rule {AdjP option conjNone - conjoined AdjPs}
	  AdjP = AdjP_1  AdjP_2
	  &lt;AdjP head&gt; = &lt;AdjP_2 head&gt;
	  &lt;AdjP conjoined&gt; = +
	  &lt;AdjP_1 conjoined&gt; = -	|limit recursion
	  &lt;AdjP head type clausal-comp&gt; = -
	  &lt;AdjP_2 head type prefix conj&gt; = -
	  &lt;AdjP_1 head type suffix conj&gt; = -
	  &lt;AdjP_1 head type comma&gt; = -
	  &lt;AdjP head type prefix&gt; &lt;= &lt;AdjP_1 head type prefix&gt;
	  &lt;AdjP option&gt; = conjNone
   </xsl:text>
</xsl:if>







   <xsl:text>
rule {AdjP option part - participle phrases}
AdjP = VP
			&lt;AdjP head&gt; = &lt;VP head&gt;
			&lt;VP head type participle&gt; = +
			&lt;AdjP head type comma&gt; &lt;= &lt;VP head type comma&gt;
			&lt;AdjP option&gt; = part
   </xsl:text>
<xsl:text>
rule {AdjP option 0 - no modifiers}
AdjP = Adj'
	&lt;AdjP head&gt; = &lt;Adj' head&gt;
	&lt;AdjP option&gt; = 0
</xsl:text>
<xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/@degreePos)='before' or normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/@degreePos)='either' or normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/@degreePos)='eitherOrBoth' or normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/@degreePos)='beforeOrBoth'">
<xsl:text>
rule {AdjP option 1d - degree modifiers initial}
AdjP = Deg Adj'
	&lt;AdjP head&gt; = &lt;Adj' head&gt;
	&lt;Deg head type modifies_Adj&gt; = +
	&lt;Deg head type AdjP-initial&gt;   = +
	&lt;Deg head type comma&gt; = -
	&lt;AdjP head type prefix&gt; &lt;= &lt;Deg head type prefix&gt;
	&lt;AdjP option&gt; = 1d
</xsl:text>
</xsl:if>

















<xsl:if test="normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)='before' or normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)='either' or normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)='eitherOrBoth' or normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)='beforeOrBoth'">
<xsl:text>
rule {AdjP option 1m - degree or AdvP modifiers initial}
AdjP = {Deg / AdvP} Adj'
	&lt;AdjP head&gt; = &lt;Adj' head&gt;
	&lt;Deg head type modifies_Adj&gt; = +
	&lt;AdvP head type manner&gt;      = +
	&lt;Deg head type AdjP-initial&gt;   = +
	&lt;AdvP head type AdjP-initial&gt;   = +
	&lt;Deg head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;AdjP head type prefix&gt; &lt;= &lt;Deg head type prefix&gt;
	&lt;AdjP head type prefix&gt; &lt;= &lt;AdvP head type prefix&gt;
	&lt;AdjP option&gt; = 1m
</xsl:text>
</xsl:if>

















<xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/@degreePos)='after' or normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/@degreePos)='either' or normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/@degreePos)='eitherOrBoth' or normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/@degreePos)='afterOrBoth'">
<xsl:text>
rule {AdjP option 2d - degree modifiers final}
AdjP = Adj' Deg
	&lt;AdjP head&gt; = &lt;Adj' head&gt;
	&lt;Deg head type modifies_Adj&gt; = +
	&lt;Deg head type AdjP-final&gt;   = +
	&lt;Adj' head type comma&gt; = -
	&lt;AdjP head type comma&gt; &lt;= &lt;Deg head type comma&gt;
	&lt;AdjP head type suffix&gt; &lt;= &lt;Deg head type suffix&gt;
	&lt;AdjP option&gt; = 2d
</xsl:text>
</xsl:if>

















<xsl:if test="normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)='after' or normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)='either' or normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)='eitherOrBoth' or normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//advp/@mannerPos)='afterOrBoth'">
<xsl:text>
rule {AdjP option 2m - degree or AdvP modifiers final}
AdjP = Adj' {Deg / AdvP}
	&lt;AdjP head&gt; = &lt;Adj' head&gt;
	&lt;Deg head type modifies_Adj&gt; = +
	&lt;AdvP head type manner&gt;      = +
	&lt;Deg head type AdjP-final&gt;   = +
	&lt;AdvP head type AdjP-final&gt;   = +
	&lt;Adj' head type comma&gt; = -
	&lt;AdjP head type comma&gt; &lt;= &lt;Deg head type comma&gt;
	&lt;AdjP head type comma&gt; &lt;= &lt;AdvP head type comma&gt;
	&lt;AdjP head type suffix&gt; &lt;= &lt;Deg head type suffix&gt;
	&lt;AdjP head type suffix&gt; &lt;= &lt;AdvP head type suffix&gt;
	&lt;AdjP option&gt; = 2m
</xsl:text>
</xsl:if>

















<xsl:if test="normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/@degreePos)='both' or normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/@degreePos)='beforeOrBoth' or normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/@degreePos)='eitherOrBoth' or normalize-space(//adjp/@modifiers)='yes' and normalize-space(//adjp/@degreePos)='afterOrBoth'">
<xsl:text>
rule {AdjP option 3d - degree modifiers both sides}
AdjP = Deg_1 Adj' Deg_2
	&lt;AdjP head&gt; = &lt;Adj' head&gt;
	&lt;Deg_1 head type modifies_Adj&gt; = +
	&lt;Deg_2 head type modifies_Adj&gt; = +
	&lt;Deg_1 head type AdjP-initial&gt; = +
	&lt;Deg_2 head type AdjP-final&gt;   = +
	&lt;Deg_1 head type comma&gt; = -
	&lt;Adj' head type comma&gt; = -
	&lt;AdjP head type comma&gt; &lt;= &lt;Deg_2 head type comma&gt;
	&lt;AdjP head type prefix&gt; &lt;= &lt;Deg_1 head type prefix&gt;
	&lt;AdjP head type suffix&gt; &lt;= &lt;Deg_2 head type suffix&gt;
	&lt;AdjP option&gt; = 3d
</xsl:text>
</xsl:if>

















<xsl:if test="normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)='both' or normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)='afterOrBoth' or normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)='eitherOrBoth' or normalize-space(//adjp/@modifiers)='yesManner' and normalize-space(//adjp/@mannerPos)='beforeOrBoth'">
<xsl:text>
rule {AdjP option 3m - degree or AdvP modifiers both sides}
AdjP = {Deg_1 / AdvP_1} Adj' {Deg_2 / AdvP_2}
	&lt;AdjP head&gt; = &lt;Adj' head&gt;
	&lt;AdvP_1 head type manner&gt;      = +
	&lt;AdvP_2 head type manner&gt;      = +
	&lt;Deg_1 head type modifies_Adj&gt; = +
	&lt;Deg_2 head type modifies_Adj&gt; = +
	&lt;Deg_1 head type AdjP-initial&gt; = +
	&lt;Deg_2 head type AdjP-final&gt;   = +
	&lt;Deg_1 head type comma&gt; = -
	&lt;AdvP_1 head type comma&gt; = -
	&lt;Adj' head type comma&gt; = -
	&lt;AdjP head type comma&gt; &lt;= &lt;Deg_2 head type comma&gt;
	&lt;AdjP head type comma&gt; &lt;= &lt;AdvP_2 head type comma&gt;
	&lt;AdjP head type prefix&gt; &lt;= &lt;Deg_1 head type prefix&gt;
	&lt;AdjP head type suffix&gt; &lt;= &lt;Deg_2 head type suffix&gt;
	&lt;AdjP head type prefix&gt; &lt;= &lt;AdvP_1 head type prefix&gt;
	&lt;AdjP head type suffix&gt; &lt;= &lt;AdvP_2 head type suffix&gt;
	&lt;AdjP option&gt; = 3m
</xsl:text>
</xsl:if>


















<xsl:text>
rule {Adj' option 0 - no complements}
Adj' = Adj
	&lt;Adj' head&gt; = &lt;Adj head&gt;
	&lt;Adj' head type clausal-comp&gt; = -
	&lt;Adj' option&gt; = 0
</xsl:text>

	<xsl:text>
rule {Adj' option 1a - Adj initial, sentential complement}
Adj' = Adj {CP / IP}
	&lt;Adj' head&gt; = &lt;Adj head&gt;
	&lt;Adj embedded&gt; = &lt;CP&gt;
	&lt;Adj embedded&gt; = &lt;IP&gt;
	&lt;CP head type root&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head type comp&gt; = -
	&lt;IP head type prefix comp&gt; = - | uses CP
	&lt;IP head type suffix comp&gt; = -
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;Adj head type sentential&gt; = +
	&lt;Adj' head type clausal-comp&gt; &lt;= +
	&lt;Adj head type comma&gt; = -
	&lt;Adj' head type comma&gt; &lt;= &lt;CP head type comma&gt;
	&lt;Adj' head type comma&gt; &lt;= &lt;IP head type comma&gt;
	&lt;Adj' head type suffix&gt; &lt;= &lt;CP head type suffix&gt;
	&lt;Adj' head type suffix&gt; &lt;= &lt;IP head type suffix&gt;
	&lt;Adj' option&gt; = 1a
</xsl:text>
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//typology/@wordOrder)='OSV'">
<xsl:text>
rule {Adj' option 1b - Adj final, sentential complement}
Adj' = {CP / IP} Adj
	&lt;Adj' head&gt; = &lt;Adj head&gt;
	&lt;Adj embedded&gt; = &lt;CP&gt;
	&lt;Adj embedded&gt; = &lt;IP&gt;
	&lt;CP head type root&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head type comp&gt; = -
	&lt;IP head type prefix comp&gt; = - | uses CP
	&lt;IP head type suffix comp&gt; = -
	&lt;IP head type root&gt; = -
	&lt;IP head type question&gt; = -
	&lt;Adj head type sentential&gt; = +
	&lt;Adj' head type clausal-comp&gt; &lt;= +
	&lt;CP head type comma&gt; = -
	&lt;IP head type comma&gt; = -
	&lt;Adj' head type prefix&gt; &lt;= &lt;CP head type prefix&gt;
	&lt;Adj' head type prefix&gt; &lt;= &lt;IP head type prefix&gt;
	&lt;Adj' option&gt; = 1b
</xsl:text>
</xsl:if>








</xsl:template>
</xsl:stylesheet>
