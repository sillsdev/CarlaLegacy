<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="advp">
	<xsl:text>
rule {AdvP option 0 - no modifiers}
AdvP = Adv'
	&lt;AdvP head&gt; = &lt;Adv' head&gt;
	&lt;AdvP option&gt; = 0
</xsl:text>
	<xsl:if test="normalize-space(//advp/@degree)='yes' and normalize-space(//advp/@degreePos)='before' or normalize-space(//advp/@degree)='yes' and normalize-space(//advp/@degreePos)='either' or normalize-space(//advp/@degree)='yes' and normalize-space(//advp/@degreePos)='eitherOrBoth' or normalize-space(//advp/@degree)='yes' and normalize-space(//advp/@degreePos)='beforeOrBoth'">
<xsl:text>
rule {AdvP option 1 - modifiers initial}
AdvP = Deg Adv'
	&lt;AdvP head&gt; = &lt;Adv' head&gt;
	&lt;Deg head type AdvP-initial&gt; = +
	&lt;Deg head type modifies_Adv&gt; = &lt;Adv' head type&gt;
	&lt;AdvP head type prefix&gt; &lt;= &lt;Deg head type prefix&gt;
	&lt;AdvP option&gt; = 1
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//advp/@degree)='yes' and normalize-space(//advp/@degreePos)='after' or normalize-space(//advp/@degree)='yes' and normalize-space(//advp/@degreePos)='either' or normalize-space(//advp/@degree)='yes' and normalize-space(//advp/@degreePos)='eitherOrBoth' or normalize-space(//advp/@degree)='yes' and normalize-space(//advp/@degreePos)='afterOrBoth'">
<xsl:text>
rule {AdvP option 2 - modifiers final}
AdvP = Adv' Deg
	&lt;AdvP head&gt; = &lt;Adv' head&gt;
	&lt;Deg head type AdvP-final&gt; = +
	&lt;Deg head type modifies_Adv&gt; = &lt;Adv' head type&gt;
	&lt;AdvP head type suffix&gt; &lt;= &lt;Deg head type suffix&gt;
	&lt;AdvP option&gt; = 2
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//advp/@degree)='yes' and normalize-space(//advp/@degreePos)='both' or normalize-space(//advp/@degree)='yes' and normalize-space(//advp/@degreePos)='beforeOrBoth' or normalize-space(//advp/@degree)='yes' and normalize-space(//advp/@degreePos)='eitherOrBoth' or normalize-space(//advp/@degree)='yes' and normalize-space(//advp/@degreePos)='afterOrBoth'">
<xsl:text>
rule {AdvP option 3 - modifiers both sides}
AdvP = Deg_1 Adv' Deg_2
	&lt;AdvP head&gt; = &lt;Adv' head&gt;
	&lt;Deg_1) head type modifies_Adv&gt; = &lt;Adv' head type&gt;
	&lt;Deg_2) head type modifies_Adv&gt; = &lt;Adv' head type&gt;
	&lt;Deg_1 head type AdvP-initial&gt; = +
	&lt;Deg_2 head type AdvP-final&gt;   = +
	&lt;AdvP head type prefix&gt; &lt;= &lt;Deg_1 head type prefix&gt;
	&lt;AdvP head type suffix&gt; &lt;= &lt;Deg_2 head type suffix&gt;
	&lt;AdvP option&gt; = 3
</xsl:text>
</xsl:if>

















	<xsl:text>
rule {AdvBar option 0 - no complements}
Adv' = Adv
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv' option&gt; = 0
</xsl:text>
	<xsl:if test="normalize-space(//advcl/@advOrNPPos)='after' or normalize-space(//advcl/@advOrNPPos)='either'">
<xsl:text>
rule {AdvBar option 1f - Adv complements final}
Adv' = Adv Adv_1
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type temporal&gt; = +
	&lt;Adv_1 head type temporal&gt; = +
	&lt;Adv head type takes_Adv&gt; = +
	&lt;Adv' head type suffix&gt; &lt;= &lt;Adv_1 head type suffix&gt;
	&lt;Adv' option&gt; = 1f
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//advcl/@advOrNPPos)='before' or normalize-space(//advcl/@advOrNPPos)='either'">
<xsl:text>
rule {AdvBar option 1i - Adv complements initial}
Adv' = Adv_1 Adv
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type temporal&gt; = +
	&lt;Adv_1 head type temporal&gt; = +
	&lt;Adv head type takes_Adv&gt; = +
	&lt;Adv' head type prefix&gt; &lt;= &lt;Adv_1 head type prefix&gt;
	&lt;Adv' option&gt; = 1i
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//advcl/@advOrNPPos)='after' or normalize-space(//advcl/@advOrNPPos)='either'">
<xsl:text>
rule {AdvBar option 2f - DP complements final}
Adv' = Adv DP
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type temporal&gt; = +
	&lt;DP head type temporal&gt; = +
	&lt;Adv head type takes_DP&gt; = +
	&lt;Adv' head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;Adv' option&gt; = 2f
</xsl:text>
</xsl:if>





	<xsl:if test="normalize-space(//advcl/@advOrNPPos)='before' or normalize-space(//advcl/@advOrNPPos)='either'">
<xsl:text>
rule {AdvBar option 2i - DP complements initial}
Adv' = DP Adv
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type temporal&gt; = +
	&lt;DP head type temporal&gt; = +
	&lt;Adv head type takes_DP&gt; = +
	&lt;Adv' head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;Adv' option&gt; = 2i
</xsl:text>
</xsl:if>





	<xsl:text>
rule {AdvBar option 3f - IP complements final}
Adv' = Adv IP
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type sentential&gt; = +
	&lt;Adv head embedded&gt; = &lt;IP head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head type root&gt; = -
	&lt;Adv' head type suffix&gt; &lt;= &lt;IP head type suffix&gt;
	&lt;Adv' option&gt; = 3f
</xsl:text>
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//typology/@wordOrder)='OSV'">
<xsl:text>
rule {AdvBar option 3i - IP complements initial}
Adv' = IP Adv
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type sentential&gt; = +
	&lt;Adv head embedded&gt; = &lt;IP head&gt;
	&lt;IP head type question&gt; = -
	&lt;IP head type relative&gt; = -
	&lt;IP head type root&gt; = -
	&lt;Adv' head type prefix&gt; &lt;= &lt;IP head type prefix&gt;
	&lt;Adv' option&gt; = 3i
</xsl:text>
</xsl:if>







	<xsl:text>
rule {AdvBar option 4f - CP complements final}
Adv' = Adv CP
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type sentential&gt; = +
	&lt;Adv head embedded&gt; = &lt;CP head&gt;
	&lt;CP head type question&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;CP head type root&gt; = -
	&lt;Adv' head type suffix&gt; &lt;= &lt;CP head type suffix&gt;
	&lt;Adv' option&gt; = 4f
</xsl:text>
	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' or normalize-space(//typology/@wordOrder)='OVS' or normalize-space(//typology/@wordOrder)='OSV'">
<xsl:text>
rule {AdvBar option 4i - CP complements initial}
Adv' = CP Adv
	&lt;Adv' head&gt; = &lt;Adv head&gt;
	&lt;Adv head type sentential&gt; = +
	&lt;Adv head embedded&gt; = &lt;CP head&gt;
	&lt;CP head type question&gt; = -
	&lt;CP head type relative&gt; = -
	&lt;CP head type root&gt; = -
	&lt;Adv' head type prefix&gt; &lt;= &lt;CP head type prefix&gt;
	&lt;Adv' option&gt; = 4i
</xsl:text>
</xsl:if>







</xsl:template>
</xsl:stylesheet>
