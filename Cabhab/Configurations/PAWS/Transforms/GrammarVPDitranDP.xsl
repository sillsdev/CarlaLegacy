<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="vpditrandp">

	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7a - V initial, ditransitive with DP (accusative object), DO,IO order}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP option&gt; = 7a
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7aNegObjVerbRequired - V initial, ditransitive with DP (accusative object), DO,IO order}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7aNegObjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7aIO - V initial, ditransitive with DP (accusative object), IO,DO order}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7aIO
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7aIONegObjVerbRequired - V initial, ditransitive with DP (accusative object), IO,DO order}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7aIONegObjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7b - V initial, ditransitive with DP (absolutive object), DO,IO order}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7b
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7bNegObjVerbRequired - V initial, ditransitive with DP (absolutive object), DO,IO order}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7bNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7bIO - V initial, ditransitive with DP (absolutive object), IO,DO order}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7bIO
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7bIONegObjVerbRequired - V initial, ditransitive with DP (absolutive object), IO,DO order}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7bIONegObjVerbRequired
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7c - V final, ditransitive with DP (accusative object), DO next to V}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7c
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7cNegObjVerbRequired - V final, ditransitive with DP (accusative object), DO next to V}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7cNegObjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7cQSubj - V final, ditransitive with DP (accusative object), DO next to V, subject questioned}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;DP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP_2 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_2 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_2 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP option&gt; = 7cQSubj
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7cQSubjNegObjVerbRequired - V final, ditransitive with DP (accusative object), DO next to V, subject questioned}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;DP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP_2 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_2 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_2 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7cQSubjNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7cQAdvP - V final, ditransitive with DP (accusative object), DO next to V, AdvP questioned}
VP = DP_2 DP_1 AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP option&gt; = 7cQAdvP
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7cQAdvPNegObjVerbRequired - V final, ditransitive with DP (accusative object), DO next to V, AdvP questioned}
VP = DP_2 DP_1 AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7cQAdvPNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7cIO - V final, ditransitive with DP (accusative object), IO next to V}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7cIO
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7cIONegObjVerbRequired - V final, ditransitive with DP (accusative object), IO next to V}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7cIONegObjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7cIOQSubj - V final, ditransitive with DP (accusative object), IO next to V, subject questioned}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;DP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP_1 head agr&gt; = &lt;DP head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP_2 head agr&gt; = &lt;DP head agr&gt;
	}
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP option&gt; = 7cIOQSubj
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7cIOQSubjNegObjVerbRequired - V final, ditransitive with DP (accusative object), IO next to V, subject questioned}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;DP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP_1 head agr&gt; = &lt;DP head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP_2 head agr&gt; = &lt;DP head agr&gt;
	}
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7cIOQSubjNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7cIOQAdvP - V final, ditransitive with DP (accusative object), IO next to V, AdvP questioned}
VP = DP_2 DP_1 AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP option&gt; = 7cIOQAdvP
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7cIOQAdvPNegObjVerbRequired - V final, ditransitive with DP (accusative object), IO next to V, AdvP questioned}
VP = DP_2 DP_1 AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7cIOQAdvPNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7d - V final, ditransitive with DP (absolutive object), DO next to V}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7d
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7dNegObjVerbRequired - V final, ditransitive with DP (absolutive object), DO next to V}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7dNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7dQSubj - V final, ditransitive with DP (absolutive object), DO next to V, subject questioned}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;DP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP_2 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_2 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_2 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 7dQSubj
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7dQSubjNegObjVerbRequired - V final, ditransitive with DP (absolutive object), DO next to V, subject questioned}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;DP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP_2 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_2 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_2 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7dQSubjNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7dQAdvP - V final, ditransitive with DP (absolutive object), DO next to V, AdvP questioned}
VP = DP_2 DP_1 AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP option&gt; = 7dQAdvP
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7dQAdvPNegObjVerbRequired - V final, ditransitive with DP (absolutive object), DO next to V, AdvP questioned}
VP = DP_2 DP_1 AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7dQAdvPNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7dIO - V final, ditransitive with DP (absolutive object), IO next to V}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7dIO
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7dIONegObjVerbRequired - V final, ditransitive with DP (absolutive object), IO next to V}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7dIONegObjVerbRequired
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7dIOQSubj - V final, ditransitive with DP (absolutive object), IO next to V, subject questioned}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;DP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP_2 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_2 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_2 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 7dIOQSubj
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7dIOQSubjNegObjVerbRequired - V final, ditransitive with DP (absolutive object), IO next to V, subject questioned}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;DP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP_2 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_2 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_2 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7dIOQSubjNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7dIOQAdvP - V final, ditransitive with DP (absolutive object), IO next to V, AdvP questioned}
VP = DP_2 DP_1 AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP option&gt; = 7dIOQAdvP
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7dIOQAdvPNegObjVerbRequired - V final, ditransitive with DP (absolutive object), IO next to V, AdvP questioned}
VP = DP_2 DP_1 AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;AdvP head type wh&gt; = +
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7dIOQAdvPNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7aq - V initial, ditransitive with DP (accusative object questioned)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;VP option&gt; = 7aq
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7aqFoc - V initial, ditransitive with DP (accusative object focused)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;VP option&gt; = 7aqFoc
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7aqNegObjVerbRequired - V initial, ditransitive with DP (accusative object questioned)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7aqNegObjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7aqNegObjVerbRequiredFoc - V initial, ditransitive with DP (accusative object focused)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7aqNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7bq - V initial, ditransitive with DP (absolutive object questioned)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 7bq
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7bqFoc - V initial, ditransitive with DP (absolutive object focused)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 7bqFoc
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7bqNegObjVerbRequired - V initial, ditransitive with DP (absolutive object questioned)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7bqNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7bqNegObjVerbRequiredFoc - V initial, ditransitive with DP (absolutive object focused)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7bqNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7cq - V final, ditransitive with DP (accusative object questioned)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;VP option&gt; = 7cq
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7cqFoc - V final, ditransitive with DP (accusative object focused)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;VP option&gt; = 7cqFoc
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7cqNegObjVerbRequired - V final, ditransitive with DP (accusative object questioned)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7cqNegObjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7cqNegObjVerbRequiredFoc - V final, ditransitive with DP (accusative object focused)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted case&gt; = accusative
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;DP head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7cqNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7dq - V final, ditransitive with DP (absolutive object questioned)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 7dq
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7dqFoc - V final, ditransitive with DP (absolutive object focused)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 7dqFoc
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7dqNegObjVerbRequired - V final, ditransitive with DP (absolutive object questioned)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7dqNegObjVerbRequired
</xsl:text>
</xsl:if>

















































































	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7dqNegObjVerbRequiredFoc - V final, ditransitive with DP (absolutive object focused)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted case&gt; = absolutive
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7dqNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7e - VSO order, ditransitive with DP (accusative object), DO,IO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
        {&lt;DP_2 head type reflexive&gt; = -
        /&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7e
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7eNegSubjVerbRequired - VSO order, ditransitive with DP (accusative object), DO,IO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
        {&lt;DP_2 head type reflexive&gt; = -
        /&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7eNegSubjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7eNegObjVerbRequired - VSO order, ditransitive with DP (accusative object), DO,IO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
        {&lt;DP_2 head type reflexive&gt; = -
        /&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7eNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7eNegSubjorObjVerbRequired - VSO order, ditransitive with DP (accusative object), DO,IO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
        {&lt;DP_2 head type reflexive&gt; = -
        /&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                           [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7eNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7eIO - VSO order, ditransitive with DP (accusative object), IO,DO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
        {&lt;DP_2 head type reflexive&gt; = -
        /&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_2 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7eIO
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7eIONegSubjVerbRequired - VSO order, ditransitive with DP (accusative object), IO,DO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
        {&lt;DP_2 head type reflexive&gt; = -
        /&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_2 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7eIONegSubjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7eIONegObjVerbRequired - VSO order, ditransitive with DP (accusative object), IO,DO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_2 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7eIONegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7eIONegSubjorObjVerbRequired - VSO order, ditransitive with DP (accusative object), IO,DO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_2 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7eIONegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7ei - VSO order, ditransitive with DP (accusative case object), DO,IO order, imperative}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type copular&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7ei
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7eiNegObjVerbRequired - VSO order, ditransitive with DP (accusative case object), DO,IO order, imperative}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type copular&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 7eiNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7eiIO - VSO order, ditransitive with DP (accusative case object), IO,DO order, imperative}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7eiIO
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7eiIONegObjVerbRequired - VSO order, ditransitive with DP (accusative case object), IO,DO order, imperative}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type copular&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7eiIONegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7ep - VSO order, ditransitive with DP (accusative object), DO,IO order pro-drop}
VP = V  DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
        {&lt;DP_2 head type reflexive&gt; = -
        /&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7ep
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7epNegObjVerbRequired - VSO order, ditransitive with DP (accusative object), DO,IO order pro-drop}
VP = V  DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7epNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7epIO - VSO order, ditransitive with DP (accusative object), IO,DO order, pro-drop}
VP = V  DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
	 /&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7epIO
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7epIONegObjVerbRequired - VSO order, ditransitive with DP (accusative object), IO,DO order, pro-drop}
VP = V  DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7epIONegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7f - VSO order, ditransitive with DP (absolutive object), DO,IO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7f
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7fNegSubjVerbRequired - VSO order, ditransitive with DP (absolutive object), DO,IO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7fNegSubjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7fNegObjVerbRequired - VSO order, ditransitive with DP (absolutive object), DO,IO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
                     &lt;VP head fronted&gt; == ~[cat:FocusP]
                     &lt;VP head fronted&gt; == ~[cat:DP]
                     &lt;VP option&gt; = 7fNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7fNegSubjorObjVerbRequired - VSO order, ditransitive with DP (absolutive object), DO,IO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7fNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7fIO - VSO order, ditransitive with DP (absolutive object), IO,DO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7fIO
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7fIONegSubjVerbRequired - VSO order, ditransitive with DP (absolutive object), IO,DO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7fIONegSubjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7fIONegObjVerbRequired - VSO order, ditransitive with DP (absolutive object), IO,DO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 7fIONegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7fIONegSubjorObjVerbRequired - VSO order, ditransitive with DP (absolutive object), IO,DO order}
VP = V DP DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7fIONegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7fi - VSO order, ditransitive with DP (absolutive case object), DO,IO order, imperative}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7fi
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7fiNegObjVerbRequired - VSO order, ditransitive with DP (absolutive case object), DO,IO order, imperative}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7fiNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7fiIO - VSO order, ditransitive with DP (absolutive case object), IO,DO order, imperative}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7fiIO
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7fiIONegObjVerbRequired - VSO order, ditransitive with DP (absolutive case object), IO,DO order, imperative}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7fiIONegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7fp - VSO order, ditransitive with DP (absolutive object), DO,IO order, pro-drop}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7fp
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7fpNegObjVerbRequired - VSO order, ditransitive with DP (absolutive object), DO,IO order, pro-drop}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7fpNegObjVerbRequired
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7fpIO - VSO order, ditransitive with DP (absolutive object), IO,DO order, pro-drop}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7fpIO
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7fpIONegObjVerbRequired - VSO order, ditransitive with DP (absolutive object), IO,DO order, pro-drop}
VP = V DP_1 DP_2
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_2 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_2 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7fpIONegObjVerbRequired
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7g - OSV order, ditransitive with DP (accusative object), IO,DO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7g
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7gNegSubjVerbRequired - OSV order, ditransitive with DP (accusative object), IO,DO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7gNegSubjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7gNegObjVerbRequired - OSV order, ditransitive with DP (accusative object), IO,DO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7gNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7gNegSubjorObjVerbRequired - OSV order, ditransitive with DP (accusative object), IO,DO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7gNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7gIO - OSV order, ditransitive with DP (accusative object), DO,IO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_2 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7gIO
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7gIONegSubjVerbRequired - OSV order, ditransitive with DP (accusative object), DO,IO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	 lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_2 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7gIONegSubjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7gIONegObjVerbRequired - OSV order, ditransitive with DP (accusative object), DO,IO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_2 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7gIONegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7gIONegSubjorObjVerbRequired - OSV order, ditransitive with DP (accusative object), DO,IO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_2 head case&gt; = accusative
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7gIONegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7gi - OSV order, ditransitive with DP (accusative case object), IO,DO order imperative}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7gi
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7giNegObjVerbRequired - OSV order, ditransitive with DP (accusative case object), IO,DO order imperative}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7giNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7giIO - OSV order, ditransitive with DP (accusative case object), DO,IO order, imperative}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7giIO
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7giIONegObjVerbRequired - OSV order, ditransitive with DP (accusative case object), DO,IO order, imperative}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7giIONegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7gp - OSV order, ditransitive with DP (accusative object), IO,DO order, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7gp
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7gpNegObjVerbRequired - OSV order, ditransitive with DP (accusative object), IO,DO order, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_2 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7gpNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7gpIO - OSV order, ditransitive with DP (accusative object), DO,IO order, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7gpIO
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7gpIONegObjVerbRequired - OSV order, ditransitive with DP (accusative object), DO,IO order, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;DP_1 head&gt; == ~[case:nominative]
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7gpIONegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7h - OSV order, ditransitive with DP (absolutive object), IO,DO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7h
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7hNegSubjVerbRequired - OSV order, ditransitive with DP (absolutive object), IO,DO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7hNegSubjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7hNegObjVerbRequired - OSV order, ditransitive with DP (absolutive object), IO,DO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7hNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7hNegSubjorObjVerbRequired - OSV order, ditransitive with DP (absolutive object), IO,DO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7hNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7hIO - OSV order, ditransitive with DP (absolutive object), DO,IO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7hIO
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7hIONegSubjVerbRequired - OSV order, ditransitive with DP (absolutive object), DO,IO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7hIONegSubjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7hIONegObjVerbRequired - OSV order, ditransitive with DP (absolutive object), DO,IO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7hIONegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7hIONegSubjorObjVerbRequired - OSV order, ditransitive with DP (absolutive object), DO,IO order}
VP = DP_2 DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7hIONegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7hi - OSV order, ditransitive with DP (absolutive case object), IO,DO order, imperative}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7hi
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7hiNegObjVerbRequired - OSV order, ditransitive with DP (absolutive case object), IO,DO order, imperative}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7hiNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7hiIO - OSV order, ditransitive with DP (absolutive case object), DO,IO order, imperative}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7hiIO
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7hiIONegObjVerbRequired - OSV order, ditransitive with DP (absolutive case object), DO,IO order, imperative}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 7hiIONegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7hp - OSV order, ditransitive with DP (absolutive object), IO,DO order, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7hp
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7hpNegObjVerbRequired - OSV order, ditransitive with DP (absolutive object), IO,DO order, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP_2&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7hpNegObjVerbRequired
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7hpIO - OSV order, ditransitive with DP (absolutive object), DO,IO order, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7hpIO
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7hpIONegObjVerbRequired - OSV order, ditransitive with DP (absolutive object), DO,IO order, pro-drop}
VP = DP_2 DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_2&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
		{&lt;DP_2 head type reflexive&gt; = -
		/&lt;DP_2 head type reflexive&gt; = +
	&lt;V head subject head agr&gt; = &lt;DP_2 head agr&gt;
	}
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_2 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_2 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_2 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_2 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_2 head type suffix copular&gt; = -
	&lt;VP head type passive&gt; = -
	&lt;VP head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;DP_2 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_2 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 7hpIONegObjVerbRequired
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7i - VSO order, ditransitive with DP (acc object), DO,IO order, subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = nominative
        {&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
        {&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP_1 head type reflexive&gt; = -
        }
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7i
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7iFoc - VSO order, ditransitive with DP (acc object), DO,IO order, subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = nominative
        {&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
        {&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP_1 head type reflexive&gt; = -
        }
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7iFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7iNegObjVerbRequired - VSO order, ditransitive with DP (acc object), DO,IO order, subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7iNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7iNegObjVerbRequiredFoc - VSO order, ditransitive with DP (acc object), DO,IO order, subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7iNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7iIO - VSO order, ditransitive with DP (acc object), IO,DO order, subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7iIO
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7iIOFoc - VSO order, ditransitive with DP (acc object), IO,DO order, subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7iIOFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7iIONegObjVerbRequired - VSO order, ditransitive with DP (acc object), IO,DO order, subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7iIONegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7iIONegObjVerbRequiredFoc - VSO order, ditransitive with DP (acc object), IO,DO order, subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7iIONegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7j - VSO order, ditransitive with DP (abs object), DO,IO order,  subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7j
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7jFoc - VSO order, ditransitive with DP (abs object), DO,IO order,  subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7jFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7jNegObjVerbRequired - VSO order, ditransitive with DP (abs object), DO,IO order,  subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7jNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7jNegObjVerbRequiredFoc - VSO order, ditransitive with DP (abs object), DO,IO order,  subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7jNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7jIO - VSO order, ditransitive with DP (abs object), IO,DO order,  subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7jIO
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7jIOFoc - VSO order, ditransitive with DP (abs object), IO,DO order,  subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7jIOFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7jIONegObjVerbRequired - VSO order, ditransitive with DP (abs object), IO,DO order,  subj questioned}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7jIONegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7jIONegObjVerbRequiredFoc - VSO order, ditransitive with DP (abs object), IO,DO order,  subj focused}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7jIONegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7k - OSV order, ditransitive with DP (acc object), IO,DO order , subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7k
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7kFoc - OSV order, ditransitive with DP (acc object), IO,DO order , subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7kFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7kNegObjVerbRequired - OSV order, ditransitive with DP (acc object), IO,DO order , subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7kNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7kNegObjVerbRequiredFoc - OSV order, ditransitive with DP (acc object), IO,DO order , subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7kNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7kIO - OSV order, ditransitive with DP (acc object), DO,IO order , subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7kIO
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7kIOFoc - OSV order, ditransitive with DP (acc object), DO,IO order , subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7kIOFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7kIONegObjVerbRequired - OSV order, ditransitive with DP (acc object), DO,IO order , subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7kIONegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7kIONegObjVerbRequiredFoc - OSV order, ditransitive with DP (acc object), DO,IO order , subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = nominative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7kIONegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7l - OSV order, ditransitive with DP (abs object), IO,DO order, subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7l
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7lFoc - OSV order, ditransitive with DP (abs object), IO,DO order, subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7lFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7lNegObjVerbRequired - OSV order, ditransitive with DP (abs object), IO,DO order, subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
	}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7lNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='direct' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7lNegObjVerbRequiredFoc - OSV order, ditransitive with DP (abs object), IO,DO order, subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7lNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7lIO - OSV order, ditransitive with DP (abs object), DO,IO order, subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7lIO
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7lIOFoc - OSV order, ditransitive with DP (abs object), DO,IO order, subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7lIOFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7lIONegObjVerbRequired - OSV order, ditransitive with DP (abs object), DO,IO order, subj questioned}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7lIONegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//ip/@diOrder)='indirect' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7lIONegObjVerbRequiredFoc - OSV order, ditransitive with DP (abs object), DO,IO order, subj focused}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;DP&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = ergative
		{&lt;DP head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7lIONegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7m - VSO order, ditransitive with DP (acc object questioned)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = accusative
        {&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
        /&lt;DP_1 head type reflexive&gt; = -
        }
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7m
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7mFoc - VSO order, ditransitive with DP (acc object focused)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = accusative
        {&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
        /&lt;DP_1 head type reflexive&gt; = -
        }
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7mFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7mNegSubjVerbRequired - VSO order, ditransitive with DP (acc object questioned)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7mNegSubjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7mNegSubjVerbRequiredFoc - VSO order, ditransitive with DP (acc object focused)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7mNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7mNegObjVerbRequired - VSO order, ditransitive with DP (acc object questioned)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7mNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7mNegObjVerbRequiredFoc - VSO order, ditransitive with DP (acc object focused)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7mNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7mNegSubjorObjVerbRequired - VSO order, ditransitive with DP (acc object questioned)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7mNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7mNegSubjorObjVerbRequiredFoc - VSO order, ditransitive with DP (acc object focused)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7mNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7mp - VSO order, ditransitive with DP (acc object questioned), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = accusative
        {&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
        /&lt;DP_1 head type reflexive&gt; = -
        }
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7mp
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7mpFoc - VSO order, ditransitive with DP (acc object focused), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = accusative
        {&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
        /&lt;DP_1 head type reflexive&gt; = -
        }
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7mpFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7mpNegObjVerbRequired - VSO order, ditransitive with DP (acc object questioned), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7mpNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7mpNegObjVerbRequiredFoc - VSO order, ditransitive with DP (acc object focused), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7mpNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7n - VSO order, ditransitive with DP (abs object questioned)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7n
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7nFoc - VSO order, ditransitive with DP (abs object focused)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7nFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7nNegSubjVerbRequired - VSO order, ditransitive with DP (abs object questioned)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7nNegSubjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7nNegSubjVerbRequiredFoc - VSO order, ditransitive with DP (abs object focused)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7nNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7nNegObjVerbRequired - VSO order, ditransitive with DP (abs object questioned)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7nNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7nNegObjVerbRequiredFoc - VSO order, ditransitive with DP (abs object focused)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7nNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7nNegSubjorObjVerbRequired - VSO order, ditransitive with DP (abs object questioned)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7nNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7nNegSubjorObjVerbRequiredFoc - VSO order, ditransitive with DP (abs object focused)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7nNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7np - VSO order, ditransitive with DP (abs object questioned), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7np
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7npFoc - VSO order, ditransitive with DP (abs object focused), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7npFoc
</xsl:text>
</xsl:if>

















































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7npNegObjVerbRequired - VSO order, ditransitive with DP (abs object questioned), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7npNegObjVerbRequired
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7npNegObjVerbRequiredFoc - VSO order, ditransitive with DP (abs object focused), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7npNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

















































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7o - OSV order, ditransitive with DP (acc object questioned)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7o
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7oFoc - OSV order, ditransitive with DP (acc object focused)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7oFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7oNegSubjVerbRequired - OSV order, ditransitive with DP (acc object questioned)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7oNegSubjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7oNegSubjVerbRequiredFoc - OSV order, ditransitive with DP (acc object focused)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7oNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7oNegObjVerbRequired - OSV order, ditransitive with DP (acc object questioned)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7oNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7oNegObjVerbRequiredFoc - OSV order, ditransitive with DP (acc object focused)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7oNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7oNegSubjorObjVerbRequired - OSV order, ditransitive with DP (acc object questioned)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7oNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7oNegSubjorObjVerbRequiredFoc - OSV order, ditransitive with DP (acc object focused)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7oNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7op - OSV order, ditransitive with DP (acc object questioned), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7op
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7opFoc - OSV order, ditransitive with DP (acc object focused), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7opFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7opNegObjVerbRequired - OSV order, ditransitive with DP (acc object questioned), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7opNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7opNegObjVerbRequiredFoc - OSV order, ditransitive with DP (acc object focused), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = accusative
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7opNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7p - OSV order, ditransitive with DP (abs object questioned)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7p
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7pFoc - OSV order, ditransitive with DP (abs object focused)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7pFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7pNegSubjVerbRequired - OSV order, ditransitive with DP (abs object questioned)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7pNegSubjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7pNegSubjVerbRequiredFoc - OSV order, ditransitive with DP (abs object focused)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7pNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7pNegObjVerbRequired - OSV order, ditransitive with DP (abs object questioned)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7pNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7pNegObjVerbRequiredFoc - OSV order, ditransitive with DP (abs object focused)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7pNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7pNegSubjorObjVerbRequired - OSV order, ditransitive with DP (abs object questioned)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7pNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7pNegSubjorObjVerbRequiredFoc - OSV order, ditransitive with DP (abs object focused)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7pNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7pp - OSV order, ditransitive with DP (abs object questioned), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7pp
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7ppFoc - OSV order, ditransitive with DP (abs object focused), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7ppFoc
</xsl:text>
</xsl:if>

















































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7ppNegObjVerbRequired - OSV order, ditransitive with DP (abs object questioned), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7ppNegObjVerbRequired
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7ppNegObjVerbRequiredFoc - OSV order, ditransitive with DP (abs object focused), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head fronted head case&gt; = absolutive
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [indirectobject:[head:[type:[negative:+]]]] -&gt;  | if indirectobject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7ppNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

















































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7q - VSO order, ditransitive with DP questioned (acc object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
        {&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
        /&lt;DP_1 head type reflexive&gt; = -
        }
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7q
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7qFoc - VSO order, ditransitive with DP focused (acc object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = FocusP
        {&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
        /&lt;DP_1 head type reflexive&gt; = -
        }
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7qFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7qNegSubjVerbRequired - VSO order, ditransitive with DP questioned (acc object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7qNegSubjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7qNegSubjVerbRequiredFoc - VSO order, ditransitive with DP focused (acc object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7qNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7qNegObjVerbRequired - VSO order, ditransitive with DP questioned (acc object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7qNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7qNegObjVerbRequiredFoc - VSO order, ditransitive with DP focused (acc object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7qNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7qNegSubjorObjVerbRequired - VSO order, ditransitive with DP questioned (acc object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7qNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7qNegSubjorObjVerbRequiredFoc - VSO order, ditransitive with DP focused (acc object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7qNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7qp - VSO order, ditransitive with DP questioned (acc object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = DP
        {&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
        /&lt;DP_1 head type reflexive&gt; = -
        }
	&lt;DP_1 head case&gt; = accusative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7qp
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7qpFoc - VSO order, ditransitive with DP focused (acc object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head indirectobject&gt; = &lt;VP head fronted&gt;
	&lt;VP head fronted cat&gt; = FocusP
        {&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
        /&lt;DP_1 head type reflexive&gt; = -
        }
	&lt;DP_1 head case&gt; = accusative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7qpFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7qpNegObjVerbRequired - VSO order, ditransitive with DP questioned (acc object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7qpNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7qpNegObjVerbRequiredFoc - VSO order, ditransitive with DP focused (acc object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7qpNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7r - VSO order, ditransitive with DP questioned (abs object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7r
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7rFoc - VSO order, ditransitive with DP focused (abs object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7rFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7rNegSubjVerbRequired - VSO order, ditransitive with DP questioned (abs object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7rNegSubjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7rNegSubjVerbRequiredFoc - VSO order, ditransitive with DP focused (abs object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7rNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7rNegObjVerbRequired - VSO order, ditransitive with DP questioned (abs object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7rNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7rNegObjVerbRequiredFoc - VSO order, ditransitive with DP focused (abs object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7rNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7rNegSubjorObjVerbRequired - VSO order, ditransitive with DP questioned (abs object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7rNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7rNegSubjorObjVerbRequiredFoc - VSO order, ditransitive with DP focused (abs object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7rNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7rp - VSO order, ditransitive with DP questioned (abs object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7rp
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7rpFoc - VSO order, ditransitive with DP focused (abs object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP option&gt; = 7rpFoc
</xsl:text>
</xsl:if>

















































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7rpNegObjVerbRequired - VSO order, ditransitive with DP questioned (abs object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7rpNegObjVerbRequired
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7rpNegObjVerbRequiredFoc - VSO order, ditransitive with DP focused (abs object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7rpNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

















































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7s - OSV order, ditransitive with DP questioned (acc object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7s
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7sFoc - OSV order, ditransitive with DP focused (acc object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FcousP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7sFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7sNegSubjVerbRequired - OSV order, ditransitive with DP questioned (acc object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7sNegSubjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7sNegSubjVerbRequiredFoc - OSV order, ditransitive with DP focused (acc object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7sNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7sNegObjVerbRequired - OSV order, ditransitive with DP questioned (acc object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7sNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7sNegObjVerbRequiredFoc - OSV order, ditransitive with DP focused (acc object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7sNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7sNegSubjorObjVerbRequired - OSV order, ditransitive with DP questioned (acc object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7sNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7sNegSubjorObjVerbRequiredFoc - OSV order, ditransitive with DP focused (acc object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head case&gt; = nominative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7sNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>





























	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7sp - OSV order, ditransitive with DP questioned (acc object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7sp
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7spFoc - OSV order, ditransitive with DP focused (acc object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7spFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7spNegObjVerbRequired - OSV order, ditransitive with DP questioned (acc object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7spNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7spNegObjVerbRequiredFoc - OSV order, ditransitive with DP focused (acc object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = accusative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7spNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7t - OSV order, ditransitive with DP questioned (abs object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7t
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7tFoc - OSV order, ditransitive with DP focused (abs object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7tFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 7tNegSubjVerbRequired - OSV order, ditransitive with DP questioned (abs object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7tNegSubjVerbRequired
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7tNegSubjVerbRequiredFoc - OSV order, ditransitive with DP focused (abs object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7tNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7tNegObjVerbRequired - OSV order, ditransitive with DP questioned (abs object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7tNegObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7tNegObjVerbRequiredFoc - OSV order, ditransitive with DP focused (abs object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7tNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7tNegSubjorObjVerbRequired - OSV order, ditransitive with DP questioned (abs object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7tNegSubjorObjVerbRequired
</xsl:text>
</xsl:if>

















































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7tNegSubjorObjVerbRequiredFoc - OSV order, ditransitive with DP focused (abs object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP head case&gt; = ergative
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7tNegSubjorObjVerbRequiredFoc
</xsl:text>
</xsl:if>

























































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 7tp - OSV order, ditransitive with DP questioned (abs object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7tp
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7tpFoc - OSV order, ditransitive with DP focused (abs object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP option&gt; = 7tpFoc
</xsl:text>
</xsl:if>

















































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 7tpNegObjVerbRequired - OSV order, ditransitive with DP questioned (abs object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = DP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;VP head type question&gt; = +
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7tpNegObjVerbRequired
</xsl:text>
</xsl:if>

































































































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='dp' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//ip/@diCat)='both' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 7tpNegObjVerbRequiredFoc - OSV order, ditransitive with DP focused (abs object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;VP head fronted cat&gt; = FocusP
		{&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
		/&lt;DP_1 head type reflexive&gt; = -
		}
	&lt;DP_1 head case&gt; = absolutive
	&lt;VP head type question&gt; = -
	&lt;V head type ditransitive&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 7tpNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>

















































































































</xsl:template>
</xsl:stylesheet>
