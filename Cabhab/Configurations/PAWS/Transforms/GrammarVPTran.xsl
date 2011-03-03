<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/" mode="vptran">

	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5a - V initial, transitive (accusative case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5a
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5aNegObjVerbRequired - V initial, transitive (accusative case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5aNegObjVerbRequired
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5b - V initial, transitive (absolutive case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5b
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SVO' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VOS' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5bNegObjVerbRequired - V initial, transitive (absolutive case object)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5bNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5c - V final, transitive (accusative case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5c
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5cNegObjVerbRequired - V final, transitive (accusative case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegObjVerbRequired
</xsl:text>
</xsl:if>













	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5cQSubj - V final, transitive (accusative case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
        {&lt;DP head type reflexive&gt; = -
        /&lt;DP head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5cQSubj
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5cQSubjNegObjVerbRequired - V final, transitive (accusative case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
        {&lt;DP head type reflexive&gt; = -
        /&lt;DP head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP option&gt; = 5cQSubjNegObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes'">
<xsl:text>
rule {VP option 5cNegSubj - V final, transitive (accusative case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type negative&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
        {&lt;DP head type reflexive&gt; = -
        /&lt;DP head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5cNegSubj
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 5cNegSubjObjVerbRequired - V final, transitive (accusative case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type negative&gt; = +
	&lt;VP head type negative&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
        {&lt;DP head type reflexive&gt; = -
        /&lt;DP head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegSubjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes'">
<xsl:text>
rule {VP option 5cNegSubjObjVerbRequired - V final, transitive (accusative case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type negative&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;DP_1 head case&gt; = nominative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
        {&lt;DP head type reflexive&gt; = -
        /&lt;DP head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegSubjObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5cQAdvP - V final, transitive (accusative case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cQAdvP
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5cQAdvPNegObjVerbRequired - V final, transitive (accusative case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cQAdvPNegObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes'">
<xsl:text>
rule {VP option 5cNegAdvP - V final, transitive (accusative case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head type negative&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvP
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes'">
<xsl:text>
rule {VP option 5cNegAdvPVerbRequired - V final, transitive (accusative case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head type negative&gt; = +
	&lt;VP head type negative&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvPVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes'">
<xsl:text>
rule {VP option 5cNegAdvPObjVerbRequired - V final, transitive (accusative case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head type negative&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5cNegAdvPObjVerbRequired
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5d - V final, transitive (absolutive case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5d
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OVS' and normalize-space(//np/@case)='split' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5dNegObjVerbRequired - V final, transitive (absolutive case object)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegObjVerbRequired
</xsl:text>
</xsl:if>

























	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5dQSubj - V final, transitive (absolutive case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
        {&lt;DP head type reflexive&gt; = -
        /&lt;DP head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP option&gt; = 5dQSubj
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5dQSubjNegObjVerbRequired - V final, transitive (absolutive case object), subject questioned}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type question&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type wh&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
        {&lt;DP head type reflexive&gt; = -
        /&lt;DP head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP option&gt; = 5dQSubjNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes'">
<xsl:text>
rule {VP option 5dNegSubj - V final, transitive (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type negative&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
        {&lt;DP head type reflexive&gt; = -
        /&lt;DP head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubj
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 5dNegSubjVerbRequired - V final, transitive (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type negative&gt; = +
	&lt;VP head type negative&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
        {&lt;DP head type reflexive&gt; = -
        /&lt;DP head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes'">
<xsl:text>
rule {VP option 5dNegSubjNegObjVerbRequired - V final, transitive (absolutive case object), subject negative}
VP = DP DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;DP_1&gt;
	&lt;VP head type pro-drop&gt; = -
	&lt;DP_1 head type negative&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;DP_1 head case&gt; = ergative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
        {&lt;DP head type reflexive&gt; = -
        /&lt;DP head type reflexive&gt; = +
	&lt;DP_1 head agr gender&gt; = &lt;DP head agr gender&gt;
	&lt;DP_1 head agr animate&gt; = &lt;DP head agr animate&gt;
	&lt;DP_1 head agr class&gt; = &lt;DP head agr class&gt;
	}
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegSubjNegObjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5dQAdvP - V final, transitive (absolutive case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dQAdvP
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='after' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5dQAdvPNegObjVerbRequired - V final, transitive (absolutive case object), AdvP questioned}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;VP head type question&gt; = +
	&lt;AdvP head type wh&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dQAdvPNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='yes'">
<xsl:text>
rule {VP option 5dNegAdvP - V final, transitive (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head type negative&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvP
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='yes'">
<xsl:text>
rule {VP option 5dNegAdvPVerbRequired - V final, transitive (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head type negative&gt; = +
	&lt;VP head type negative&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvPVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='SOV' and normalize-space(//np/@case)='split' and normalize-space(//neg/@negFront)='beforeVerb' and normalize-space(//neg/@advVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='yes'">
<xsl:text>
rule {VP option 5dNegAdvPNegObjVerbRequired - V final, transitive (absolutive case object), AdvP negative}
VP = DP AdvP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;AdvP head type negative&gt; = +
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;AdvP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5dNegAdvPNegObjVerbRequired
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5e - VSO order, transitive (accusative case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5e
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5eNegSubjVerbRequired - VSO order, transitive (accusative case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5eNegSubjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5eNegObjVerbRequired - VSO order, transitive (accusative case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5eNegObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5eNegSubjOrObjVerbRequired - VSO order, transitive (accusative case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;DP_1 head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                           [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5eNegSubjOrObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5ei - VSO order, transitive (accusative case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5ei
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5eiNegObjVerbRequired - VSO order, transitive (accusative case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5eiNegObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5ep - VSO order, transitive (accusative case object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP_1 head agr&gt; = &lt;VP head subject head agr&gt;
	}
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5ep
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5epIO - VSO order, transitive (dative case indirect object), subj pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head indirectobject&gt; = &lt;DP_1&gt;
	{&lt;DP_1 head type reflexive&gt; = -
	/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP_1 head agr&gt; = &lt;VP head subject head agr&gt;
	}
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = dative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
	                   [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
	                   [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5epIO
	</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5epNegObjVerbRequired - VSO order, transitive (accusative case object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP_1 head agr&gt; = &lt;VP head subject head agr&gt;
	}
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
        &lt;VP head fronted&gt; == ~[cat:FocusP]
        &lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5epNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5f - VSO order, transitive (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
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
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5f
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5fNegSubjVerbRequired - VSO order, transitive (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
        {&lt;DP_1 head type reflexive&gt; = -
        /&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
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
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                           [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5fNegSubjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5fNegObjVerbRequired - VSO order, transitive (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
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
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5fNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5fNegSubjOrObjVerbRequired - VSO order, transitive (absolutive case object)}
VP = V DP DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
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
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5fNegSubjOrObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5fi - VSO order, transitive (absolutive case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5fi
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5fiNegObjVerbRequired - VSO order, transitive (absolutive case object), imperative}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5fiNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5fp - VSO order, transitive (absolutive case object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5fp
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5fpNegObjVerbRequired - VSO order, transitive (absolutive case object), pro-drop}
VP = V DP_1
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP_1 head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP_1 head type suffix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5fpNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5g - OSV order, transitive (accusative case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
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
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5g
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5gNegSubjVerbRequired - OSV order, transitive (accusative case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
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
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5gNegSubjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5gNegObjVerbRequired - OSV order, transitive (accusative case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
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
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5gNegObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5gNegSubjOrObjVerbRequired - OSV order, transitive (accusative case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
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
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5gNegSubjOrObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5gi - OSV order, transitive (accusative case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5gi
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5giNegObjVerbRequired - OSV order, transitive (accusative case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5giNegObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5gp - OSV order, transitive (accusative case object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5gp
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5gpNegObjVerbRequired - OSV order, transitive (accusative case object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = accusative
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:]
	&lt;VP option&gt; = 5gpNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5h - OSV order, transitive (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
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
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	 &lt;VP head fronted&gt; == ~[cat:DP]
	 &lt;VP option&gt; = 5h
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5hNegSubjVerbRequired - OSV order, transitive (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
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
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5hNegSubjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5hNegObjVerbRequired - OSV order, transitive (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
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
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5hNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5hNegSubjOrObjVerbRequired - OSV order, transitive (absolutive case object)}
VP = DP_1 DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;DP head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head type pro-drop&gt; = -
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
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
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5hNegSubjOrObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5hi - OSV order, transitive (absolutive case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5hi
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)!='no' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5hiNegObjVerbRequired - OSV order, transitive (absolutive case object), imperative}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head infl mood imperative&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;VP head type question&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	 &lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP option&gt; = 5hiNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5hp - OSV order, transitive (absolutive case object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5hp
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5hpNegObjVerbRequired - OSV order, transitive (absolutive case object), pro-drop}
VP = DP_1 V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;DP_1&gt;
		{&lt;DP_1 head type reflexive&gt; = -
		/&lt;DP_1 head type reflexive&gt; = +
	&lt;VP head subject head agr&gt; = &lt;DP_1 head agr&gt;
	}
	&lt;VP head infl mood imperative&gt; = -
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;DP_1 head case&gt; = absolutive
	&lt;DP_1 head type suffix poss&gt; = -         | only in possessor position
	&lt;DP_1 head type prefix poss&gt; = -
	&lt;DP_1 head type prefix copular&gt; = -    | only in no V/Aux copulars
	&lt;DP_1 head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP_1 head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP_1 head type prefix&gt;
	&lt;VP head&gt; == [type:[reciprocal:+]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[reciprocal:+]]]] -&gt;
                     [subject:[head:[agr:[number:plural]]]]
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP head fronted&gt; == ~[cat:FocusP]
	&lt;VP head fronted&gt; == ~[cat:DP]
	&lt;VP option&gt; = 5hpNegObjVerbRequired
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative'">
<xsl:text>
rule {VP option 5i - V initial/final, object questioned (accusative object)}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5i
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)!='ergative' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5iFoc - V initial/final, object focused (accusative object)}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5iFoc
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split'">
<xsl:text>
rule {VP option 5j - V initial/final, object questioned (absolutive object)}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5j
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='ergative' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)!='VSO' and normalize-space(//typology/@wordOrder)!='OSV' and normalize-space(//q/@contFront)='before' and normalize-space(//np/@case)='split' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5jFoc - V initial/final, object focused (absolutive object)}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5jFoc
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 5k - VSO order, transitive, object questioned (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5k
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5kFoc - VSO order, transitive, object focused (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5kFoc
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no'">
<xsl:text>
rule {VP option 5kNegSubjVerbRequired - VSO order, transitive, object questioned (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5kNegSubjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5kNegSubjVerbRequiredFoc - VSO order, transitive, object focused (accusative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5kNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 5kp - VSO order, transitive, object questioned (accusative), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5kp
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5kpFoc - VSO order, transitive, object focused (accusative), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5kpFoc
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 5l - VSO order, transitive, object questioned (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5l
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5lFoc - VSO order, transitive, object focused (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5lFoc
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no'">
<xsl:text>
rule {VP option 5lNegSubjVerbRequired - VSO order, transitive, object questioned (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5lNegSubjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5lNegSubjVerbRequiredFoc - VSO order, transitive, object focused (absolutive)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5lNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 5lp - VSO order, transitive, object questioned (absolutive), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5lp
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5lpFoc - VSO order, transitive, object focused (absolutive), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5lpFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 5m - OSV order, transitive, object questioned (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5m
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5mFoc - OSV order, transitive, object focused (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5mFoc
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 5mNegSubjVerbRequired - OSV order, transitive, object questioned (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5mNegSubjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5mNegSubjVerbRequiredFoc - OSV order, transitive, object focused (accusative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = nominative
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5mNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 5mp - OSV order, transitive, object questioned (accusative), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5mp
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5mpFoc - OSV order, transitive, object focused (accusative), pro-drop}
VP = V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = accusative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5mpFoc
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no'">
<xsl:text>
rule {VP option 5n - OSV order, transitive, object questioned (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5n
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5nFoc - OSV order, transitive, object focused (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5nFoc
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes'">
<xsl:text>
rule {VP option 5nNegSubjVerbRequired - OSV order, transitive, object questioned (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5nNegSubjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@subjVerbRequired)='yes' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5nNegSubjVerbRequiredFoc - OSV order, transitive, object focused (absolutive)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head subject&gt; = &lt;DP&gt;
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = ergative
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type possessive&gt; = -  		|subject not possessive
	&lt;DP head type reflexive&gt; = -		|subject not reflexive
	&lt;DP head type reciprocal&gt; = -		|subject not reciprocal
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [subject:[head:[type:[negative:+]]]] -&gt;  | if subject negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5nNegSubjVerbRequiredFoc
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic'">
<xsl:text>
rule {VP option 5np - OSV order, transitive, object questioned (absolutive), pro-drop}
VP =  V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5np
</xsl:text>
</xsl:if>

































	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yes' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//ip/@proDrop)='yesClitic' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5npFoc - OSV order, transitive, object focused (absolutive), pro-drop}
VP =  V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;VP head type pro-drop&gt; = +
	&lt;V head object&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;V head type copular&gt; = -
	&lt;VP head fronted head case&gt; = absolutive
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;VP option&gt; = 5npFoc
</xsl:text>
</xsl:if>









































	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5o - VSO order, transitive, subject questioned (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
        {&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;VP head fronted head case&gt; = nominative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5o
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5oFoc - VSO order, transitive, subject focused (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
        {&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;VP head fronted head case&gt; = nominative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5oFoc
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5oNegObjVerbRequired - VSO order, transitive, subject questioned (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
        {&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;VP head fronted head case&gt; = nominative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                           [type:[negative:+]]
	&lt;VP option&gt; = 5oNegObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5oNegObjVerbRequiredFoc - VSO order, transitive, subject focused (nominative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
        {&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
        /&lt;DP head type reflexive&gt; = -
        }
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;VP head fronted head case&gt; = nominative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5oNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5p - VSO order, transitive, subject questioned (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
		{&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5p
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5pFoc - VSO order, transitive, subject focused (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
		{&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP option&gt; = 5pFoc
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5pNegObjVerbRequired - VSO order, transitive, subject questioned (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
		{&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5pNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='VSO' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5pNegObjVerbRequiredFoc - VSO order, transitive, subject focused (ergative)}
VP = V DP
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
		{&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;V head type comma&gt; = -
	&lt;VP head type comma&gt; &lt;= &lt;DP head type comma&gt;
	&lt;VP head type suffix&gt; &lt;= &lt;DP head type suffix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5pNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5q - OSV order, transitive, subject questioned (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
		{&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;VP head fronted head case&gt; = nominative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5q
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5qFoc - OSV order, transitive, subject focused (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
		{&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;VP head fronted head case&gt; = nominative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5qFoc
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5qNegObjVerbRequired - OSV order, transitive, subject questioned (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
		{&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;VP head fronted head case&gt; = nominative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5qNegObjVerbRequired
</xsl:text>
</xsl:if>









	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)!='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5qNegObjVerbRequiredFoc - OSV order, transitive, subject focused (nominative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
		{&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = accusative
	&lt;VP head fronted head case&gt; = nominative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5qNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>











	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no'">
<xsl:text>
rule {VP option 5r - OSV order, transitive, subject questioned (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
		{&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5r
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5rFoc - OSV order, transitive, subject focused (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
		{&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP option&gt; = 5rFoc
</xsl:text>
</xsl:if>





















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no'">
<xsl:text>
rule {VP option 5rNegObjVerbRequired - OSV order, transitive, subject questioned (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
		{&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	&lt;VP head fronted head type wh&gt; = +
	&lt;VP head fronted cat&gt; = DP
	&lt;VP head type question&gt; = +
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5rNegObjVerbRequired
</xsl:text>
</xsl:if>

















	<xsl:if test="normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='ergative' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes' or normalize-space(//typology/@wordOrder)='OSV' and normalize-space(//np/@case)='split' and normalize-space(//q/@contFront)='before' and normalize-space(//neg/@objVerbRequired)!='no' and normalize-space(//focus/@focus)='yes'">
<xsl:text>
rule {VP option 5rNegObjVerbRequiredFoc - OSV order, transitive, subject focused (ergative)}
VP = DP V
	&lt;VP head&gt; = &lt;V head&gt;
	&lt;V head object&gt; = &lt;DP head&gt;
	&lt;V head subject&gt; = &lt;VP head fronted&gt;
	&lt;V head type transitive&gt; = +
	&lt;VP head type pro-drop&gt; = -
		{&lt;DP head type reflexive&gt; = +
	&lt;VP head object head agr&gt; = &lt;VP head fronted head agr&gt;
		/&lt;DP head type reflexive&gt; = -
		}
	&lt;V head type copular&gt; = -
	&lt;DP head case&gt; = absolutive
	&lt;VP head fronted head case&gt; = ergative
	&lt;VP head fronted head type wh&gt; = -
	&lt;VP head fronted cat&gt; = FocusP
	&lt;VP head type question&gt; = -
	&lt;DP head type suffix poss&gt; = -         | only in possessor position
	&lt;DP head type prefix poss&gt; = -
	&lt;DP head type prefix copular&gt; = -      | only in no V/Aux copulars
	&lt;DP head type suffix copular&gt; = -
	&lt;V head type passive&gt; = -
	&lt;V head type motion&gt; = -
	&lt;DP head type comma&gt; = -
	&lt;VP head type prefix&gt; &lt;= &lt;DP head type prefix&gt;
	&lt;VP head&gt; == [object:[head:[type:[negative:+]]]] -&gt;  | if object negative, VP must be
                     [type:[negative:+]]
	&lt;VP option&gt; = 5rNegObjVerbRequiredFoc
</xsl:text>
</xsl:if>





















</xsl:template>
</xsl:stylesheet>
